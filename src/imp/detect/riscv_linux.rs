// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
Run-time CPU feature detection on RISC-V Linux/Android by using riscv_hwprobe.

On RISC-V, detection using auxv only supports single-letter extensions.
So, we use riscv_hwprobe that supports multi-letter extensions.

Refs: https://github.com/torvalds/linux/blob/v6.11/Documentation/arch/riscv/hwprobe.rst
*/

include!("common.rs");

use core::ptr;

// core::ffi::c_* (except c_void) requires Rust 1.64, libc will soon require Rust 1.47
#[allow(non_camel_case_types, non_upper_case_globals)]
mod ffi {
    pub(crate) use super::c_types::{c_long, c_size_t, c_uint, c_ulong};

    // https://github.com/torvalds/linux/blob/v6.11/arch/riscv/include/uapi/asm/hwprobe.h
    #[derive(Copy, Clone)]
    #[cfg_attr(test, derive(Debug, PartialEq))]
    #[repr(C)]
    pub(crate) struct riscv_hwprobe {
        pub(crate) key: i64,
        pub(crate) value: u64,
    }

    pub(crate) const __NR_riscv_hwprobe: c_long = 258;

    // https://github.com/torvalds/linux/blob/v6.11/arch/riscv/include/uapi/asm/hwprobe.h
    pub(crate) const RISCV_HWPROBE_KEY_IMA_EXT_0: i64 = 4;
    // Linux 6.8+
    // https://github.com/torvalds/linux/commit/154a3706122978eeb34d8223d49285ed4f3c61fa
    pub(crate) const RISCV_HWPROBE_EXT_ZACAS: u64 = 1 << 34;

    #[cfg(not(all(
        target_os = "linux",
        any(target_arch = "riscv32", all(target_arch = "riscv64", target_pointer_width = "64")),
    )))]
    extern "C" {
        // https://man7.org/linux/man-pages/man2/syscall.2.html
        pub(crate) fn syscall(number: c_long, ...) -> c_long;
    }
    // Use asm-based syscall for compatibility with non-libc targets if possible.
    #[cfg(all(
        target_os = "linux", // https://github.com/bytecodealliance/rustix/issues/1095
        any(target_arch = "riscv32", all(target_arch = "riscv64", target_pointer_width = "64")),
    ))]
    #[inline]
    pub(crate) unsafe fn syscall(
        number: c_long,
        a0: *mut riscv_hwprobe,
        a1: c_size_t,
        a2: c_size_t,
        a3: *mut c_ulong,
        a4: c_uint,
    ) -> c_long {
        // arguments must be extended to 64-bit if RV64
        let a4 = a4 as usize;
        let r;
        // SAFETY: the caller must uphold the safety contract.
        // Refs:
        // - https://github.com/bminor/musl/blob/v1.2.5/arch/riscv32/syscall_arch.h
        // - https://github.com/bminor/musl/blob/v1.2.5/arch/riscv64/syscall_arch.h
        unsafe {
            core::arch::asm!(
                "ecall",
                in("a7") number,
                inout("a0") a0 => r,
                in("a1") a1,
                in("a2") a2,
                in("a3") a3,
                in("a4") a4,
                options(nostack, preserves_flags)
            );
        }
        r
    }

    // https://github.com/torvalds/linux/blob/v6.11/Documentation/arch/riscv/hwprobe.rst
    pub(crate) unsafe fn __riscv_hwprobe(
        pairs: *mut riscv_hwprobe,
        pair_count: c_size_t,
        cpu_set_size: c_size_t,
        cpus: *mut c_ulong,
        flags: c_uint,
    ) -> c_long {
        // SAFETY: the caller must uphold the safety contract.
        unsafe { syscall(__NR_riscv_hwprobe, pairs, pair_count, cpu_set_size, cpus, flags) }
    }
}

