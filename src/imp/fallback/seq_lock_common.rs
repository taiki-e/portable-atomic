// SPDX-License-Identifier: Apache-2.0 OR MIT

// Code shared by seqlock*.rs.

// -----------------------------------------------------------------------------
// 64-bit stamp based on one 64-bit atomic.
//
// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/seq_lock.rs.

cfg_has_fast_atomic_64!({
    #[allow(unused_imports)]
    pub(crate) use self::stamp64 as stamp; // for benchmark
    #[allow(dead_code)]
    pub(crate) mod stamp64 {
        use core::sync::atomic::Ordering;

        use crate::imp::core_atomic::AtomicU64;

        pub(crate) type State = u64;

        #[repr(transparent)]
        pub(crate) struct Stamp {
            /// The current state of the lock.
            ///
            /// If the least significant bit is 0, this holds the current stamp.
            /// If the least significant bit is 1, this lock is locked and the state doesn't contain a valid stamp.
            pub(crate) state: AtomicU64,
        }

        impl Stamp {
            #[inline]
            pub(crate) const fn new() -> Self {
                Self { state: AtomicU64::new(0) }
            }

            /// If not locked, returns the current stamp.
            ///
            /// This method should be called before optimistic reads.
            #[inline]
            pub(crate) fn optimistic_read(&self) -> Option<State> {
                // The acquire load from `state` synchronizes with the release stores in
                // `SeqLockWriteGuard::drop` and `SeqLockWriteGuard::abort`.
                let state = self.state.load(Ordering::Acquire);
                if state & 1 != 0 { None } else { Some(state) }
            }

            /// Returns `true` if the current stamp is equal to `stamp`.
            ///
            /// This method should be called after optimistic reads to check whether they are valid. The
            /// argument `stamp` should correspond to the one returned by method `optimistic_read`.
            #[inline]
            pub(crate) fn validate_read(&self, stamp: State) -> bool {
                // Thanks to the fence, if we're noticing any modification to the data at the critical
                // section of `stamp`, then the critical section's write of 1 to state
                // should be visible.
                crate::fence(Ordering::Acquire);
                self.state.load(Ordering::Relaxed) == stamp
            }

            #[allow(clippy::unused_self)]
            #[inline(always)]
            pub(crate) fn handle_next_stamp(&self, state: State) {
                debug_assert!(state != 0);
            }
        }
    }
});

// -----------------------------------------------------------------------------
// 64-bit stamp based on two 32-bit atomics.
//
// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/seq_lock_wide.rs.

cfg_no_fast_atomic_64!({
    #[allow(unused_imports)]
    pub(crate) use self::stamp32x2 as stamp; // for benchmark
});
#[allow(dead_code)]
pub(crate) mod stamp32x2 {
    use core::sync::atomic::Ordering;

    use crate::imp::core_atomic::AtomicU32;

    pub(crate) type State = u32;

    #[repr(C)]
    pub(crate) struct Stamp {
        /// The high bits of the current stamp.
        state_hi: AtomicU32,

        /// The low bits of the current state of the lock.
        ///
        /// If the least significant bit is 0, this holds the low bits of the current stamp.
        /// If the least significant bit is 1, this lock is locked and the state doesn't contain a valid stamp.
        pub(crate) state: AtomicU32,
    }

    impl Stamp {
        #[inline]
        pub(crate) const fn new() -> Self {
            Self { state_hi: AtomicU32::new(0), state: AtomicU32::new(0) }
        }

        /// If not locked, returns the current stamp.
        ///
        /// This method should be called before optimistic reads.
        #[inline]
        pub(crate) fn optimistic_read(&self) -> Option<(State, State)> {
            // The acquire loads from `state_hi` and `state_lo` synchronize with the release stores in
            // `SeqLockWriteGuard::drop` and `SeqLockWriteGuard::abort`.
            //
            // As a consequence, we can make sure that (1) all writes within the era of `state_hi - 1`
            // happens before now; and therefore, (2) if `state_lo` is even, all writes within the
            // critical section of (`state_hi`, `state_lo`) happens before now.
            let state_hi = self.state_hi.load(Ordering::Acquire);
            let state_lo = self.state.load(Ordering::Acquire);
            if state_lo & 1 != 0 { None } else { Some((state_hi, state_lo)) }
        }

        /// Returns `true` if the current stamp is equal to `stamp`.
        ///
        /// This method should be called after optimistic reads to check whether they are valid. The
        /// argument `stamp` should correspond to the one returned by method `optimistic_read`.
        #[inline]
        pub(crate) fn validate_read(&self, stamp: (State, State)) -> bool {
            // Thanks to the fence, if we're noticing any modification to the data at the critical
            // section of `(stamp.0, stamp.1)`, then the critical section's write of 1 to state_lo
            // should be visible.
            crate::fence(Ordering::Acquire);

            // So if `state_lo` coincides with `stamp.1`, then either (1) we're noticing no modification
            // to the data after the critical section of `(stamp.0, stamp.1)`, or (2) `state_lo` wrapped
            // around.
            //
            // If (2) is the case, the acquire ordering ensures we see the new value of `state_hi`.
            let state_lo = self.state.load(Ordering::Acquire);

            // If (2) is the case and `state_hi` coincides with `stamp.0`, then `state_hi` also wrapped
            // around, which we give up to correctly validate the read.
            let state_hi = self.state_hi.load(Ordering::Relaxed);

            // Except for the case that both `state_hi` and `state_lo` wrapped around, the following
            // condition implies that we're noticing no modification to the data after the critical
            // section of `(stamp.0, stamp.1)`.
            (state_hi, state_lo) == stamp
        }

        #[inline]
        pub(crate) fn handle_next_stamp(&self, state_lo: State) {
            // Increase the high bits if the low bits wrap around.
            // Release ordering for synchronizing with `optimistic_read`.
            if state_lo == 0 {
                crate::utils::cold_path();
                let state_hi = self.state_hi.load(Ordering::Relaxed).wrapping_add(1);
                debug_assert!(state_hi != 0);
                self.state_hi.store(state_hi, Ordering::Release);
            }
        }
    }
}

// -----------------------------------------------------------------------------
// Tests

#[cfg(test)]
mod tests {
    use core::sync::atomic::Ordering;

    use super::super::seq_lock::SeqLock;

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
            // SAFETY: The value hasn't been changed.
            unsafe { guard.abort() }
        }
        let after = lock.optimistic_read().unwrap();
        assert_eq!(before, after, "aborted write does not update the stamp");
    }

    #[test]
    fn test_wrap() {
        let lock = SeqLock::new();
        let zero = lock.optimistic_read().unwrap();
        lock.state.store(0xFFFF_FFFE, Ordering::Relaxed); // u32::MAX & !1
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
            assert_eq!(lock.state.load(Ordering::Relaxed) & 0xFFFF_FFFF, 0);
        }
    }
}
