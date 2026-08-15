// SPDX-License-Identifier: Apache-2.0 OR MIT

// TODO: implement
// PI SeqLock on other systems using POSIX thread.
//
// Seqlock logic is adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/seq_lock.rs.
// Wait logic is adapted from https://github.com/rust-lang/rust/blob/1.97.0/library/std/src/sys/sync/mutex/futex.rs.
//
// Refs:
// - https://pubs.opengroup.org/onlinepubs/9799919799/functions/pthread_mutexattr_setprotocol.html

#[cfg(portable_atomic_unsafe_assume_privileged)]
compile_error!("internal error: unreachable");

use core::{marker::PhantomData, mem::ManuallyDrop, ops, sync::atomic::Ordering};

use super::seq_lock_common::stamp::{self, State as Stamp};
use crate::imp::{
    AtomicU32,
    fallback::{
        LOCK_ACQUIRE_ORDER, LOCK_RELEASE_ORDER,
        wait::{ffi::FUTEX_WAITERS, lock_pi, unlock_pi},
    },
};

type State = u32;

const UNLOCKED: State = 0;

pub(crate) struct SeqLock {
    /// The current state of the lock.
    futex: AtomicU32,

    /// The the current stamp.
    stamp: stamp::Stamp,
}

impl SeqLock {
    #[inline]
    pub(crate) const fn new() -> Self {
        Self { futex: AtomicU32::new(UNLOCKED), stamp: stamp::Stamp::new() }
    }

    #[inline]
    pub(crate) fn write(&self) -> SeqLockWriteGuard<'_> {
        let tid = current_tid();
        if self
            .futex
            .compare_exchange(UNLOCKED, tid, LOCK_ACQUIRE_ORDER, Ordering::Relaxed)
            .is_err()
        {
            self.write_contended(tid);
        }
        let stamp = self.stamp.state.load(Ordering::Relaxed).wrapping_add(1);
        self.stamp.state.store(stamp, Ordering::Relaxed);
        // To synchronize with the acquire fence in `validate_read` via any modification to
        // the data at the critical section of `previous`.
        crate::fence(Ordering::Release);

        SeqLockWriteGuard { lock: self, tid, stamp, _not_send: PhantomData }
    }

    #[cold]
    fn write_contended(&self, tid: u32) {
        // Spin first to speed things up if the lock is released quickly.
        let mut state = self.spin();

        loop {
            // If it's unlocked now, attempt to take the lock
            // without marking it as contended.
            if state == UNLOCKED
                && self
                    .futex
                    .compare_exchange(UNLOCKED, tid, LOCK_ACQUIRE_ORDER, Ordering::Relaxed)
                    .is_ok()
            {
                return; // Locked!
            }

            if lock_pi(&self.futex) {
                return; // Locked!
            }

            // Spin again after waking up.
            state = self.spin();
        }
    }

    fn spin(&self) -> State {
        let mut spin = 100;
        loop {
            // We only use `load` (and not `swap` or `compare_exchange`)
            // while spinning, to be easier on the caches.
            let state = self.futex.load(Ordering::Relaxed);

            // We stop spinning when the mutex is UNLOCKED,
            // but also when it's contended.
            if state == UNLOCKED || state & FUTEX_WAITERS != 0 || spin == 0 {
                return state;
            }

            #[allow(deprecated)]
            core::sync::atomic::spin_loop_hint();
            spin -= 1;
        }
    }

    /// Release the lock with the given stamp.
    #[inline]
    unsafe fn unlock(&self, tid: u32, next_stamp: Stamp) {
        // Release ordering for synchronizing with `optimistic_read`.
        self.stamp.state.store(next_stamp, Ordering::Release);

        // Release ordering for synchronizing with `write`.
        while self
            .futex
            .compare_exchange(tid, UNLOCKED, LOCK_RELEASE_ORDER, Ordering::Relaxed)
            .is_err()
        {
            if unlock_pi(&self.futex) {
                break;
            }
        }
    }
}

impl ops::Deref for SeqLock {
    type Target = stamp::Stamp;

    #[inline(always)]
    fn deref(&self) -> &Self::Target {
        &self.stamp
    }
}

#[must_use]
pub(crate) struct SeqLockWriteGuard<'a> {
    /// The parent lock.
    lock: &'a SeqLock,

    tid: u32,

    /// The current stamp.
    stamp: Stamp,

    // Ensure the same tid.
    _not_send: PhantomData<*const ()>,
}

impl SeqLockWriteGuard<'_> {
    /// Releases the lock without incrementing the stamp.
    #[inline]
    pub(crate) unsafe fn abort(self) {
        // We specifically don't want to call drop(), since that's
        // what increments the stamp.
        let this = ManuallyDrop::new(self);

        // Restore the stamp and release the lock.
        // SAFETY: SeqLockWriteGuard is !Send so tid field is correct and
        // the stamp is the same was the one retrieved by the previous `write`.
        // the caller must guarantee that the value hasn't been changed.
        unsafe { this.lock.unlock(this.tid, this.stamp.wrapping_sub(1)) }
    }
}

