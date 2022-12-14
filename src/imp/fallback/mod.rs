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
// In narrow architectures (pointer width <= 16), the counter is still <= 32-bit and may be
// vulnerable to wrap around. But it's mostly okay, since in such a primitive hardware, the
// counter will not be increased that fast.
//
// Some 64-bit architectures have ABI with 32-bit pointer width (e.g., x86_64 X32 ABI,
// aarch64 ILP32 ABI, mips64 N32 ABI). On those targets, AtomicU64 is available and fast,
// so use it to implement normal sequence lock.
// Known architectures that have such ABI are x86_64, aarch64, and mips64. However,
// we list all 64-bit architectures because similar ABIs may exist for other architectures.
// (for target in $(rustc --print target-list); do target_spec=$(rustc --print target-spec-json -Z unstable-options --target "${target}"); [[ "$(jq <<<"${target_spec}" -r '."target-pointer-width"')" == "64" ]] && jq <<<"${target_spec}" -r '.arch'; done) | LC_ALL=C sort -u
#[cfg(any(
    not(any(target_pointer_width = "16", target_pointer_width = "32")),
    target_arch = "aarch64",
    target_arch = "bpf",
    target_arch = "mips64",
    target_arch = "nvptx64",
    target_arch = "powerpc64",
    target_arch = "riscv64",
    target_arch = "s390x",
    target_arch = "sparc64",
    target_arch = "wasm64",
    target_arch = "x86_64",
))]
mod seq_lock;
#[cfg(not(any(
    not(any(target_pointer_width = "16", target_pointer_width = "32")),
    target_arch = "aarch64",
    target_arch = "bpf",
    target_arch = "mips64",
    target_arch = "nvptx64",
    target_arch = "powerpc64",
    target_arch = "riscv64",
    target_arch = "s390x",
    target_arch = "sparc64",
    target_arch = "wasm64",
    target_arch = "x86_64",
)))]
#[path = "seq_lock_wide.rs"]
mod seq_lock;

#[cfg(any(target_pointer_width = "16", target_pointer_width = "32"))]
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
