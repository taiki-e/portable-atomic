// SPDX-License-Identifier: Apache-2.0 OR MIT

// SeqLock with unified lock state.
//
// Seqlock logic is adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/seq_lock.rs.
// Wait logic is adapted from https://github.com/rust-lang/rust/blob/1.97.0/library/std/src/sys/sync/mutex/futex.rs.

#[cfg(feature = "pi-fallback")]
compile_error!("internal error: unreachable");

use core::{mem::ManuallyDrop, sync::atomic::Ordering};

pub(crate) use super::wait::stamp::Stamp as SeqLock;
use super::wait::{notify_one, stamp::State, wait};
use crate::imp::fallback::{LOCK_ACQUIRE_ORDER, LOCK_RELEASE_ORDER};
#[cfg(portable_atomic_unsafe_assume_privileged)]
use crate::imp::interrupt::arch as interrupt;

const LOCKED: State = 0b01; // locked, no other threads waiting
const CONTENDED: State = 0b11; // locked, and other threads waiting (contended)

#[inline]
fn is_locked(state: State) -> bool {
    state & LOCKED != 0
}
#[inline]
fn is_unlocked(state: State) -> bool {
    state & LOCKED == 0
}

impl SeqLock {
    /// Grabs the lock for writing.
    #[inline]
    pub(crate) fn write(&self) -> SeqLockWriteGuard<'_> {
        // Get current interrupt state and disable interrupts when the user
        // explicitly declares that privileged instructions are available.
        #[cfg(portable_atomic_unsafe_assume_privileged)]
        let interrupt_state = interrupt::disable();

        let mut previous = self.state.load(Ordering::Relaxed);
        if is_locked(previous)
            || self
                .state
                .compare_exchange(previous, LOCKED, LOCK_ACQUIRE_ORDER, Ordering::Relaxed)
                .is_err()
        {
            previous = self.write_contended();
        }
        // To synchronize with the acquire fence in `validate_read` via any modification to
        // the data at the critical section of `previous` (seq_lock.rs) or `(state_hi, previous)`
        // (seq_lock_wide.rs).
        crate::fence(Ordering::Release);

        SeqLockWriteGuard {
            lock: self,
            state: previous,
            #[cfg(portable_atomic_unsafe_assume_privileged)]
            interrupt_state,
        }
    }

    #[cold]
    #[must_use]
    fn write_contended(&self) -> State {
        // Spin first to speed things up if the lock is released quickly.
        let mut state = self.spin();

        // If it's unlocked now, attempt to take the lock
        // without marking it as contended.
        if is_unlocked(state) {
            match self.state.compare_exchange(state, LOCKED, LOCK_ACQUIRE_ORDER, Ordering::Relaxed)
            {
                Ok(_) => return state, // Locked!
                Err(s) => state = s,
            }
        }

        loop {
            // Put the lock in contended state.
            // We avoid an unnecessary write if it as already set to CONTENDED,
            // to be friendlier for the caches.
            if state != CONTENDED {
                state = self.state.swap(CONTENDED, LOCK_ACQUIRE_ORDER);
                // We changed it from unlocked to CONTENDED, so we just successfully locked it.
                if is_unlocked(state) {
                    return state;
                }
            }

            // Wait for the futex to change state, assuming it is still CONTENDED.
            wait(&self.state, CONTENDED);

            // Spin again after waking up.
            state = self.spin();
        }
    }

    fn spin(&self) -> State {
        let mut spin = 100;
        loop {
            // We only use `load` (and not `swap` or `compare_exchange`)
            // while spinning, to be easier on the caches.
            let state = self.state.load(Ordering::Relaxed);

            // We stop spinning when unlocked,
            // but also when it's CONTENDED.
            if state != LOCKED || spin == 0 {
                return state;
            }

            #[allow(deprecated)]
            core::sync::atomic::spin_loop_hint();
            spin -= 1;
        }
    }

    /// Release the lock with the given stamp.
    #[inline]
    unsafe fn unlock(&self, next_stamp: State) {
        // Release ordering for synchronizing with `optimistic_read` and `write`.
        if self.state.swap(next_stamp, LOCK_RELEASE_ORDER) == CONTENDED {
            // We only wake up one thread. When that thread locks the mutex, it
            // will mark the mutex as CONTENDED (see write_contended above),
            // which makes sure that any other waiting threads will also be
            // woken up eventually.
            self.notify();
        }
    }

    #[cold]
    fn notify(&self) {
        notify_one(&self.state);
    }
}