impl Drop for SeqLockWriteGuard<'_> {
    #[inline]
    fn drop(&mut self) {
        let next_stamp = self.stamp.wrapping_add(1);
        self.lock.stamp.handle_next_stamp(next_stamp);

        // Increment the stamp and release the lock.
        // SAFETY: handle_next_stamp ensures the state that has never been used.
        // SeqLockWriteGuard is !Send so tid field is correct.
        unsafe { self.lock.unlock(self.tid, next_stamp) }
    }
}

#[inline]
fn current_tid() -> u32 {
    // In Linux, the clockid is based on tid/pid or fd. pthread_getcpuclockid returns
    // the clockid based on the cached tid, it is faster than calling the gettid syscall.
    // https://github.com/torvalds/linux/blob/v7.1/include/linux/posix-timers_types.h#L10
    // https://git.musl-libc.org/cgit/musl/tree/src/thread/pthread_getcpuclockid.c?h=v1.2.6
    // https://sourceware.org/git/?p=glibc.git;a=blob;f=nptl/pthread_getcpuclockid.c;hb=glibc-2.44
    // https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/kernel-posix-cpu-timers.h;hb=glibc-2.44
    // https://github.com/wbx-github/uclibc-ng/blob/50c470ef4e688e6eea6fd1eff13083e4fd7b7c95/libpthread/nptl/sysdeps/unix/sysv/linux/pthread_getcpuclockid.c#L51
    // https://android.googlesource.com/platform/bionic.git/+/refs/tags/android-16.0.0_r1/libc/bionic/pthread_getcpuclockid.cpp
    // TODO: glibc 2.42+ and Android 5.0+ (API level 21+) have pthread_gettid_np:
    // https://sourceware.org/git/?p=glibc.git;a=blob;f=nptl/pthread_gettid_np.c;hb=glibc-2.44
    // https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=74d463c50bb1096efef47022405c7db33f83fb5a
    // https://android.googlesource.com/platform/bionic.git/+/refs/tags/android-16.0.0_r1/libc/bionic/pthread_gettid_np.cpp
    // https://android.googlesource.com/platform/bionic.git/+/655e430b28d7404f763e7ebefe84fba5a387666d
    #[cfg(any(
        target_os = "android",
        target_env = "gnu",
        target_env = "musl",
        target_env = "uclibc"
    ))]
    {
        let mut clock_id: libc::clockid_t = 0;
        // https://www.man7.org/linux/man-pages/man3/pthread_getcpuclockid.3.html
        if unsafe { libc::pthread_getcpuclockid(libc::pthread_self(), &mut clock_id) } == 0 {
            let bits = clock_id as u32;
            if clock_id < 0 && (bits & 7) == 6 {
                let tid = (!bits) >> 3;
                if tid != 0 {
                    return tid;
                }
            }
        }
    }

    unsafe { (libc::syscall(libc::SYS_gettid) as libc::pid_t).cast_unsigned() }
}

#[cfg(test)]
mod tests {
    // Common cases are covered by seqlock_common.rs.

