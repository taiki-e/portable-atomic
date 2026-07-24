// SPDX-License-Identifier: Apache-2.0 OR MIT

// Seqlock logic is adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/seq_lock.rs
// and https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/seq_lock_wide.rs.
// Wait logic is adapted from https://github.com/rust-lang/rust/blob/1.97.0/library/std/src/sys/sync/mutex/futex.rs.

use core::{mem::ManuallyDrop, sync::atomic::Ordering};

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

// In some architectures, SeqCst/Acquire/Release swap/CAS are the same. Therefore,
// using SeqCst here allows us to omit the SeqCst fence in operations other
// than load (that may not use write lock), without degrading performance in
// non-SeqCst ops.
// LoongArch64 v1.1 added Acquire/Release LL/SC, but is also added
// Relaxed/SeqCst CAS which is more preferred for CAS.
cfg_sel!({
    #[cfg(any(
        target_arch = "loongarch64",
        target_arch = "m68k",
        target_arch = "s390x",
        target_arch = "x86",
        target_arch = "x86_64",
    ))]
    {
        pub(crate) const WRITE_LOCK_ACQUIRE_ORDER: Ordering = Ordering::SeqCst;
        pub(crate) const WRITE_LOCK_RELEASE_ORDER: Ordering = Ordering::SeqCst;
    }
    #[cfg(else)]
    {
        pub(crate) const WRITE_LOCK_ACQUIRE_ORDER: Ordering = Ordering::Acquire;
        pub(crate) const WRITE_LOCK_RELEASE_ORDER: Ordering = Ordering::Release;
    }
});

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
                .compare_exchange(previous, LOCKED, WRITE_LOCK_ACQUIRE_ORDER, Ordering::Relaxed)
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
            match self.state.compare_exchange(
                state,
                LOCKED,
                WRITE_LOCK_ACQUIRE_ORDER,
                Ordering::Relaxed,
            ) {
                Ok(_) => return state, // Locked!
                Err(s) => state = s,
            }
        }

        loop {
            // Put the lock in contended state.
            // We avoid an unnecessary write if it as already set to CONTENDED,
            // to be friendlier for the caches.
            if state != CONTENDED {
                state = self.state.swap(CONTENDED, WRITE_LOCK_ACQUIRE_ORDER);
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
    pub(crate) fn abort(self) {
        // We specifically don't want to call drop(), since that's
        // what increments the stamp.
        let this = ManuallyDrop::new(self);

        // Restore the stamp.
        //
        // Release ordering for synchronizing with `optimistic_read`.
        if this.lock.state.swap(this.state, WRITE_LOCK_RELEASE_ORDER) == CONTENDED {
            // We only wake up one thread. When that thread locks the mutex, it
            // will mark the mutex as CONTENDED (see write_contended above),
            // which makes sure that any other waiting threads will also be
            // woken up eventually.
            this.lock.notify();
        }

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
        let state = self.next_stamp();

        // Release the lock and increment the stamp.
        //
        // Release ordering for synchronizing with `optimistic_read`.
        if self.lock.state.swap(state, WRITE_LOCK_RELEASE_ORDER) == CONTENDED {
            // We only wake up one thread. When that thread locks the mutex, it
            // will mark the mutex as CONTENDED (see write_contended above),
            // which makes sure that any other waiting threads will also be
            // woken up eventually.
            self.lock.notify();
        }

        // Restore interrupt state.
        // SAFETY: the state was retrieved by the previous `disable`.
        #[cfg(portable_atomic_unsafe_assume_privileged)]
        unsafe {
            interrupt::restore(self.interrupt_state);
        }
    }
}

#[cfg(test)]
#[allow(clippy::items_after_test_module)]
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
    fn test_wrap() {
        let mut lock = SeqLock::new();
        let zero = lock.optimistic_read().unwrap();
        *lock.state.get_mut() = 0xFFFF_FFFE; // u32::MAX & !1
        let before = lock.optimistic_read().unwrap();
        assert!(lock.validate_read(before));
        {
            let _guard = lock.write();
            assert!(lock.optimistic_read().is_none());
        }
        assert!(!lock.validate_read(before));
        let after = lock.optimistic_read().unwrap();
        assert_ne!(before, after);
        assert_ne!(after, zero);
        #[allow(clippy::identity_op)]
        {
            assert_eq!(*lock.state.get_mut() & 0xFFFF_FFFF, 0);
        }
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
