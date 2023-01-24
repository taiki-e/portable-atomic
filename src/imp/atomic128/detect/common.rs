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
    const HAS_LSE: u32 = 1;
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
    const HAS_CMPXCHG16B: u32 = 1;
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
            portable_atomic_target_feature = "cmpxchg16b"
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
