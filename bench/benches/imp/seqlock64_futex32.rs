// SPDX-License-Identifier: Apache-2.0 OR MIT

// SeqLock with separated lock state and stamp.
//
// This is for platforms that cannot use 64-bit futex but can use 64-bit registers.
//
// Seqlock logic is adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/seq_lock.rs.
// Lock and wait logic is adapted from https://github.com/rust-lang/rust/blob/1.97.0/library/std/src/sys/sync/mutex/futex.rs.

#[cfg(portable_atomic_unsafe_assume_privileged)]
compile_error!("internal error: unreachable");
cfg_no_fast_atomic_64!({
    compile_error!("internal error: unreachable");
});

use core::{mem::ManuallyDrop, sync::atomic::Ordering};

use super::{notify32_one as notify_one, wait32 as wait};
use crate::imp::{
    AtomicU32, AtomicU64,
    fallback::{LOCK_ACQUIRE_ORDER, LOCK_RELEASE_ORDER},
};

type State = u32;
pub(crate) type Stamp = u64;

pub(crate) struct SeqLock {
    /// The current state of the lock.
    lock: AtomicU32,

    /// The the current stamp.
    stamp: AtomicU64,
}

const UNLOCKED: State = 0;
const LOCKED: State = 1; // locked, no other threads waiting
const CONTENDED: State = 2; // locked, and other threads waiting (contended)

impl SeqLock {
    #[inline]
    pub(crate) const fn new() -> Self {
        Self { lock: AtomicU32::new(UNLOCKED), stamp: AtomicU64::new(0) }
    }

    /// If not locked, returns the current stamp.
    ///
    /// This method should be called before optimistic reads.
    #[inline]
    pub(crate) fn optimistic_read(&self) -> Option<Stamp> {
        // The acquire load from `stamp` synchronizes with the release stores in
        // `SeqLockWriteGuard::drop` and `SeqLockWriteGuard::abort`.
        let stamp = self.stamp.load(Ordering::Acquire);
        if stamp & 1 != 0 { None } else { Some(stamp) }
    }

    /// Returns `true` if the current stamp is equal to `stamp`.
    ///
    /// This method should be called after optimistic reads to check whether they are valid. The
    /// argument `stamp` should correspond to the one returned by method `optimistic_read`.
    #[inline]
    pub(crate) fn validate_read(&self, stamp: Stamp) -> bool {
        // Thanks to the fence, if we're noticing any modification to the data at the critical
        // section of `stamp`, then the critical section's write of 1 to state
        // should be visible.
        crate::fence(Ordering::Acquire);
        self.stamp.load(Ordering::Relaxed) == stamp
    }

    #[inline]
    pub(crate) fn write(&self) -> SeqLockWriteGuard<'_> {
        if self
            .lock
            .compare_exchange(UNLOCKED, LOCKED, LOCK_ACQUIRE_ORDER, Ordering::Relaxed)
            .is_err()
        {
            self.write_contended();
        }
        let stamp = self.stamp.load(Ordering::Relaxed).wrapping_add(1);
        self.stamp.store(stamp, Ordering::Relaxed);
        // To synchronize with the acquire fence in `validate_read` via any modification to
        // the data at the critical section of `previous`.
        crate::fence(Ordering::Release);

        SeqLockWriteGuard { lock: self, stamp }
    }

    #[cold]
    fn write_contended(&self) {
        // Spin first to speed things up if the lock is released quickly.
        let mut state = self.spin();

        // If it's unlocked now, attempt to take the lock
        // without marking it as contended.
        if state == UNLOCKED {
            match self.lock.compare_exchange(
                UNLOCKED,
                LOCKED,
                LOCK_ACQUIRE_ORDER,
                Ordering::Relaxed,
            ) {
                Ok(_) => return, // Locked!
                Err(s) => state = s,
            }
        }

        loop {
            // Put the lock in contended state.
            // We avoid an unnecessary write if it as already set to CONTENDED,
            // to be friendlier for the caches.
            if state != CONTENDED && self.lock.swap(CONTENDED, LOCK_ACQUIRE_ORDER) == UNLOCKED {
                // We changed it from UNLOCKED to CONTENDED, so we just successfully locked it.
                return;
            }

            // Wait for the futex to change state, assuming it is still CONTENDED.
            wait(&self.lock, CONTENDED);

            // Spin again after waking up.
            state = self.spin();
        }
    }

    fn spin(&self) -> State {
        let mut spin = 100;
        loop {
            // We only use `load` (and not `swap` or `compare_exchange`)
            // while spinning, to be easier on the caches.
            let state = self.lock.load(Ordering::Relaxed);

            // We stop spinning when the mutex is UNLOCKED,
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
        notify_one(&self.lock);
    }
}

#[must_use]
pub(crate) struct SeqLockWriteGuard<'a> {
    /// The parent lock.
    lock: &'a SeqLock,

    /// The current stamp.
    stamp: Stamp,
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
        this.lock.stamp.store(this.stamp.wrapping_sub(1), Ordering::Release);

        // Release the lock.
        //
        // Release ordering for synchronizing with `write`.
        if this.lock.lock.swap(UNLOCKED, LOCK_RELEASE_ORDER) == CONTENDED {
            // We only wake up one thread. When that thread locks the mutex, it
            // will mark the mutex as CONTENDED (see lock_contended above),
            // which makes sure that any other waiting threads will also be
            // woken up eventually.
            this.lock.notify();
        }
    }
}

impl Drop for SeqLockWriteGuard<'_> {
    #[inline]
    fn drop(&mut self) {
        // Increment the stamp.
        //
        // Release ordering for synchronizing with `optimistic_read`.
        self.lock.stamp.store(self.stamp.wrapping_add(1), Ordering::Release);

        // Release the lock.
        //
        // Release ordering for synchronizing with `write`.
        if self.lock.lock.swap(UNLOCKED, LOCK_RELEASE_ORDER) == CONTENDED {
            // We only wake up one thread. When that thread locks the mutex, it
            // will mark the mutex as CONTENDED (see lock_contended above),
            // which makes sure that any other waiting threads will also be
            // woken up eventually.
            self.lock.notify();
        }
    }
}

#[cfg(test)]
#[allow(clippy::items_after_test_module)]
mod tests {
    use core::sync::atomic::Ordering;

    use super::SeqLock;

    #[test]
    fn smoke() {
        let lock = SeqLock::new();
        assert_eq!(lock.lock.load(Ordering::Relaxed), 0);
        let before = lock.optimistic_read().unwrap();
        assert!(lock.validate_read(before));
        {
            let _guard = lock.write();
            assert_eq!(lock.lock.load(Ordering::Relaxed), 1);
            assert!(lock.optimistic_read().is_none());
        }
        assert_eq!(lock.lock.load(Ordering::Relaxed), 0);
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
