// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
Run-time CPU feature detection on AArch64 Linux/Android/FreeBSD/NetBSD/OpenBSD by parsing system registers.

As of Rust 1.97, is_aarch64_feature_detected doesn't support run-time detection on NetBSD.
https://github.com/rust-lang/rust/blob/1.97.0/library/std_detect/src/detect/mod.rs
Run-time detection on OpenBSD by is_aarch64_feature_detected is supported on Rust 1.70+.
https://github.com/rust-lang/stdarch/pull/1374 / https://github.com/rust-lang/stdarch/pull/1379

Refs:
- https://developer.arm.com/documentation/ddi0601/2025-06/AArch64-Registers
- https://github.com/torvalds/linux/blob/v6.19/Documentation/arch/arm64/cpu-feature-registers.rst
- https://github.com/rust-lang/stdarch/blob/a0c30f3e3c75adcd6ee7efc94014ebcead61c507/crates/std_detect/src/detect/os/aarch64.rs

Supported platforms:
- Linux 4.11+ (emulate mrs instruction)
  https://github.com/torvalds/linux/commit/77c97b4ee21290f5f083173d957843b615abbff2
- FreeBSD 12.0+ (emulate mrs instruction)
  https://github.com/freebsd/freebsd-src/commit/398810619cb32abf349f8de23f29510b2ee0839b
- NetBSD 9.0+ (through sysctl/sysctlbyname)
  https://github.com/NetBSD/src/commit/0e9d25528729f7fea53e78275d1bc5039dfe8ffb
  sysctl/sysctlbyname returns an unsupported error if operation is not supported,
  so we can safely use this on older versions.
- OpenBSD 7.1+ (through sysctl)
  https://github.com/openbsd/src/commit/d335af936b9d7dd9cf655cae1ce19560c45de6c8
  sysctl returns an unsupported error if operation is not supported,
  so we can safely use this on older versions.

For now, this module is only used on NetBSD/OpenBSD.

On Linux/Android/FreeBSD, we use auxv.rs and this module is test-only because:
- On Linux/Android, this approach requires a higher kernel version than Rust supports,
  and also does not work with qemu-user (as of QEMU 7.2) and Valgrind (as of Valgrind 3.24).
  (Looking into HWCAP_CPUID in auxvec, it appears that Valgrind is setting it
  to false correctly, but qemu-user is setting it to true.)
  - qemu-user issue has been fixed in fixed in 8.0/7.2.11.
    https://github.com/qemu/qemu/commit/bc6bd20ee3538347afb750c4bd06edca4a922897
    https://github.com/qemu/qemu/commit/4002b76c1cf14101ac5cbdcce936330234a9de8f
- On FreeBSD, this approach causes SIGILL on FreeBSD 12.{2,3,4} on QEMU (works on FreeBSD 13 and 14).
*/

include!("common.rs");

#[cfg_attr(target_os = "netbsd", derive(Default))]
#[cfg_attr(test, derive(Debug, PartialEq))]
struct AA64Reg {
    aa64isar0: u64,
    aa64isar1: u64,
    #[cfg(test)]
    aa64isar3: u64,
    aa64mmfr2: u64,
}

