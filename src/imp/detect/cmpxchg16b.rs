#[inline]
fn _has_cmpxchg16b() -> bool {
    // https://github.com/rust-lang/stdarch/blob/bcbe010614f398ec86f3a9274d22e33e5f2ee60b/crates/core_arch/src/x86/cpuid.rs#L102-L105
    #[cfg(target_env = "sgx")]
    {
        false
    }
    // Miri doesn't support inline assembly used in __cpuid
    #[cfg(miri)]
    {
        true
    }
    #[cfg(not(any(target_env = "sgx", miri)))]
    {
        // Adapted from https://github.com/rust-lang/stdarch/blob/bcbe010614f398ec86f3a9274d22e33e5f2ee60b/crates/std_detect/src/detect/os/x86.rs.
        use core::arch::x86_64::__cpuid;

        // SAFETY: Calling `__cpuid`` is safe because the CPU has `cpuid` support.
        //
        // EAX = 1, ECX = 0: Queries "Processor Info and Feature Bits";
        // Contains information about most x86 features.
        let proc_info_ecx = unsafe { __cpuid(0x0000_0001_u32).ecx };

        // https://github.com/rust-lang/stdarch/blob/bcbe010614f398ec86f3a9274d22e33e5f2ee60b/crates/std_detect/src/detect/os/x86.rs#L111
        proc_info_ecx & (1 << 13) != 0
    }
}

#[inline]
pub(crate) fn has_cmpxchg16b() -> bool {
    #[cfg(any(portable_atomic_target_feature_cmpxchg16b, target_feature = "cmpxchg16b"))]
    {
        // cmpxchg16b is statically available.
        true
    }
    #[cfg(not(any(portable_atomic_target_feature_cmpxchg16b, target_feature = "cmpxchg16b")))]
    {
        fn t() -> bool {
            true
        }
        #[cold]
        fn f() -> bool {
            false
        }
        ifunc!(fn() -> bool = if _has_cmpxchg16b() { t } else { f })
    }
}

#[cfg(test)]
mod tests {
    #[test]
    #[cfg_attr(miri, ignore)] // Miri doesn't support inline assembly
    fn test() {
        assert_eq!(std::is_x86_feature_detected!("cmpxchg16b"), super::_has_cmpxchg16b());
        assert_eq!(std::is_x86_feature_detected!("cmpxchg16b"), super::has_cmpxchg16b());
    }
}
