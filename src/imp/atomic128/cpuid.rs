// Adapted from https://github.com/rust-lang/stdarch.

#![cfg_attr(
    any(
        not(feature = "outline-atomics"),
        not(target_feature = "sse"),
        miri,
        portable_atomic_sanitize_thread
    ),
    allow(dead_code)
)]

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::{
    arch::x86_64::CpuidResult,
    sync::atomic::{AtomicU32, Ordering},
};

#[derive(Clone, Copy)]
pub(crate) struct CpuInfo(u32);

impl CpuInfo {
    const INIT: u32 = 0;
    const HAS_CMPXCHG16B: u32 = 1;
    const IS_INTEL_AND_HAS_AVX: u32 = 2;

    #[inline]
    fn set(&mut self, bit: u32) {
        self.0 = set(self.0, bit);
    }
    #[inline]
    fn test(self, bit: u32) -> bool {
        test(self.0, bit)
    }

    #[allow(clippy::unused_self)]
    #[inline]
    pub(crate) fn has_cmpxchg16b(self) -> bool {
        #[cfg(any(target_feature = "cmpxchg16b", portable_atomic_target_feature = "cmpxchg16b"))]
        {
            // CMPXCHG16B is statically available.
            true
        }
        #[cfg(not(any(
            target_feature = "cmpxchg16b",
            portable_atomic_target_feature = "cmpxchg16b"
        )))]
        {
            self.test(CpuInfo::HAS_CMPXCHG16B)
        }
    }
    #[inline]
    pub(crate) fn is_intel_and_has_avx(self) -> bool {
        self.test(CpuInfo::IS_INTEL_AND_HAS_AVX)
    }
}

#[inline]
fn set(x: u32, bit: u32) -> u32 {
    x | 1 << bit
}
#[inline]
fn test(x: u32, bit: u32) -> bool {
    x & (1 << bit) != 0
}

// Workaround for https://github.com/rust-lang/rust/issues/101346
// It is not clear if our use cases are affected, but we implement this just in case.
//
// Refs:
// - https://www.felixcloutier.com/x86/cpuid
// - https://en.wikipedia.org/wiki/CPUID
// - https://github.com/rust-lang/stdarch/blob/28335054b1f417175ab5005cf1d9cf7937737930/crates/core_arch/src/x86/cpuid.rs
#[inline]
unsafe fn __cpuid(leaf: u32) -> CpuidResult {
    let eax;
    let mut ebx;
    let ecx;
    let edx;
    // SAFETY: the caller must guarantee that CPU supports `cpuid`.
    unsafe {
        asm!(
            // rbx is reserved by LLVM
            "mov {ebx_tmp:r}, rbx",
            "cpuid",
            "xchg {ebx_tmp:r}, rbx",
            ebx_tmp = out(reg) ebx,
            inout("eax") leaf => eax,
            inout("ecx") 0 => ecx,
            out("edx") edx,
            options(nostack, preserves_flags),
        );
    }
    CpuidResult { eax, ebx, ecx, edx }
}

#[inline]
unsafe fn _vendor_id() -> [u8; 12] {
    // SAFETY: the caller must guarantee that CPU supports `cpuid`.
    // transmute is safe because `[u8; 12]` and `[[u8; 4]; 3]` has the same layout.
    unsafe {
        // https://github.com/rust-lang/stdarch/blob/28335054b1f417175ab5005cf1d9cf7937737930/crates/std_detect/src/detect/os/x86.rs#L40-L59
        let CpuidResult { ebx, ecx, edx, .. } = __cpuid(0);
        let vendor_id: [[u8; 4]; 3] = [ebx.to_ne_bytes(), edx.to_ne_bytes(), ecx.to_ne_bytes()];
        core::mem::transmute(vendor_id)
    }
}

