#[path = "../src/tests"]
mod tests {
    #[allow(dead_code, unused_macros)]
    #[macro_use]
    pub(crate) mod helper;

    use portable_atomic::*;

    // Since the unit tests are compiled with local thin LTO, several different
    // optimizations are applied.

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
}
