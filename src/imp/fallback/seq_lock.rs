// SPDX-License-Identifier: Apache-2.0 OR MIT

// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/seq_lock.rs.

include!("seq_lock_common.rs");

use core::sync::atomic::AtomicU64;

use super::{notify64_one as notify_one, wait64 as wait};

pub(crate) type State = u64;

/// A stamped lock.
pub(crate) struct SeqLock {
    /// The current state of the lock.
    ///
    /// If the least significant bit is 0, this holds the current stamp.
    /// If the least significant bit is 1, this lock is locked and the state doesn't contain a valid stamp.
    state: AtomicU64,
}

impl SeqLock {
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
        if is_locked(state) { None } else { Some(state) }
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
}

impl SeqLockWriteGuard<'_> {
    #[inline]
    fn next_stamp(&self) -> State {
        self.state.wrapping_add(2)
    }
}