#[cold]
#[must_use]
fn _detect(mut info: CpuInfo) -> CpuInfo {
    let AA64Reg {
        aa64isar0,
        aa64isar1,
        #[cfg(test)]
        aa64isar3,
        aa64mmfr2,
    } = imp::aa64reg();

    // ID_AA64ISAR0_EL1, AArch64 Instruction Set Attribute Register 0
    // https://developer.arm.com/documentation/ddi0601/2025-06/AArch64-Registers/ID-AA64ISAR0-EL1--AArch64-Instruction-Set-Attribute-Register-0
    // Atomic, bits [23:20]
    // > FEAT_LSE implements the functionality identified by the value 0b0010.
    // > FEAT_LSE128 implements the functionality identified by the value 0b0011.
    // > From Armv8.1, the value 0b0000 is not permitted.
    let atomic = extract(aa64isar0, 23, 20);
    if atomic >= 0b0010 {
        info.set(CpuInfoFlag::lse);
        if atomic >= 0b0011 {
            info.set(CpuInfoFlag::lse128);
        }
    }
    // ID_AA64ISAR1_EL1, AArch64 Instruction Set Attribute Register 1
    // https://developer.arm.com/documentation/ddi0601/2025-06/AArch64-Registers/ID-AA64ISAR1-EL1--AArch64-Instruction-Set-Attribute-Register-1
    // LRCPC, bits [23:20]
    // > FEAT_LRCPC implements the functionality identified by the value 0b0001.
    // > FEAT_LRCPC2 implements the functionality identified by the value 0b0010.
    // > FEAT_LRCPC3 implements the functionality identified by the value 0b0011.
    // > From Armv8.3, the value 0b0000 is not permitted.
    // > From Armv8.4, the value 0b0001 is not permitted.
    let lrcpc = extract(aa64isar1, 23, 20);
    if lrcpc >= 0b0011 {
        info.set(CpuInfoFlag::rcpc3);
    }
    #[cfg(test)]
    if lrcpc >= 0b0001 {
        info.set(CpuInfoFlag::rcpc);
        if lrcpc >= 0b0010 {
            info.set(CpuInfoFlag::rcpc2);
        }
    }
    // LS64, bits [63:60]
    // > FEAT_LS64 implements the functionality identified by 0b0001.
    // > FEAT_LS64_V implements the functionality identified by 0b0010.
    // > FEAT_LS64_ACCDATA implements the functionality identified by 0b0011.
    // > FEAT_LS64WB implements the functionality identified by 0b0100.
    #[cfg(test)]
    if extract(aa64isar1, 63, 60) >= 0b0100 {
        info.set(CpuInfoFlag::ls64wb);
    }
    // ID_AA64ISAR3_EL1, AArch64 Instruction Set Attribute Register 3
    // https://developer.arm.com/documentation/ddi0601/2025-06/AArch64-Registers/ID-AA64ISAR3-EL1--AArch64-Instruction-Set-Attribute-Register-3
    // LSFE, bits [19:16]
    // > FEAT_LSFE implements the functionality identified by the value 0b0001
    #[cfg(test)]
    if extract(aa64isar3, 19, 16) >= 0b0001 {
        info.set(CpuInfoFlag::lsfe);
    }
    // ID_AA64MMFR2_EL1, AArch64 Memory Model Feature Register 2
    // https://developer.arm.com/documentation/ddi0601/2025-06/AArch64-Registers/ID-AA64MMFR2-EL1--AArch64-Memory-Model-Feature-Register-2
    // AT, bits [35:32]
    // > FEAT_LSE2 implements the functionality identified by the value 0b0001.
    // > From Armv8.4, the value 0b0000 is not permitted.
    if extract(aa64mmfr2, 35, 32) >= 0b0001 {
        info.set(CpuInfoFlag::lse2);
    }
    info
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
                "mrs {}, ID_AA64ISAR0_EL1",
                out(reg) aa64isar0,
                options(pure, nomem, nostack, preserves_flags),
            );
            let aa64isar1: u64;
            asm!(
                "mrs {}, ID_AA64ISAR1_EL1",
                out(reg) aa64isar1,
                options(pure, nomem, nostack, preserves_flags),
            );
            #[cfg(test)]
            #[cfg(not(portable_atomic_pre_llvm_18))]
            let aa64isar3: u64;
            // ID_AA64ISAR3_EL1 is only recognized on LLVM 18+.
            // https://github.com/llvm/llvm-project/commit/17baba9fa2728b1b1134f9dccb9318debd5a9a1b
            #[cfg(test)]
            #[cfg(not(portable_atomic_pre_llvm_18))]
            asm!(
                "mrs {}, ID_AA64ISAR3_EL1",
                out(reg) aa64isar3,
                options(pure, nomem, nostack, preserves_flags),
            );
            let aa64mmfr2: u64;
            asm!(
                "mrs {}, ID_AA64MMFR2_EL1",
                out(reg) aa64mmfr2,
                options(pure, nomem, nostack, preserves_flags),
            );
            AA64Reg {
                aa64isar0,
                aa64isar1,
                #[cfg(test)]
                #[cfg(not(portable_atomic_pre_llvm_18))]
                aa64isar3,
                #[cfg(test)]
                #[cfg(portable_atomic_pre_llvm_18)]
                aa64isar3: 0,
                aa64mmfr2,
            }
        }
    }
}
#[cfg(target_os = "netbsd")]
mod imp {
    // NetBSD doesn't trap the mrs instruction, but exposes the system registers through sysctl.
    // https://github.com/NetBSD/src/commit/0e9d25528729f7fea53e78275d1bc5039dfe8ffb
    // https://github.com/golang/sys/commit/ef9fd89ba245e184bdd308f7f2b4f3c551fa5b0f

