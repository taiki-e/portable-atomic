// Run-time feature detection on aarch64 Linux/Android/FreeBSD by parsing ELF auxiliary vectors.
//
// # Linux/Android
//
// As of nightly-2023-01-23, is_aarch64_feature_detected always uses dlsym by default
// on aarch64 Linux/Android, but on the following platforms, so we can safely assume
// getauxval is linked to the binary.
//
// - On glibc (*-linux-gnu*), [aarch64 support is available on glibc 2.17+](https://sourceware.org/legacy-ml/libc-announce/2012/msg00001.html)
//   and is newer than [glibc 2.16 that added getauxval](https://sourceware.org/legacy-ml/libc-announce/2012/msg00000.html).
// - On bionic (*-android*), [64-bit architecture support is available on Android 5.0+ (API level 21+)](https://android-developers.googleblog.com/2014/10/whats-new-in-android-50-lollipop.html)
//   and is newer than [Android 4.3 (API level 18) that added getauxval](https://github.com/aosp-mirror/platform_bionic/blob/d3ebc2f7c49a9893b114124d4a6b315f3a328764/libc/include/sys/auxv.h#L49).
//
// On other Linux targets, we cannot assume that getauxval is always available,
// so we use is_aarch64_feature_detected which uses dlsym (+io fallback) instead
// of this module.
//
// - On musl (*-linux-musl*), [aarch64 support is available on musl 1.1.7+](https://git.musl-libc.org/cgit/musl/tree/WHATSNEW?h=v1.1.7#n1422)
//   and is newer than [musl 1.1.0 that added getauxval](https://git.musl-libc.org/cgit/musl/tree/WHATSNEW?h=v1.1.0#n1197).
//   However, it seems that getauxval is not always available, independent of version requirements: https://github.com/rust-lang/rust/issues/89626
//   (That problem may have been fixed in https://github.com/rust-lang/rust/commit/9a04ae4997493e9260352064163285cddc43de3c,
//   but even in the version containing that patch, [there is report](https://github.com/rust-lang/rust/issues/89626#issuecomment-1242636038)
//   of the same error.)
// - On uClibc-ng (*-linux-uclibc*), they [recently added getauxval](https://repo.or.cz/uclibc-ng.git/commitdiff/d869bb1600942c01a77539128f9ba5b5b55ad647)
//   but have not released it yet (as of 2023-02-09).
// - On Picolibc, [Picolibc 1.4.6 added getauxval stub](https://github.com/picolibc/picolibc#picolibc-version-146).
//
// See also https://github.com/rust-lang/stdarch/pull/1375
//
// # FreeBSD
//
// As of nightly-2023-01-23, is_aarch64_feature_detected always uses mrs on
// aarch64 FreeBSD. However, they do not work on FreeBSD 12 on QEMU (confirmed
// on FreeBSD 12.{2,3,4}), and we got SIGILL (worked on FreeBSD 13 and 14).
//
// So use elf_aux_info instead of mrs like compiler-rt does.
// https://man.freebsd.org/elf_aux_info(3)
// https://reviews.llvm.org/D109330
//
// elf_aux_info is available on FreeBSD 12.0+ and 11.4+:
// https://github.com/freebsd/freebsd-src/commit/0b08ae2120cdd08c20a2b806e2fcef4d0a36c470
// https://github.com/freebsd/freebsd-src/blob/release/11.4.0/sys/sys/auxv.h
// On FreeBSD, [aarch64 support is available on FreeBSD 11.0+](https://www.freebsd.org/releases/11.0R/relnotes/#hardware-arm),
// but FreeBSD 11 (11.4) was EoL on 2021-09-30, and FreeBSD 11.3 was EoL on 2020-09-30:
// https://www.freebsd.org/security/unsupported
// See also https://github.com/rust-lang/stdarch/pull/611#issuecomment-445464613

#![cfg_attr(
    any(
        portable_atomic_no_aarch64_target_feature,
        any(target_feature = "lse", portable_atomic_target_feature = "lse"),
    ),
    allow(dead_code)
)]

