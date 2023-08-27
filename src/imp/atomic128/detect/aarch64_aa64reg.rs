// Run-time feature detection on aarch64 Linux/FreeBSD/NetBSD/OpenBSD by parsing system registers.
//
// As of nightly-2023-01-23, is_aarch64_feature_detected doesn't support run-time detection on NetBSD/OpenBSD.
// https://github.com/rust-lang/stdarch/blob/a0c30f3e3c75adcd6ee7efc94014ebcead61c507/crates/std_detect/src/detect/mod.rs
// https://github.com/rust-lang/stdarch/pull/1374
//
// Refs:
// - https://developer.arm.com/documentation/ddi0601/latest/AArch64-Registers
// - https://www.kernel.org/doc/Documentation/arm64/cpu-feature-registers.txt
// - https://github.com/rust-lang/stdarch/blob/a0c30f3e3c75adcd6ee7efc94014ebcead61c507/crates/std_detect/src/detect/os/aarch64.rs
//
// Supported platforms:
// - Linux 4.11+ (emulate mrs instruction)
//   https://github.com/torvalds/linux/commit/77c97b4ee21290f5f083173d957843b615abbff2
// - FreeBSD 12.0+ (emulate mrs instruction)
//   https://github.com/freebsd/freebsd-src/commit/398810619cb32abf349f8de23f29510b2ee0839b
// - NetBSD 9.0+ (through sysctl)
//   https://github.com/NetBSD/src/commit/70057642485887b9601804adb983c70d11e48d9a
// - OpenBSD 7.1+ (through sysctl)
//   https://github.com/openbsd/src/commit/d335af936b9d7dd9cf655cae1ce19560c45de6c8
//
// For now, this module is only used on NetBSD/OpenBSD.
// On Linux/FreeBSD, this module is test-only:
// - On Linux, this approach requires a higher kernel version than Rust supports,
//   and also does not work with qemu-user (as of QEMU 7.2) and Valgrind.
//   (Looking into HWCAP_CPUID in auxvec, it appears that Valgrind is setting it
//   to false correctly, but qemu-user is setting it to true.)
// - On FreeBSD, this approach does not work on FreeBSD 12 on QEMU (confirmed on
//   FreeBSD 12.{2,3,4}), and we got SIGILL (worked on FreeBSD 13 and 14).

include!("common.rs");

#[cfg_attr(target_os = "netbsd", derive(Default, PartialEq))]
struct AA64Reg {
    aa64isar0: u64,
    #[cfg(test)]
    aa64isar1: u64,
    #[cfg(test)]
    aa64mmfr2: u64,
}

#[cold]
fn _detect(info: &mut CpuInfo) {
    let AA64Reg {
        aa64isar0,
        #[cfg(test)]
        aa64isar1,
        #[cfg(test)]
        aa64mmfr2,
    } = imp::aa64reg();

    // ID_AA64ISAR0_EL1, Instruction Set Attribute Register 0
    // https://developer.arm.com/documentation/ddi0601/2023-06/AArch64-Registers/ID-AA64ISAR0-EL1--AArch64-Instruction-Set-Attribute-Register-0?lang=en
    let atomic = extract(aa64isar0, 23, 20);
    if atomic >= 2 {
        info.set(CpuInfo::HAS_LSE);
        // we currently only use FEAT_LSE in outline-atomics.
        #[cfg(test)]
        {
            if atomic >= 3 {
                info.set(CpuInfo::HAS_LSE128);
            }
        }
    }
    // we currently only use FEAT_LSE in outline-atomics.
    #[cfg(test)]
    {
        // ID_AA64ISAR1_EL1, Instruction Set Attribute Register 1
        // https://developer.arm.com/documentation/ddi0601/2023-06/AArch64-Registers/ID-AA64ISAR1-EL1--AArch64-Instruction-Set-Attribute-Register-1?lang=en
        if extract(aa64isar1, 23, 20) >= 3 {
            info.set(CpuInfo::HAS_RCPC3);
        }
        // ID_AA64MMFR2_EL1, AArch64 Memory Model Feature Register 2
        // https://developer.arm.com/documentation/ddi0601/2023-06/AArch64-Registers/ID-AA64MMFR2-EL1--AArch64-Memory-Model-Feature-Register-2?lang=en
        if extract(aa64mmfr2, 35, 32) >= 1 {
            info.set(CpuInfo::HAS_LSE2);
        }
    }
}

