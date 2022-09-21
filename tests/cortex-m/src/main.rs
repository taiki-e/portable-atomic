#![no_main]
#![no_std]
#![warn(rust_2018_idioms, single_use_lifetimes, unsafe_op_in_unsafe_fn)]
#![feature(panic_info_message)]

#[macro_use]
#[path = "../../api-test/src/helper.rs"]
mod helper;

use core::{ptr, sync::atomic::Ordering};

use cortex_m_rt::entry;
use cortex_m_semihosting as semihosting;
use portable_atomic::*;

macro_rules! print {
    ($($tt:tt)*) => {
        if let Ok(mut hstdout) = semihosting::hio::hstdout() {
            use core::fmt::Write;
            let _ = write!(hstdout, $($tt)*);
        }
    };
}
macro_rules! println {
    ($($tt:tt)*) => {
        if let Ok(mut hstdout) = semihosting::hio::hstdout() {
            use core::fmt::Write;
            let _ = writeln!(hstdout, $($tt)*);
        }
    };
}

#[entry]
fn main() -> ! {
    macro_rules! test_atomic_int {
        ($int_type:ident) => {
            paste::paste! {
                fn [<test_atomic_ $int_type>]() {
                    __test_atomic_int!($int_type, [<Atomic $int_type:camel>]);
                }
                print!("test test_atomic_{} ... ", stringify!($int_type));
                [<test_atomic_ $int_type>]();
                println!("ok");
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
                print!("test test_atomic_{} ... ", stringify!($float_type));
                [<test_atomic_ $float_type>]();
                println!("ok");
            }
        };
    }
    macro_rules! test_atomic_bool {
        () => {
            fn test_atomic_bool() {
                __test_atomic_bool!(AtomicBool);
            }
            print!("test test_atomic_bool ... ");
            test_atomic_bool();
            println!("ok");
        };
    }
    macro_rules! test_atomic_ptr {
        () => {
            fn test_atomic_ptr() {
                __test_atomic_ptr!(AtomicPtr<u8>);
            }
            print!("test test_atomic_ptr ... ");
            test_atomic_ptr();
            println!("ok");
        };
    }

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

    loop {
        semihosting::debug::exit(semihosting::debug::EXIT_SUCCESS);
    }
}

#[inline(never)]
#[panic_handler]
fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
    if let Some(s) = info.message() {
        if let Some(l) = info.location() {
            println!("panicked at '{:?}', {}", s, l);
        } else {
            println!("panicked at '{:?}' (no location info)", s);
        }
    } else {
        println!("panic occurred (no message)");
    }

    loop {
        semihosting::debug::exit(semihosting::debug::EXIT_FAILURE);
    }
}
