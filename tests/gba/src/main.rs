// SPDX-License-Identifier: Apache-2.0 OR MIT

#![no_main]
#![no_std]
#![warn(rust_2018_idioms, single_use_lifetimes, unsafe_op_in_unsafe_fn)]
#![allow(clippy::empty_loop)] // this test crate is #![no_std]

#[macro_use]
#[path = "../../api-test/src/helper.rs"]
mod helper;

use core::sync::atomic::Ordering;

use gba::prelude::*;
use portable_atomic::*;

macro_rules! print {
    ($($tt:tt)*) => {
        if let Ok(mut logger) = MgbaBufferedLogger::try_new(MgbaMessageLevel::Warning) {
            use core::fmt::Write as _;
            let _ = write!(logger, $($tt)*);
        }
    };
}
macro_rules! println {
    ($($tt:tt)*) => {
        if let Ok(mut logger) = MgbaBufferedLogger::try_new(MgbaMessageLevel::Warning) {
            use core::fmt::Write as _;
            let _ = writeln!(logger, $($tt)*);
        }
    };
}
macro_rules! fatal {
    ($($tt:tt)*) => {
        if let Ok(mut logger) = MgbaBufferedLogger::try_new(MgbaMessageLevel::Fatal) {
            use core::fmt::Write as _;
            let _ = writeln!(logger, $($tt)*);
        }
    };
}

#[no_mangle]
fn main() -> ! {
    macro_rules! test_atomic_int {
        ($int_type:ident) => {
            paste::paste! {
                fn [<test_atomic_ $int_type>]() {
                    __test_atomic_int!([<Atomic $int_type:camel>], $int_type);
                }
                print!("test test_atomic_{} ... ", stringify!($int_type));
                [<test_atomic_ $int_type>]();
                println!("ok");
            }
        };
    }
    macro_rules! test_atomic_float {
        ($float_type:ident) => {
            paste::paste! {
                fn [<test_atomic_ $float_type>]() {
                    __test_atomic_float!([<Atomic $float_type:camel>], $float_type);
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

    println!("starting tests...");

    // TODO: undefined reference to `__sync_synchronize'
    // for &order in &test_helper::FENCE_ORDERINGS {
    //     fence(order);
    //     compiler_fence(order);
    // }
    hint::spin_loop();
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
    test_atomic_float!(f32);
    test_atomic_float!(f64);

    println!("all tests passed");

    loop {}
}

#[inline(never)]
#[panic_handler]
fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
    fatal!("{info}");
    loop {}
}
