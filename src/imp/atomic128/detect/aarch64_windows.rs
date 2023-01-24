// Run-time feature detection on aarch64 Windows.
//
// As of nightly-2023-01-23, is_aarch64_feature_detected doesn't support detecting FEAT_LSE on Windows.
// https://github.com/rust-lang/stdarch/blob/a0c30f3e3c75adcd6ee7efc94014ebcead61c507/crates/std_detect/src/detect/os/windows/aarch64.rs
// https://github.com/rust-lang/stdarch/pull/1373
//
// Refs: https://learn.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-isprocessorfeaturepresent

#![cfg_attr(
    any(
        portable_atomic_no_aarch64_target_feature,
        portable_atomic_no_outline_atomics,
        any(target_feature = "lse", portable_atomic_target_feature = "lse")
    ),
    allow(dead_code)
)]

include!("common.rs");

use core::sync::atomic::{AtomicU32, Ordering};

impl CpuInfo {
    const INIT: u32 = 0;
    const HAS_LSE: u32 = 1;
}

#[inline]
pub(crate) fn has_lse() -> bool {
    #[cfg(any(target_feature = "lse", portable_atomic_target_feature = "lse"))]
    {
        // FEAT_LSE is statically available.
        true
    }
    #[cfg(not(any(target_feature = "lse", portable_atomic_target_feature = "lse")))]
    {
        detect().test(CpuInfo::HAS_LSE)
    }
}

#[allow(clippy::upper_case_acronyms)]
#[inline]
fn _detect(info: &mut CpuInfo) {
    type DWORD = u32;
    type BOOL = i32;

    const FALSE: BOOL = 0;
    // Defined in winnt.h of Windows SDK.
    const PF_ARM_V81_ATOMIC_INSTRUCTIONS_AVAILABLE: DWORD = 34;

    extern "system" {
        fn IsProcessorFeaturePresent(ProcessorFeature: DWORD) -> BOOL;
    }

    info.set(CpuInfo::INIT);
    // SAFETY: calling IsProcessorFeaturePresent is safe, and FALSE is also
    // returned if the HAL does not support detection of the specified feature.
    if unsafe { IsProcessorFeaturePresent(PF_ARM_V81_ATOMIC_INSTRUCTIONS_AVAILABLE) != FALSE } {
        info.set(CpuInfo::HAS_LSE);
    }
}

#[inline]
fn detect() -> CpuInfo {
    static CACHE: AtomicU32 = AtomicU32::new(0);
    let mut info = CpuInfo(CACHE.load(Ordering::Relaxed));
    if info.0 != 0 {
        return info;
    }
    _detect(&mut info);
    CACHE.store(info.0, Ordering::Relaxed);
    info
}

#[allow(clippy::undocumented_unsafe_blocks)]
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_bit_flags() {
        let mut x = CpuInfo(0);
        assert!(!x.test(CpuInfo::INIT));
        assert!(!x.test(CpuInfo::HAS_LSE));
        x.set(CpuInfo::INIT);
        assert!(x.test(CpuInfo::INIT));
        assert!(!x.test(CpuInfo::HAS_LSE));
        x.set(CpuInfo::HAS_LSE);
        assert!(x.test(CpuInfo::INIT));
        assert!(x.test(CpuInfo::HAS_LSE));
    }

    #[test]
    fn test_detect() {
        if has_lse() {
            assert!(detect().test(CpuInfo::HAS_LSE));
            #[cfg(any(
                target_feature = "lse",
                portable_atomic_target_feature = "lse",
                not(portable_atomic_no_aarch64_target_feature),
            ))]
            unsafe {
                use core::cell::UnsafeCell;
                let v = UnsafeCell::new(0);
                assert_eq!(
                    super::super::_compare_exchange_casp(v.get(), 0, 1, Ordering::SeqCst),
                    0
                );
                assert_eq!(*v.get(), 1);
            }
        } else {
            assert!(!detect().test(CpuInfo::HAS_LSE));
            #[cfg(not(portable_atomic_no_aarch64_target_feature))]
            {
                assert!(!std::arch::is_aarch64_feature_detected!("lse"));
            }
        }
    }
}
