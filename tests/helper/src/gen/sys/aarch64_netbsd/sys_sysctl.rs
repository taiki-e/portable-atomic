// This file is @generated by portable-atomic-internal-codegen
// (gen function at tools/codegen/src/ffi.rs).
// It is not intended for manual editing.

extern "C" {
    pub fn sysctlbyname(
        arg1: *const ::std::os::raw::c_char,
        arg2: *mut ::core::ffi::c_void,
        arg3: *mut usize,
        arg4: *const ::core::ffi::c_void,
        arg5: usize,
    ) -> ::std::os::raw::c_int;
}
