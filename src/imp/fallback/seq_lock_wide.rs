// SPDX-License-Identifier: Apache-2.0 OR MIT

// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.7/crossbeam-utils/src/atomic/seq_lock_wide.rs.

use core::{
    mem::ManuallyDrop,
    sync::atomic::{self, AtomicU32, Ordering},
};

use super::utils::Backoff;
#[cfg(portable_atomic_unsafe_assume_privileged)]
use crate::imp::interrupt::arch as interrupt;

// See mod.rs for details.
pub(super) type AtomicChunk = AtomicU32;
pub(super) type Chunk = u32;

pub(super) type State = u32;

const LOCKED: State = 1;

/// A simple stamped lock.
///
/// The state is represented as two `AtomicU32`: `state_hi` for high bits and `state_lo` for low
/// bits.
pub(super) struct SeqLock {
    /// The high bits of the current state of the lock.
    state_hi: AtomicU32,

    /// The low bits of the current state of the lock.
    ///
    /// All bits except the least significant one hold the current stamp. When locked, the state_lo
    /// equals 1 and doesn't contain a valid stamp.
    state_lo: AtomicU32,
}

impl SeqLock {
    #[inline]
    pub(super) const fn new() -> Self {
        Self { state_hi: AtomicU32::new(0), state_lo: AtomicU32::new(0) }
    }

    /// If not locked, returns the current stamp.
    ///
    /// This method should be called before optimistic reads.
    #[inline]
    pub(super) fn optimistic_read(&self) -> Option<(State, State)> {
        // The acquire loads from `state_hi` and `state_lo` synchronize with the release stores in
        // `SeqLockWriteGuard::drop` and `SeqLockWriteGuard::abort`.
        //
        // As a consequence, we can make sure that (1) all writes within the era of `state_hi - 1`
        // happens before now; and therefore, (2) if `state_lo` is even, all writes within the
        // critical section of (`state_hi`, `state_lo`) happens before now.
        let state_hi = self.state_hi.load(Ordering::Acquire);
        let state_lo = self.state_lo.load(Ordering::Acquire);
        if state_lo == LOCKED { None } else { Some((state_hi, state_lo)) }
    }

    /// Returns `true` if the current stamp is equal to `stamp`.
    ///
    /// This method should be called after optimistic reads to check whether they are valid. The
    /// argument `stamp` should correspond to the one returned by method `optimistic_read`.
    #[inline]
    pub(super) fn validate_read(&self, stamp: (State, State)) -> bool {
        // Thanks to the fence, if we're noticing any modification to the data at the critical
        // section of `(stamp.0, stamp.1)`, then the critical section's write of 1 to state_lo should be
        // visible.
        atomic::fence(Ordering::Acquire);

        // So if `state_lo` coincides with `stamp.1`, then either (1) we're noticing no modification
        // to the data after the critical section of `(stamp.0, stamp.1)`, or (2) `state_lo` wrapped
        // around.
        //
        // If (2) is the case, the acquire ordering ensures we see the new value of `state_hi`.
        let state_lo = self.state_lo.load(Ordering::Acquire);

        // If (2) is the case and `state_hi` coincides with `stamp.0`, then `state_hi` also wrapped
        // around, which we give up to correctly validate the read.
        let state_hi = self.state_hi.load(Ordering::Relaxed);

        // Except for the case that both `state_hi` and `state_lo` wrapped around, the following
        // condition implies that we're noticing no modification to the data after the critical
        // section of `(stamp.0, stamp.1)`.
        (state_hi, state_lo) == stamp
    }

    /// Grabs the lock for writing.
    #[inline]
    pub(super) fn write(&self) -> SeqLockWriteGuard<'_> {
        // Get current interrupt state and disable interrupts when the user
        // explicitly declares that privileged instructions are available.
        #[cfg(portable_atomic_unsafe_assume_privileged)]
        let interrupt_state = interrupt::disable();

        let mut backoff = Backoff::new();
        loop {
            let previous = self.state_lo.swap(LOCKED, Ordering::Acquire);

            if previous != LOCKED {
                // To synchronize with the acquire fence in `validate_read` via any modification to
                // the data at the critical section of `(state_hi, previous)`.
                atomic::fence(Ordering::Release);

                return SeqLockWriteGuard {
                    lock: self,
                    state_lo: previous,
                    #[cfg(portable_atomic_unsafe_assume_privileged)]
                    interrupt_state,
                };
            }

            while self.state_lo.load(Ordering::Relaxed) == LOCKED {
                backoff.snooze();
            }
        }
    }
}

/// An RAII guard that releases the lock and increments the stamp when dropped.
#[must_use]
pub(super) struct SeqLockWriteGuard<'a> {
    /// The parent lock.
    lock: &'a SeqLock,

    /// The stamp before locking.
    state_lo: State,

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
        this.lock.state_lo.store(this.state_lo, Ordering::Release);

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
        let state_lo = self.state_lo.wrapping_add(2);

        // Increase the high bits if the low bits wrap around.
        //
        // Release ordering for synchronizing with `optimistic_read`.
        if state_lo == 0 {
            let state_hi = self.lock.state_hi.load(Ordering::Relaxed);
            self.lock.state_hi.store(state_hi.wrapping_add(1), Ordering::Release);
        }

        // Release the lock and increment the stamp.
        //
        // Release ordering for synchronizing with `optimistic_read`.
        self.lock.state_lo.store(state_lo, Ordering::Release);

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
    use super::SeqLock;

    #[test]
    fn smoke() {
        let lock = SeqLock::new();
        let before = lock.optimistic_read().unwrap();
        assert!(lock.validate_read(before));
        {
            let _guard = lock.write();
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
            guard.abort();
        }
        let after = lock.optimistic_read().unwrap();
        assert_eq!(before, after, "aborted write does not update the stamp");
    }
}