    use core::{mem, ptr};

    use super::AA64Reg;

    // libc requires Rust 1.63
    #[allow(non_camel_case_types)]
    pub(super) mod ffi {
        pub(crate) use crate::utils::ffi::{CStr, c_char, c_int, c_size_t, c_uint, c_void};

        sys_struct!({
            // Defined in machine/armreg.h.
            // https://github.com/NetBSD/src/blob/121914f187d0f46c2ce43f00531d2c500d8e81e5/sys/arch/aarch64/include/armreg.h#L1863
            pub(crate) struct aarch64_sysctl_cpu_id {
                // NetBSD 9.0+
                // https://github.com/NetBSD/src/commit/0e9d25528729f7fea53e78275d1bc5039dfe8ffb
                pub(crate) ac_midr: u64,
                pub(crate) ac_revidr: u64,
                pub(crate) ac_mpidr: u64,
                pub(crate) ac_aa64dfr0: u64,
                pub(crate) ac_aa64dfr1: u64,
                pub(crate) ac_aa64isar0: u64,
                pub(crate) ac_aa64isar1: u64,
                pub(crate) ac_aa64mmfr0: u64,
                pub(crate) ac_aa64mmfr1: u64,
                pub(crate) ac_aa64mmfr2: u64,
                pub(crate) ac_aa64pfr0: u64,
                pub(crate) ac_aa64pfr1: u64,
                pub(crate) ac_aa64zfr0: u64,
                pub(crate) ac_mvfr0: u32,
                pub(crate) ac_mvfr1: u32,
                pub(crate) ac_mvfr2: u32,
                // NetBSD 10.0+
                // https://github.com/NetBSD/src/commit/0c7bdc13f0e332cccec56e307f023b4888638973
                pub(crate) ac_pad: u32,
                pub(crate) ac_clidr: u64,
                pub(crate) ac_ctr: u64,
            }
        });

        sys_const!({
            // Defined in sys/sysctl.h.
            // https://github.com/NetBSD/src/blob/121914f187d0f46c2ce43f00531d2c500d8e81e5/sys/sys/sysctl.h
            pub(crate) const CTL_HW: c_int = 6;
        });
        // TODO: use sys_const!
        pub(crate) const HW_NCPU: c_int = 3;

        sys_fn!({
            extern "C" {
                // Defined in sys/sysctl.h.
                // https://man.netbsd.org/sysctl.3
                // https://github.com/NetBSD/src/blob/121914f187d0f46c2ce43f00531d2c500d8e81e5/sys/sys/sysctl.h
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
        });
    }

    #[inline]
    fn sysctl32(mib: &[ffi::c_int]) -> Option<u32> {
        const OUT_LEN: ffi::c_size_t = core::mem::size_of::<u32>() as ffi::c_size_t;
        #[allow(clippy::cast_possible_truncation)]
        let mib_len = mib.len() as ffi::c_uint;
        let mut out = 0_u32;
        let mut out_len = OUT_LEN;
        // SAFETY:
        // - `mib_len` does not exceed the size of `mib`.
        // - `out_len` does not exceed the size of `out`.
        // - `sysctl` is thread-safe.
        let res = unsafe {
            ffi::sysctl(
                mib.as_ptr(),
                mib_len,
                (&mut out as *mut u32).cast::<ffi::c_void>(),
                &mut out_len,
                ptr::null_mut(),
                0,
            )
        };
        // NetBSD sysctl returns 0 on success, -1 on failure.
        if res != 0 {
            return None;
        }
        debug_assert_eq!(out_len, OUT_LEN);
        Some(out)
    }

    pub(super) fn sysctl_cpu_id(
        name: &ffi::CStr,
        buf: &mut ffi::aarch64_sysctl_cpu_id,
    ) -> Option<AA64Reg> {
        const OUT_LEN: ffi::c_size_t =
            mem::size_of::<ffi::aarch64_sysctl_cpu_id>() as ffi::c_size_t;

        let mut out_len = OUT_LEN;
        // SAFETY:
        // - `name` a valid C string.
        // - `out_len` does not exceed the size of the value at `buf`.
        // - `sysctlbyname` is thread-safe.
        let res = unsafe {
            ffi::sysctlbyname(
                name.as_ptr(),
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
            aa64isar0: buf.ac_aa64isar0,
            aa64isar1: buf.ac_aa64isar1,
            #[cfg(test)]
            aa64isar3: 0,
            aa64mmfr2: buf.ac_aa64mmfr2,
        })
    }