// syscall returns an unsupported error if riscv_hwprobe is not supported,
// so we can safely use this function on older versions of Linux.
fn riscv_hwprobe(out: &mut ffi::riscv_hwprobe) -> bool {
    // SAFETY: We've passed the valid pointer and length,
    // passing null ptr for cpus is safe because cpu_set_size is zero.
    unsafe { ffi::__riscv_hwprobe(out, 1, 0, ptr::null_mut(), 0) == 0 }
}

#[cold]
fn _detect(info: &mut CpuInfo) {
    let mut out = ffi::riscv_hwprobe { key: ffi::RISCV_HWPROBE_KEY_IMA_EXT_0, value: 0 };
    if riscv_hwprobe(&mut out) && out.key != -1 {
        let value = out.value;
        if value & ffi::RISCV_HWPROBE_EXT_ZACAS != 0 {
            info.set(CpuInfo::HAS_ZACAS);
        }
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

    // We use asm-based syscall for compatibility with non-libc targets.
    // This test tests that our ones and libc::syscall returns the same result.
    #[test]
    fn test_linux_like() {
        use test_helper::libc;
        unsafe fn __libc_riscv_hwprobe(
            pairs: *mut ffi::riscv_hwprobe,
            pair_count: ffi::c_size_t,
            cpu_set_size: ffi::c_size_t,
            cpus: *mut ffi::c_ulong,
            flags: ffi::c_uint,
        ) -> ffi::c_long {
            // SAFETY: the caller must uphold the safety contract.
            unsafe {
                libc::syscall(ffi::__NR_riscv_hwprobe, pairs, pair_count, cpu_set_size, cpus, flags)
            }
        }
        fn libc_riscv_hwprobe(out: &mut ffi::riscv_hwprobe) -> bool {
            unsafe { __libc_riscv_hwprobe(out, 1, 0, ptr::null_mut(), 0) == 0 }
        }
        let mut out = ffi::riscv_hwprobe { key: ffi::RISCV_HWPROBE_KEY_IMA_EXT_0, value: 0 };
        let mut libc_out = ffi::riscv_hwprobe { key: ffi::RISCV_HWPROBE_KEY_IMA_EXT_0, value: 0 };
        assert_eq!(riscv_hwprobe(&mut out), libc_riscv_hwprobe(&mut libc_out));
        assert_eq!(out, libc_out);
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
    #[allow(
        clippy::cast_possible_wrap,
        clippy::cast_sign_loss,
        clippy::no_effect_underscore_binding
    )]
    const _: fn() = || {
        use std::mem;
        use test_helper::sys;
        // TODO: syscall
        // static_assert!(ffi::__NR_riscv_hwprobe == libc::__NR_riscv_hwprobe); // libc doesn't have this
        static_assert!(ffi::__NR_riscv_hwprobe == sys::__NR_riscv_hwprobe as ffi::c_long);
        // static_assert!(ffi::RISCV_HWPROBE_KEY_IMA_EXT_0 == libc::RISCV_HWPROBE_KEY_IMA_EXT_0); // libc doesn't have this
        static_assert!(ffi::RISCV_HWPROBE_KEY_IMA_EXT_0 == sys::RISCV_HWPROBE_KEY_IMA_EXT_0 as i64);
        // static_assert!(ffi::RISCV_HWPROBE_EXT_ZACAS == libc::RISCV_HWPROBE_EXT_ZACAS); // libc doesn't have this
        static_assert!(ffi::RISCV_HWPROBE_EXT_ZACAS == sys::RISCV_HWPROBE_EXT_ZACAS);
        // libc doesn't have this
        // static_assert!(
        //     mem::size_of::<ffi::riscv_hwprobe>()
        //         == mem::size_of::<libc::riscv_hwprobe>()
        // );
        static_assert!(
            mem::size_of::<ffi::riscv_hwprobe>() == mem::size_of::<sys::riscv_hwprobe>()
        );
        let ffi: ffi::riscv_hwprobe = unsafe { mem::zeroed() };
        let _ = sys::riscv_hwprobe { key: ffi.key, value: ffi.value };
    };
}
