// SPDX-License-Identifier: Apache-2.0 OR MIT

#[derive(Clone, Copy)]
#[repr(transparent)]
pub(crate) struct CpuInfo(u32);

impl CpuInfo {
    #[inline]
    fn set(&mut self, bit: u32) {
        self.0 = set(self.0, bit);
    }
    #[inline]
    fn test(self, bit: u32) -> bool {
        test(self.0, bit)
    }
}

#[inline]
fn set(x: u32, bit: u32) -> u32 {
    x | (1 << bit)
}
#[inline]
fn test(x: u32, bit: u32) -> bool {
    x & (1 << bit) != 0
}

#[inline]
pub(crate) fn detect() -> CpuInfo {
    use core::sync::atomic::{AtomicU32, Ordering};

    static CACHE: AtomicU32 = AtomicU32::new(0);
    let mut info = CpuInfo(CACHE.load(Ordering::Relaxed));
    if info.0 != 0 {
        return info;
    }
    info.set(CpuInfo::INIT);
    // Note: detect_false cfg is intended to make it easy for portable-atomic developers to
    // test cases such as has_cmpxchg16b == false, has_lse == false,
    // __kuser_helper_version < 5, etc., and is not a public API.
    if !cfg!(portable_atomic_test_outline_atomics_detect_false) {
        _detect(&mut info);
    }
    CACHE.store(info.0, Ordering::Relaxed);
    info
}

