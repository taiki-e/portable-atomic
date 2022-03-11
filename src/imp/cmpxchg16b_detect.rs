#[inline]
fn _has_cmpxchg16b() -> bool {
    // https://github.com/rust-lang/stdarch/blob/b4a0e07552cf90ef8f1a5b775bf70e4db94b3d63/crates/core_arch/src/x86/cpuid.rs#L102-L105
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
        // Adapted from https://github.com/rust-lang/stdarch/blob/2adc17a5442614dbe34626fdd9b32de7c07b8086/crates/std_detect/src/detect/os/x86.rs.
        use core::arch::x86_64::__cpuid;

        // SAFETY: Calling `__cpuid`` is safe because the CPU has `cpuid` support.
        //
        // EAX = 1, ECX = 0: Queries "Processor Info and Feature Bits";
        // Contains information about most x86 features.
        let proc_info_ecx = unsafe { __cpuid(0x0000_0001_u32).ecx };

        // https://github.com/rust-lang/stdarch/blob/2adc17a5442614dbe34626fdd9b32de7c07b8086/crates/std_detect/src/detect/os/x86.rs#L111
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
        // Adapted from https://github.com/BurntSushi/memchr/blob/8e1da98fee06d66c13e66c330e3a3dd6ccf0e3a0/src/memchr/x86/mod.rs#L9-L71.
        use core::{
            mem,
            sync::atomic::{AtomicPtr, Ordering},
        };
        type FnRaw = *mut ();
        type FnTy = fn() -> bool;
        static FUNC: AtomicPtr<()> = AtomicPtr::new(detect as FnRaw);
        #[cold]
        fn detect() -> bool {
            let func: FnTy = if _has_cmpxchg16b() { t } else { f };
            FUNC.store(func as FnRaw, Ordering::Relaxed);
            func()
        }
        fn t() -> bool {
            true
        }
        #[cold]
        fn f() -> bool {
            false
        }
        // SAFETY: `FnTy` is a function pointer, which is always safe to transmute with a `*mut ()`.
        unsafe {
            let func = FUNC.load(Ordering::Relaxed);
            mem::transmute::<FnRaw, FnTy>(func)()
        }
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
