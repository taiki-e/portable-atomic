// SPDX-License-Identifier: Apache-2.0 OR MIT

// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.7/crossbeam-utils/src/atomic/seq_lock.rs.

use core::{
    mem::ManuallyDrop,
    sync::atomic::{self, AtomicU64, Ordering},
};

use super::utils::Backoff;

// See mod.rs for details.
pub(super) type AtomicChunk = AtomicU64;
pub(super) type Chunk = u64;

pub(super) type State = u64;

const LOCKED: State = 1;

/// A simple stamped lock.
pub(super) struct SeqLock {
    /// The current state of the lock.
    ///
    /// All bits except the least significant one hold the current stamp. When locked, the state
    /// equals 1 and doesn't contain a valid stamp.
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
        if state == LOCKED { None } else { Some(state) }
    }

    /// Returns `true` if the current stamp is equal to `stamp`.
    ///
    /// This method should be called after optimistic reads to check whether they are valid. The
    /// argument `stamp` should correspond to the one returned by method `optimistic_read`.
    #[inline]
    pub(super) fn validate_read(&self, stamp: State) -> bool {
        atomic::fence(Ordering::Acquire);
        self.state.load(Ordering::Relaxed) == stamp
    }

    /// Grabs the lock for writing.
    #[inline]
    pub(super) fn write(&self) -> SeqLockWriteGuard<'_> {
        let mut backoff = Backoff::new();
        loop {
            let previous = self.state.swap(LOCKED, Ordering::Acquire);

            if previous != LOCKED {
                atomic::fence(Ordering::Release);

                return SeqLockWriteGuard { lock: self, state: previous };
            }

            while self.state.load(Ordering::Relaxed) == LOCKED {
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
    state: State,
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
        this.lock.state.store(this.state, Ordering::Release);
    }
}

impl Drop for SeqLockWriteGuard<'_> {
    #[inline]
    fn drop(&mut self) {
        // Release the lock and increment the stamp.
        //
        // Release ordering for synchronizing with `optimistic_read`.
        self.lock.state.store(self.state.wrapping_add(2), Ordering::Release);
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