fn extract(x: u64, high: usize, low: usize) -> u64 {
    (x >> low) & ((1 << (high - low + 1)) - 1)
}

#[cfg(not(any(target_os = "netbsd", target_os = "openbsd")))]
mod imp {
    // This module is test-only. See parent module docs for details.

    #[cfg(not(portable_atomic_no_asm))]
    use core::arch::asm;

    use super::AA64Reg;

    pub(super) fn aa64reg() -> AA64Reg {
        // SAFETY: This is safe on FreeBSD 12.0+. FreeBSD 11 was EoL on 2021-09-30.
        // Note that stdarch has been doing the same thing since before FreeBSD 11 was EoL.
        // https://github.com/rust-lang/stdarch/pull/611
        unsafe {
            let aa64isar0: u64;
            asm!(
                "mrs {0}, ID_AA64ISAR0_EL1",
                out(reg) aa64isar0,
                options(pure, nomem, nostack, preserves_flags)
            );
            #[cfg(test)]
            let aa64isar1: u64;
            #[cfg(test)]
            {
                asm!(
                    "mrs {0}, ID_AA64ISAR1_EL1",
                    out(reg) aa64isar1,
                    options(pure, nomem, nostack, preserves_flags)
                );
            }
            #[cfg(test)]
            let aa64mmfr2: u64;
            #[cfg(test)]
            {
                asm!(
                    "mrs {0}, ID_AA64MMFR2_EL1",
                    out(reg) aa64mmfr2,
                    options(pure, nomem, nostack, preserves_flags)
                );
            }
            AA64Reg {
                aa64isar0,
                #[cfg(test)]
                aa64isar1,
                #[cfg(test)]
                aa64mmfr2,
            }
        }
    }
}
#[cfg(target_os = "netbsd")]
mod imp {
    // NetBSD doesn't trap the mrs instruction, but exposes the system registers through sysctl.
    // https://github.com/NetBSD/src/commit/70057642485887b9601804adb983c70d11e48d9a
    // https://github.com/golang/sys/commit/ef9fd89ba245e184bdd308f7f2b4f3c551fa5b0f

    use core::ptr;

    use super::AA64Reg;

    // core::ffi::c_* (except c_void) requires Rust 1.64
    #[allow(non_camel_case_types)]
    pub(super) mod ffi {
        pub(crate) use super::super::c_types::{c_char, c_int, c_size_t, c_uint, c_void};

        extern "C" {
            // Defined in sys/sysctl.h.
            // https://man.netbsd.org/sysctl.3
            // https://github.com/rust-lang/libc/blob/0.2.139/src/unix/bsd/netbsdlike/netbsd/mod.rs#L2574
            pub(crate) fn sysctl(
                name: *const c_int,
                name_len: c_uint,
                old_p: *mut c_void,
                old_len_p: *mut c_size_t,
                new_p: *const c_void,
                new_len: c_size_t,
            ) -> c_int;
            pub(crate) fn sysctlbyname(
                name: *const c_char,
                old_p: *mut c_void,
                old_len_p: *mut c_size_t,
                new_p: *const c_void,
                new_len: c_size_t,
            ) -> c_int;
        }

