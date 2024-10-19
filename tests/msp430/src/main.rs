// SPDX-License-Identifier: Apache-2.0 OR MIT

#![no_main]
#![no_std]
// #![warn(unsafe_op_in_unsafe_fn)]

#[macro_use]
#[path = "../../api-test/src/helper.rs"]
mod helper;

use msp430f5529 as _;
use portable_atomic::*;

macro_rules! print {
    ($($tt:tt)*) => {
        let _ = ufmt::uwrite!(simio::Console, $($tt)*);
    };
}
macro_rules! println {
    ($($tt:tt)*) => {
        let _ = ufmt::uwriteln!(simio::Console, $($tt)*);
    };
}

#[msp430_rt::entry]
fn main() -> ! {
    #[allow(unused_macros)]
    macro_rules! test_atomic_int {
        ($int_type:ident) => {
            paste::paste! {
                fn [<test_atomic_ $int_type>]() {
                    __test_atomic_int!([<Atomic $int_type:camel>], $int_type);
                }
                print!("{}", concat!("test test_atomic_", stringify!($int_type), " ... "));
                [<test_atomic_ $int_type>]();
                println!("ok");
            }
        };
    }
    #[allow(unused_macros)]
    macro_rules! test_atomic_float {
        ($float_type:ident) => {
            paste::paste! {
                fn [<test_atomic_ $float_type>]() {
                    __test_atomic_float!([<Atomic $float_type:camel>], $float_type);
                }
                print!("{}", concat!("test test_atomic_", stringify!($float_type), " ... "));
                [<test_atomic_ $float_type>]();
                println!("ok");
            }
        };
    }
    #[cfg(feature = "bool")]
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
    #[cfg(feature = "ptr")]
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

    #[cfg(not(any(
        feature = "bool",
        feature = "ptr",
        feature = "isize",
        feature = "usize",
        feature = "i8",
        feature = "u8",
        feature = "i16",
        feature = "u16",
        feature = "i32",
        feature = "u32",
        feature = "i64",
        feature = "u64",
        feature = "i128",
        feature = "u128",
        feature = "f32",
        feature = "f64",
    )))]
    {
        // misc
        for order in helper::FENCE_ORDERINGS {
            fence(order);
            compiler_fence(order);
        }
        hint::spin_loop();
    }
    #[cfg(feature = "bool")]
    test_atomic_bool!();
    #[cfg(feature = "ptr")]
    test_atomic_ptr!();
    #[cfg(feature = "isize")]
    test_atomic_int!(isize);
    #[cfg(feature = "usize")]
    test_atomic_int!(usize);
    #[cfg(feature = "i8")]
    test_atomic_int!(i8);
    #[cfg(feature = "u8")]
    test_atomic_int!(u8);
    #[cfg(feature = "i16")]
    test_atomic_int!(i16);
    #[cfg(feature = "u16")]
    test_atomic_int!(u16);
    #[cfg(feature = "i32")]
    test_atomic_int!(i32);
    #[cfg(feature = "u32")]
    test_atomic_int!(u32);
    #[cfg(feature = "i64")]
    test_atomic_int!(i64);
    #[cfg(feature = "u64")]
    test_atomic_int!(u64);
    #[cfg(feature = "i128")]
    test_atomic_int!(i128);
    #[cfg(feature = "u128")]
    test_atomic_int!(u128);
    #[cfg(feature = "f32")]
    test_atomic_float!(f32);
    #[cfg(feature = "f64")]
    test_atomic_float!(f64);

    println!("Tests finished successfully");

    #[allow(clippy::empty_loop)] // this test crate is #![no_std]
    loop {}
}

#[inline(never)]
#[panic_handler]
fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
    macro_rules! println {
        ($($tt:tt)*) => {
            use core::fmt::Write as _;
            let _ = writeln!(simio::Console, $($tt)*);
        };
    }

    println!("{}", info); // this println takes a lot of spaces but better panic message is useful...
    #[allow(clippy::empty_loop)] // this test crate is #![no_std]
    loop {}
}

#[no_mangle]
extern "C" fn abort() -> ! {
    panic!()
}

mod simio {
    use core::{convert::Infallible, fmt};

    pub struct Console;
    impl Console {
        fn write_str(&mut self, s: &str) {
            // https://github.com/dlbeer/mspdebug/blob/v0.25/simio/simio_console.c#L130
            let addr = 0x00FF_usize as *mut u8;
            for &b in s.as_bytes() {
                unsafe { addr.write_volatile(b) }
            }
        }
    }
    impl ufmt::uWrite for Console {
        type Error = Infallible;
        fn write_str(&mut self, s: &str) -> Result<(), Self::Error> {
            self.write_str(s);
            Ok(())
        }
    }
    impl fmt::Write for Console {
        fn write_str(&mut self, s: &str) -> fmt::Result {
            self.write_str(s);
            Ok(())
        }
    }
}
