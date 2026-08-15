// SPDX-License-Identifier: Apache-2.0 OR MIT

// PI SeqLock on Linux, Android, and FreeBSD.
//
// Seqlock logic is adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/seq_lock.rs.
//
// Refs:
// - https://man7.org/linux/man-pages/man2/futex.2.html
// - https://git.musl-libc.org/cgit/musl/tree/src/thread/pthread_mutex_timedlock.c?h=v1.2.6
// - https://android.googlesource.com/platform/bionic.git/+/refs/tags/android-16.0.0_r1/libc/bionic/pthread_mutex.cpp
// - https://man.freebsd.org/_umtx_op(2)
// - https://github.com/freebsd/freebsd-src/blob/release/15.1.0/lib/libthr/thread/thr_mutex.c

#[cfg(portable_atomic_unsafe_assume_privileged)]
compile_error!("internal error: unreachable");

use core::{marker::PhantomData, mem::ManuallyDrop, ops, ptr, sync::atomic::Ordering};

use super::seq_lock_common::stamp::{self, State as Stamp};
use crate::imp::fallback::{LOCK_ACQUIRE_ORDER, LOCK_RELEASE_ORDER};

pub(crate) struct SeqLock {
    /// The current state of the lock.
    #[cfg(not(target_os = "freebsd"))]
    futex: AtomicU32,
    /// The current state of the lock.
    // Use UnsafeCell. See comments on m_owner field on umutex.
    #[cfg(target_os = "freebsd")]
    umutex: UnsafeCell<umutex>,

    /// The the current stamp.
    stamp: stamp::Stamp,
}

// SAFETY: any data races are prevented by the lock.
unsafe impl Sync for SeqLock {}

impl SeqLock {
    #[inline]
    pub(crate) fn write(&self) -> SeqLockWriteGuard<'_> {
        let tid = current_tid();
        if self
            .state()
            .compare_exchange(UNLOCKED, tid, LOCK_ACQUIRE_ORDER, Ordering::Relaxed)
            .is_err()
        {
            self.write_contended();
        }
        let stamp = self.stamp.state.load(Ordering::Relaxed).wrapping_add(1);
        self.stamp.state.store(stamp, Ordering::Relaxed);
        // To synchronize with the acquire fence in `validate_read` via any modification to
        // the data at the critical section of `previous`.
        crate::fence(Ordering::Release);

