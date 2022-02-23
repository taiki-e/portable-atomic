#![allow(clippy::wildcard_imports)]

#[macro_use]
pub(crate) mod helper;

#[cfg(feature = "serde")]
mod serde;

use super::*;

test_atomic_bool_pub!(test_atomic_bool, AtomicBool);
test_atomic_ptr_pub!(test_atomic_ptr, AtomicPtr<u8>);
test_atomic_int_pub!(test_atomic_isize, AtomicIsize, isize);
test_atomic_int_pub!(test_atomic_usize, AtomicUsize, usize);
test_atomic_int_pub!(test_atomic_i8, AtomicI8, i8);
test_atomic_int_pub!(test_atomic_u8, AtomicU8, u8);
test_atomic_int_pub!(test_atomic_i16, AtomicI16, i16);
test_atomic_int_pub!(test_atomic_u16, AtomicU16, u16);
test_atomic_int_pub!(test_atomic_i32, AtomicI32, i32);
test_atomic_int_pub!(test_atomic_u32, AtomicU32, u32);
test_atomic_int_pub!(test_atomic_i64, AtomicI64, i64);
test_atomic_int_pub!(test_atomic_u64, AtomicU64, u64);
#[cfg(feature = "i128")]
test_atomic_int_pub!(test_atomic_i128, AtomicI128, i128);
#[cfg(feature = "i128")]
test_atomic_int_pub!(test_atomic_u128, AtomicU128, u128);
#[cfg(feature = "float")]
test_atomic_float_pub!(test_atomic_f32, AtomicF32, f32);
#[cfg(feature = "float")]
test_atomic_float_pub!(test_atomic_f64, AtomicF64, f64);

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
    // TODO: https://github.com/rust-lang/unsafe-code-guidelines/issues/119
    // fn _atomic_i128_ffi_safety(_: AtomicI128);
    // fn _atomic_u128_ffi_safety(_: AtomicU128);
}
