// Run-time feature detection on aarch64 Linux/FreeBSD/OpenBSD by parsing system registers.
//
// As of nightly-2023-01-23, is_aarch64_feature_detected doesn't support run-time detection on OpenBSD.
// https://github.com/rust-lang/stdarch/blob/a0c30f3e3c75adcd6ee7efc94014ebcead61c507/crates/std_detect/src/detect/mod.rs
// https://github.com/rust-lang/stdarch/pull/1374
//
// Refs:
// - https://developer.arm.com/documentation/ddi0601/2022-12/AArch64-Registers?lang=en
// - https://www.kernel.org/doc/Documentation/arm64/cpu-feature-registers.txt
// - https://github.com/rust-lang/stdarch/blob/a0c30f3e3c75adcd6ee7efc94014ebcead61c507/crates/std_detect/src/detect/os/aarch64.rs
//
// Supported platforms:
// - Linux 4.11+
//   https://github.com/torvalds/linux/commit/77c97b4ee21290f5f083173d957843b615abbff2
// - FreeBSD 12.0+
//   https://github.com/freebsd/freebsd-src/commit/398810619cb32abf349f8de23f29510b2ee0839b
// - OpenBSD 7.1+ (through sysctl)
//   https://github.com/openbsd/src/commit/d335af936b9d7dd9cf655cae1ce19560c45de6c8
//
// For now, this module is only used on FreeBSD and OpenBSD.
// On Linux, this module is test only because this approach requires a higher
// kernel version than Rust supports, and also does not work with qemu-user
// (as of QEMU 7.2) and Valgrind. (Looking into HWCAP_CPUID in auxvec, it appears
// that Valgrind is setting it to false correctly, but qemu-user is setting it to true.)

#![cfg_attr(
    any(
        portable_atomic_no_aarch64_target_feature,
        any(target_feature = "lse", portable_atomic_target_feature = "lse")
    ),
    allow(dead_code)
)]

include!("common.rs");

struct AA64Reg {
    aa64isar0: u64,
    #[cfg(test)]
    aa64mmfr2: u64,
}

#[inline]
fn _detect(info: &mut CpuInfo) {
    let AA64Reg {
        aa64isar0,
        #[cfg(test)]
        aa64mmfr2,
    } = imp::aa64reg();

    // ID_AA64ISAR0_EL1, Instruction Set Attribute Register 0
    // https://developer.arm.com/documentation/ddi0601/2022-12/AArch64-Registers/ID-AA64ISAR0-EL1--AArch64-Instruction-Set-Attribute-Register-0?lang=en
    let atomic = extract(aa64isar0, 23, 20);
    if atomic >= 2 {
        info.set(CpuInfo::HAS_LSE);
        #[cfg(test)]
        {
            if atomic >= 3 {
                info.set(CpuInfo::HAS_LSE128);
            }
        }
    }

    #[cfg(test)]
    {
        // ID_AA64MMFR2_EL1, AArch64 Memory Model Feature Register 2
        // https://developer.arm.com/documentation/ddi0601/2022-12/AArch64-Registers/ID-AA64MMFR2-EL1--AArch64-Memory-Model-Feature-Register-2?lang=en
        if extract(aa64mmfr2, 35, 32) >= 1 {
            info.set(CpuInfo::HAS_LSE2);
        }
    }
}

#[inline]
fn extract(x: u64, high: usize, low: usize) -> u64 {
    (x >> low) & ((1 << (high - low + 1)) - 1)
}

#[cfg(not(target_os = "openbsd"))]
mod imp {
    #[cfg(not(portable_atomic_no_asm))]
    use core::arch::asm;

    use super::AA64Reg;