        SeqLockWriteGuard { lock: self, tid, stamp, _not_send: PhantomData }
    }

    #[cold]
    fn write_contended(&self) {
        // Linux futex provides seqcst semantics. (https://github.com/torvalds/linux/commit/31d30c8208a38a0442cc01a9c7f6542489c76353)
        // FreeBSD UMTX_OP_MUTEX_LOCK only provides acquire semantics.
        #[cfg(target_os = "freebsd")]
        if LOCK_ACQUIRE_ORDER == Ordering::SeqCst {
            crate::fence(Ordering::SeqCst);
        }
        // https://github.com/torvalds/linux/blob/v7.1/kernel/locking/rtmutex.c#L1490
        loop {
            if self.lock_pi() {
                return; // Locked!
            }
        }
    }

    /// Release the lock with the given stamp.
    #[inline]
    unsafe fn unlock(&self, tid: Tid, next_stamp: Stamp) {
        debug_assert_eq!(tid, current_tid());
        // Release ordering for synchronizing with `optimistic_read`.
        self.stamp.state.store(next_stamp, Ordering::Release);

        // Release ordering for synchronizing with `write`.
        while self
            .state()
            .compare_exchange(tid, UNLOCKED, LOCK_RELEASE_ORDER, Ordering::Relaxed)
            .is_err()
        {
            if self.unlock_pi() {
                // Linux futex provides seqcst semantics. (https://github.com/torvalds/linux/commit/31d30c8208a38a0442cc01a9c7f6542489c76353)
                // FreeBSD UMTX_OP_MUTEX_UNLOCK only provides release semantics.
                #[cfg(target_os = "freebsd")]
                if LOCK_RELEASE_ORDER == Ordering::SeqCst {
                    crate::fence(Ordering::SeqCst);
                }
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

    tid: Tid,

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

cfg_sel!({
    #[cfg(any(target_os = "linux", target_os = "android"))]
    {
        use libc::FUTEX_WAITERS as CONTESTED;

        use crate::imp::core_atomic::AtomicU32;

        type Tid = u32;
        const UNLOCKED: u32 = 0;
        impl SeqLock {
            #[inline]
            pub(crate) const fn new() -> Self {
                Self { futex: AtomicU32::new(UNLOCKED), stamp: stamp::Stamp::new() }
            }
            #[inline(always)]
            fn state(&self) -> &AtomicU32 {
                &self.futex
            }
            // TODO: handle ENOSYS、EINVAL、EDEADLK
            #[inline]
            fn lock_pi(&self) -> bool {
                // SAFETY: any data races are prevented since accesses to `a` are atomic and
                // the raw pointer passed in is valid because we got it from a reference.
                unsafe {
                    libc::syscall(
                        libc::SYS_futex,
                        self.futex.as_ptr(),
                        libc::FUTEX_LOCK_PI | libc::FUTEX_PRIVATE_FLAG,
                        0,                      // unused
                        ptr::null::<[u8; 0]>(), // timeout is actually a pointer to timespec, but is fine because we only pass null.
                    ) == 0
                }
            }
            #[inline]
            fn unlock_pi(&self) -> bool {
                // SAFETY: the raw pointer passed in is valid because we got it from a reference.
                unsafe {
                    libc::syscall(
                        libc::SYS_futex,
                        self.futex.as_ptr(),
                        libc::FUTEX_UNLOCK_PI | libc::FUTEX_PRIVATE_FLAG,
                    ) == 0
                }
            }
        }

        #[inline]
        fn current_tid() -> Tid {
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
                // SAFETY: the raw pointer passed in is valid because we got it from a reference.
                if unsafe { libc::pthread_getcpuclockid(libc::pthread_self(), &mut clock_id) } == 0
                {
                    #[allow(clippy::cast_sign_loss)]
                    let bits = clock_id as u32;
                    if clock_id < 0 && (bits & 7) == 6 {
                        let tid = (!bits) >> 3;
                        if tid != 0 {
                            return tid;
                        }
                    }
                }
            }

            // SAFETY: calling gettid is safe.
            #[allow(clippy::cast_possible_truncation)]
            unsafe {
                (libc::syscall(libc::SYS_gettid) as libc::pid_t).cast_unsigned()
            }
        }
    }
    #[cfg(target_os = "freebsd")]
    {
        use core::cell::UnsafeCell;

        use self::{UMUTEX_CONTESTED as CONTESTED, UMUTEX_UNOWNED as UNLOCKED};
        use crate::imp::core_atomic::AtomicI32;

        type Tid = i32;
        impl SeqLock {
            #[inline]
            pub(crate) const fn new() -> Self {
                Self {
                    umutex: UnsafeCell::new(umutex {
                        m_owner: UMUTEX_UNOWNED,
                        m_flags: UMUTEX_PRIO_INHERIT,
                        m_ceilings: [0; 2],
                        m_rb_lnk: 0,
                        #[cfg(target_pointer_width = "32")]
                        m_pad: 0,
                        m_spare: [0; 2],
                    }),
                    stamp: stamp::Stamp::new(),
                }
            }
            #[inline(always)]
            fn state(&self) -> &AtomicI32 {
                // SAFETY: umutex is repr(C) and in UnsafeCell, and m_owner field is the first field and
                // has the same layout as AtomicI32, and all accesses to this field is atomic in both our
                // side and kernel side.
                unsafe { &*(self.umutex.get() as *const AtomicI32) }
            }
            // TODO: handle ENOSYS、EINVAL、EDEADLK
            #[inline]
            fn lock_pi(&self) -> bool {
                let res = unsafe {
                    libc::_umtx_op(
                        self.umutex.get() as *mut libc::c_void,
                        libc::UMTX_OP_MUTEX_LOCK,
                        0,
                        ptr::null_mut(),
                        ptr::null_mut(),
                    )
                };
                res == 0
            }
            #[inline]
            fn unlock_pi(&self) -> bool {
                let res = unsafe {
                    libc::_umtx_op(
                        self.umutex.get() as *mut libc::c_void,
                        libc::UMTX_OP_MUTEX_UNLOCK,
                        0,
                        ptr::null_mut(),
                        ptr::null_mut(),
                    )
                };
                res == 0
            }
        }

        #[inline]
        fn current_tid() -> Tid {
            // SAFETY: calling pthread_getthreadid_np is safe.
            let tid = unsafe { libc::pthread_getthreadid_np() };
            debug_assert!(tid > 0);
            tid
        }

        sys_struct!({
            // Defined in sys/umtx.h.
            // https://github.com/freebsd/freebsd-src/blob/release/15.1.0/sys/sys/_umtx.h
            pub(crate) struct umutex {
                // Note: this field is volatile and the kernel may update this field with atomic,
                // so umutex must be wrapped in an UnsafeCell, and all accesses to this field
                // must be atomic.
                pub(crate) m_owner: libc::lwpid_t,
                pub(crate) m_flags: u32,
                pub(crate) m_ceilings: [u32; 2],
                pub(crate) m_rb_lnk: libc::c_ulong, // __uintptr_t
                #[cfg(target_pointer_width = "32")]
                pub(crate) m_pad: u32,
                pub(crate) m_spare: [u32; 2],
            }
        });
        // not in libc
        sys_const!({
            // Defined in sys/umtx.h.
            // https://github.com/freebsd/freebsd-src/blob/release/15.1.0/sys/sys/umtx.h
            // FreeBSD 7.0+
            // https://github.com/freebsd/freebsd-src/commit/d10183d94d500a0b54413a4d9f1831190b890ec9
            pub(crate) const UMTX_OP_MUTEX_LOCK: libc::c_int = 5;
            pub(crate) const UMTX_OP_MUTEX_UNLOCK: libc::c_int = 6;
            pub(crate) const UMUTEX_PRIO_INHERIT: u32 = 0x0004;
            pub(crate) const UMUTEX_UNOWNED: libc::lwpid_t = 0x0;
            #[allow(clippy::cast_possible_wrap)]
            pub(crate) const UMUTEX_CONTESTED: libc::lwpid_t = 0x80000000_u32 as i32;
        });
    }
});

#[cfg(test)]
mod tests {
    // Common cases are covered by seqlock_common.rs.

    // TODO: cleanup
    #[test]
    #[ignore = "require RLIMIT_RTPRIO >= 3 on Linux / PRIV_SCHED_RTPRIO on FreeBSD"]
    fn test_pi() {
        use core::{
            sync::atomic::{AtomicU8, Ordering},
            time::Duration,
        };
        use std::{sync::mpsc, thread, time::Instant};

        use super::{CONTESTED, SeqLock};
        use crate::tests::helper::pi::{Priority, pin_to_cpu, set_priority, target_cpu};

        const PENDING: u8 = 0;
        const ACQUIRED: u8 = 1;
        const TIMED_OUT: u8 = 2;

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
                set_priority(Priority::Low);
                let guard = lock.write();
                low_locked_tx.send(lock.state().load(Ordering::Relaxed)).unwrap();
                // Continue on disconnection so a failure in the mid thread
                // cannot leave this realtime thread blocked forever.
                let _ = release_low_rx.recv();
                drop(guard);
            });

            let low_owner = low_locked_rx.recv_timeout(Duration::from_secs(1)).ok();
            let high = if low_owner.is_some() {
                Some(s.spawn(move || {
                    pin_to_cpu(cpu);
                    set_priority(Priority::High);
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

            // Only high can be contending here, so CONTESTED shows that it
            // has entered the kernel PI path. Since all workers are pinned to
            // the same CPU, mid cannot run until the higher-priority high has
            // blocked.
            let high_waiting = if let Some(low_owner) = low_owner {
                let wait_deadline = Instant::now() + Duration::from_secs(1);
                loop {
                    if lock.state().load(Ordering::Relaxed) == (low_owner | CONTESTED) {
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
                    set_priority(Priority::Mid);

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
