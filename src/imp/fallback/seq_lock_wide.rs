// SPDX-License-Identifier: Apache-2.0 OR MIT

// Seqlock logic is adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/seq_lock.rs.
// Wait logic is adapted from https://github.com/rust-lang/rust/blob/1.92.0/library/std/src/sys/sync/mutex/futex.rs.

use core::{
    mem::ManuallyDrop,
    sync::atomic::{self, AtomicU32, Ordering},
};

use super::{
    utils::sc_fence,
    wait::{notify32_one as notify, wait32 as wait},
};
#[cfg(portable_atomic_unsafe_assume_privileged)]
use crate::imp::interrupt::arch as interrupt;
use crate::utils::unlikely;

pub(super) type State = u32;

const LOCKED: State = 0b01; // locked, no other threads waiting
const CONTENDED: State = 0b11; // locked, and other threads waiting (contended)

#[inline]
fn is_locked(state_lo: State) -> bool {
    state_lo & LOCKED != 0
}
#[inline]
fn is_unlocked(state_lo: State) -> bool {
    state_lo & LOCKED == 0
}

/// A stamped lock.
///
/// The state is represented as two `AtomicU32`: `state_hi` for high bits and `state_lo` for low
/// bits.
pub(super) struct SeqLock {
    /// The high bits of the current state of the lock.
    state_hi: AtomicU32,

    /// The low bits of the current state of the lock.
    ///
    /// If the least significant bit is 0, the state holds the current stamp.
    /// If the least significant bit is 1, this lock is locked and the state doesn't contain a valid stamp.
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
    pub(super) fn optimistic_read(&self, order: Ordering) -> Option<(State, State)> {
        if unlikely(order == Ordering::SeqCst) {
            sc_fence();
        }
        // The acquire loads from `state_hi` and `state_lo` synchronize with the release stores in
        // `SeqLockWriteGuard::drop` and `SeqLockWriteGuard::abort`.
        //
        // As a consequence, we can make sure that (1) all writes within the era of `state_hi - 1`
        // happens before now; and therefore, (2) if `state_lo` is even, all writes within the
        // critical section of (`state_hi`, `state_lo`) happens before now.
        let state_hi = self.state_hi.load(Ordering::Acquire);
        let state_lo = self.state_lo.load(Ordering::Acquire);
        if is_locked(state_lo) { None } else { Some((state_hi, state_lo)) }
    }

    /// Returns `true` if the current stamp is equal to `stamp`.
    ///
    /// This method should be called after optimistic reads to check whether they are valid. The
    /// argument `stamp` should correspond to the one returned by method `optimistic_read`.
    #[inline]
    pub(super) fn validate_read(&self, stamp: (State, State), order: Ordering) -> bool {
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
        let result = (state_hi, state_lo) == stamp;
        if unlikely(order == Ordering::SeqCst) && result {
            sc_fence();
        }
        result
    }

    /// Grabs the lock for writing.
    #[inline]
    pub(super) fn write(&self, order: Ordering) -> SeqLockWriteGuard<'_> {
        let emit_sc_fence = order == Ordering::SeqCst;
        if unlikely(emit_sc_fence) {
            sc_fence();
        }

        // Get current interrupt state and disable interrupts when the user
        // explicitly declares that privileged instructions are available.
        #[cfg(portable_atomic_unsafe_assume_privileged)]
        let interrupt_state = interrupt::disable();

        let mut previous = self.state_lo.load(Ordering::Relaxed);
        if is_locked(previous)
            || self
                .state_lo
                .compare_exchange(previous, LOCKED, Ordering::Acquire, Ordering::Relaxed)
                .is_err()
        {
            previous = self.write_contended();
        }
        // To synchronize with the acquire fence in `validate_read` via any modification to
        // the data at the critical section of `(state_hi, previous)`.
        atomic::fence(Ordering::Release);

        SeqLockWriteGuard {
            lock: self,
            state_lo: previous,
            #[cfg(portable_atomic_unsafe_assume_privileged)]
            interrupt_state,
            emit_sc_fence,
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
            match self.state_lo.compare_exchange(
                state,
                LOCKED,
                Ordering::Acquire,
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
                state = self.state_lo.swap(CONTENDED, Ordering::Acquire);
                // We changed it from unlocked to CONTENDED, so we just successfully locked it.
                if is_unlocked(state) {
                    return state;
                }
            }

            // Wait for the futex to change state, assuming it is still CONTENDED.
            wait(&self.state_lo, CONTENDED);

            // Spin again after waking up.
            state = self.spin();
        }
    }

    fn spin(&self) -> State {
        let mut spin = 100;
        loop {
            // We only use `load` (and not `swap` or `compare_exchange`)
            // while spinning, to be easier on the caches.
            let state = self.state_lo.load(Ordering::Relaxed);

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
        notify(&self.state_lo);
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

    emit_sc_fence: bool,
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
        let state_lo = this.lock.state_lo.swap(this.state_lo, Ordering::Release);

        // Restore interrupt state.
        // SAFETY: the state was retrieved by the previous `disable`.
        #[cfg(portable_atomic_unsafe_assume_privileged)]
        unsafe {
            interrupt::restore(this.interrupt_state);
        }

        if state_lo == CONTENDED {
            // We only wake up one thread. When that thread locks the mutex, it
            // will mark the mutex as CONTENDED (see write_contended above),
            // which makes sure that any other waiting threads will also be
            // woken up eventually.
            this.lock.notify();
        }

        if unlikely(this.emit_sc_fence) {
            sc_fence();
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
        let state_lo = self.lock.state_lo.swap(state_lo, Ordering::Release);

        // Restore interrupt state.
        // SAFETY: the state was retrieved by the previous `disable`.
        #[cfg(portable_atomic_unsafe_assume_privileged)]
        unsafe {
            interrupt::restore(self.interrupt_state);
        }

        if state_lo == CONTENDED {
            // We only wake up one thread. When that thread locks the mutex, it
            // will mark the mutex as CONTENDED (see write_contended above),
            // which makes sure that any other waiting threads will also be
            // woken up eventually.
            self.lock.notify();
        }

        if unlikely(self.emit_sc_fence) {
            sc_fence();
        }
    }
}

#[cfg(test)]
mod tests {
    use super::{Ordering, SeqLock};

    #[test]
    fn smoke() {
        for &order in &[Ordering::AcqRel, Ordering::SeqCst] {
            let lock = SeqLock::new();
            let before = lock.optimistic_read(order).unwrap();
            assert!(lock.validate_read(before, order));
            {
                let _guard = lock.write(order);
            }
            assert!(!lock.validate_read(before, order));
            let after = lock.optimistic_read(order).unwrap();
            assert_ne!(before, after);
        }
    }

    #[test]
    fn test_abort() {
        for &order in &[Ordering::AcqRel, Ordering::SeqCst] {
            let lock = SeqLock::new();
            let before = lock.optimistic_read(order).unwrap();
            {
                let guard = lock.write(order);
                guard.abort();
            }
            let after = lock.optimistic_read(order).unwrap();
            assert_eq!(before, after, "aborted write does not update the stamp");
        }
    }
}