include!("common.rs");

struct AuxVec {
    hwcap: ffi::c_ulong,
}

#[inline]
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

    let AuxVec { hwcap } = imp::auxv();

    if hwcap & ffi::HWCAP_ATOMICS != 0 {
        info.set(CpuInfo::HAS_LSE);
    }
    // we currently only use FEAT_LSE in outline-atomics.
    #[cfg(test)]
    {
        if hwcap & ffi::HWCAP_USCAT != 0 {
            info.set(CpuInfo::HAS_LSE2);
        }
    }
}

use imp::ffi;
#[cfg(any(target_os = "linux", target_os = "android"))]
mod imp {
    use super::AuxVec;

    // core::ffi::c_* (except c_void) requires Rust 1.64
    #[allow(non_camel_case_types)]
    pub(super) mod ffi {
        // c_char is u8 on aarch64 Linux/Android
        // https://github.com/rust-lang/rust/blob/1.67.0/library/core/src/ffi/mod.rs#L104-L157
        #[cfg(target_os = "android")]
        pub(crate) type c_char = u8;
        // c_{,u}int is {i,u}32 on non-16-bit architectures
        // https://github.com/rust-lang/rust/blob/1.67.0/library/core/src/ffi/mod.rs#L159-L173
        #[cfg(target_os = "android")]
        pub(crate) type c_int = i32;
        // c_{,u}long is {i,u}64 on non-windows 64-bit targets, otherwise is {i,u}32
        // https://github.com/rust-lang/rust/blob/1.67.0/library/core/src/ffi/mod.rs#L175-L190
        #[cfg(target_pointer_width = "64")]
        pub(crate) type c_ulong = u64;
        #[cfg(target_pointer_width = "32")]
        pub(crate) type c_ulong = u32;

        extern "C" {
            // https://man7.org/linux/man-pages/man3/getauxval.3.html
            // https://github.com/bminor/glibc/blob/801af9fafd4689337ebf27260aa115335a0cb2bc/misc/sys/auxv.h
            // https://github.com/bminor/musl/blob/7d756e1c04de6eb3f2b3d3e1141a218bb329fcfb/include/sys/auxv.h
            // https://repo.or.cz/uclibc-ng.git/blob/9d549d7bc6a1b78498ee8d1f39f6a324fdfc9e5d:/include/sys/auxv.h
            // https://github.com/aosp-mirror/platform_bionic/blob/d3ebc2f7c49a9893b114124d4a6b315f3a328764/libc/include/sys/auxv.h
            // https://github.com/picolibc/picolibc/blob/7a8a58aeaa5946cb662577a518051091b691af3a/newlib/libc/picolib/getauxval.c
            // https://github.com/rust-lang/libc/blob/0.2.139/src/unix/linux_like/linux/gnu/mod.rs#L1201
            // https://github.com/rust-lang/libc/blob/0.2.139/src/unix/linux_like/linux/musl/mod.rs#L744
            // https://github.com/rust-lang/libc/blob/0.2.139/src/unix/linux_like/android/b64/mod.rs#L333
            pub(crate) fn getauxval(type_: c_ulong) -> c_ulong;

            // Defined in sys/system_properties.h.
            // https://github.com/aosp-mirror/platform_bionic/blob/d3ebc2f7c49a9893b114124d4a6b315f3a328764/libc/include/sys/system_properties.h
            // https://github.com/rust-lang/libc/blob/0.2.139/src/unix/linux_like/android/mod.rs#L3471
            #[cfg(target_os = "android")]
            pub(crate) fn __system_property_get(
                __name: *const c_char,
                __value: *mut c_char,
            ) -> c_int;
        }

        // https://github.com/torvalds/linux/blob/v6.1/include/uapi/linux/auxvec.h
        pub(crate) const AT_HWCAP: c_ulong = 16;
        // https://github.com/torvalds/linux/blob/v6.1/arch/arm64/include/uapi/asm/hwcap.h
        pub(crate) const HWCAP_ATOMICS: c_ulong = 1 << 8;
        #[cfg(test)]
        pub(crate) const HWCAP_USCAT: c_ulong = 1 << 25;