    // TODO: port
    // TODO: cleanup
    #[test]
    #[ignore = "require RLIMIT_RTPRIO >= 3"]
    fn test_pi() {
        use core::{
            convert::TryFrom as _,
            mem,
            sync::atomic::{AtomicU8, Ordering},
            time::Duration,
        };
        use std::{sync::mpsc, thread, time::Instant};

        use super::{FUTEX_WAITERS, SeqLock};

        const LOW: u8 = 1;
        const MID: u8 = 2;
        const HIGH: u8 = 3;
        const PENDING: u8 = 0;
        const ACQUIRED: u8 = 1;
        const TIMED_OUT: u8 = 2;

        fn target_cpu() -> usize {
            // SAFETY: all-zero is a valid empty cpu_set_t.
            let mut set = unsafe { mem::zeroed::<libc::cpu_set_t>() };
            // SAFETY: set points to writable memory of the size passed.
            let result =
                unsafe { libc::sched_getaffinity(0, mem::size_of::<libc::cpu_set_t>(), &mut set) };
            if result != 0 {
                panic!("sched_getaffinity failed: {}", std::io::Error::last_os_error());
            }
            (0..mem::size_of::<libc::cpu_set_t>() * 8)
                // SAFETY: cpu is within the bounds of set.
                .find(|&cpu| unsafe { libc::CPU_ISSET(cpu, &set) })
                .expect("the test thread has no available CPU")
        }
        fn pin_to_cpu(cpu: usize) {
            // SAFETY: all-zero is a valid empty cpu_set_t.
            let mut set = unsafe { mem::zeroed::<libc::cpu_set_t>() };
            // SAFETY: cpu came from a cpu_set_t of the same size in target_cpu.
            unsafe { libc::CPU_SET(cpu, &mut set) };
            // SAFETY: set points to readable memory of the size passed.
            let result =
                unsafe { libc::sched_setaffinity(0, mem::size_of::<libc::cpu_set_t>(), &set) };
            if result != 0 {
                panic!("sched_setaffinity failed: {}", std::io::Error::last_os_error());
            }
        }
        fn set_priority(priority: u8) {
            use thread_priority::*;
            set_thread_priority_and_policy(
                thread_native_id(),
                ThreadPriority::Crossplatform(ThreadPriorityValue::try_from(priority).unwrap()),
                ThreadSchedulePolicy::Realtime(RealtimeThreadSchedulePolicy::RoundRobin),
            )
            .unwrap();
        }

        let cpu = target_cpu();
        let lock = &SeqLock::new();
        let outcome = &AtomicU8::new(PENDING);

        let (low_locked, high_waiting, mid_result, low_result, high_result) = thread::scope(|s| {
            // Keep these senders inside the scope closure so unwinding from a
            // failed spawn disconnects low before the scope joins it.
            let (low_locked_tx, low_locked_rx) = mpsc::channel();
            let (release_low_tx, release_low_rx) = mpsc::channel();
            let low = s.spawn(move || {
                pin_to_cpu(cpu);
                set_priority(LOW);
                let guard = lock.write();
                low_locked_tx.send(lock.futex.load(Ordering::Relaxed)).unwrap();
                // Continue on disconnection so a failure in the mid thread
                // cannot leave this realtime thread blocked forever.
                let _ = release_low_rx.recv();
                drop(guard);
            });

            let low_owner = low_locked_rx.recv_timeout(Duration::from_secs(1)).ok();
            let high = if low_owner.is_some() {
                Some(s.spawn(move || {
                    pin_to_cpu(cpu);
                    set_priority(HIGH);
                    let guard = lock.write();
                    let _ = outcome.compare_exchange(
                        PENDING,
                        ACQUIRED,
                        Ordering::Relaxed,
                        Ordering::Relaxed,
                    );
                    drop(guard);
                }))
            } else {
                None
            };

            // Only high can be contending here, so FUTEX_WAITERS shows that it
            // has entered the kernel PI path. Since all workers are pinned to
            // the same CPU, mid cannot run until the higher-priority high has
            // blocked.
            let high_waiting = if let Some(low_owner) = low_owner {
                let wait_deadline = Instant::now() + Duration::from_secs(1);
                loop {
                    if lock.futex.load(Ordering::Relaxed) == (low_owner | FUTEX_WAITERS) {
                        break true;
                    }
                    if Instant::now() >= wait_deadline {
                        break false;
                    }
                    thread::yield_now();
                }
            } else {
                false
            };

            let mid = if high_waiting {
                let release_low_tx = release_low_tx.clone();
                Some(s.spawn(move || {
                    pin_to_cpu(cpu);
                    set_priority(MID);

                    // Establish that the intermediate-priority thread is
                    // actively consuming the shared CPU before waking low.
                    let busy_deadline = Instant::now() + Duration::from_millis(10);
                    while Instant::now() < busy_deadline {
                        #[allow(deprecated)]
                        core::sync::atomic::spin_loop_hint();
                    }
                    release_low_tx.send(()).unwrap();

                    // This is also the watchdog: without working PI, mid
                    // prevents low from running until this deadline expires.
                    let pi_deadline = Instant::now() + Duration::from_millis(250);
                    while outcome.load(Ordering::Relaxed) == PENDING {
                        if Instant::now() >= pi_deadline {
                            let _ = outcome.compare_exchange(
                                PENDING,
                                TIMED_OUT,
                                Ordering::Relaxed,
                                Ordering::Relaxed,
                            );
                            break;
                        }
                        #[allow(deprecated)]
                        core::sync::atomic::spin_loop_hint();
                    }
                }))
            } else {
                None
            };

            let mid_result = mid.map(thread::ScopedJoinHandle::join);
            // Release low on setup failures or if high never reached the
            // expected wait state. A second send after the normal mid-thread
            // send is harmless.
            let _ = release_low_tx.send(());

            let high_result = high.map(thread::ScopedJoinHandle::join);
            let low_result = low.join();
            (low_owner.is_some(), high_waiting, mid_result, low_result, high_result)
        });

        if let Some(mid_result) = mid_result {
            mid_result.unwrap();
        }
        low_result.unwrap();
        if let Some(high_result) = high_result {
            high_result.unwrap();
        }
        assert!(low_locked, "low did not acquire the lock before the timeout");
        assert!(high_waiting, "high did not enter the PI-futex wait path before the timeout",);
        assert_eq!(
            outcome.load(Ordering::Relaxed),
            ACQUIRED,
            "high did not acquire the lock while mid was runnable",
        );
    }
}
