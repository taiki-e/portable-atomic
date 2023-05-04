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

#![cfg_attr(
    any(
        all(
            target_arch = "x86_64",
            not(portable_atomic_no_cmpxchg16b_target_feature),
            not(portable_atomic_no_outline_atomics),
            not(target_env = "sgx"),
        ),
        all(
            target_arch = "powerpc64",
            feature = "fallback",
            not(portable_atomic_no_outline_atomics),
            portable_atomic_outline_atomics, // TODO(powerpc64): currently disabled by default
            any(
                all(
                    target_os = "linux",
                    any(
                        target_env = "gnu",
                        all(target_env = "musl", not(target_feature = "crt-static")),
                        portable_atomic_outline_atomics,
                    ),
                ),
                target_os = "freebsd",
            ),
            not(any(miri, portable_atomic_sanitize_thread)),
        ),
        all(
            any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
            target_arch = "arm",
            any(target_os = "linux", target_os = "android"),
            not(portable_atomic_no_outline_atomics),
        ),
    ),
    allow(dead_code)
)]

#[macro_use]
mod utils;

// Use "wide" sequence lock if the pointer width <= 32 for preventing its counter against wrap
// around.
//
// In narrow architectures (pointer width <= 16), the counter is still <= 32-bit and may be
// vulnerable to wrap around. But it's mostly okay, since in such a primitive hardware, the
// counter will not be increased that fast.
//
// Some 64-bit architectures have ABI with 32-bit pointer width (e.g., x86_64 X32 ABI,
// aarch64 ILP32 ABI, mips64 N32 ABI). On those targets, AtomicU64 is available and fast,
// so use it to implement normal sequence lock.
cfg_has_fast_atomic_64! {
    #[path = "seq_lock_fallback.rs"]
    mod imp;
}
cfg_no_fast_atomic_64! {
    #[path = "spinlock_fallback.rs"]
    mod imp;
}

#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(any(test, portable_atomic_no_atomic_64)))]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(test, not(target_has_atomic = "64")))
)]
cfg_no_fast_atomic_64! {
    #[cfg_attr(test, allow(unused_imports))]
    pub(crate) use imp::{AtomicI64, AtomicU64};
}

#[cfg_attr(test, allow(unused_imports))]
pub(crate) use imp::{AtomicI128, AtomicU128};
