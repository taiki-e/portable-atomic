// SPDX-License-Identifier: Apache-2.0 OR MIT

// SeqLock with unified lock state.
//
// Seqlock logic is adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/seq_lock.rs.
// Wait logic is adapted from https://github.com/rust-lang/rust/blob/1.97.0/library/std/src/sys/sync/mutex/futex.rs.

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