        // Defined in aarch64/armreg.h.
        // https://github.com/NetBSD/src/blob/49ff686c908df01d34af98d7a46d51aabe7008fa/sys/arch/aarch64/include/armreg.h#L1626
        #[derive(Clone, Copy)]
        #[repr(C)]
        pub(crate) struct aarch64_sysctl_cpu_id {
            // NetBSD 9.0+
            // https://github.com/NetBSD/src/commit/70057642485887b9601804adb983c70d11e48d9a
            pub(crate) _midr: u64,      /* Main ID Register */
            pub(crate) _revidr: u64,    /* Revision ID Register */
            pub(crate) _mpidr: u64,     /* Multiprocessor Affinity Register */
            pub(crate) _aa64dfr0: u64,  /* A64 Debug Feature Register 0 */
            pub(crate) _aa64dfr1: u64,  /* A64 Debug Feature Register 1 */
            pub(crate) _aa64isar0: u64, /* A64 Instruction Set Attribute Register 0 */
            pub(crate) _aa64isar1: u64, /* A64 Instruction Set Attribute Register 1 */
            pub(crate) _aa64mmfr0: u64, /* A64 Memory Model Feature Register 0 */
            pub(crate) _aa64mmfr1: u64, /* A64 Memory Model Feature Register 1 */
            pub(crate) _aa64mmfr2: u64, /* A64 Memory Model Feature Register 2 */
            pub(crate) _aa64pfr0: u64,  /* A64 Processor Feature Register 0 */
            pub(crate) _aa64pfr1: u64,  /* A64 Processor Feature Register 1 */
            pub(crate) _aa64zfr0: u64,  /* A64 SVE Feature ID Register 0 */
            pub(crate) _mvfr0: u32,     /* Media and VFP Feature Register 0 */
            pub(crate) _mvfr1: u32,     /* Media and VFP Feature Register 1 */
            pub(crate) _mvfr2: u32,     /* Media and VFP Feature Register 2 */
            // NetBSD 10.0+
            // https://github.com/NetBSD/src/commit/908d3fadf77e1b392db35d1076f7f9961c1d351d
            pub(crate) _pad: u32,
            pub(crate) _clidr: u64, /* Cache Level ID Register */
            pub(crate) _ctr: u64,   /* Cache Type Register */
        }

        // Defined in sys/sysctl.h.
        // https://github.com/NetBSD/src/blob/49ff686c908df01d34af98d7a46d51aabe7008fa/sys/sys/sysctl.h
        pub(crate) const CTL_HW: c_int = 6;
        pub(crate) const HW_NCPU: c_int = 3;
    }

