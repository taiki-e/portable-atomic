// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.7/crossbeam-utils/src/atomic/seq_lock.rs.

#[path = "imp.rs"]
pub(super) mod imp;

use core::{
    mem::ManuallyDrop,
    sync::atomic::{self, Ordering},
};

use crate::utils::Backoff;

// See mod.rs for details.
#[cfg(any(target_pointer_width = "16", target_pointer_width = "32"))]
use core::sync::atomic::AtomicU64 as AtomicStamp;
#[cfg(not(any(target_pointer_width = "16", target_pointer_width = "32")))]
use core::sync::atomic::AtomicUsize as AtomicStamp;
#[cfg(not(any(target_pointer_width = "16", target_pointer_width = "32")))]
pub(crate) type Stamp = usize;
#[cfg(any(target_pointer_width = "16", target_pointer_width = "32"))]
pub(crate) type Stamp = u64;

/// A simple stamped lock.
pub(crate) struct SeqLock {
    /// The current state of the lock.
    ///
    /// All bits except the least significant one hold the current stamp. When locked, the state
    /// equals 1 and doesn't contain a valid stamp.
    state: AtomicStamp,
}

impl SeqLock {
    #[inline]
    pub(crate) const fn new() -> Self {
        Self { state: AtomicStamp::new(0) }
    }

    /// If not locked, returns the current stamp.
    ///
    /// This method should be called before optimistic reads.
    #[cfg(any(test, not(portable_atomic_cmpxchg16b_dynamic)))]
    #[inline]
    pub(crate) fn optimistic_read(&self) -> Option<Stamp> {
        let state = self.state.load(Ordering::Acquire);
        if state == 1 {
            None
        } else {
            Some(state)
        }
    }

    /// Returns `true` if the current stamp is equal to `stamp`.
    ///
    /// This method should be called after optimistic reads to check whether they are valid. The
    /// argument `stamp` should correspond to the one returned by method `optimistic_read`.
    #[cfg(any(test, not(portable_atomic_cmpxchg16b_dynamic)))]
    #[inline]
    pub(crate) fn validate_read(&self, stamp: Stamp) -> bool {
        atomic::fence(Ordering::Acquire);
        self.state.load(Ordering::Relaxed) == stamp
    }

    /// Grabs the lock for writing.
    #[inline]
    pub(crate) fn write(&self) -> SeqLockWriteGuard<'_> {
        let mut backoff = Backoff::new();
        loop {
            let previous = self.state.swap(1, Ordering::Acquire);

            if previous != 1 {
                atomic::fence(Ordering::Release);

                return SeqLockWriteGuard { lock: self, state: previous };
            }

            while self.state.load(Ordering::Relaxed) == 1 {
                backoff.snooze();
            }
        }
    }
}

/// An RAII guard that releases the lock and increments the stamp when dropped.
#[must_use]
pub(crate) struct SeqLockWriteGuard<'a> {
    /// The parent lock.
    lock: &'a SeqLock,

    /// The stamp before locking.
    state: Stamp,
}

impl SeqLockWriteGuard<'_> {
    /// Releases the lock without incrementing the stamp.
    #[inline]
    pub(crate) fn abort(self) {
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
