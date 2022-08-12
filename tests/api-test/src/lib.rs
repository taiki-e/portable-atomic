#![no_std]
#![warn(rust_2018_idioms, single_use_lifetimes, /* unsafe_op_in_unsafe_fn */)]
#![allow(unused_imports)]

#[macro_use]
mod helper;

use core::ptr;

use portable_atomic as atomic;
use portable_atomic::{
    hint, AtomicBool, AtomicI128, AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize,
    AtomicPtr, AtomicU128, AtomicU16, AtomicU32, AtomicU64, AtomicU8, AtomicUsize, Ordering,
};
#[cfg(feature = "float")]
use portable_atomic::{AtomicF32, AtomicF64};

pub fn all() {
    #[cfg(not(target_arch = "msp430"))]
    atomic::fence(Ordering::SeqCst);
    #[cfg(not(target_arch = "msp430"))]
    atomic::compiler_fence(Ordering::SeqCst);
    hint::spin_loop();

    macro_rules! test_atomic_int {
        ($int_type:ident) => {
            paste::paste! {
                fn [<test_atomic_ $int_type>]() {
                    __test_atomic_int!($int_type, [<Atomic $int_type:camel>]);
                }
                [<test_atomic_ $int_type>]();
            }
        };
    }
    macro_rules! test_atomic_bool {
        () => {
            fn test_atomic_bool() {
                __test_atomic_bool!(AtomicBool);
            }
            test_atomic_bool();
        };
    }
    macro_rules! test_atomic_ptr {
        () => {
            fn test_atomic_ptr() {
                __test_atomic_ptr!(AtomicPtr<u8>);
            }
            test_atomic_ptr();
        };
    }
    // TODO: AtomicF{32,64}

    test_atomic_bool!();
    test_atomic_ptr!();
    test_atomic_int!(isize);
    test_atomic_int!(usize);
    test_atomic_int!(i8);
    test_atomic_int!(u8);
    test_atomic_int!(i16);
    test_atomic_int!(u16);
    test_atomic_int!(i32);
    test_atomic_int!(u32);
    test_atomic_int!(i64);
    test_atomic_int!(u64);
    test_atomic_int!(i128);
    test_atomic_int!(u128);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test() {
        all();
    }
}