    pub(super) fn aa64reg() -> AA64Reg {
        // SAFETY: all fields of aarch64_sysctl_cpu_id are zero-able and we use
        // the result when machdep.cpuN.cpu_id sysctl was successful.
        let mut cpu_id_buf: ffi::aarch64_sysctl_cpu_id = unsafe { mem::zeroed() };
        // First, get system registers for cpu0.
        // If failed, returns default because machdep.cpuN.cpu_id sysctl is not available.
        // machdep.cpuN.cpu_id sysctl was added on NetBSD 9.0 so it is not available on older versions.
        let mut cpu_id = match sysctl_cpu_id(c!("machdep.cpu0.cpu_id"), &mut cpu_id_buf) {
            Some(cpu_id) => cpu_id,
            None => return AA64Reg::default(),
        };
        // Second, get the number of cpus.
        // If failed, returns default because nothing can be assumed about the other cores.
        // Do not use available_parallelism/_SC_NPROCESSORS_ONLN/HW_NCPUONLINE because
        // offline cores may become online during execution.
        let cpus = match sysctl32(&[ffi::CTL_HW, ffi::HW_NCPU]) {
            Some(0) | None => return AA64Reg::default(), // failed
            Some(1) => return cpu_id,                    // single-core
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
        // https://github.com/NetBSD/src/commit/bd9707e06ea7d21b5c24df6dfc14cb37c2819416
        // https://github.com/golang/sys/commit/ef9fd89ba245e184bdd308f7f2b4f3c551fa5b0f
        // https://github.com/aws/aws-lc/commit/1aa0cef79cf26cfc8a0d25be275f353543ff306c
        let mut name_buf = MachdepNameBuffer::new();
        for n in 1..cpus {
            match sysctl_cpu_id(name_buf.name(n), &mut cpu_id_buf) {
                Some(AA64Reg {
                    aa64isar0,
                    aa64isar1,
                    #[cfg(test)]
                    aa64isar3,
                    aa64mmfr2,
                }) => {
                    cpu_id.aa64isar0 &= aa64isar0;
                    cpu_id.aa64isar1 &= aa64isar1;
                    #[cfg(test)]
                    {
                        cpu_id.aa64isar3 &= aa64isar3;
                    }
                    cpu_id.aa64mmfr2 &= aa64mmfr2;
                }
                None => return AA64Reg::default(),
            }
        }
        cpu_id
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
        pub(super) fn name(&mut self, mut cpu: u32) -> &ffi::CStr {
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
            // SAFETY: we've wrote a valid name in a C string.
            unsafe { ffi::CStr::from_bytes_with_nul_unchecked(&self.buf[..len]) }
        }
    }
}
#[cfg(target_os = "openbsd")]
mod imp {
    // OpenBSD doesn't trap the mrs instruction, but exposes the system registers through sysctl.
    // https://github.com/openbsd/src/commit/d335af936b9d7dd9cf655cae1ce19560c45de6c8
    // https://github.com/golang/go/commit/cd54ef1f61945459486e9eea2f016d99ef1da925

    use core::{mem, ptr};

    use super::AA64Reg;

    // libc requires Rust 1.63
    pub(super) mod ffi {
        pub(crate) use crate::utils::ffi::{c_int, c_size_t, c_uint, c_void};

        sys_const!({
            // Defined in sys/sysctl.h.
            // https://github.com/openbsd/src/blob/d2e81eb18e50973c87ae2c9c2ba348ff3ff89cf9/sys/sys/sysctl.h
            pub(crate) const CTL_MACHDEP: c_int = 7;

            // Defined in machine/cpu.h.
            // https://github.com/openbsd/src/blob/d2e81eb18e50973c87ae2c9c2ba348ff3ff89cf9/sys/arch/arm64/include/cpu.h
            // OpenBSD 7.1+
            // https://github.com/openbsd/src/commit/d335af936b9d7dd9cf655cae1ce19560c45de6c8
            pub(crate) const CPU_ID_AA64ISAR0: c_int = 2;
            pub(crate) const CPU_ID_AA64ISAR1: c_int = 3;
            // OpenBSD 7.3+
            // https://github.com/openbsd/src/commit/c7654cd65262d532212f65123ee3905ba200365c
            // However, on OpenBSD 7.3-7.5, querying CPU_ID_AA64MMFR2 always returns 0.
            // https://github.com/openbsd/src/commit/e8331b74e5c20302d4bd948c9db722af688ccfc1
            pub(crate) const CPU_ID_AA64MMFR2: c_int = 7;
        });

