// SPDX-License-Identifier: Apache-2.0 OR MIT

// Seqlock logic is adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/seq_lock.rs.
// Wait logic is adapted from https://github.com/rust-lang/rust/blob/1.92.0/library/std/src/sys/sync/mutex/futex.rs.

use core::{
    mem::ManuallyDrop,
    sync::atomic::{AtomicU64, Ordering},
};

use super::wait::{notify64_one as notify, wait64 as wait};
#[cfg(portable_atomic_unsafe_assume_privileged)]
use crate::imp::interrupt::arch as interrupt;

pub(super) type State = u64;

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

/// A stamped lock.
pub(super) struct SeqLock {
    /// The current state of the lock.
    ///
    /// If the least significant bit is 0, this holds the current stamp.
    /// If the least significant bit is 1, this lock is locked and the state doesn't contain a valid stamp.
    state: AtomicU64,
}

impl SeqLock {
    #[inline]
    pub(super) const fn new() -> Self {
        Self { state: AtomicU64::new(0) }
    }

    /// If not locked, returns the current stamp.
    ///
    /// This method should be called before optimistic reads.
    #[inline]
    pub(super) fn optimistic_read(&self) -> Option<State> {
        let state = self.state.load(Ordering::Acquire);
        if is_locked(state) { None } else { Some(state) }
    }

    /// Returns `true` if the current stamp is equal to `stamp`.
    ///
    /// This method should be called after optimistic reads to check whether they are valid. The
    /// argument `stamp` should correspond to the one returned by method `optimistic_read`.
    #[inline]
    pub(super) fn validate_read(&self, stamp: State) -> bool {
        crate::fence(Ordering::Acquire);
        self.state.load(Ordering::Relaxed) == stamp
    }

    /// Grabs the lock for writing.
    #[inline]
    pub(super) fn write(&self) -> SeqLockWriteGuard<'_> {
        // Get current interrupt state and disable interrupts when the user
        // explicitly declares that privileged instructions are available.
        #[cfg(portable_atomic_unsafe_assume_privileged)]
        let interrupt_state = interrupt::disable();

        let mut previous = self.state.load(Ordering::Relaxed);
        if is_locked(previous)
            || self
                .state
                .compare_exchange(previous, LOCKED, Ordering::Acquire, Ordering::Relaxed)
                .is_err()
        {
            previous = self.write_contended();
        }
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
            match self.state.compare_exchange(state, LOCKED, Ordering::Acquire, Ordering::Relaxed) {
                Ok(_) => return state, // Locked!
                Err(s) => state = s,
            }
        }

        loop {
            // Put the lock in contended state.
            // We avoid an unnecessary write if it as already set to CONTENDED,
            // to be friendlier for the caches.
            if state != CONTENDED {
                state = self.state.swap(CONTENDED, Ordering::Acquire);
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

    #[cold]
    fn notify(&self) {
        notify(&self.state);
    }
}

/// An RAII guard that releases the lock and increments the stamp when dropped.
#[must_use]
pub(super) struct SeqLockWriteGuard<'a> {
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
    pub(super) fn abort(self) {
        // We specifically don't want to call drop(), since that's
        // what increments the stamp.
        let this = ManuallyDrop::new(self);

        // Restore the stamp.
        //
        // Release ordering for synchronizing with `optimistic_read`.
        let state = this.lock.state.swap(this.state, Ordering::Release);

        // Restore interrupt state.
        // SAFETY: the state was retrieved by the previous `disable`.
        #[cfg(portable_atomic_unsafe_assume_privileged)]
        unsafe {
            interrupt::restore(this.interrupt_state);
        }

        if state == CONTENDED {
            // We only wake up one thread. When that thread locks the mutex, it
            // will mark the mutex as CONTENDED (see write_contended above),
            // which makes sure that any other waiting threads will also be
            // woken up eventually.
            this.lock.notify();
        }
    }
}

impl Drop for SeqLockWriteGuard<'_> {
    #[inline]
    fn drop(&mut self) {
        // Release the lock and increment the stamp.
        //
        // Release ordering for synchronizing with `optimistic_read`.
        let state = self.lock.state.swap(self.state.wrapping_add(2), Ordering::Release);

        // Restore interrupt state.
        // SAFETY: the state was retrieved by the previous `disable`.
        #[cfg(portable_atomic_unsafe_assume_privileged)]
        unsafe {
            interrupt::restore(self.interrupt_state);
        }

        if state == CONTENDED {
            // We only wake up one thread. When that thread locks the mutex, it
            // will mark the mutex as CONTENDED (see write_contended above),
            // which makes sure that any other waiting threads will also be
            // woken up eventually.
            self.lock.notify();
        }
    }
}

#[cfg(test)]
mod tests {
    use super::SeqLock;

    #[test]
    fn smoke() {
        let lock = SeqLock::new();
        let before = lock.optimistic_read().unwrap();
        assert!(lock.validate_read(before));
        {
            let _guard = lock.write();
            assert!(lock.optimistic_read().is_none());
        }
        assert!(!lock.validate_read(before));
        let after = lock.optimistic_read().unwrap();
        assert_ne!(before, after);
    }

    #[test]
    fn test_abort() {
        let lock = SeqLock::new();
        let before = lock.optimistic_read().unwrap();
        {
            let guard = lock.write();
            assert!(lock.optimistic_read().is_none());
            guard.abort();
        }
        let after = lock.optimistic_read().unwrap();
        assert_eq!(before, after, "aborted write does not update the stamp");
    }
}
