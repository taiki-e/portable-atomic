#![no_main]
#![no_std]
#![warn(rust_2018_idioms, single_use_lifetimes, unsafe_op_in_unsafe_fn)]
#![feature(linkage, core_intrinsics)]

#[macro_use]
#[path = "../../api-test/src/helper.rs"]
mod helper;

use core::{ptr, sync::atomic::Ordering};

use gba::{fatal, warning};
use portable_atomic::*;

#[no_mangle]
fn main() -> ! {
    macro_rules! test_atomic_int {
        ($int_type:ident) => {
            paste::paste! {
                fn [<test_atomic_ $int_type>]() {
                    __test_atomic_int!($int_type, [<Atomic $int_type:camel>]);
                }
                warning!("test test_atomic_{} ...", stringify!($int_type));
                [<test_atomic_ $int_type>]();
                warning!(" ok");
            }
        };
    }
    #[cfg(feature = "float")]
    macro_rules! test_atomic_float {
        ($float_type:ident) => {
            paste::paste! {
                fn [<test_atomic_ $float_type>]() {
                    __test_atomic_float!($float_type, [<Atomic $float_type:camel>]);
                }
                warning!("test test_atomic_{} ...", stringify!($float_type));
                [<test_atomic_ $float_type>]();
                warning!(" ok");
            }
        };
    }
    macro_rules! test_atomic_bool {
        () => {
            fn test_atomic_bool() {
                __test_atomic_bool!(AtomicBool);
            }
            warning!("test test_atomic_bool ...");
            test_atomic_bool();
            warning!(" ok");
        };
    }
    macro_rules! test_atomic_ptr {
        () => {
            fn test_atomic_ptr() {
                __test_atomic_ptr!(AtomicPtr<u8>);
            }
            warning!("test test_atomic_ptr ...");
            test_atomic_ptr();
            warning!(" ok");
        };
    }

    warning!("starting tests...");

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
    #[cfg(feature = "float")]
    test_atomic_float!(f32);
    #[cfg(feature = "float")]
    test_atomic_float!(f64);

    warning!("all tests passed");

    loop {}
}

#[inline(never)]
#[panic_handler]
fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
    fatal!("{}", info)
}