        sys_fn!({
            extern "C" {
                // Defined in sys/sysctl.h.
                // https://man.openbsd.org/sysctl.2
                // https://github.com/openbsd/src/blob/d2e81eb18e50973c87ae2c9c2ba348ff3ff89cf9/sys/sys/sysctl.h
                pub(crate) fn sysctl(
                    name: *const c_int,
                    name_len: c_uint,
                    old_p: *mut c_void,
                    old_len_p: *mut c_size_t,
                    new_p: *mut c_void,
                    new_len: c_size_t,
                ) -> c_int;
            }
        });
    }

    // sysctl returns an unsupported error if operation is not supported,
    // so we can safely use this function on older versions of OpenBSD.
    pub(super) fn aa64reg() -> AA64Reg {
        let aa64isar0 = sysctl64(&[ffi::CTL_MACHDEP, ffi::CPU_ID_AA64ISAR0]).unwrap_or(0);
        let aa64isar1 = sysctl64(&[ffi::CTL_MACHDEP, ffi::CPU_ID_AA64ISAR1]).unwrap_or(0);
        let aa64mmfr2 = sysctl64(&[ffi::CTL_MACHDEP, ffi::CPU_ID_AA64MMFR2]).unwrap_or(0);
        AA64Reg {
            aa64isar0,
            aa64isar1,
            #[cfg(test)]
            aa64isar3: 0,
            aa64mmfr2,
        }
    }