    #[inline]
    pub(super) fn aa64reg() -> AA64Reg {
        // SAFETY: This is safe on FreeBSD 12.0+. FreeBSD 11 was EoL on 2021-09-30.
        // Note that stdarch has been doing the same thing since before FreeBSD 11 was EoL.
        // https://github.com/rust-lang/stdarch/pull/611
        unsafe {
            let aa64isar0: u64;
            asm!(
                "mrs {}, ID_AA64ISAR0_EL1",
                out(reg) aa64isar0,
                options(pure, nomem, nostack, preserves_flags)
            );
            #[cfg(test)]
            let aa64mmfr2: u64;
            #[cfg(test)]
            {
                asm!(
                    "mrs {}, ID_AA64MMFR2_EL1",
                    out(reg) aa64mmfr2,
                    options(pure, nomem, nostack, preserves_flags)
                );
            }
            AA64Reg {
                aa64isar0,
                #[cfg(test)]
                aa64mmfr2,
            }
        }
    }
}
// OpenBSD doesn't trap the mrs instruction, but exposes the system registers through sysctl.
// https://github.com/openbsd/src/commit/d335af936b9d7dd9cf655cae1ce19560c45de6c8
// https://github.com/golang/go/commit/cd54ef1f61945459486e9eea2f016d99ef1da925
#[cfg(target_os = "openbsd")]
mod imp {
    use core::{mem::MaybeUninit, ptr};

    use super::AA64Reg;

    // core::ffi::c_* (except c_void) requires Rust 1.64
    #[allow(non_camel_case_types)]
    pub(super) mod ffi {
        pub(crate) use core::ffi::c_void;
        // c_{,u}int is {i,u}32 on non-16-bit architectures
        // https://github.com/rust-lang/rust/blob/1.67.0/library/core/src/ffi/mod.rs#L159-L173
        pub(crate) type c_int = i32;
        pub(crate) type c_uint = u32;
        // c_size_t is usize
        // https://github.com/rust-lang/rust/blob/1.67.0/library/core/src/ffi/mod.rs#L83-L88
        pub(crate) type c_size_t = usize;

        extern "C" {
            // Defined in sys/sysctl.h.
            // https://man.openbsd.org/sysctl.2
            // https://github.com/rust-lang/libc/blob/0.2.139/src/unix/bsd/netbsdlike/openbsd/mod.rs#L1817-L1824
            pub(crate) fn sysctl(
                name: *const c_int,
                name_len: c_uint,
                old_p: *mut c_void,
                old_len_p: *mut c_size_t,
                new_p: *mut c_void,
                new_len: c_size_t,
            ) -> c_int;
        }

        // Defined in sys/sysctl.h.
        // https://github.com/openbsd/src/blob/72ccc03bd11da614f31f7ff76e3f6fce99bc1c79/sys/sys/sysctl.h#L82
        pub(crate) const CTL_MACHDEP: c_int = 7;
        // Defined in machine/cpu.h.
        // https://github.com/openbsd/src/blob/72ccc03bd11da614f31f7ff76e3f6fce99bc1c79/sys/arch/arm64/include/cpu.h#L25-L40
        pub(crate) const CPU_ID_AA64ISAR0: c_int = 2;
        #[cfg(test)]
        pub(crate) const CPU_ID_AA64MMFR2: c_int = 7;
    }

    // ID_AA64ISAR0_EL1 and ID_AA64ISAR1_EL1 are supported on OpenBSD 7.1+.
    // https://github.com/openbsd/src/commit/d335af936b9d7dd9cf655cae1ce19560c45de6c8
    // Others are supported on OpenBSD 7.3+.
    // https://github.com/openbsd/src/commit/c7654cd65262d532212f65123ee3905ba200365c
    // sysctl returns an unsupported error if operation is not supported,
    // so we can safely use this function on older versions of OpenBSD.
    #[inline]
    pub(super) fn aa64reg() -> AA64Reg {
        let aa64isar0 = sysctl64(&[ffi::CTL_MACHDEP, ffi::CPU_ID_AA64ISAR0]).unwrap_or(0);
        #[cfg(test)]
        let aa64mmfr2 = sysctl64(&[ffi::CTL_MACHDEP, ffi::CPU_ID_AA64MMFR2]).unwrap_or(0);
        AA64Reg {
            aa64isar0,
            #[cfg(test)]
            aa64mmfr2,
        }
    }

