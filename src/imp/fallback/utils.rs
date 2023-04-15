// Some 64-bit architectures have ABI with 32-bit pointer width (e.g., x86_64 X32 ABI,
// aarch64 ILP32 ABI, mips64 N32 ABI). On those targets, AtomicU64 is available and fast,
// so use it to implement normal sequence lock.
// Known architectures that have such ABI are x86_64, aarch64, and mips64. However,
// we list all 64-bit architectures because similar ABIs may exist for other architectures.
// Script to get the list:
// $ (for target in $(rustc --print target-list); do target_spec=$(rustc --print target-spec-json -Z unstable-options --target "${target}"); [[ "$(jq <<<"${target_spec}" -r '."target-pointer-width"')" == "64" ]] && jq <<<"${target_spec}" -r '.arch'; done) | LC_ALL=C sort -u | sed -E 's/^/    target_arch = "/g; s/$/",/g'
macro_rules! cfg_fast_atomic_64 {
    ($($tt:tt)*) => {
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
        $($tt)*
    };
}
macro_rules! cfg_no_fast_atomic_64 {
    ($($tt:tt)*) => {
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
        $($tt)*
    };
}

// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.7/crossbeam-utils/src/backoff.rs.
// Adjusted to reduce spinning.
/// Performs exponential backoff in spin loops.
pub(crate) struct Backoff {
    step: u32,
}

// https://github.com/oneapi-src/oneTBB/blob/v2021.5.0/include/oneapi/tbb/detail/_utils.h#L46-L48
const SPIN_LIMIT: u32 = 4;

impl Backoff {
    #[inline]
    pub(crate) const fn new() -> Self {
        Self { step: 0 }
    }

    #[inline]
    pub(crate) fn snooze(&mut self) {
        if self.step <= SPIN_LIMIT {
            for _ in 0..1 << self.step {
                #[allow(deprecated)]
                core::sync::atomic::spin_loop_hint();
            }
            self.step += 1;
        } else {
            #[cfg(not(feature = "std"))]
            for _ in 0..1 << self.step {
                #[allow(deprecated)]
                core::sync::atomic::spin_loop_hint();
            }

            #[cfg(feature = "std")]
            std::thread::yield_now();
        }
    }
}
