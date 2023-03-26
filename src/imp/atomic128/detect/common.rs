#[derive(Clone, Copy)]
pub(crate) struct CpuInfo(u32);

impl CpuInfo {
    const INIT: u32 = 0;

    #[inline]
    fn set(&mut self, bit: u32) {
        self.0 = set(self.0, bit);
    }
    #[inline]
    fn test(self, bit: u32) -> bool {
        test(self.0, bit)
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

#[inline]
pub(crate) fn detect() -> CpuInfo {
    use core::sync::atomic::{AtomicU32, Ordering};

    static CACHE: AtomicU32 = AtomicU32::new(0);
    let mut info = CpuInfo(CACHE.load(Ordering::Relaxed));
    if info.0 != 0 {
        return info;
    }
    info.set(CpuInfo::INIT);
    _detect(&mut info);
    CACHE.store(info.0, Ordering::Relaxed);
    info
}

#[cfg(target_arch = "aarch64")]
impl CpuInfo {
    /// Whether FEAT_LSE is available
    const HAS_LSE: u32 = 1;
    /// Whether FEAT_LSE2 is available
    // This is currently only used in tests.
    #[cfg(test)]
    const HAS_LSE2: u32 = 2;
    /// Whether FEAT_LSE128 is available
    // This is currently only used in tests.
    #[cfg(test)]
    const HAS_LSE128: u32 = 3;
    /// Whether FEAT_LRCPC3 is available
    // This is currently only used in tests.
    #[cfg(test)]
    const HAS_RCPC3: u32 = 4;
}
#[cfg(target_arch = "aarch64")]
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

#[cfg(target_arch = "x86_64")]
impl CpuInfo {
    /// Whether CMPXCHG16B is available
    const HAS_CMPXCHG16B: u32 = 1;
    /// Whether VMOVDQA is atomic
    const HAS_VMOVDQA_ATOMIC: u32 = 2;

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
            portable_atomic_target_feature = "cmpxchg16b",
        )))]
        {
            self.test(CpuInfo::HAS_CMPXCHG16B)
        }
    }
    #[inline]
    pub(crate) fn has_vmovdqa_atomic(self) -> bool {
        self.test(CpuInfo::HAS_VMOVDQA_ATOMIC)
    }
}
/// Equivalent to `detect().has_cmpxchg16b()`, but avoids calling `detect()`
/// if CMPXCHG16B is statically available.
#[cfg(target_arch = "x86_64")]
#[inline]
pub(crate) fn has_cmpxchg16b() -> bool {
    #[cfg(any(target_feature = "cmpxchg16b", portable_atomic_target_feature = "cmpxchg16b"))]
    {
        // CMPXCHG16B is statically available.
        true
    }
    #[cfg(not(any(target_feature = "cmpxchg16b", portable_atomic_target_feature = "cmpxchg16b")))]
    {
        detect().has_cmpxchg16b()
    }
}

#[allow(
    clippy::alloc_instead_of_core,
    clippy::std_instead_of_alloc,
    clippy::std_instead_of_core,
    clippy::undocumented_unsafe_blocks,
    clippy::wildcard_imports
)]
#[cfg(test)]
mod tests_common {
    use super::*;

