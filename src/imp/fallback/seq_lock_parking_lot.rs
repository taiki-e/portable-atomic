// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.7/crossbeam-utils/src/atomic/seq_lock.rs.
// Adjusted to use parking_lot instead of spinlock.

use core::{
    mem::ManuallyDrop,
    sync::atomic::{self, AtomicUsize, Ordering},
};

use parking_lot::{Mutex, MutexGuard};

/// A simple stamped lock.
pub(crate) struct SeqLock {
    /// The current state of the lock.
    ///
    /// All bits except the least significant one hold the current stamp. When locked, the state
    /// equals 1 and doesn't contain a valid stamp.
    state: AtomicUsize,

    lock: Mutex<()>,
}

impl SeqLock {
    pub(crate) const fn new() -> Self {
        Self { state: AtomicUsize::new(0), lock: parking_lot::const_mutex(()) }
    }

    /// If not locked, returns the current stamp.
    ///
    /// This method should be called before optimistic reads.
    #[inline]
    pub(crate) fn optimistic_read(&self) -> Option<usize> {
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
    #[inline]
    pub(crate) fn validate_read(&self, stamp: usize) -> bool {
        atomic::fence(Ordering::Acquire);
        self.state.load(Ordering::Relaxed) == stamp
    }

    /// Grabs the lock for writing.
    #[inline]
    pub(crate) fn write(&'static self) -> SeqLockWriteGuard {
        let guard = self.lock.lock();

        let previous = self.state.load(Ordering::Relaxed);
        self.state.store(1, Ordering::Relaxed);
        atomic::fence(Ordering::Release);

        debug_assert_ne!(previous, 1);
        SeqLockWriteGuard { lock: self, state: previous, guard: Some(guard) }
    }
}

/// An RAII guard that releases the lock and increments the stamp when dropped.
#[must_use]
pub(crate) struct SeqLockWriteGuard {
    /// The parent lock.
    lock: &'static SeqLock,

    /// The stamp before locking.
    state: usize,

    guard: Option<MutexGuard<'static, ()>>,
}

impl SeqLockWriteGuard {
    /// Releases the lock without incrementing the stamp.
    #[inline]
    pub(crate) fn abort(self) {
        // We specifically don't want to call drop(), since that's
        // what increments the stamp.
        let mut this = ManuallyDrop::new(self);

        // Restore the stamp.
        //
        // Release ordering for synchronizing with `optimistic_read`.
        this.lock.state.store(this.state, Ordering::Release);

        // Release the lock.
        debug_assert!(this.guard.is_some());
        this.guard = None;
    }
}

impl Drop for SeqLockWriteGuard {
    #[inline]
    fn drop(&mut self) {
        // Increment the stamp.
        //
        // Release ordering for synchronizing with `optimistic_read`.
        self.lock.state.store(self.state.wrapping_add(2), Ordering::Release);

        // The lock will be automatically released when `guard` is dropped.
        debug_assert!(self.guard.is_some());
    }
}

#[cfg(test)]
mod tests {
    use super::SeqLock;

    #[test]
    fn test_abort() {
        static LK: SeqLock = SeqLock::new();
        let before = LK.optimistic_read().unwrap();
        {
            let guard = LK.write();
            guard.abort();
        }
        let after = LK.optimistic_read().unwrap();
        assert_eq!(before, after, "aborted write does not update the stamp");
    }
}
