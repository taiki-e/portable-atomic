// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
Run-time CPU feature detection on AArch64 illumos by using getisax.

As of nightly-2024-09-07, is_aarch64_feature_detected doesn't support run-time detection on illumos.
https://github.com/rust-lang/stdarch/blob/d9466edb4c53cece8686ee6e17b028436ddf4151/crates/std_detect/src/detect/mod.rs

Run-time detection on AArch64 illumos is currently disabled by default as AArch64 port is experimental.
*/

include!("common.rs");

// core::ffi::c_* (except c_void) requires Rust 1.64, libc will soon require Rust 1.47
#[allow(non_camel_case_types)]
mod ffi {
    pub(crate) use super::c_types::c_uint;

    // Defined in sys/auxv_aarch64.h.
    // https://github.com/richlowe/illumos-gate/blob/arm64-gate/usr/src/uts/common/sys/auxv_aarch64.h
    pub(crate) const AV_AARCH64_LSE: u32 = 1 << 15;
    pub(crate) const AV_AARCH64_2_LSE2: u32 = 1 << 2;

    extern "C" {
        // Defined in sys/auxv.h.
        // https://illumos.org/man/2/getisax
        // https://github.com/richlowe/illumos-gate/blob/arm64-gate/usr/src/uts/common/sys/auxv.h
        pub(crate) fn getisax(array: *mut u32, n: c_uint) -> c_uint;
    }
}

#[cold]
fn _detect(info: &mut CpuInfo) {
    let mut out = [0_u32; 2];
    // SAFETY: the pointer is valid because we got it from a reference.
    unsafe {
        ffi::getisax(out.as_mut_ptr(), 2);
    }
    if out[0] & ffi::AV_AARCH64_LSE != 0 {
        info.set(CpuInfo::HAS_LSE);
    }
    if out[1] & ffi::AV_AARCH64_2_LSE2 != 0 {
        info.set(CpuInfo::HAS_LSE2);
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
    // This checks that FFI bindings defined in this crate and FFI bindings
    // generated for the platform's latest header file using bindgen have
    // compatible signatures (or the same values if constants).
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
        use test_helper::sys;
        let mut _getisax: unsafe extern "C" fn(*mut u32, ffi::c_uint) -> ffi::c_uint = ffi::getisax;
        _getisax = sys::getisax;
        // static_assert!(ffi::AV_AARCH64_LSE == libc::AV_AARCH64_LSE);
        static_assert!(ffi::AV_AARCH64_LSE == sys::AV_AARCH64_LSE);
        // static_assert!(ffi::AV_AARCH64_2_LSE2 == libc::AV_AARCH64_2_LSE2);
        static_assert!(ffi::AV_AARCH64_2_LSE2 == sys::AV_AARCH64_2_LSE2);
    };
}
