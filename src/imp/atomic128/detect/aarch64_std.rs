#![cfg_attr(
    any(
        portable_atomic_no_aarch64_target_feature,
        not(any(
            feature = "std",
            target_os = "linux",
            target_os = "android",
            target_os = "windows",
            // target_os = "freebsd",
            // target_os = "openbsd",
        )),
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
            not(any(
                portable_atomic_no_aarch64_target_feature,
                portable_atomic_unstable_aarch64_target_feature
            )),
            // https://github.com/rust-lang/stdarch/blob/a0c30f3e3c75adcd6ee7efc94014ebcead61c507/crates/std_detect/src/detect/mod.rs
            // It is fine to use std for targets that we know can be linked to std.
            // Note: std may not be available on tier 3 such as aarch64 FreeBSD/OpenBSD.
            any(
                feature = "std",
                all(target_os = "linux", any(target_env = "gnu", target_env = "musl")),
                target_os = "android",
                target_os = "windows",
                // target_os = "freebsd",
                // target_os = "openbsd",
            )
        ))]
        {
            extern crate std;
            return std::arch::is_aarch64_feature_detected!("lse");
        }
        false
    }
}