    #[test]
    fn test_bit_flags() {
        let mut x = CpuInfo(0);
        #[cfg(target_arch = "aarch64")]
        {
            assert!(!x.test(CpuInfo::INIT));
            assert!(!x.test(CpuInfo::HAS_LSE));
            assert!(!x.test(CpuInfo::HAS_LSE2));
            assert!(!x.test(CpuInfo::HAS_LSE128));
            assert!(!x.test(CpuInfo::HAS_RCPC3));
            x.set(CpuInfo::INIT);
            assert!(x.test(CpuInfo::INIT));
            assert!(!x.test(CpuInfo::HAS_LSE));
            assert!(!x.test(CpuInfo::HAS_LSE2));
            assert!(!x.test(CpuInfo::HAS_LSE128));
            assert!(!x.test(CpuInfo::HAS_RCPC3));
            x.set(CpuInfo::HAS_LSE);
            assert!(x.test(CpuInfo::INIT));
            assert!(x.test(CpuInfo::HAS_LSE));
            assert!(!x.test(CpuInfo::HAS_LSE2));
            assert!(!x.test(CpuInfo::HAS_LSE128));
            assert!(!x.test(CpuInfo::HAS_RCPC3));
            x.set(CpuInfo::HAS_LSE2);
            assert!(x.test(CpuInfo::INIT));
            assert!(x.test(CpuInfo::HAS_LSE));
            assert!(x.test(CpuInfo::HAS_LSE2));
            assert!(!x.test(CpuInfo::HAS_LSE128));
            assert!(!x.test(CpuInfo::HAS_RCPC3));
            x.set(CpuInfo::HAS_LSE128);
            assert!(x.test(CpuInfo::INIT));
            assert!(x.test(CpuInfo::HAS_LSE));
            assert!(x.test(CpuInfo::HAS_LSE2));
            assert!(x.test(CpuInfo::HAS_LSE128));
            assert!(!x.test(CpuInfo::HAS_RCPC3));
            x.set(CpuInfo::HAS_RCPC3);
            assert!(x.test(CpuInfo::INIT));
            assert!(x.test(CpuInfo::HAS_LSE));
            assert!(x.test(CpuInfo::HAS_LSE2));
            assert!(x.test(CpuInfo::HAS_LSE128));
            assert!(x.test(CpuInfo::HAS_RCPC3));
        }
        #[cfg(target_arch = "x86_64")]
        {
            assert!(!x.test(CpuInfo::INIT));
            assert!(!x.test(CpuInfo::HAS_CMPXCHG16B));
            assert!(!x.test(CpuInfo::HAS_VMOVDQA_ATOMIC));
            x.set(CpuInfo::INIT);
            assert!(x.test(CpuInfo::INIT));
            assert!(!x.test(CpuInfo::HAS_CMPXCHG16B));
            assert!(!x.test(CpuInfo::HAS_VMOVDQA_ATOMIC));
            x.set(CpuInfo::HAS_CMPXCHG16B);
            assert!(x.test(CpuInfo::INIT));
            assert!(x.test(CpuInfo::HAS_CMPXCHG16B));
            assert!(!x.test(CpuInfo::HAS_VMOVDQA_ATOMIC));
            x.set(CpuInfo::HAS_VMOVDQA_ATOMIC);
            assert!(x.test(CpuInfo::INIT));
            assert!(x.test(CpuInfo::HAS_CMPXCHG16B));
            assert!(x.test(CpuInfo::HAS_VMOVDQA_ATOMIC));
        }
    }

    #[test]
    fn print_features() {
        use std::{fmt::Write as _, io::Write, string::String};

        let mut features = String::new();
        #[cfg(target_arch = "aarch64")]
        {
            let _ = writeln!(features, "lse: {}", detect().test(CpuInfo::HAS_LSE));
            let _ = writeln!(features, "lse2: {}", detect().test(CpuInfo::HAS_LSE2));
            let _ = writeln!(features, "lse128: {}", detect().test(CpuInfo::HAS_LSE128));
            let _ = writeln!(features, "rcpc3: {}", detect().test(CpuInfo::HAS_RCPC3));
        }
        #[cfg(target_arch = "x86_64")]
        {
            let _ = writeln!(features, "cmpxchg16b: {}", detect().test(CpuInfo::HAS_CMPXCHG16B));
            let _ = writeln!(
                features,
                "vmovdqa-atomic: {}",
                detect().test(CpuInfo::HAS_VMOVDQA_ATOMIC)
            );
        }
        let stdout = std::io::stderr();
        let mut stdout = stdout.lock();
        let _ = stdout.write_all(features.as_bytes());
    }