        // Defined in sys/system_properties.h.
        // https://github.com/aosp-mirror/platform_bionic/blob/d3ebc2f7c49a9893b114124d4a6b315f3a328764/libc/include/sys/system_properties.h
        #[cfg(target_os = "android")]
        pub(crate) const PROP_VALUE_MAX: c_int = 92;
    }

    #[inline]
    pub(super) fn auxv() -> AuxVec {
        // SAFETY: `getauxval` is thread-safe and is available in all versions on
        // aarch64 linux-gnu/android. See also the module level docs.
        let hwcap = unsafe { ffi::getauxval(ffi::AT_HWCAP) };
        AuxVec { hwcap }
    }
}
#[cfg(target_os = "freebsd")]
mod imp {
    use super::AuxVec;

    // core::ffi::c_* (except c_void) requires Rust 1.64
    #[allow(non_camel_case_types)]
    pub(super) mod ffi {
        pub(crate) use core::ffi::c_void;
        // c_{,u}int is {i,u}32 on non-16-bit architectures
        // https://github.com/rust-lang/rust/blob/1.67.0/library/core/src/ffi/mod.rs#L159-L173
        pub(crate) type c_int = i32;
        // c_{,u}long is {i,u}64 on non-windows 64-bit targets, otherwise is {i,u}32
        // https://github.com/rust-lang/rust/blob/1.67.0/library/core/src/ffi/mod.rs#L175-L190
        #[cfg(target_pointer_width = "64")]
        pub(crate) type c_ulong = u64;
        #[cfg(target_pointer_width = "32")]
        pub(crate) type c_ulong = u32;

        // Defined in sys/elf_common.h.
        // https://github.com/freebsd/freebsd-src/blob/deb63adf945d446ed91a9d84124c71f15ae571d1/sys/sys/elf_common.h
        pub(crate) const AT_HWCAP: c_int = 25;

        // Defined in machine/elf.h.
        // https://github.com/freebsd/freebsd-src/blob/deb63adf945d446ed91a9d84124c71f15ae571d1/sys/arm64/include/elf.h
        // available on FreeBSD 13.0+ and 12.2+
        // https://github.com/freebsd/freebsd-src/blob/release/13.0.0/sys/arm64/include/elf.h
        // https://github.com/freebsd/freebsd-src/blob/release/12.2.0/sys/arm64/include/elf.h
        pub(crate) const HWCAP_ATOMICS: c_ulong = 0x0000_0100;
        #[cfg(test)]
        pub(crate) const HWCAP_USCAT: c_ulong = 0x0200_0000;

        extern "C" {
            // Defined in sys/auxv.h.
            // https://man.freebsd.org/elf_aux_info(3)
            // https://github.com/freebsd/freebsd-src/blob/deb63adf945d446ed91a9d84124c71f15ae571d1/sys/sys/auxv.h
            pub(crate) fn elf_aux_info(aux: c_int, buf: *mut c_void, buf_len: c_int) -> c_int;
        }
    }

    #[inline]
    fn getauxval(aux: ffi::c_int) -> ffi::c_ulong {
        #[allow(clippy::cast_possible_wrap, clippy::cast_possible_truncation)]
        const OUT_LEN: ffi::c_int = core::mem::size_of::<ffi::c_ulong>() as ffi::c_int;
        let mut out: ffi::c_ulong = 0;
        // SAFETY:
        // - the pointer is valid because we got it from a reference.
        // - `OUT_LEN` is the same as the size of `out`.
        // - `elf_aux_info` is thread-safe.
        // If elf_aux_info fails, `out` will be left at zero (which is the proper default value).
        unsafe {
            ffi::elf_aux_info(aux, (&mut out as *mut ffi::c_ulong).cast::<ffi::c_void>(), OUT_LEN);
        }
        out
    }