/// An RAII guard that releases the lock and increments the stamp when dropped.
#[must_use]
pub(crate) struct SeqLockWriteGuard<'a> {
    /// The parent lock.
    lock: &'a SeqLock,

    /// The stamp before locking.
    state: State,

    /// The interrupt state before disabling.
    #[cfg(portable_atomic_unsafe_assume_privileged)]
    interrupt_state: interrupt::State,
}

impl SeqLockWriteGuard<'_> {
    /// Releases the lock without incrementing the stamp.
    #[inline]
    pub(crate) unsafe fn abort(self) {
        // We specifically don't want to call drop(), since that's
        // what increments the stamp.
        let this = ManuallyDrop::new(self);

        // Restore the stamp and release the lock.
        // SAFETY: the state was retrieved by the previous `write`.
        // the caller must guarantee that the value hasn't been changed.
        unsafe { this.lock.unlock(this.state) }

        // Restore interrupt state.
        // SAFETY: the state was retrieved by the previous `disable`.
        #[cfg(portable_atomic_unsafe_assume_privileged)]
        unsafe {
            interrupt::restore(this.interrupt_state);
        }
    }
}

impl Drop for SeqLockWriteGuard<'_> {
    #[inline]
    fn drop(&mut self) {
        let next_stamp = self.state.wrapping_add(2);
        self.lock.handle_next_stamp(next_stamp);

        // Increment the stamp and release the lock.
        // SAFETY: handle_next_stamp ensures the state that has never been used.
        unsafe { self.lock.unlock(next_stamp) }

        // Restore interrupt state.
        // SAFETY: the state was retrieved by the previous `disable`.
        #[cfg(portable_atomic_unsafe_assume_privileged)]
        unsafe {
            interrupt::restore(self.interrupt_state);
        }
    }
}

#[cfg(test)]
mod tests {
    // Common cases are covered by seqlock_common.rs.

    // TODO: cleanup
    #[cfg(any(target_os = "linux", target_os = "android", target_os = "freebsd"))]
    #[test]
    #[ignore = "require RLIMIT_RTPRIO >= 3 on Linux / PRIV_SCHED_RTPRIO on FreeBSD"]
    fn test_pi() {
        use core::{
            sync::atomic::{AtomicU8, Ordering},
            time::Duration,
        };
        use std::{sync::mpsc, thread, time::Instant};

        use super::{CONTENDED, SeqLock};
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
                low_locked_tx.send(()).unwrap();
                // Continue on disconnection so a failure in the mid thread
                // cannot leave this realtime thread blocked forever.
                let _ = release_low_rx.recv();
                drop(guard);
            });

            let low_locked = low_locked_rx.recv_timeout(Duration::from_secs(1)).is_ok();
            let high = if low_locked {
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

            // Only high can be contending here, so CONTENDED shows that it has
            // entered the contended path. Since all workers are pinned to the
            // same CPU, mid cannot run until the higher-priority high has
            // blocked in the normal futex wait path.
            let high_waiting = if low_locked {
                let wait_deadline = Instant::now() + Duration::from_secs(1);
                loop {
                    if lock.state.load(Ordering::Relaxed) == CONTENDED {
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

                    // This is also the watchdog. With a normal futex, mid
                    // prevents low from running until this deadline expires.
                    let inversion_deadline = Instant::now() + Duration::from_millis(250);
                    while outcome.load(Ordering::Relaxed) == PENDING {
                        if Instant::now() >= inversion_deadline {
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
            (low_locked, high_waiting, mid_result, low_result, high_result)
        });

        if let Some(mid_result) = mid_result {
            mid_result.unwrap();
        }
        low_result.unwrap();
        if let Some(high_result) = high_result {
            high_result.unwrap();
        }
        assert!(low_locked, "low did not acquire the lock before the timeout");
        assert!(high_waiting, "high did not enter the normal futex wait path before the timeout",);
        assert_eq!(
            outcome.load(Ordering::Relaxed),
            TIMED_OUT,
            "high acquired the lock while mid was runnable",
        );
    }
}
