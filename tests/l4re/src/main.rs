// SPDX-License-Identifier: Apache-2.0 OR MIT

#![no_main]
#![no_std]
#![warn(unsafe_op_in_unsafe_fn)]
#![allow(clippy::undocumented_unsafe_blocks, clippy::wildcard_imports)]

#[macro_use]
#[path = "../../api-test/src/helper.rs"]
mod helper;

use portable_atomic::*;

macro_rules! print {
    ($($tt:tt)*) => {
        #[allow(unused_imports)] // false positive
        use core::fmt::Write as _;
        let _ = write!(libc::Stdout, $($tt)*);
    };
}
macro_rules! println {
    ($($tt:tt)*) => {
        #[allow(unused_imports)] // false positive
        use core::fmt::Write as _;
        let _ = writeln!(libc::Stdout, $($tt)*);
    };
}

#[no_mangle]
extern "C" fn main() {
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
    macro_rules! test_atomic_bool {
        () => {
            fn test_atomic_bool() {
                __test_atomic_bool!(AtomicBool);
            }
            print!("test test_atomic_test_atomic_bool ... ");
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

    unsafe {
        let base = libc::getauxval(libc::AT_BASE);
        let hwcap = libc::getauxval(libc::AT_HWCAP);
        let hwcap2 = libc::getauxval(libc::AT_HWCAP2);
        assert_ne!(base, 0, "getauxval(AT_BASE)={base}");
        assert_eq!(hwcap, 0, "getauxval(AT_HWCAP)={hwcap}");
        assert_eq!(hwcap2, 0, "getauxval(AT_HWCAP2)={hwcap2}");
    }

    for &order in &helper::FENCE_ORDERINGS {
        fence(order);
        compiler_fence(order);
    }
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

    println!("Tests finished successfully");
    unsafe { libc::exit(0) }
}

#[inline(never)]
#[panic_handler]
fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
    println!("{info}");
    unsafe { libc::abort() }
}

mod libc {
    use core::{ffi::*, fmt};

    pub const AT_BASE: c_ulong = 7;
    pub const AT_HWCAP: c_ulong = 16;
    pub const AT_HWCAP2: c_ulong = 26;

    #[link(name = "c")]
    #[link(name = "dl")]
    extern "C" {}

    extern "C" {
        pub fn abort() -> !;
        pub fn exit(status: i32) -> !;
        pub fn printf(format: *const c_char, ...) -> c_int;

        pub fn getauxval(type_: c_ulong) -> c_ulong;
    }

    pub struct Stdout;
    impl fmt::Write for Stdout {
        fn write_str(&mut self, s: &str) -> fmt::Result {
            unsafe { printf(b"%.*s\0".as_ptr() as _, s.len() as i32, s.as_ptr()) };
            Ok(())
        }
    }
}