#[inline]
fn _cpuid(info: &mut CpuInfo) {
    info.set(CpuInfo::INIT);
    // Miri doesn't support inline assembly used in __cpuid
    #[cfg(miri)]
    {
        info.set(CpuInfo::HAS_CMPXCHG16B);
    }
    // sgx doesn't support `cpuid`: https://github.com/rust-lang/stdarch/blob/28335054b1f417175ab5005cf1d9cf7937737930/crates/core_arch/src/x86/cpuid.rs#L102-L105
    #[cfg(not(any(target_env = "sgx", miri)))]
    {
        use core::arch::x86_64::_xgetbv;

        // SAFETY: Calling `_vendor_id`` is safe because the CPU has `cpuid` support.
        let vendor_id = unsafe { _vendor_id() };

        // SAFETY: Calling `__cpuid`` is safe because the CPU has `cpuid` support.
        let proc_info_ecx = unsafe { __cpuid(0x0000_0001_u32).ecx };

        // https://github.com/rust-lang/stdarch/blob/28335054b1f417175ab5005cf1d9cf7937737930/crates/std_detect/src/detect/os/x86.rs#L111
        if test(proc_info_ecx, 13) {
            info.set(CpuInfo::HAS_CMPXCHG16B);
        }

        if vendor_id == *b"GenuineIntel" {
            // https://github.com/rust-lang/stdarch/blob/28335054b1f417175ab5005cf1d9cf7937737930/crates/std_detect/src/detect/os/x86.rs#L131-L224
            let cpu_xsave = test(proc_info_ecx, 26);
            if cpu_xsave {
                let cpu_osxsave = test(proc_info_ecx, 27);
                if cpu_osxsave {
                    // SAFETY: Calling `_xgetbv`` is safe because the CPU has `xsave` support.
                    let xcr0 = unsafe { _xgetbv(0) };
                    let os_avx_support = xcr0 & 6 == 6;
                    if os_avx_support && test(proc_info_ecx, 28) {
                        info.set(CpuInfo::IS_INTEL_AND_HAS_AVX);
                    }
                }
            }
        }
    }
}

#[inline]
pub(crate) fn cpuid() -> CpuInfo {
    static CACHE: AtomicU32 = AtomicU32::new(0);
    let mut info = CpuInfo(CACHE.load(Ordering::Relaxed));
    if info.0 != 0 {
        return info;
    }
    _cpuid(&mut info);
    CACHE.store(info.0, Ordering::Relaxed);
    info
}

/// Equivalent to `cpuid().has_cmpxchg16b()`, but avoids calling `cpuid()`
/// if CMPXCHG16B is statically available.
#[inline]
pub(crate) fn has_cmpxchg16b() -> bool {
    #[cfg(any(target_feature = "cmpxchg16b", portable_atomic_target_feature = "cmpxchg16b"))]
    {
        // CMPXCHG16B is statically available.
        true
    }
    #[cfg(not(any(target_feature = "cmpxchg16b", portable_atomic_target_feature = "cmpxchg16b")))]
    {
        cpuid().has_cmpxchg16b()
    }
}

#[allow(clippy::undocumented_unsafe_blocks)]
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_bit_flags() {
        let mut x = CpuInfo(0);
        assert!(!x.test(CpuInfo::INIT));
        assert!(!x.test(CpuInfo::HAS_CMPXCHG16B));
        assert!(!x.test(CpuInfo::IS_INTEL_AND_HAS_AVX));
        x.set(CpuInfo::INIT);
        assert!(x.test(CpuInfo::INIT));
        assert!(!x.test(CpuInfo::HAS_CMPXCHG16B));
        assert!(!x.test(CpuInfo::IS_INTEL_AND_HAS_AVX));
        x.set(CpuInfo::HAS_CMPXCHG16B);
        assert!(x.test(CpuInfo::INIT));
        assert!(x.test(CpuInfo::HAS_CMPXCHG16B));
        assert!(!x.test(CpuInfo::IS_INTEL_AND_HAS_AVX));
        x.set(CpuInfo::IS_INTEL_AND_HAS_AVX);
        assert!(x.test(CpuInfo::INIT));
        assert!(x.test(CpuInfo::HAS_CMPXCHG16B));
        assert!(x.test(CpuInfo::IS_INTEL_AND_HAS_AVX));
    }

    #[test]
    // Miri doesn't support inline assembly
    // sgx doesn't support `cpuid`
    #[cfg_attr(any(target_env = "sgx", miri), ignore)]
    fn test_cpuid() {
        assert_eq!(std::is_x86_feature_detected!("cmpxchg16b"), has_cmpxchg16b());
        if unsafe { _vendor_id() } == *b"GenuineIntel" {
            assert_eq!(std::is_x86_feature_detected!("avx"), cpuid().is_intel_and_has_avx());
        }
    }
}