    #[inline]
    fn sysctl32(mib: &[ffi::c_int]) -> Option<u32> {
        const OUT_LEN: ffi::c_size_t = core::mem::size_of::<u32>() as ffi::c_size_t;
        let mut out = 0_u32;
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
                (&mut out as *mut u32).cast::<ffi::c_void>(),
                &mut out_len,
                ptr::null_mut(),
                0,
            )
        };
        if res == -1 {
            return None;
        }
        debug_assert_eq!(out_len, OUT_LEN);
        Some(out)
    }

    #[allow(clippy::used_underscore_binding)]
    #[inline]
    unsafe fn sysctl_cpu_id(buf: &mut ffi::aarch64_sysctl_cpu_id, name: &[u8]) -> Option<AA64Reg> {
        const OUT_LEN: ffi::c_size_t =
            core::mem::size_of::<ffi::aarch64_sysctl_cpu_id>() as ffi::c_size_t;

        debug_assert_eq!(name.last(), Some(&0), "{:?}", name);
        debug_assert_eq!(name.iter().filter(|&&v| v == 0).count(), 1, "{:?}", name);

        let mut out_len = OUT_LEN;
        // SAFETY:
        // - the caller must guarantee that `name` is ` machdep.cpuN.cpu_id` in a C string.
        // - `out_len` does not exceed the size of the value at `buf`.
        // - `sysctlbyname` is thread-safe.
        let res = unsafe {
            ffi::sysctlbyname(
                name.as_ptr().cast::<ffi::c_char>(),
                (buf as *mut ffi::aarch64_sysctl_cpu_id).cast::<ffi::c_void>(),
                &mut out_len,
                ptr::null_mut(),
                0,
            )
        };
        if res != 0 {
            return None;
        }
        Some(AA64Reg {
            aa64isar0: buf._aa64isar0,
            #[cfg(test)]
            aa64isar1: buf._aa64isar1,
            #[cfg(test)]
            aa64mmfr2: buf._aa64mmfr2,
        })
    }

    #[inline]
    pub(super) fn aa64reg() -> AA64Reg {
        // SAFETY: all fields of aarch64_sysctl_cpu_id are zero-able and we use
        // the result when machdep.cpuN.cpu_id sysctl was successful.
        let mut cpu_id_buf: ffi::aarch64_sysctl_cpu_id = unsafe { core::mem::zeroed() };
        // First, get system registers for cpu0.
        // If failed, returns default because machdep.cpuN.cpu_id sysctl is not available.
        // machdep.cpuN.cpu_id sysctl was added on NetBSD 9.0 so it is not available on older versions.
        // SAFETY: we passed a valid name in a C string.
        let cpu0 = match unsafe { sysctl_cpu_id(&mut cpu_id_buf, b"machdep.cpu0.cpu_id\0") } {
            Some(cpu0) => cpu0,
            None => return AA64Reg::default(),
        };
        // Second, get the number of cpus.
        // If failed, returns default because nothing can be assumed about the other cores.
        // Do not use available_parallelism/_SC_NPROCESSORS_ONLN/HW_NCPUONLINE because
        // offline cores may become online during execution.
        let cpus = match sysctl32(&[ffi::CTL_HW, ffi::HW_NCPU]) {
            Some(0) | None => return AA64Reg::default(), // failed
            Some(1) => return cpu0,                      // single-core
            Some(cpus) => cpus,
        };
        // Unfortunately, there is a bug in Samsung's SoC that supports
        // different CPU features in big and little cores.
        // https://web.archive.org/web/20210908112244/https://medium.com/@niaow/a-big-little-problem-a-tale-of-big-little-gone-wrong-e7778ce744bb
        // https://github.com/golang/go/issues/28431#issuecomment-433573689
        // https://en.wikichip.org/wiki/samsung/exynos/9810
        // So, make sure that all cores provide the same CPU features.
        // Note that we are only checking the consistency of the registers to
        // which we actually refer. (If we check all registers, fields such as
        // product variant are also checked, which breaks runtime detection on
        // most big.LITTLE SoCs.)
        // TODO: Is this processing really necessary on NetBSD?
        let mut name_buf = MachdepNameBuffer::new();
        for n in 1..cpus {
            // SAFETY: MachdepNameBuffer::name returns a valid name in a C string.
            let cpu = match unsafe { sysctl_cpu_id(&mut cpu_id_buf, name_buf.name(n)) } {
                Some(cpu) => cpu,
                None => return AA64Reg::default(),
            };
            if cpu != cpu0 {
                return AA64Reg::default();
            }
        }
        cpu0
    }

    pub(super) struct MachdepNameBuffer {
        buf: [u8; NAME_MAX_LEN],
    }

    const NAME_PREFIX: &[u8] = b"machdep.cpu";
    const NAME_SUFFIX: &[u8] = b".cpu_id\0";
    pub(super) const U32_MAX_LEN: usize = 10;
    const NAME_MAX_LEN: usize = NAME_PREFIX.len() + NAME_SUFFIX.len() + U32_MAX_LEN;

    impl MachdepNameBuffer {
        #[inline]
        pub(super) fn new() -> Self {
            let mut buf: [u8; NAME_MAX_LEN] = [0; NAME_MAX_LEN];
            buf[..NAME_PREFIX.len()].copy_from_slice(NAME_PREFIX);
            Self { buf }
        }

        #[allow(clippy::cast_possible_truncation, clippy::unreadable_literal)]
        #[inline]
        pub(super) fn name(&mut self, mut cpu: u32) -> &[u8] {
            let mut len = NAME_PREFIX.len();
            // integer -> string conversion which is optimized for small numbers.
            macro_rules! put {
                ($cur:tt $($tt:tt)*) => {
                    if cpu >= $cur {
                        put!($($tt)*);
                        let n = cpu / $cur;
                        self.buf[len] = (n as u8) + b'0';
                        len += 1;
                        cpu %= $cur;
                    }
                };
                () => {};
            }
            put!(
                10
                100
                1000
                10000
                100000
                1000000
                10000000
                100000000
                1000000000
            );
            self.buf[len] = (cpu as u8) + b'0';
            len += 1;
            self.buf[len..len + NAME_SUFFIX.len()].copy_from_slice(NAME_SUFFIX);
            len += NAME_SUFFIX.len();
            &self.buf[..len]
        }
    }
}
#[cfg(target_os = "openbsd")]
mod imp {
    // OpenBSD doesn't trap the mrs instruction, but exposes the system registers through sysctl.
    // https://github.com/openbsd/src/commit/d335af936b9d7dd9cf655cae1ce19560c45de6c8
    // https://github.com/golang/go/commit/cd54ef1f61945459486e9eea2f016d99ef1da925

