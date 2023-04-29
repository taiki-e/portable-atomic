// Gets and parses ELF auxiliary vectors on Linux/Android/FreeBSD.
//
// # Linux/Android
//
// As of nightly-2023-01-23, is_aarch64_feature_detected always uses dlsym by default
// on aarch64 Linux/Android, but on the following platforms, so we can safely assume
// getauxval is linked to the binary.
//
// - On glibc (*-linux-gnu*), [aarch64 support is available on glibc 2.17+](https://sourceware.org/legacy-ml/libc-announce/2012/msg00001.html)
//   and is newer than [glibc 2.16 that added getauxval](https://sourceware.org/legacy-ml/libc-announce/2012/msg00000.html).
// - On musl (*-linux-musl*, *-linux-ohos*), [aarch64 support is available on musl 1.1.7+](https://git.musl-libc.org/cgit/musl/tree/WHATSNEW?h=v1.1.7#n1422)
//   and is newer than [musl 1.1.0 that added getauxval](https://git.musl-libc.org/cgit/musl/tree/WHATSNEW?h=v1.1.0#n1197).
//   https://github.com/rust-lang/rust/commit/9a04ae4997493e9260352064163285cddc43de3c
// - On bionic (*-android*), [64-bit architecture support is available on Android 5.0+ (API level 21+)](https://android-developers.googleblog.com/2014/10/whats-new-in-android-50-lollipop.html)
//   and is newer than [Android 4.3 (API level 18) that added getauxval](https://github.com/aosp-mirror/platform_bionic/blob/d3ebc2f7c49a9893b114124d4a6b315f3a328764/libc/include/sys/auxv.h#L49).
//
// However, on musl with static linking, it seems that getauxval is not always available, independent of version requirements: https://github.com/rust-lang/rust/issues/89626
// (That problem may have been fixed in https://github.com/rust-lang/rust/commit/9a04ae4997493e9260352064163285cddc43de3c,
// but even in the version containing that patch, [there is report](https://github.com/rust-lang/rust/issues/89626#issuecomment-1242636038)
// of the same error.)
//
// On other Linux targets, we cannot assume that getauxval is always available, so we don't enable
// outline-atomics by default (can be enabled by `--cfg portable_atomic_outline_atomics`).
//
// - On musl with static linking. See the above for more.
//   Also, in this case, dlsym(getauxval) always returns null.
// - On uClibc-ng (*-linux-uclibc*, *-l4re-uclibc*), they [recently added getauxval](https://repo.or.cz/uclibc-ng.git/commitdiff/d869bb1600942c01a77539128f9ba5b5b55ad647)
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
//
// # PowerPC64
//
// On PowerPC64, outline-atomics is currently disabled by default mainly for
// compatibility with older versions of operating systems
// (can be enabled by `--cfg portable_atomic_outline_atomics`).

#[cfg(target_arch = "aarch64")]
pub(crate) use ffi::AT_HWCAP;
#[cfg(target_arch = "powerpc64")]
pub(crate) use ffi::AT_HWCAP2;
use os::ffi;
pub(crate) use os::getauxval;
#[cfg(any(target_os = "linux", target_os = "android"))]
mod os {
    // core::ffi::c_* (except c_void) requires Rust 1.64, libc will soon require Rust 1.47
    #[allow(dead_code)]
    pub(super) mod ffi {
        pub(crate) use super::super::super::c_types::c_ulong;

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
        }

        // https://github.com/torvalds/linux/blob/v6.1/include/uapi/linux/auxvec.h
        pub(crate) const AT_HWCAP: c_ulong = 16;
        pub(crate) const AT_HWCAP2: c_ulong = 26;
    }

    pub(crate) fn getauxval(type_: ffi::c_ulong) -> ffi::c_ulong {
        // SAFETY: `getauxval` is thread-safe. See also the module level docs.
        unsafe { ffi::getauxval(type_) }
    }
}
#[cfg(target_os = "freebsd")]
mod os {
    // core::ffi::c_* (except c_void) requires Rust 1.64, libc will soon require Rust 1.47
    #[allow(dead_code)]
    pub(super) mod ffi {
        pub(crate) use super::super::super::c_types::{c_int, c_ulong, c_void};

        extern "C" {
            // Defined in sys/auxv.h.
            // https://man.freebsd.org/elf_aux_info(3)
            // https://github.com/freebsd/freebsd-src/blob/deb63adf945d446ed91a9d84124c71f15ae571d1/sys/sys/auxv.h
            pub(crate) fn elf_aux_info(aux: c_int, buf: *mut c_void, buf_len: c_int) -> c_int;
        }

        // Defined in sys/elf_common.h.
        // https://github.com/freebsd/freebsd-src/blob/deb63adf945d446ed91a9d84124c71f15ae571d1/sys/sys/elf_common.h
        pub(crate) const AT_HWCAP: c_int = 25;
        pub(crate) const AT_HWCAP2: c_int = 26;
    }