    fn sysctl64(mib: &[ffi::c_int]) -> Option<u64> {
        const OUT_LEN: ffi::c_size_t = mem::size_of::<u64>() as ffi::c_size_t;
        let mut out = 0_u64;
        let mut out_len = OUT_LEN;
        #[allow(clippy::cast_possible_truncation)]
        let mib_len = mib.len() as ffi::c_uint;
        // SAFETY:
        // - `mib_len` does not exceed the size of `mib`.
        // - `out_len` does not exceed the size of `out`.
        // - `sysctl` is thread-safe.
        let res = unsafe {
            ffi::sysctl(
                mib.as_ptr(),
                mib_len,
                (&mut out as *mut u64).cast::<ffi::c_void>(),
                &mut out_len,
                ptr::null_mut(),
                0,
            )
        };
        // OpenBSD sysctl returns -1 on failure.
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
    use super::*;

    #[test]
    #[cfg_attr(portable_atomic_test_detect_false, ignore = "detection disabled")]
    fn test_aa64reg() {
        let AA64Reg { aa64isar0, aa64isar1, aa64isar3, aa64mmfr2 } = imp::aa64reg();
        test_helper::eprintln_nocapture!(
            "aa64isar0={},aa64isar1={},aa64isar3={},aa64mmfr2={}",
            aa64isar0,
            aa64isar1,
            aa64isar3,
            aa64mmfr2,
        );
        let atomic = extract(aa64isar0, 23, 20);
        if detect().lse() {
            if detect().lse128() {
                assert_eq!(atomic, 0b0011);
            } else {
                assert_eq!(atomic, 0b0010);
            }
        } else {
            assert_eq!(atomic, 0b0000);
        }
        let lrcpc = extract(aa64isar1, 23, 20);
        if detect().rcpc() {
            if detect().rcpc2() {
                if detect().rcpc3() {
                    assert_eq!(lrcpc, 0b0011);
                } else {
                    assert_eq!(lrcpc, 0b0010);
                }
            } else {
                assert_eq!(lrcpc, 0b0001);
            }
        } else {
            assert_eq!(lrcpc, 0b0000);
        }
        let ls64 = extract(aa64isar1, 63, 60);
        if detect().ls64wb() {
            assert_eq!(ls64, 0b0100);
        } else {
            assert!(ls64 < 0b0100, "{}", ls64);
        }
        let lsfe = extract(aa64isar3, 19, 16);
        if detect().lsfe() {
            assert_eq!(lsfe, 0b0001);
        } else {
            assert_eq!(lsfe, 0b0000);
        }
        let at = extract(aa64mmfr2, 35, 32);
        if detect().lse2() {
            assert_eq!(at, 0b0001);
        } else {
            assert_eq!(at, 0b0000);
        }
    }

    #[allow(clippy::cast_possible_wrap)]
    #[cfg(target_os = "netbsd")]
    #[test]
    fn test_alternative() {
        use std::{mem, ptr};

        use test_helper::sys;

        use super::imp::ffi;
        use crate::utils::ffi::*;

        // This is almost equivalent to what sysctlbyname does.
        //
        // Unlike sysctlbyname, this doesn't use mutex/heap.
        //
        // This is currently used only for testing.
        fn sysctl_cpu_id() -> Option<AA64Reg> {
            // https://github.com/golang/sys/blob/v0.47.0/cpu/cpu_netbsd_arm64.go
            // https://github.com/NetBSD/src/blob/121914f187d0f46c2ce43f00531d2c500d8e81e5/lib/libc/gen/sysctlbyname.c
            // https://github.com/NetBSD/src/blob/121914f187d0f46c2ce43f00531d2c500d8e81e5/lib/libc/gen/sysctlgetmibinfo.c
            fn sysctl_nodes(
                mib: &[i32; MIB_LEN],
                mib_len: c_uint,
                nodes: &mut [sys::sysctlnode; NODES_MAX],
            ) -> Option<usize> {
                let mut q_node = sys::sysctlnode {
                    sysctl_flags: sys::SYSCTL_VERS_1,
                    // SAFETY: sysctlnode can be safely zeroed.
                    ..unsafe { mem::zeroed() }
                };
                let qp = (&mut q_node as *mut sys::sysctlnode).cast::<ffi::c_void>();
                let node_size = mem::size_of::<sys::sysctlnode>();
                let nodes_size = mem::size_of_val(nodes);
                let mut out_size = nodes_size;
                let nodes_ptr = nodes.as_mut_ptr().cast::<ffi::c_void>();
                // SAFETY:
                // - `mib_len` does not exceed the size of `mib`.
                // - `out_size` does not exceed the size of `nodes_ptr`.
                // - `node_size` does not exceed the size of `qp`.
                // - `sysctl` is thread-safe.
                let res = unsafe {
                    sys::sysctl(mib.as_ptr(), mib_len, nodes_ptr, &mut out_size, qp, node_size)
                };
                // NetBSD sysctl returns 0 on success, -1 on failure.
                #[allow(clippy::cast_possible_wrap, clippy::cast_sign_loss)]
                // SAFETY: errno is thread-local
                if res != 0 && unsafe { *sys::__errno() as u32 != sys::ENOMEM } {
                    return None;
                }
                Some(out_size.min(nodes_size) / node_size)
            }
            fn name_to_mib(parts: &[&[u8]; MIB_LEN - 1], mib: &mut [i32; MIB_LEN]) -> Option<()> {
                // SAFETY: sysctlnode can be safely zeroed.
                let mut nodes: [sys::sysctlnode; NODES_MAX] = unsafe { mem::zeroed() };
                let mut mib_len = 1;
                'outer: for &part in parts {
                    let nodes_len =
                        sysctl_nodes(mib, mib_len + 1 /* include CTL_QUERY */, &mut nodes)?;
                    for node in &nodes[..nodes_len] {
                        if node.sysctl_name.get(part.len()) == Some(&0)
                            && node.sysctl_name[..part.len()] == *part
                        {
                            mib[mib_len as usize] = node.sysctl_num;
                            mib_len += 1;
                            continue 'outer;
                        }
                    }
                    return None;
                }
                Some(())
            }

            const OUT_LEN: ffi::c_size_t =
                mem::size_of::<ffi::aarch64_sysctl_cpu_id>() as ffi::c_size_t;
            const MIB_LEN: ffi::c_size_t = 3;
            const NODES_MAX: ffi::c_size_t = 32;

            let mut mib: [ffi::c_int; MIB_LEN] = [
                sys::CTL_MACHDEP as ffi::c_int,
                sys::CTL_QUERY as ffi::c_int,
                sys::CTL_QUERY as ffi::c_int,
            ];
            let parts = [&b"cpu0"[..], b"cpu_id"];
            name_to_mib(&parts, &mut mib)?;

            #[allow(clippy::cast_possible_truncation)]
            let mib_len = MIB_LEN as ffi::c_uint;
            let mut buf: ffi::aarch64_sysctl_cpu_id = unsafe { mem::zeroed() };
            let mut out_len = OUT_LEN;
            // SAFETY:
            // - `mib_len` does not exceed the size of `mib`.
            // - `out_len` does not exceed the size of `buf`.
            // - `sysctl` is thread-safe.
            let res = unsafe {
                sys::sysctl(
                    mib.as_ptr(),
                    mib_len,
                    (&mut buf as *mut ffi::aarch64_sysctl_cpu_id).cast::<ffi::c_void>(),
                    &mut out_len,
                    ptr::null_mut(),
                    0,
                )
            };
            // NetBSD sysctl returns 0 on success, -1 on failure.
            if res != 0 {
                return None;
            }
            Some(AA64Reg {
                aa64isar0: buf.ac_aa64isar0,
                aa64isar1: buf.ac_aa64isar1,
                aa64isar3: 0,
                aa64mmfr2: buf.ac_aa64mmfr2,
            })
        }

        let mut cpu_id_buf: ffi::aarch64_sysctl_cpu_id = unsafe { mem::zeroed() };
        assert_eq!(
            imp::sysctl_cpu_id(c!("machdep.cpu0.cpu_id"), &mut cpu_id_buf).unwrap(),
            sysctl_cpu_id().unwrap()
        );
    }
    #[cfg(target_os = "openbsd")]
    #[test]
    fn test_alternative() {
        use std::{format, process::Command, string::String};

        // Call sysctl command instead of libc API.
        //
        // This is used only for testing.
        struct SysctlMachdepOutput(String);
        impl SysctlMachdepOutput {
            fn new() -> Self {
                let output = Command::new("sysctl").arg("machdep").output().unwrap();
                assert!(output.status.success());
                let stdout = String::from_utf8(output.stdout).unwrap();
                Self(stdout)
            }
            fn field(&self, name: &str) -> Option<u64> {
                Some(
                    self.0
                        .lines()
                        .find_map(|s| s.strip_prefix(&format!("{}=", name)))?
                        .parse()
                        .unwrap(),
                )
            }
        }

        let AA64Reg { aa64isar0, aa64isar1, aa64isar3, aa64mmfr2 } = imp::aa64reg();
        let sysctl_output = SysctlMachdepOutput::new();
        assert_eq!(aa64isar0, sysctl_output.field("machdep.id_aa64isar0").unwrap_or(0));
        assert_eq!(aa64isar1, sysctl_output.field("machdep.id_aa64isar1").unwrap_or(0));
        assert_eq!(aa64isar3, sysctl_output.field("machdep.id_aa64isar3").unwrap_or(0));
        assert_eq!(aa64mmfr2, sysctl_output.field("machdep.id_aa64mmfr2").unwrap_or(0));
    }

