// Fallback implementation using global locks.
//
// This implementation uses seqlock for global locks.
//
// This is basically based on global locks in crossbeam-utils's `AtomicCell`,
// but seqlock is implemented in a way that does not depend on UB
// (see comments in optimistic_read method in atomic! macro for details).
//
// Note that we cannot use a lock per atomic type, since the in-memory representation of the atomic
// type and the value type must be the same.

// Use "wide" sequence lock if the pointer width <= 32 for preventing its counter against wrap
// around.
//
// We are ignoring too wide architectures (pointer width >= 256), since such a system will not
// appear in a conceivable future.
//
// In narrow architectures (pointer width <= 16), the counter is still <= 32-bit and may be
// vulnerable to wrap around. But it's mostly okay, since in such a primitive hardware, the
// counter will not be increased that fast.
#[cfg(any(target_pointer_width = "64", target_pointer_width = "128"))]
mod seq_lock;
#[cfg(not(any(target_pointer_width = "64", target_pointer_width = "128")))]
#[path = "seq_lock_wide.rs"]
mod seq_lock;

#[cfg(not(target_pointer_width = "64"))]
#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(any(test, portable_atomic_no_atomic_64))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(test, not(target_has_atomic = "64")))
)]
#[cfg_attr(test, allow(unused_imports))]
pub(crate) use seq_lock::imp::{AtomicI64, AtomicU64};

#[cfg(any(test, not(portable_atomic_cmpxchg16b_dynamic)))]
#[cfg_attr(test, allow(unused_imports))]
pub(crate) use seq_lock::imp::AtomicI128;
#[cfg_attr(test, allow(unused_imports))]
pub(crate) use seq_lock::imp::AtomicU128;
