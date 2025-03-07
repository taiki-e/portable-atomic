// SPDX-License-Identifier: Apache-2.0 OR MIT

#[derive(Clone, Copy)]
#[repr(transparent)]
pub(crate) struct CpuInfo(u32);

impl CpuInfo {
    #[inline]
    fn set(&mut self, bit: CpuInfoFlag) {
        self.0 = set(self.0, bit as u32);
    }
    #[inline]
    fn test(self, bit: CpuInfoFlag) -> bool {
        test(self.0, bit as u32)
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
    info.set(CpuInfoFlag::Init);
    // Note: detect_false cfg is intended to make it easy for developers to test
    // cases where features usually available is not available, and is not a public API.
    if !cfg!(portable_atomic_test_detect_false) {
        _detect(&mut info);
    }
    CACHE.store(info.0, Ordering::Relaxed);
    info
}

macro_rules! flags {
    ($(
        $(#[$attr:meta])*
        $func:ident($name:literal, any($($cfg:ident),*)),
    )*) => {
        #[allow(dead_code, non_camel_case_types)]
        #[derive(Clone, Copy)]
        #[cfg_attr(test, derive(PartialEq, Eq, PartialOrd, Ord))]
        #[repr(u32)]
        enum CpuInfoFlag {
            Init = 0,
            $($func,)*
        }
        impl CpuInfo {
            $(
                $(#[$attr])*
                #[cfg(any(test, not(any($($cfg = $name),*))))]
                #[inline]
                pub(crate) fn $func(self) -> bool {
                    self.test(CpuInfoFlag::$func)
                }
            )*
            #[cfg(test)] // for test
            const ALL_FLAGS: &'static [(&'static str, CpuInfoFlag, bool)] = &[$(
                ($name, CpuInfoFlag::$func, cfg!(any($($cfg = $name),*))),
            )*];
        }
        #[test]
        #[cfg_attr(portable_atomic_test_detect_false, ignore)]
        fn test_detect() {$(
            $(#[$attr])*
            {
                const _: u32 = 1_u32 << CpuInfoFlag::$func as u32;
                assert_eq!($name.replace(|c: char| c == '-' || c == '.', "_"), stringify!($func));
                if detect().$func() {
                    assert!(detect().test(CpuInfoFlag::$func));
                } else {
                    assert!(!detect().test(CpuInfoFlag::$func));
                }
            }
        )*}
    };
}

// rustc definitions: https://github.com/rust-lang/rust/blob/e6af292f91f21f12ac1aab6825efb7e1e3381cbb/compiler/rustc_target/src/target_features.rs#L179

// LLVM definitions: https://github.com/llvm/llvm-project/blob/llvmorg-20.1.0/llvm/lib/Target/AArch64/AArch64Features.td
#[cfg(any(target_arch = "aarch64", target_arch = "arm64ec"))]
flags! {
    // FEAT_LSE, Large System Extensions
    // https://developer.arm.com/documentation/109697/2024_12/Feature-descriptions/The-Armv8-1-architecture-extension
    // > This feature is supported in AArch64 state only.
    // > FEAT_LSE is OPTIONAL from Armv8.0.
    // > FEAT_LSE is mandatory from Armv8.1.
    lse("lse", any(target_feature /* 1.61+ */, portable_atomic_target_feature)),
    // FEAT_LSE2, Large System Extensions version 2
    // https://developer.arm.com/documentation/109697/2024_12/Feature-descriptions/The-Armv8-4-architecture-extension
    // > This feature is supported in AArch64 state only.
    // > FEAT_LSE2 is OPTIONAL from Armv8.2.
    // > FEAT_LSE2 is mandatory from Armv8.4.
    #[cfg_attr(not(test), allow(dead_code))]
    lse2("lse2", any(target_feature /* nightly */, portable_atomic_target_feature)),
    // FEAT_LRCPC3, Load-Acquire RCpc instructions version 3
    // https://developer.arm.com/documentation/109697/2024_12/Feature-descriptions/The-Armv8-9-architecture-extension
    // > This feature is supported in AArch64 state only.
    // > FEAT_LRCPC3 is OPTIONAL from Armv8.2.
    // > If FEAT_LRCPC3 is implemented, then FEAT_LRCPC2 is implemented.
    #[cfg_attr(not(test), allow(dead_code))]
    rcpc3("rcpc3", any(target_feature /* nightly */, portable_atomic_target_feature)),
    // FEAT_LSE128, 128-bit Atomics
    // https://developer.arm.com/documentation/109697/2024_12/Feature-descriptions/The-Armv9-4-architecture-extension
    // > This feature is supported in AArch64 state only.
    // > FEAT_LSE128 is OPTIONAL from Armv9.3.
    // > If FEAT_LSE128 is implemented, then FEAT_LSE is implemented.
    #[cfg_attr(not(test), allow(dead_code))]
    lse128("lse128", any(target_feature /* nightly */, portable_atomic_target_feature)),
}

// LLVM definitions: https://github.com/llvm/llvm-project/blob/llvmorg-20.1.0/llvm/lib/Target/PowerPC/PPC.td
#[cfg(target_arch = "powerpc64")]
flags! {
    // lqarx and stqcx.
    quadword_atomics("quadword-atomics", any(target_feature /* nightly */, portable_atomic_target_feature)),
}

// LLVM definitions: https://github.com/llvm/llvm-project/blob/llvmorg-20.1.0/llvm/lib/Target/RISCV/RISCVFeatures.td
#[cfg(any(target_arch = "riscv32", target_arch = "riscv64"))]
flags! {
    // amocas.{w,d,q}
    zacas("zacas", any(target_feature /* nightly */, portable_atomic_target_feature)),
}

// LLVM definitions: https://github.com/llvm/llvm-project/blob/llvmorg-20.1.0/llvm/lib/Target/X86/X86.td
#[cfg(target_arch = "x86_64")]
flags! {
    // cmpxchg16b
    cmpxchg16b("cmpxchg16b", any(target_feature /* 1.69+ */, portable_atomic_target_feature)),
    // atomic vmovdqa
    #[cfg(target_feature = "sse")]
    vmovdqa_atomic("vmovdqa-atomic", any(/* no corresponding target feature */)),
}

// Helper macros for defining FFI bindings.
#[cfg(not(any(target_arch = "x86", target_arch = "x86_64")))]
#[allow(unused_macros)]
#[macro_use]
mod ffi_macros {
    /// Defines types with #[cfg(test)] static assertions which checks
    /// types are the same as the platform's latest header files' ones.
    // Note: This macro is sys_ty!({ }), not sys_ty! { }.
    // An extra brace is used in input to make contents rustfmt-able.
    macro_rules! sys_type {
        ({$(
            $(#[$attr:meta])*
            $vis:vis type $([$($windows_path:ident)::+])? $name:ident = $ty:ty;
        )*}) => {
            $(
                $(#[$attr])*
                $vis type $name = $ty;
            )*
            // Static assertions for FFI bindings.
            // This checks that FFI bindings defined in this crate and FFI bindings generated for
            // the platform's latest header file using bindgen have the same types.
            // Since this is static assertion, we can detect problems with
            // `cargo check --tests --target <target>` run in CI (via TESTS=1 build.sh)
            // without actually running tests on these platforms.
            // See also https://github.com/taiki-e/test-helper/blob/HEAD/tools/codegen/src/ffi.rs.
            #[cfg(test)]
            #[allow(
                unused_imports,
                clippy::cast_possible_wrap,
                clippy::cast_sign_loss,
                clippy::cast_possible_truncation
            )]
            const _: fn() = || {
                #[cfg(not(any(target_os = "aix", windows)))]
                use test_helper::sys;
                #[cfg(target_os = "aix")]
                use libc as sys;
                $(
                    $(#[$attr])*
                    {
                        $(use windows_sys::$($windows_path)::+ as sys;)?
                        let _: $name = 0 as sys::$name;
                    }
                )*
            };
        };
    }
    /// Defines #[repr(C)] structs with #[cfg(test)] static assertions which checks
    /// fields are the same as the platform's latest header files' ones.
    // Note: This macro is sys_struct!({ }), not sys_struct! { }.
    // An extra brace is used in input to make contents rustfmt-able.
    macro_rules! sys_struct {
        ({$(
            $(#[$attr:meta])*
            $vis:vis struct $([$($windows_path:ident)::+])? $name:ident {$(
                $(#[$field_attr:meta])*
                $field_vis:vis $field_name:ident: $field_ty:ty,
            )*}
        )*}) => {
            $(
                $(#[$attr])*
                #[derive(Copy, Clone)]
                #[cfg_attr(test, derive(Debug, PartialEq))]
                #[repr(C)]
                $vis struct $name {$(
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
            #[allow(unused_imports, clippy::undocumented_unsafe_blocks)]
            const _: fn() = || {
                #[cfg(not(any(target_os = "aix", windows)))]
                use test_helper::sys;
                #[cfg(target_os = "aix")]
                use libc as sys;
                $(
                    $(#[$attr])*
                    {
                        $(use windows_sys::$($windows_path)::+ as sys;)?
                        static_assert!(
                            core::mem::size_of::<$name>()
                                == core::mem::size_of::<sys::$name>()
                        );
                        let s: $name = unsafe { core::mem::zeroed() };
                        // field names and types
                        let _ = sys::$name {$(
                            $(#[$field_attr])*
                            $field_name: s.$field_name,
                        )*};
                        // field offsets
                        #[cfg(not(portable_atomic_no_offset_of))]
                        {$(
                            $(#[$field_attr])*
                            static_assert!(
                                core::mem::offset_of!($name, $field_name) ==
                                    core::mem::offset_of!(sys::$name, $field_name),
                            );
                        )*}
                    }
                )*
            };
        };
    }
    /// Defines constants with #[cfg(test)] static assertions which checks
    /// values are the same as the platform's latest header files' ones.
    // Note: This macro is sys_const!({ }), not sys_const! { }.
    // An extra brace is used in input to make contents rustfmt-able.
    macro_rules! sys_const {
        ({$(
            $(#[$attr:meta])*
            $vis:vis const $([$($windows_path:ident)::+])? $name:ident: $ty:ty = $val:expr;
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
                unused_imports,
                clippy::cast_possible_wrap,
                clippy::cast_sign_loss,
                clippy::cast_possible_truncation,
            )]
            const _: fn() = || {
                #[cfg(not(any(target_os = "aix", windows)))]
                use test_helper::sys;
                #[cfg(target_os = "aix")]
                use libc as sys;
                $(
                    $(#[$attr])*
                    {
                        $(use windows_sys::$($windows_path)::+ as sys;)?
                        sys_const_cmp!($name, $ty);
                    }
                )*
            };
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
                        == core::mem::transmute::<$ty, usize>(sys::RTLD_DEFAULT)
                }
            );
        };
        ($name:ident, $ty:ty) => {
            static_assert!($name == sys::$name as $ty);
        };
    }
    /// Defines functions with #[cfg(test)] static assertions which checks
    /// signatures are the same as the platform's latest header files' ones.
    // Note: This macro is sys_fn!({ }), not sys_fn! { }.
    // An extra brace is used in input to make contents rustfmt-able.
    macro_rules! sys_fn {
        ({
            $(#[$extern_attr:meta])*
            extern $abi:literal {$(
                $(#[$fn_attr:meta])*
                $vis:vis fn $([$($windows_path:ident)::+])? $name:ident(
                    $($arg_pat:ident: $arg_ty:ty),* $(,)?
                ) $(-> $ret_ty:ty)?;
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
            #[allow(unused_imports)]
            const _: fn() = || {
                #[cfg(not(any(target_os = "aix", windows)))]
                use test_helper::sys;
                #[cfg(target_os = "aix")]
                use libc as sys;
                $(
                    $(#[$fn_attr])*
                    {
                        $(use windows_sys::$($windows_path)::+ as sys;)?
                        let mut _f: unsafe extern $abi fn($($arg_ty),*) $(-> $ret_ty)? = $name;
                        _f = sys::$name;
                    }
                )*
            };
        };
    }

    // Static assertions for C type definitions.
    // Assertions with core::ffi types are in crate::utils::ffi module.
    #[cfg(test)]
    #[cfg(not(windows))]
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
        let mut flags = vec![("init", CpuInfoFlag::Init)];
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
        use std::{fmt::Write as _, string::String};

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
        test_helper::eprintln_nocapture!("{}", features);
    }

    #[cfg(any(target_arch = "aarch64", target_arch = "arm64ec"))]
    #[allow(clippy::collapsible_else_if)]
    #[test]
    #[cfg_attr(portable_atomic_test_detect_false, ignore)]
    fn test_detect() {
        let proc_cpuinfo = test_helper::cpuinfo::ProcCpuinfo::new();
        if detect().lse() {
            if let Ok(proc_cpuinfo) = proc_cpuinfo {
                assert!(proc_cpuinfo.lse);
            }
        } else {
            if let Ok(proc_cpuinfo) = proc_cpuinfo {
                assert!(!proc_cpuinfo.lse);
            }
        }
        if detect().lse2() {
            assert!(detect().lse());
            if let Ok(test_helper::cpuinfo::ProcCpuinfo { lse2: Some(lse2), .. }) = proc_cpuinfo {
                assert!(lse2);
            }
        } else {
            if let Ok(test_helper::cpuinfo::ProcCpuinfo { lse2: Some(lse2), .. }) = proc_cpuinfo {
                // cpuinfo shows features of host, not valgrind
                if !cfg!(valgrind) {
                    assert!(!lse2);
                }
            }
        }
        if detect().lse128() {
            assert!(detect().lse());
            assert!(detect().lse2());
            if let Ok(test_helper::cpuinfo::ProcCpuinfo { lse128: Some(lse128), .. }) = proc_cpuinfo
            {
                assert!(lse128);
            }
        } else {
            if let Ok(test_helper::cpuinfo::ProcCpuinfo { lse128: Some(lse128), .. }) = proc_cpuinfo
            {
                assert!(!lse128);
            }
        }
        if detect().rcpc3() {
            if let Ok(test_helper::cpuinfo::ProcCpuinfo { rcpc3: Some(rcpc3), .. }) = proc_cpuinfo {
                assert!(rcpc3);
            }
        } else {
            if let Ok(test_helper::cpuinfo::ProcCpuinfo { rcpc3: Some(rcpc3), .. }) = proc_cpuinfo {
                assert!(!rcpc3);
            }
        }
    }
    #[cfg(target_arch = "powerpc64")]
    #[allow(clippy::collapsible_else_if)]
    #[test]
    #[cfg_attr(portable_atomic_test_detect_false, ignore)]
    fn test_detect() {
        let proc_cpuinfo = test_helper::cpuinfo::ProcCpuinfo::new();
        if detect().quadword_atomics() {
            if let Ok(proc_cpuinfo) = proc_cpuinfo {
                assert!(proc_cpuinfo.power8);
            }
        } else {
            if let Ok(proc_cpuinfo) = proc_cpuinfo {
                assert!(!proc_cpuinfo.power8);
            }
        }
    }
}