    use core::ptr;

    use super::AA64Reg;

    // core::ffi::c_* (except c_void) requires Rust 1.64, libc will soon require Rust 1.47
    #[allow(non_camel_case_types)]
    pub(super) mod ffi {
        pub(crate) use super::super::c_types::{c_int, c_size_t, c_uint, c_void};

        // Defined in sys/sysctl.h.
        // https://github.com/openbsd/src/blob/72ccc03bd11da614f31f7ff76e3f6fce99bc1c79/sys/sys/sysctl.h#L82
        pub(crate) const CTL_MACHDEP: c_int = 7;
        // Defined in machine/cpu.h.
        // https://github.com/openbsd/src/blob/72ccc03bd11da614f31f7ff76e3f6fce99bc1c79/sys/arch/arm64/include/cpu.h#L25-L40
        pub(crate) const CPU_ID_AA64ISAR0: c_int = 2;
        #[cfg(test)]
        pub(crate) const CPU_ID_AA64ISAR1: c_int = 3;
        #[cfg(test)]
        pub(crate) const CPU_ID_AA64MMFR2: c_int = 7;

        extern "C" {
            // Defined in sys/sysctl.h.
            // https://man.openbsd.org/sysctl.2
            // https://github.com/openbsd/src/blob/72ccc03bd11da614f31f7ff76e3f6fce99bc1c79/sys/sys/sysctl.h
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
    }

    // ID_AA64ISAR0_EL1 and ID_AA64ISAR1_EL1 are supported on OpenBSD 7.1+.
    // https://github.com/openbsd/src/commit/d335af936b9d7dd9cf655cae1ce19560c45de6c8
    // Others are supported on OpenBSD 7.3+.
    // https://github.com/openbsd/src/commit/c7654cd65262d532212f65123ee3905ba200365c
    // sysctl returns an unsupported error if operation is not supported,
    // so we can safely use this function on older versions of OpenBSD.
    pub(super) fn aa64reg() -> AA64Reg {
        let aa64isar0 = sysctl64(&[ffi::CTL_MACHDEP, ffi::CPU_ID_AA64ISAR0]).unwrap_or(0);
        #[cfg(test)]
        let aa64isar1 = sysctl64(&[ffi::CTL_MACHDEP, ffi::CPU_ID_AA64ISAR1]).unwrap_or(0);
        #[cfg(test)]
        let aa64mmfr2 = sysctl64(&[ffi::CTL_MACHDEP, ffi::CPU_ID_AA64MMFR2]).unwrap_or(0);
        AA64Reg {
            aa64isar0,
            #[cfg(test)]
            aa64isar1,
            #[cfg(test)]
            aa64mmfr2,
        }
    }

