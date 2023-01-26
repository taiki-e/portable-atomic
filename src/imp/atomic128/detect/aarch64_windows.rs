// Run-time feature detection on aarch64 Windows.
//
// As of nightly-2023-01-23, is_aarch64_feature_detected doesn't support run-time detection of FEAT_LSE on Windows.
// https://github.com/rust-lang/stdarch/blob/a0c30f3e3c75adcd6ee7efc94014ebcead61c507/crates/std_detect/src/detect/os/windows/aarch64.rs
// https://github.com/rust-lang/stdarch/pull/1373
//
// Refs: https://learn.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-isprocessorfeaturepresent

#![cfg_attr(
    any(
        portable_atomic_no_aarch64_target_feature,
        portable_atomic_no_outline_atomics,
        any(target_feature = "lse", portable_atomic_target_feature = "lse")
    ),
    allow(dead_code)
)]

include!("common.rs");

#[allow(clippy::upper_case_acronyms)]
mod ffi {
    pub(crate) type DWORD = u32;
    pub(crate) type BOOL = i32;

    pub(crate) const FALSE: BOOL = 0;
    // Defined in winnt.h of Windows SDK.
    pub(crate) const PF_ARM_V81_ATOMIC_INSTRUCTIONS_AVAILABLE: DWORD = 34;

    extern "system" {
        // https://learn.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-isprocessorfeaturepresent
        pub(crate) fn IsProcessorFeaturePresent(ProcessorFeature: DWORD) -> BOOL;
    }
}

#[inline]
fn _detect(info: &mut CpuInfo) {
    // SAFETY: calling IsProcessorFeaturePresent is safe, and FALSE is also
    // returned if the HAL does not support detection of the specified feature.
    if unsafe {
        ffi::IsProcessorFeaturePresent(ffi::PF_ARM_V81_ATOMIC_INSTRUCTIONS_AVAILABLE) != ffi::FALSE
    } {
        info.set(CpuInfo::HAS_LSE);
    }
}

#[allow(clippy::undocumented_unsafe_blocks)]
#[cfg(test)]
mod tests {
    use super::*;

    // static assertions for FFI bindings signatures
    // TODO: auto-generate this test
    const _: fn() = || {
        let _: ffi::DWORD = 0 as windows_sys::Win32::System::Threading::PROCESSOR_FEATURE_ID;
        let _: ffi::BOOL = 0 as windows_sys::Win32::Foundation::BOOL;
        let mut _sysctl: unsafe extern "system" fn(ffi::DWORD) -> ffi::BOOL =
            ffi::IsProcessorFeaturePresent;
        _sysctl = windows_sys::Win32::System::Threading::IsProcessorFeaturePresent;
        let [] = [(); (ffi::FALSE - windows_sys::Win32::Foundation::FALSE) as usize];
        let [] = [(); (ffi::PF_ARM_V81_ATOMIC_INSTRUCTIONS_AVAILABLE
            - windows_sys::Win32::System::Threading::PF_ARM_V81_ATOMIC_INSTRUCTIONS_AVAILABLE)
            as usize];
    };
}