    pub(crate) fn getauxval(aux: ffi::c_int) -> ffi::c_ulong {
        #[allow(clippy::cast_possible_wrap, clippy::cast_possible_truncation)]
        const OUT_LEN: ffi::c_int = core::mem::size_of::<ffi::c_ulong>() as ffi::c_int;
        let mut out: ffi::c_ulong = 0;
        // SAFETY:
        // - the pointer is valid because we got it from a reference.
        // - `OUT_LEN` is the same as the size of `out`.
        // - `elf_aux_info` is thread-safe.
        unsafe {
            let res = ffi::elf_aux_info(
                aux,
                (&mut out as *mut ffi::c_ulong).cast::<ffi::c_void>(),
                OUT_LEN,
            );
            // If elf_aux_info fails, `out` will be left at zero (which is the proper default value).
            debug_assert!(res == 0 || out == 0);
        }
        out
    }
}

// Basically, Linux and FreeBSD use the same hwcap values.
// FreeBSD supports a subset of the hwcap values supported by Linux.
#[cfg(target_arch = "aarch64")]
pub(crate) mod arch {
    pub(crate) use super::ffi::c_ulong;

    // Linux
    // https://github.com/torvalds/linux/blob/v6.1/arch/arm64/include/uapi/asm/hwcap.h
    // FreeBSD
    // Defined in machine/elf.h.
    // https://github.com/freebsd/freebsd-src/blob/deb63adf945d446ed91a9d84124c71f15ae571d1/sys/arm64/include/elf.h
    // available on FreeBSD 13.0+ and 12.2+
    // https://github.com/freebsd/freebsd-src/blob/release/13.0.0/sys/arm64/include/elf.h
    // https://github.com/freebsd/freebsd-src/blob/release/12.2.0/sys/arm64/include/elf.h
    pub(crate) const HWCAP_ATOMICS: c_ulong = 1 << 8;
    #[cfg(test)]
    pub(crate) const HWCAP_USCAT: c_ulong = 1 << 25;
}
#[cfg(target_arch = "powerpc64")]
pub(crate) mod arch {
    pub(crate) use super::ffi::c_ulong;

    // Linux
    // https://github.com/torvalds/linux/blob/v6.1/arch/powerpc/include/uapi/asm/cputable.h
    // FreeBSD
    // Defined in machine/cpu.h.
    // https://github.com/freebsd/freebsd-src/blob/deb63adf945d446ed91a9d84124c71f15ae571d1/sys/powerpc/include/cpu.h
    // available on FreeBSD 11.0+
    // https://github.com/freebsd/freebsd-src/commit/b0bf7fcd298133457991b27625bbed766e612730
    pub(crate) const PPC_FEATURE2_ARCH_2_07: c_ulong = 0x80000000;
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

    // Static assertions for FFI bindings.
    // This checks that FFI bindings defined in this crate, FFI bindings defined
    // in libc, and FFI bindings generated for the platform's latest header file
    // using bindgen have compatible signatures (or the same values if constants).
    // Since this is static assertion, we can detect problems with
    // `cargo check --tests --target <target>` run in CI (via TESTS=1 build.sh)
    // without actually running tests on these platforms.
    // See also tools/codegen/src/ffi.rs.
    // TODO(codegen): auto-generate this test
    #[allow(
        clippy::cast_possible_wrap,
        clippy::cast_sign_loss,
        clippy::cast_possible_truncation,
        clippy::no_effect_underscore_binding
    )]
    const _: fn() = || {
        use test_helper::{libc, sys};
        #[cfg(any(target_os = "linux", target_os = "android"))]
        {
            let mut _getauxval: unsafe extern "C" fn(ffi::c_ulong) -> ffi::c_ulong = ffi::getauxval;
            _getauxval = libc::getauxval;
            #[cfg(any(target_env = "musl", target_os = "android"))] // TODO(codegen)
            {
                _getauxval = sys::getauxval;
            }
        }
        #[cfg(target_os = "freebsd")]
        {
            let mut _elf_aux_info: unsafe extern "C" fn(
                ffi::c_int,
                *mut ffi::c_void,
                ffi::c_int,
            ) -> ffi::c_int = ffi::elf_aux_info;
            _elf_aux_info = libc::elf_aux_info;
            _elf_aux_info = sys::elf_aux_info;
        }
        #[cfg(not(target_os = "freebsd"))] // libc doesn't have this on FreeBSD
        static_assert!(ffi::AT_HWCAP == libc::AT_HWCAP);
        static_assert!(ffi::AT_HWCAP == sys::AT_HWCAP as _);
        #[cfg(not(target_os = "freebsd"))] // libc doesn't have this on FreeBSD
        static_assert!(ffi::AT_HWCAP2 == libc::AT_HWCAP2);
        static_assert!(ffi::AT_HWCAP2 == sys::AT_HWCAP2 as _);
        #[cfg(target_arch = "aarch64")]
        {
            // static_assert!(arch::HWCAP_ATOMICS == libc::HWCAP_ATOMICS); // libc doesn't have this
            static_assert!(arch::HWCAP_ATOMICS == sys::HWCAP_ATOMICS as ffi::c_ulong);
            // static_assert!(HWCAP_USCAT == libc::HWCAP_USCAT); // libc doesn't have this
            static_assert!(arch::HWCAP_USCAT == sys::HWCAP_USCAT as ffi::c_ulong);
        }
        #[cfg(target_arch = "powerpc64")]
        {
            // static_assert!(arch::PPC_FEATURE2_ARCH_2_07 == libc::PPC_FEATURE2_ARCH_2_07); // libc doesn't have this
            static_assert!(
                arch::PPC_FEATURE2_ARCH_2_07 == sys::PPC_FEATURE2_ARCH_2_07 as ffi::c_ulong
            );
        }
    };
}