    fn sysctl64(mib: &[ffi::c_int]) -> Option<u64> {
        const OUT_LEN: ffi::c_size_t = core::mem::size_of::<u64>() as ffi::c_size_t;
        let mut out = 0_u64;
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
                (&mut out as *mut u64).cast::<ffi::c_void>(),
                &mut out_len,
                ptr::null_mut(),
                0,
            )
        };
        if res == -1 {
            return None;
        }
        debug_assert_eq!(out_len, OUT_LEN);
        Some(out)
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
        let AA64Reg { aa64isar0, aa64isar1, aa64mmfr2 } = imp::aa64reg();
        std::eprintln!("aa64isar0={}", aa64isar0);
        std::eprintln!("aa64isar1={}", aa64isar1);
        std::eprintln!("aa64mmfr2={}", aa64mmfr2);
        if cfg!(target_os = "openbsd") {
            let output = Command::new("sysctl").arg("machdep").output().unwrap();
            assert!(output.status.success());
            let stdout = String::from_utf8(output.stdout).unwrap();
            // OpenBSD 7.1+
            assert_eq!(
                stdout.lines().find_map(|s| s.strip_prefix("machdep.id_aa64isar0=")).unwrap_or("0"),
                aa64isar0.to_string(),
            );
            assert_eq!(
                stdout.lines().find_map(|s| s.strip_prefix("machdep.id_aa64isar1=")).unwrap_or("0"),
                aa64isar1.to_string(),
            );
            // OpenBSD 7.3+
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
        if detect().test(CpuInfo::HAS_RCPC3) {
            assert_eq!(extract(aa64isar1, 23, 20), 3);
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
    #[cfg(target_os = "netbsd")]
    #[allow(
        clippy::cast_possible_wrap,
        clippy::cast_sign_loss,
        clippy::no_effect_underscore_binding,
        clippy::used_underscore_binding
    )]
    const _: fn() = || {
        use core::mem::size_of;
        use imp::ffi;
        use test_helper::{libc, sys};
        let mut _sysctl: unsafe extern "C" fn(
            *const ffi::c_int,
            ffi::c_uint,
            *mut ffi::c_void,
            *mut ffi::c_size_t,
            *const ffi::c_void,
            ffi::c_size_t,
        ) -> ffi::c_int = ffi::sysctl;
        _sysctl = libc::sysctl;
        _sysctl = sys::sysctl;
        let mut _sysctlbyname: unsafe extern "C" fn(
            *const ffi::c_char,
            *mut ffi::c_void,
            *mut ffi::c_size_t,
            *const ffi::c_void,
            ffi::c_size_t,
        ) -> ffi::c_int = ffi::sysctlbyname;
        _sysctlbyname = libc::sysctlbyname;
        _sysctlbyname = sys::sysctlbyname;
        static_assert!(ffi::CTL_HW == libc::CTL_HW);
        static_assert!(ffi::CTL_HW == sys::CTL_HW as ffi::c_int);
        static_assert!(ffi::HW_NCPU == libc::HW_NCPU);
        static_assert!(ffi::HW_NCPU == sys::HW_NCPU as ffi::c_int);
        // libc doesn't have this
        // static_assert!(
        //     size_of::<ffi::aarch64_sysctl_cpu_id>() == size_of::<libc::aarch64_sysctl_cpu_id>()
        // );
        static_assert!(
            size_of::<ffi::aarch64_sysctl_cpu_id>() == size_of::<sys::aarch64_sysctl_cpu_id>()
        );
        let ffi: ffi::aarch64_sysctl_cpu_id = unsafe { core::mem::zeroed() };
        let _ = sys::aarch64_sysctl_cpu_id {
            ac_midr: ffi._midr,
            ac_revidr: ffi._revidr,
            ac_mpidr: ffi._mpidr,
            ac_aa64dfr0: ffi._aa64dfr0,
            ac_aa64dfr1: ffi._aa64dfr1,
            ac_aa64isar0: ffi._aa64isar0,
            ac_aa64isar1: ffi._aa64isar1,
            ac_aa64mmfr0: ffi._aa64mmfr0,
            ac_aa64mmfr1: ffi._aa64mmfr1,
            ac_aa64mmfr2: ffi._aa64mmfr2,
            ac_aa64pfr0: ffi._aa64pfr0,
            ac_aa64pfr1: ffi._aa64pfr1,
            ac_aa64zfr0: ffi._aa64zfr0,
            ac_mvfr0: ffi._mvfr0,
            ac_mvfr1: ffi._mvfr1,
            ac_mvfr2: ffi._mvfr2,
            ac_pad: ffi._pad,
            ac_clidr: ffi._clidr,
            ac_ctr: ffi._ctr,
        };
    };
    #[cfg(target_os = "openbsd")]
    #[allow(
        clippy::cast_possible_wrap,
        clippy::cast_sign_loss,
        clippy::no_effect_underscore_binding
    )]
    const _: fn() = || {
        use imp::ffi;
        use test_helper::{libc, sys};
        let mut _sysctl: unsafe extern "C" fn(
            *const ffi::c_int,
            ffi::c_uint,
            *mut ffi::c_void,
            *mut ffi::c_size_t,
            *mut ffi::c_void,
            ffi::c_size_t,
        ) -> ffi::c_int = ffi::sysctl;
        _sysctl = libc::sysctl;
        _sysctl = sys::sysctl;
        static_assert!(ffi::CTL_MACHDEP == libc::CTL_MACHDEP);
        static_assert!(ffi::CTL_MACHDEP == sys::CTL_MACHDEP as ffi::c_int);
        // static_assert!(ffi::CPU_ID_AA64ISAR0 == libc::CPU_ID_AA64ISAR0); // libc doesn't have this
        static_assert!(ffi::CPU_ID_AA64ISAR0 == sys::CPU_ID_AA64ISAR0 as ffi::c_int);
        // static_assert!(ffi::CPU_ID_AA64ISAR1 == libc::CPU_ID_AA64ISAR1); // libc doesn't have this
        static_assert!(ffi::CPU_ID_AA64ISAR1 == sys::CPU_ID_AA64ISAR1 as ffi::c_int);
        // static_assert!(ffi::CPU_ID_AA64MMFR2 == libc::CPU_ID_AA64MMFR2); // libc doesn't have this
        static_assert!(ffi::CPU_ID_AA64MMFR2 == sys::CPU_ID_AA64MMFR2 as ffi::c_int);
    };

    #[cfg(target_os = "netbsd")]
    #[test]
    fn machdep_name_buffer() {
        use std::string::ToString;
        assert_eq!(u32::MAX.to_string().len(), imp::U32_MAX_LEN);
        assert_eq!(imp::MachdepNameBuffer::new().name(0), b"machdep.cpu0.cpu_id\0");
        assert_eq!(imp::MachdepNameBuffer::new().name(1), b"machdep.cpu1.cpu_id\0");
        assert_eq!(imp::MachdepNameBuffer::new().name(10), b"machdep.cpu10.cpu_id\0");
        assert_eq!(imp::MachdepNameBuffer::new().name(100), b"machdep.cpu100.cpu_id\0");
        assert_eq!(imp::MachdepNameBuffer::new().name(1023), b"machdep.cpu1023.cpu_id\0");
        assert_eq!(imp::MachdepNameBuffer::new().name(u32::MAX), b"machdep.cpu4294967295.cpu_id\0");
    }
    #[cfg(target_os = "netbsd")]
    ::quickcheck::quickcheck! {
        fn quickcheck_machdep_name_buffer(x: u32) -> bool {
            let expected = std::ffi::CString::new(std::format!("machdep.cpu{}.cpu_id", x)).unwrap();
            assert_eq!(imp::MachdepNameBuffer::new().name(x), expected.into_bytes_with_nul());
            true
        }
    }
}
