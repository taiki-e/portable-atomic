#![cfg_attr(
    any(
        portable_atomic_no_aarch64_target_feature,
        portable_atomic_no_outline_atomics,
        not(any(feature = "std", target_os = "linux", target_os = "android", target_os = "windows", /* target_os = "freebsd" */)),
        any(target_feature = "lse", portable_atomic_target_feature = "lse"),
    ),
    allow(dead_code)
)]

#[inline]
pub(crate) fn has_lse() -> bool {
    #[cfg(any(target_feature = "lse", portable_atomic_target_feature = "lse"))]
    {
        // FEAT_LSE is statically available.
        true
    }
    #[cfg(not(any(target_feature = "lse", portable_atomic_target_feature = "lse")))]
    #[allow(unreachable_code)]
    {
        #[cfg(all(
            not(portable_atomic_no_aarch64_target_feature),
            not(portable_atomic_no_outline_atomics),
            // https://github.com/rust-lang/stdarch/blob/a0c30f3e3c75adcd6ee7efc94014ebcead61c507/crates/std_detect/src/detect/mod.rs
            // It is fine to use std for targets that we know can be linked to std.
            // Note: aarch64 freebsd is tier 3, so std may not be available.
            any(feature = "std", target_os = "linux", target_os = "android", target_os = "windows", /* target_os = "freebsd" */)
        ))]
        {
            extern crate std;
            return std::arch::is_aarch64_feature_detected!("lse");
        }
        false
    }
}
