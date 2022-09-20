#![cfg_attr(all(test, target_os = "none"), no_main)]
#![cfg_attr(all(test, target_os = "none"), no_std)]
#![cfg_attr(all(test, target_os = "none"), feature(custom_test_frameworks))]
#![cfg_attr(all(test, target_os = "none"), test_runner(no_std_test_helper::test_runner))]
#![cfg_attr(all(test, target_os = "none"), reexport_test_harness_main = "test_main")]
#![warn(rust_2018_idioms, single_use_lifetimes, unsafe_op_in_unsafe_fn)]

#[cfg(all(test, target_os = "none"))]
no_std_test_helper::test_harness_main!(test_main);

#[macro_use]
#[path = "../src/tests"]
mod tests {
    #[macro_use]
    pub mod helper;
}

use portable_atomic::*;

test_atomic_bool_pub!();
test_atomic_ptr_pub!();

test_atomic_int_pub!(isize);
test_atomic_int_pub!(usize);
test_atomic_int_pub!(i8);
test_atomic_int_pub!(u8);
test_atomic_int_pub!(i16);
test_atomic_int_pub!(u16);
test_atomic_int_pub!(i32);
test_atomic_int_pub!(u32);
test_atomic_int_pub!(i64);
test_atomic_int_pub!(u64);

#[cfg_attr(
    all(
        target_arch = "powerpc64",
        any(
            target_feature = "quadword-atomics",
            portable_atomic_target_feature = "quadword-atomics"
        )
    ),
    cfg(not(qemu))
)]
test_atomic_int_pub!(i128);
#[cfg_attr(
    all(
        target_arch = "powerpc64",
        any(
            target_feature = "quadword-atomics",
            portable_atomic_target_feature = "quadword-atomics"
        )
    ),
    cfg(not(qemu))
)]
test_atomic_int_pub!(u128);
#[cfg(qemu)]
#[cfg(target_arch = "powerpc64")]
#[cfg(any(
    target_feature = "quadword-atomics",
    portable_atomic_target_feature = "quadword-atomics"
))]
test_atomic_int_load_store_pub!(i128);
#[cfg(qemu)]
#[cfg(target_arch = "powerpc64")]
#[cfg(any(
    target_feature = "quadword-atomics",
    portable_atomic_target_feature = "quadword-atomics"
))]
test_atomic_int_load_store_pub!(u128);

#[cfg(feature = "float")]
test_atomic_float_pub!(f32);
#[cfg(feature = "float")]
test_atomic_float_pub!(f64);

#[deny(improper_ctypes)]
extern "C" {
    fn _atomic_bool_ffi_safety(_: AtomicBool);
    fn _atomic_ptr_ffi_safety(_: AtomicPtr<u8>);
    fn _atomic_isize_ffi_safety(_: AtomicIsize);
    fn _atomic_usize_ffi_safety(_: AtomicUsize);
    fn _atomic_i8_ffi_safety(_: AtomicI8);
    fn _atomic_u8_ffi_safety(_: AtomicU8);
    fn _atomic_i16_ffi_safety(_: AtomicI16);
    fn _atomic_u16_ffi_safety(_: AtomicU16);
    fn _atomic_i32_ffi_safety(_: AtomicI32);
    fn _atomic_u32_ffi_safety(_: AtomicU32);
    fn _atomic_i64_ffi_safety(_: AtomicI64);
    fn _atomic_u64_ffi_safety(_: AtomicU64);
    // TODO: 128-bit integers are not FFI safe
    // https://github.com/rust-lang/unsafe-code-guidelines/issues/119
    // https://github.com/rust-lang/rust/issues/54341
    // fn _atomic_i128_ffi_safety(_: AtomicI128);
    // fn _atomic_u128_ffi_safety(_: AtomicU128);
    #[cfg(feature = "float")]
    fn _atomic_f32_ffi_safety(_: AtomicF32);
    #[cfg(feature = "float")]
    fn _atomic_f64_ffi_safety(_: AtomicF64);
}