macro_rules! flags {
    ($(
        $(#[$attr:meta])*
        $flag:ident ($func:ident, $name:literal, any($($cfg:ident),*)),
    )*) => {
        #[allow(dead_code, non_camel_case_types)]
        #[repr(u32)]
        enum CpuInfoFlag {
            Init = 0,
            $($flag,)*
        }
        impl CpuInfo {
            const INIT: u32 = CpuInfoFlag::Init as u32;
            $(
                $(#[$attr])*
                const $flag: u32 = CpuInfoFlag::$flag as u32;
                $(#[$attr])*
                #[cfg(any(test, not(any($($cfg = $name),*))))]
                #[inline]
                pub(crate) fn $func(self) -> bool {
                    self.test(Self::$flag)
                }
            )*
            #[cfg(test)] // for test
            const ALL_FLAGS: &'static [(&'static str, u32, bool)] = &[$(
                ($name, Self::$flag, cfg!(any($($cfg = $name),*))),
            )*];
        }
    };
}

#[cfg(any(target_arch = "aarch64", target_arch = "arm64ec"))]
flags! {
    // FEAT_LSE, Large System Extensions
    // https://developer.arm.com/documentation/109697/2024_12/Feature-descriptions/The-Armv8-1-architecture-extension
    // > This feature is supported in AArch64 state only.
    // > FEAT_LSE is OPTIONAL from Armv8.0.
    // > FEAT_LSE is mandatory from Armv8.1.
    HAS_LSE(has_lse, "lse", any(target_feature, portable_atomic_target_feature)),
    // FEAT_LSE2, Large System Extensions version 2
    // https://developer.arm.com/documentation/109697/2024_12/Feature-descriptions/The-Armv8-4-architecture-extension
    // > This feature is supported in AArch64 state only.
    // > FEAT_LSE2 is OPTIONAL from Armv8.2.
    // > FEAT_LSE2 is mandatory from Armv8.4.
    #[cfg_attr(not(test), allow(dead_code))]
    HAS_LSE2(has_lse2, "lse2", any(target_feature, portable_atomic_target_feature)),
    // FEAT_LRCPC3, Load-Acquire RCpc instructions version 3
    // https://developer.arm.com/documentation/109697/2024_12/Feature-descriptions/The-Armv8-9-architecture-extension
    // > This feature is supported in AArch64 state only.
    // > FEAT_LRCPC3 is OPTIONAL from Armv8.2.
    // > If FEAT_LRCPC3 is implemented, then FEAT_LRCPC2 is implemented.
    #[cfg_attr(not(test), allow(dead_code))]
    HAS_RCPC3(has_rcpc3, "rcpc3", any(target_feature, portable_atomic_target_feature)),
    // FEAT_LSE128, 128-bit Atomics
    // https://developer.arm.com/documentation/109697/2024_12/Feature-descriptions/The-Armv9-4-architecture-extension
    // > This feature is supported in AArch64 state only.
    // > FEAT_LSE128 is OPTIONAL from Armv9.3.
    // > If FEAT_LSE128 is implemented, then FEAT_LSE is implemented.
    #[cfg_attr(not(test), allow(dead_code))]
    HAS_LSE128(has_lse128, "lse128", any(target_feature, portable_atomic_target_feature)),
}

#[cfg(target_arch = "powerpc64")]
flags! {
    // lqarx and stqcx.
    HAS_QUADWORD_ATOMICS(has_quadword_atomics, "quadword-atomics", any(target_feature, portable_atomic_target_feature)),
}

#[cfg(any(target_arch = "riscv32", target_arch = "riscv64"))]
flags! {
    // amocas.{w,d,q}
    HAS_ZACAS(has_zacas, "zacas", any(target_feature, portable_atomic_target_feature)),
}

#[cfg(target_arch = "x86_64")]
flags! {
    // cmpxchg16b
    HAS_CMPXCHG16B(has_cmpxchg16b, "cmpxchg16b", any(target_feature, portable_atomic_target_feature)),
    // atomic vmovdqa
    #[cfg(target_feature = "sse")]
    HAS_VMOVDQA_ATOMIC(has_vmovdqa_atomic, "vmovdqa-atomic", any(/* always false */)),
}

// Helper macros for defining FFI bindings.
#[cfg(not(any(windows, target_arch = "x86", target_arch = "x86_64")))]
#[allow(unused_macros)]
#[macro_use]
mod ffi_macros {
    /// Defines constants with #[cfg(test)] static assertions which checks
    /// values are the same as the platform's latest header files' ones.
    // Note: This macro is sys_const!({ }), not sys_const! { }.
    // An extra brace is used in input to make contents rustfmt-able:.
    macro_rules! sys_const {
        ({$(
            $(#[$attr:meta])*
            $vis:vis const $name:ident: $ty:ty = $val:expr;
        )*}) => {
            $(
                $(#[$attr])*
                $vis const $name: $ty = $val;
            )*
            // Static assertions for FFI bindings.
            // This checks that FFI bindings defined in this crate and FFI bindings generated for
            // the platform's latest header file using bindgen have the same values.
            // Since this is static assertion, we can detect problems with
            // `cargo check --tests --target <target>` run in CI (via TESTS=1 build.sh)
            // without actually running tests on these platforms.
            // See also https://github.com/taiki-e/test-helper/blob/HEAD/tools/codegen/src/ffi.rs.
            #[cfg(test)]
            #[allow(
                unused_attributes, // for #[allow(..)] in $(#[$attr])*
                clippy::cast_possible_wrap,
                clippy::cast_sign_loss,
                clippy::cast_possible_truncation,
            )]
            const _: fn() = || {$(
                $(#[$attr])*
                sys_const_cmp!($name, $ty);
            )*};
        };
    }
    #[cfg(test)]
    macro_rules! sys_const_cmp {
        (RTLD_DEFAULT, $ty:ty) => {
            // ptr comparison and ptr-to-int cast are not stable on const context, so use ptr-to-int
            // transmute and compare its result.
            static_assert!(
                // SAFETY: Pointer-to-integer transmutes are valid (since we are okay with losing the
                // provenance here). (Same as <pointer>::addr().)
                unsafe {
                    core::mem::transmute::<$ty, usize>(RTLD_DEFAULT)
                        == core::mem::transmute::<$ty, usize>(test_helper::sys::RTLD_DEFAULT)
                }
            );
        };
        ($name:ident, $ty:ty) => {
            static_assert!($name == test_helper::sys::$name as $ty);
        };
    }
    /// Defines functions with #[cfg(test)] static assertions which checks
    /// signatures are the same as the platform's latest header files' ones.
    // Note: This macro is sys_fn!({ }), not sys_fn! { }.
    // An extra brace is used in input to make contents rustfmt-able:.
    macro_rules! sys_fn {
        ({
            $(#[$extern_attr:meta])*
            extern $abi:literal {$(
                $(#[$fn_attr:meta])*
                $vis:vis fn $name:ident($($arg_pat:ident: $arg_ty:ty),* $(,)?) $(-> $ret_ty:ty)?;
            )*}
        }) => {
            $(#[$extern_attr])*
            extern $abi {$(
                $(#[$fn_attr])*
                $vis fn $name($($arg_pat: $arg_ty),*) $(-> $ret_ty)?;
            )*}
            // Static assertions for FFI bindings.
            // This checks that FFI bindings defined in this crate and FFI bindings generated for
            // the platform's latest header file using bindgen have the same signatures.
            // Since this is static assertion, we can detect problems with
            // `cargo check --tests --target <target>` run in CI (via TESTS=1 build.sh)
            // without actually running tests on these platforms.
            // See also https://github.com/taiki-e/test-helper/blob/HEAD/tools/codegen/src/ffi.rs.
            #[cfg(test)]
            const _: fn() = || {$(
                $(#[$fn_attr])*
                {
                    let mut _f: unsafe extern $abi fn($($arg_ty),*) $(-> $ret_ty)? = $name;
                    _f = test_helper::sys::$name;
                }
            )*};
        };
    }
    /// Defines #[repr(C)] structs with #[cfg(test)] static assertions which checks
    /// fields are the same as the platform's latest header files' ones.
    // Note: This macro is sys_struct!({ }), not sys_struct! { }.
    // An extra brace is used in input to make contents rustfmt-able:.
    macro_rules! sys_struct {
        ({$(
            $(#[$struct_attr:meta])*
            $struct_vis:vis struct $struct_name:ident {$(
                $(#[$field_attr:meta])*
                $field_vis:vis $field_name:ident: $field_ty:ty,
            )*}
        )*}) => {
            $(
                $(#[$struct_attr])*
                #[derive(Copy, Clone)]
                #[cfg_attr(test, derive(Debug, PartialEq))]
                #[repr(C)]
                $struct_vis struct $struct_name {$(
                    $(#[$field_attr])*
                    $field_vis $field_name: $field_ty,
                )*}
            )*
            // Static assertions for FFI bindings.
            // This checks that FFI bindings defined in this crate and FFI bindings generated for
            // the platform's latest header file using bindgen have the same fields.
            // Since this is static assertion, we can detect problems with
            // `cargo check --tests --target <target>` run in CI (via TESTS=1 build.sh)
            // without actually running tests on these platforms.
            // See also https://github.com/taiki-e/test-helper/blob/HEAD/tools/codegen/src/ffi.rs.
            #[cfg(test)]
            #[allow(clippy::undocumented_unsafe_blocks)]
            const _: fn() = || {$(
                $(#[$struct_attr])*
                {
                    static_assert!(
                        core::mem::size_of::<$struct_name>()
                            == core::mem::size_of::<test_helper::sys::$struct_name>()
                    );
                    let s: $struct_name = unsafe { core::mem::zeroed() };
                    // field names and types
                    let _ = test_helper::sys::$struct_name {$(
                        $(#[$field_attr])*
                        $field_name: s.$field_name,
                    )*};
                    // field offsets
                    #[cfg(not(portable_atomic_no_offset_of))]
                    {$(
                        $(#[$field_attr])*
                        static_assert!(
                            core::mem::offset_of!($struct_name, $field_name) ==
                            core::mem::offset_of!(test_helper::sys::$struct_name, $field_name),
                        );
                    )*}
                }
            )*};
        };
    }

    // Static assertions for C type definitions.
    // Assertions with core::ffi types are in crate::utils::ffi module.
    #[cfg(test)]
    const _: fn() = || {
        use test_helper::sys;
        let _: crate::utils::ffi::c_char = 0 as sys::c_char;
    };
}

#[allow(
    clippy::alloc_instead_of_core,
    clippy::std_instead_of_alloc,
    clippy::std_instead_of_core,
    clippy::undocumented_unsafe_blocks,
    clippy::wildcard_imports
)]
#[cfg(test)]
mod tests_common {
    use std::{collections::BTreeSet, vec};

    use super::*;

    #[test]
    fn test_bit_flags() {
        let mut flags = vec![("init", CpuInfo::INIT)];
        flags.extend(CpuInfo::ALL_FLAGS.iter().map(|&(name, flag, _)| (name, flag)));
        let flag_set = flags.iter().map(|(_, flag)| flag).collect::<BTreeSet<_>>();
        let name_set = flags.iter().map(|(_, flag)| flag).collect::<BTreeSet<_>>();
        if flag_set.len() != flags.len() {
            panic!("CpuInfo flag values must be unique")
        }
        if name_set.len() != flags.len() {
            panic!("CpuInfo flag names must be unique")
        }

        let mut x = CpuInfo(0);
        for &(_, f) in &flags {
            assert!(!x.test(f));
        }
        for i in 0..flags.len() {
            x.set(flags[i].1);
            for &(_, f) in &flags[..i + 1] {
                assert!(x.test(f));
            }
            for &(_, f) in &flags[i + 1..] {
                assert!(!x.test(f));
            }
        }
        for &(_, f) in &flags {
            assert!(x.test(f));
        }
    }

    #[test]
    fn print_features() {
        use std::{
            fmt::Write as _,
            io::{self, Write as _},
            string::String,
        };

        let mut features = String::new();
        features.push_str("\nfeatures:\n");
        for &(name, flag, compile_time) in CpuInfo::ALL_FLAGS {
            let run_time = detect().test(flag);
            if run_time == compile_time {
                let _ = writeln!(features, "  {}: {}", name, run_time);
            } else {
                let _ = writeln!(
                    features,
                    "  {}: {} (compile-time), {} (run-time)",
                    name, compile_time, run_time
                );
            }
        }
        let stdout = io::stderr();
        let mut stdout = stdout.lock();
        let _ = stdout.write_all(features.as_bytes());
    }

    #[cfg(any(target_arch = "aarch64", target_arch = "arm64ec"))]
    #[test]
    #[cfg_attr(portable_atomic_test_outline_atomics_detect_false, ignore)]
    fn test_detect() {
        let proc_cpuinfo = test_helper::cpuinfo::ProcCpuinfo::new();
        if detect().has_lse() {
            assert!(detect().test(CpuInfo::HAS_LSE));
            if let Ok(proc_cpuinfo) = proc_cpuinfo {
                assert!(proc_cpuinfo.lse);
            }
        } else {
            assert!(!detect().test(CpuInfo::HAS_LSE));
            if let Ok(proc_cpuinfo) = proc_cpuinfo {
                assert!(!proc_cpuinfo.lse);
            }
        }
        if detect().has_lse2() {
            assert!(detect().test(CpuInfo::HAS_LSE));
            assert!(detect().test(CpuInfo::HAS_LSE2));
            if let Ok(test_helper::cpuinfo::ProcCpuinfo { lse2: Some(lse2), .. }) = proc_cpuinfo {
                assert!(lse2);
            }
        } else {
            assert!(!detect().test(CpuInfo::HAS_LSE2));
            if let Ok(test_helper::cpuinfo::ProcCpuinfo { lse2: Some(lse2), .. }) = proc_cpuinfo {
                // cpuinfo shows features of host, not valgrind
                if !cfg!(valgrind) {
                    assert!(!lse2);
                }
            }
        }
        if detect().has_lse128() {
            assert!(detect().test(CpuInfo::HAS_LSE));
            assert!(detect().test(CpuInfo::HAS_LSE2));
            assert!(detect().test(CpuInfo::HAS_LSE128));
            if let Ok(test_helper::cpuinfo::ProcCpuinfo { lse128: Some(lse128), .. }) = proc_cpuinfo
            {
                assert!(lse128);
            }
        } else {
            assert!(!detect().test(CpuInfo::HAS_LSE128));
            if let Ok(test_helper::cpuinfo::ProcCpuinfo { lse128: Some(lse128), .. }) = proc_cpuinfo
            {
                assert!(!lse128);
            }
        }
        if detect().has_rcpc3() {
            assert!(detect().test(CpuInfo::HAS_RCPC3));
            if let Ok(test_helper::cpuinfo::ProcCpuinfo { rcpc3: Some(rcpc3), .. }) = proc_cpuinfo {
                assert!(rcpc3);
            }
        } else {
            assert!(!detect().test(CpuInfo::HAS_RCPC3));
            if let Ok(test_helper::cpuinfo::ProcCpuinfo { rcpc3: Some(rcpc3), .. }) = proc_cpuinfo {
                assert!(!rcpc3);
            }
        }
    }
    #[cfg(target_arch = "powerpc64")]
    #[test]
    #[cfg_attr(portable_atomic_test_outline_atomics_detect_false, ignore)]
    fn test_detect() {
        let proc_cpuinfo = test_helper::cpuinfo::ProcCpuinfo::new();
        if detect().has_quadword_atomics() {
            assert!(detect().test(CpuInfo::HAS_QUADWORD_ATOMICS));
            if let Ok(proc_cpuinfo) = proc_cpuinfo {
                assert!(proc_cpuinfo.power8);
            }
        } else {
            assert!(!detect().test(CpuInfo::HAS_QUADWORD_ATOMICS));
            if let Ok(proc_cpuinfo) = proc_cpuinfo {
                assert!(!proc_cpuinfo.power8);
            }
        }
    }
    #[cfg(any(target_arch = "riscv32", target_arch = "riscv64"))]
    #[test]
    #[cfg_attr(portable_atomic_test_outline_atomics_detect_false, ignore)]
    fn test_detect() {
        if detect().has_zacas() {
            assert!(detect().test(CpuInfo::HAS_ZACAS));
        } else {
            assert!(!detect().test(CpuInfo::HAS_ZACAS));
        }
    }
    #[cfg(target_arch = "x86_64")]
    #[test]
    #[cfg_attr(portable_atomic_test_outline_atomics_detect_false, ignore)]
    fn test_detect() {
        if detect().has_cmpxchg16b() {
            assert!(detect().test(CpuInfo::HAS_CMPXCHG16B));
        } else {
            assert!(!detect().test(CpuInfo::HAS_CMPXCHG16B));
        }
        if detect().has_vmovdqa_atomic() {
            assert!(detect().test(CpuInfo::HAS_VMOVDQA_ATOMIC));
        } else {
            assert!(!detect().test(CpuInfo::HAS_VMOVDQA_ATOMIC));
        }
    }
}
