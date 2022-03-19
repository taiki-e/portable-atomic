#![warn(rust_2018_idioms, single_use_lifetimes, unsafe_op_in_unsafe_fn)]

#[path = "../src/tests"]
mod tests {
    #[allow(dead_code, unused_macros)]
    #[macro_use]
    pub(crate) mod helper;

    use portable_atomic::*;

    // Since the unit tests are compiled with local thin LTO, several different
    // optimizations are applied.

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
    test_atomic_int_pub!(i128);
    test_atomic_int_pub!(u128);
    #[cfg(feature = "float")]
    test_atomic_float_pub!(f32);
    #[cfg(feature = "float")]
    test_atomic_float_pub!(f64);
}
