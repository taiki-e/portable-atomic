// Run-time feature detection on aarch64 Linux/Android/FreeBSD by parsing ELF auxiliary vectors.
//
// See auxv.rs for more.

include!("common.rs");

#[path = "auxv.rs"]
mod auxv;
use auxv::arch;

#[cold]
fn _detect(info: &mut CpuInfo) {
    #[cfg(target_os = "android")]
    {
        // Samsung Exynos 9810 has a bug that big and little cores have different
        // ISAs. And on older Android (pre-9), the kernel incorrectly reports
        // that features available only on some cores are available on all cores.
        // https://reviews.llvm.org/D114523
        let mut arch = [0_u8; ffi::PROP_VALUE_MAX as usize];
        // SAFETY: we've passed a valid C string and a buffer with max length.
        let len = unsafe {
            ffi::__system_property_get(
                b"ro.arch\0".as_ptr().cast::<ffi::c_char>(),
                arch.as_mut_ptr().cast::<ffi::c_char>(),
            )
        };
        // On Exynos, ro.arch is not available on Android 12+, but it is fine
        // because Android 9+ includes the fix.
        if len > 0 && arch.starts_with(b"exynos9810") {
            return;
        }
    }

    let hwcap = auxv::getauxval(auxv::AT_HWCAP);

    if hwcap & arch::HWCAP_ATOMICS != 0 {
        info.set(CpuInfo::HAS_LSE);
    }
    // we currently only use FEAT_LSE in outline-atomics.
    #[cfg(test)]
    {
        if hwcap & arch::HWCAP_USCAT != 0 {
            info.set(CpuInfo::HAS_LSE2);
        }
    }
}

// core::ffi::c_* (except c_void) requires Rust 1.64, libc will soon require Rust 1.47
#[cfg(target_os = "android")]
mod ffi {
    pub(crate) use super::c_types::{c_char, c_int};

    extern "C" {
        // Defined in sys/system_properties.h.
        // https://github.com/aosp-mirror/platform_bionic/blob/d3ebc2f7c49a9893b114124d4a6b315f3a328764/libc/include/sys/system_properties.h
        // https://github.com/rust-lang/libc/blob/0.2.139/src/unix/linux_like/android/mod.rs#L3471
        pub(crate) fn __system_property_get(name: *const c_char, value: *mut c_char) -> c_int;
    }

    // Defined in sys/system_properties.h.
    // https://github.com/aosp-mirror/platform_bionic/blob/d3ebc2f7c49a9893b114124d4a6b315f3a328764/libc/include/sys/system_properties.h
    pub(crate) const PROP_VALUE_MAX: c_int = 92;
}

#[allow(
    clippy::alloc_instead_of_core,
    clippy::std_instead_of_alloc,
    clippy::std_instead_of_core,
    clippy::undocumented_unsafe_blocks,
    clippy::wildcard_imports
)]
#[cfg(test)]
mod tests {
    #[cfg(target_os = "android")]
    use super::*;

    #[allow(clippy::cast_sign_loss)]
    #[cfg(target_os = "android")]
    #[test]
    fn test_android() {
        unsafe {
            let mut arch = [1; ffi::PROP_VALUE_MAX as usize];
            let len = ffi::__system_property_get(
                b"ro.arch\0".as_ptr().cast::<ffi::c_char>(),
                arch.as_mut_ptr().cast::<ffi::c_char>(),
            );
            assert!(len >= 0);
            std::eprintln!("len={}", len);
            std::eprintln!("arch={:?}", arch);
            std::eprintln!(
                "arch={:?}",
                core::str::from_utf8(core::slice::from_raw_parts(arch.as_ptr(), len as usize))
                    .unwrap()
            );
        }
    }

    // Static assertions for FFI bindings.
    // This checks that FFI bindings defined in this crate, FFI bindings defined
    // in libc, and FFI bindings generated for the platform's latest header file
    // using bindgen have compatible signatures (or the same values if constants).
    // Since this is static assertion, we can detect problems with
    // `cargo check --tests --target <target>` run in CI (via TESTS=1 build.sh)
    // without actually running tests on these platforms.
    // See also tools/codegen/src/ffi.rs.
    // TODO(codegen): auto-generate this test
    #[cfg(target_os = "android")]
    #[allow(
        clippy::cast_possible_wrap,
        clippy::cast_sign_loss,
        clippy::cast_possible_truncation,
        clippy::no_effect_underscore_binding
    )]
    const _: fn() = || {
        use test_helper::{libc, sys};
        let mut ___system_property_get: unsafe extern "C" fn(
            *const ffi::c_char,
            *mut ffi::c_char,
        ) -> ffi::c_int = ffi::__system_property_get;
        ___system_property_get = libc::__system_property_get;
        ___system_property_get = sys::__system_property_get;
        static_assert!(ffi::PROP_VALUE_MAX == libc::PROP_VALUE_MAX);
        static_assert!(ffi::PROP_VALUE_MAX == sys::PROP_VALUE_MAX as _);
    };
}
