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

    extern "C" {
        // https://man7.org/linux/man-pages/man2/syscall.2.html
        pub(crate) fn syscall(number: c_long, ...) -> c_long;
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
