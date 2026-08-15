// SPDX-License-Identifier: Apache-2.0 OR MIT

// TODO: implement
// PI SeqLock on Fuchsia.
//
// Seqlock logic is adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/seq_lock.rs.
//
// Refs:
// - https://fuchsia.dev/fuchsia-src/reference/kernel_objects/futex
// - https://github.com/rust-lang/rust/blob/1.97.0/library/std/src/sys/sync/mutex/fuchsia.rs

#[cfg(portable_atomic_unsafe_assume_privileged)]
compile_error!("internal error: unreachable");

use core::{marker::PhantomData, mem::ManuallyDrop, ops, ptr, sync::atomic::Ordering};

use super::seq_lock_common::stamp::{self, State as Stamp};
use crate::imp::fallback::{LOCK_ACQUIRE_ORDER, LOCK_RELEASE_ORDER};

pub(crate) struct SeqLock {
    /// The current state of the lock.
    futex: AtomicU32,

    /// The the current stamp.
    stamp: stamp::Stamp,
}

impl SeqLock {
    #[inline]
    pub(crate) fn write(&self) -> SeqLockWriteGuard<'_> {
        let tid = current_tid();
        if let Err(state) =
            self.futex.compare_exchange(UNLOCKED, tid, LOCK_ACQUIRE_ORDER, Ordering::Relaxed)
        {
            self.write_contended(tid, state);
        }
        let stamp = self.stamp.state.load(Ordering::Relaxed).wrapping_add(1);
        self.stamp.state.store(stamp, Ordering::Relaxed);
        // To synchronize with the acquire fence in `validate_read` via any modification to
        // the data at the critical section of `previous`.
        crate::fence(Ordering::Release);

        SeqLockWriteGuard { lock: self, tid, stamp, _not_send: PhantomData }
    }

    #[cold]
    fn write_contended(&self, tid: Tid, mut state: u32) {
        let tid = tid & !CONTESTED;
        loop {
            let contested = state & !CONTESTED;
            if state & CONTESTED == 0
                || self
                    .futex
                    .compare_exchange(state, contested, Ordering::Relaxed, Ordering::Relaxed)
                    .is_ok()
            {
                unsafe {
                    // TODO: error handling
                    zx_futex_wait(
                        &self.futex,
                        AtomicU32::new(contested),
                        state | CONTESTED,
                        ZX_TIME_INFINITE,
                    );
                }
            }

            match self.futex.compare_exchange(UNLOCKED, tid, LOCK_ACQUIRE_ORDER, Ordering::Relaxed)
            {
                Ok(_) => return, // Locked!
                Err(s) => state = s,
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
        if self.futex.swap(UNLOCKED, LOCK_RELEASE_ORDER) & CONTESTED == 0 {
            self.wake();
        }
    }

    #[cold]
    fn wake(&self) {
        unsafe {
            zx_futex_wake_single_owner(&self.futex);
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

use crate::imp::core_atomic::AtomicU32;

type Tid = zx_handle_t;
const UNLOCKED: u32 = 0;
const CONTESTED: u32 = 1;
impl SeqLock {
    #[inline]
    pub(crate) const fn new() -> Self {
        Self { futex: AtomicU32::new(UNLOCKED), stamp: stamp::Stamp::new() }
    }
}

#[inline]
fn current_tid() -> Tid {
    zx_thread_self()
}

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