    #[cfg(target_os = "netbsd")]
    #[test]
    fn machdep_name_buffer() {
        use std::string::ToString as _;
        assert_eq!(u32::MAX.to_string().len(), imp::U32_MAX_LEN);
        assert_eq!(imp::MachdepNameBuffer::new().name(0).to_bytes_with_nul(), b"machdep.cpu0.cpu_id\0");
        assert_eq!(imp::MachdepNameBuffer::new().name(1).to_bytes_with_nul(), b"machdep.cpu1.cpu_id\0");
        assert_eq!(imp::MachdepNameBuffer::new().name(10).to_bytes_with_nul(), b"machdep.cpu10.cpu_id\0");
        assert_eq!(imp::MachdepNameBuffer::new().name(100).to_bytes_with_nul(), b"machdep.cpu100.cpu_id\0");
        assert_eq!(imp::MachdepNameBuffer::new().name(1023).to_bytes_with_nul(), b"machdep.cpu1023.cpu_id\0");
        assert_eq!(imp::MachdepNameBuffer::new().name(u32::MAX).to_bytes_with_nul(), b"machdep.cpu4294967295.cpu_id\0");
    }
    #[cfg(target_os = "netbsd")]
    ::quickcheck::quickcheck! {
        fn quickcheck_machdep_name_buffer(x: u32) -> bool {
            let expected = std::ffi::CString::new(std::format!("machdep.cpu{}.cpu_id", x)).unwrap();
            assert_eq!(imp::MachdepNameBuffer::new().name(x).to_bytes_with_nul(), expected.into_bytes_with_nul());
            true
        }
    }
}