    #[cfg(target_arch = "aarch64")]
    #[test]
    fn test_detect() {
        let proc_cpuinfo = test_helper::cpuinfo::ProcCpuinfo::new();
        if has_lse() {
            assert!(detect().test(CpuInfo::HAS_LSE));
            #[cfg(any(
                target_feature = "lse",
                portable_atomic_target_feature = "lse",
                all(
                    not(portable_atomic_no_aarch64_target_feature),
                    not(portable_atomic_no_outline_atomics),
                ),
            ))]
            unsafe {
                use core::{cell::UnsafeCell, sync::atomic::Ordering};
                let v = UnsafeCell::new(0);
                assert_eq!(
                    super::super::_atomic_compare_exchange_casp(v.get(), 0, 1, Ordering::SeqCst),
                    0
                );
                assert_eq!(*v.get(), 1);
            }
            if let Ok(proc_cpuinfo) = proc_cpuinfo {
                assert!(proc_cpuinfo.lse);
            }
        } else {
            assert!(!detect().test(CpuInfo::HAS_LSE));
            // is_aarch64_feature_detected uses mrs on FreeBSD
            #[cfg(not(target_os = "freebsd"))]
            #[cfg(not(any(
                portable_atomic_no_aarch64_target_feature,
                portable_atomic_unstable_aarch64_target_feature,
            )))]
            {
                assert!(!std::arch::is_aarch64_feature_detected!("lse"));
            }
            if let Ok(proc_cpuinfo) = proc_cpuinfo {
                assert!(!proc_cpuinfo.lse);
            }
        }
        if detect().test(CpuInfo::HAS_LSE2) {
            assert!(detect().test(CpuInfo::HAS_LSE));
            assert!(detect().test(CpuInfo::HAS_LSE2));
            if let Ok(test_helper::cpuinfo::ProcCpuinfo { lse2: Some(lse2), .. }) = proc_cpuinfo {
                assert!(lse2);
            }
        } else {
            assert!(!detect().test(CpuInfo::HAS_LSE2));
            // // is_aarch64_feature_detected uses mrs on FreeBSD
            // #[cfg(not(target_os = "freebsd"))]
            // #[cfg(not(any(
            //     portable_atomic_no_aarch64_target_feature,
            //     portable_atomic_unstable_aarch64_target_feature,
            // )))]
            // {
            //     assert!(!std::arch::is_aarch64_feature_detected!("lse2"));
            // }
            if let Ok(test_helper::cpuinfo::ProcCpuinfo { lse2: Some(lse2), .. }) = proc_cpuinfo {
                assert!(!lse2);
            }
        }
        if detect().test(CpuInfo::HAS_LSE128) {
            assert!(detect().test(CpuInfo::HAS_LSE));
            assert!(detect().test(CpuInfo::HAS_LSE2));
            assert!(detect().test(CpuInfo::HAS_LSE128));
        } else {
            assert!(!detect().test(CpuInfo::HAS_LSE128));
            // is_aarch64_feature_detected doesn't support lse128
            // // is_aarch64_feature_detected uses mrs on FreeBSD
            // #[cfg(not(target_os = "freebsd"))]
            // #[cfg(not(any(
            //     portable_atomic_no_aarch64_target_feature,
            //     portable_atomic_unstable_aarch64_target_feature,
            // )))]
            // {
            //     assert!(!std::arch::is_aarch64_feature_detected!("lse128"));
            // }
        }
        if detect().test(CpuInfo::HAS_RCPC3) {
            assert!(detect().test(CpuInfo::HAS_RCPC3));
        } else {
            assert!(!detect().test(CpuInfo::HAS_RCPC3));
            // is_aarch64_feature_detected doesn't support rcpc3
            // // is_aarch64_feature_detected uses mrs on FreeBSD
            // #[cfg(not(target_os = "freebsd"))]
            // #[cfg(not(any(
            //     portable_atomic_no_aarch64_target_feature,
            //     portable_atomic_unstable_aarch64_target_feature,
            // )))]
            // {
            //     assert!(!std::arch::is_aarch64_feature_detected!("rcpc3"));
            // }
        }
    }
}