    #[inline]
    pub(super) fn auxv() -> AuxVec {
        let hwcap = getauxval(ffi::AT_HWCAP);
        AuxVec { hwcap }
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
mod tests {
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
            std::println!("len={}", len);
            std::println!("arch={:?}", arch);
            std::println!(
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
    // TODO: auto-generate this test
    #[cfg(any(target_os = "linux", target_os = "android"))]
    #[allow(
        clippy::cast_possible_wrap,
        clippy::cast_sign_loss,
        clippy::cast_possible_truncation,
        clippy::no_effect_underscore_binding
    )]
    const _: fn() = || {
        use test_helper::{libc, sys};
        #[cfg(target_os = "android")]
        let _: ffi::c_char = 0 as std::os::raw::c_char;
        #[cfg(target_os = "android")]
        let _: ffi::c_char = 0 as libc::c_char;
        #[cfg(target_os = "android")]
        let _: ffi::c_int = 0 as std::os::raw::c_int;
        #[cfg(target_os = "android")]
        let _: ffi::c_int = 0 as libc::c_int;
        let _: ffi::c_ulong = 0 as std::os::raw::c_ulong;
        let _: ffi::c_ulong = 0 as libc::c_ulong;
        let mut _getauxval: unsafe extern "C" fn(ffi::c_ulong) -> ffi::c_ulong = ffi::getauxval;
        _getauxval = libc::getauxval;
        #[cfg(target_os = "android")]
        {
            let mut ___system_property_get: unsafe extern "C" fn(
                *const ffi::c_char,
                *mut ffi::c_char,
            ) -> ffi::c_int = ffi::__system_property_get;
            ___system_property_get = libc::__system_property_get;
        }
        static_assert!(ffi::AT_HWCAP == libc::AT_HWCAP);
        static_assert!(ffi::AT_HWCAP == sys::AT_HWCAP as ffi::c_ulong);
        static_assert!(ffi::HWCAP_ATOMICS == libc::HWCAP_ATOMICS);
        static_assert!(ffi::HWCAP_ATOMICS == sys::HWCAP_ATOMICS as ffi::c_ulong);
        static_assert!(ffi::HWCAP_USCAT == libc::HWCAP_USCAT);
        static_assert!(ffi::HWCAP_USCAT == sys::HWCAP_USCAT as ffi::c_ulong);
        #[cfg(target_os = "android")]
        static_assert!(ffi::PROP_VALUE_MAX == libc::PROP_VALUE_MAX);
    };
    #[cfg(target_os = "freebsd")]
    #[allow(
        clippy::cast_possible_wrap,
        clippy::cast_sign_loss,
        clippy::cast_possible_truncation,
        clippy::no_effect_underscore_binding
    )]
    const _: fn() = || {
        use test_helper::{libc, sys};
        let _: ffi::c_int = 0 as libc::c_int;
        let _: ffi::c_ulong = 0 as std::os::raw::c_ulong;
        let _: ffi::c_ulong = 0 as libc::c_ulong;
        let mut _elf_aux_info: unsafe extern "C" fn(
            ffi::c_int,
            *mut ffi::c_void,
            ffi::c_int,
        ) -> ffi::c_int = ffi::elf_aux_info;
        // libc has this, but unreleased as of 0.2.139: https://github.com/rust-lang/libc/commit/a4fd9d32c854417afa1acdbc922eeafac5fcbbfd
        // _elf_aux_info = libc::elf_aux_info;
        _elf_aux_info = sys::elf_aux_info;
        // static_assert!(ffi::AT_HWCAP == libc::AT_HWCAP); // libc doesn't have this
        static_assert!(ffi::AT_HWCAP == sys::AT_HWCAP as ffi::c_int);
        // static_assert!(ffi::HWCAP_ATOMICS == libc::HWCAP_ATOMICS); // libc doesn't have this
        static_assert!(ffi::HWCAP_ATOMICS == sys::HWCAP_ATOMICS as ffi::c_ulong);
        // static_assert!(ffi::HWCAP_USCAT == libc::HWCAP_USCAT); // libc doesn't have this
        static_assert!(ffi::HWCAP_USCAT == sys::HWCAP_USCAT as ffi::c_ulong);
    };
}