    #[inline]
    fn sysctl64(mib: &[ffi::c_int]) -> Option<u64> {
        const OUT_LEN: ffi::c_size_t = core::mem::size_of::<u64>() as ffi::c_size_t;
        let mut out = MaybeUninit::<u64>::uninit();
        let mut out_len = OUT_LEN;
        #[allow(clippy::cast_possible_truncation)]
        // SAFETY:
        // - `mib.len()` does not exceed the size of `mib`.
        // - `out_len` does not exceed the size of `out`.
        // - `sysctl` is thread-safe.
        let res = unsafe {
            ffi::sysctl(
                mib.as_ptr(),
                mib.len() as ffi::c_uint,
                out.as_mut_ptr() as *mut ffi::c_void,
                &mut out_len,
                ptr::null_mut(),
                0,
            )
        };
        if res == -1 || out_len != OUT_LEN {
            return None;
        }
        // SAFETY: we've checked that sysctl was successful and `out` was filled.
        Some(unsafe { out.assume_init() })
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
    use std::{
        process::Command,
        string::{String, ToString},
    };

    use super::*;

    #[test]
    fn test_aa64reg() {
        let AA64Reg { aa64isar0, aa64mmfr2 } = imp::aa64reg();
        std::eprintln!("aa64isar0={}", aa64isar0);
        std::eprintln!("aa64mmfr2={}", aa64mmfr2);
        if cfg!(target_os = "openbsd") {
            let output = Command::new("sysctl").arg("machdep").output().unwrap();
            assert!(output.status.success());
            let stdout = String::from_utf8(output.stdout).unwrap();
            assert_eq!(
                stdout.lines().find_map(|s| s.strip_prefix("machdep.id_aa64isar0=")).unwrap(),
                aa64isar0.to_string(),
            );
            assert_eq!(
                stdout.lines().find_map(|s| s.strip_prefix("machdep.id_aa64mmfr2=")).unwrap_or("0"),
                aa64mmfr2.to_string(),
            );
        }
        if detect().test(CpuInfo::HAS_LSE) {
            let atomic = extract(aa64isar0, 23, 20);
            if detect().test(CpuInfo::HAS_LSE128) {
                assert_eq!(atomic, 3);
            } else {
                assert_eq!(atomic, 2);
            }
        }
        if detect().test(CpuInfo::HAS_LSE2) {
            assert_eq!(extract(aa64mmfr2, 35, 32), 1);
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
    #[cfg(target_os = "openbsd")]
    #[allow(
        clippy::cast_possible_wrap,
        clippy::cast_sign_loss,
        clippy::no_effect_underscore_binding
    )]
    const _: fn() = || {
        use crate::tests::sys::*;
        use imp::ffi;
        let _: ffi::c_int = 0 as std::os::raw::c_int;
        let _: ffi::c_uint = 0 as std::os::raw::c_uint;
        let _: ffi::c_int = 0 as libc::c_int;
        let _: ffi::c_uint = 0 as libc::c_uint;
        let _: ffi::c_size_t = 0 as libc::size_t;
        let mut _sysctl: unsafe extern "C" fn(
            *const ffi::c_int,
            ffi::c_uint,
            *mut ffi::c_void,
            *mut ffi::c_size_t,
            *mut ffi::c_void,
            ffi::c_size_t,
        ) -> ffi::c_int = ffi::sysctl;
        _sysctl = libc::sysctl;
        _sysctl = sys_sysctl::sysctl;
        let [] = [(); (ffi::CTL_MACHDEP - libc::CTL_MACHDEP) as usize];
        let [] = [(); (ffi::CTL_MACHDEP - sys_sysctl::CTL_MACHDEP as ffi::c_int) as usize];
        // libc doesn't have this
        // let [] = [(); (ffi::CPU_ID_AA64ISAR0 - libc::CPU_ID_AA64ISAR0) as usize];
        let [] =
            [(); (ffi::CPU_ID_AA64ISAR0 - machine_cpu::CPU_ID_AA64ISAR0 as ffi::c_int) as usize];
        // libc doesn't have this
        // let [] = [(); (ffi::CPU_ID_AA64MMFR2 - libc::CPU_ID_AA64MMFR2) as usize];
        let [] =
            [(); (ffi::CPU_ID_AA64MMFR2 - machine_cpu::CPU_ID_AA64MMFR2 as ffi::c_int) as usize];
    };
}
