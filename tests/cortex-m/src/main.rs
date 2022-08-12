#![no_main]
#![no_std]
#![warn(rust_2018_idioms, single_use_lifetimes, unsafe_op_in_unsafe_fn)]
#![feature(panic_info_message)]

#[macro_use]
#[path = "../../api-test/src/helper.rs"]
mod helper;

use core::{fmt::Write, panic::PanicInfo, ptr, sync::atomic::Ordering};

use cortex_m::asm;
use cortex_m_rt::entry;
use cortex_m_semihosting as semihosting;
use portable_atomic::*;

#[entry]
fn main() -> ! {
    asm::nop();

    let mut hstdout = semihosting::hio::hstdout().unwrap();

    macro_rules! test_atomic_int {
        ($int_type:ident) => {
            paste::paste! {
                fn [<test_atomic_ $int_type>]() {
                    __test_atomic_int!($int_type, [<Atomic $int_type:camel>]);
                }
                let _ = write!(hstdout, "test test_atomic_{} ...", stringify!($int_type));
                [<test_atomic_ $int_type>]();
                let _ = writeln!(hstdout, " ok");
            }
        };
    }
    macro_rules! test_atomic_bool {
        () => {
            fn test_atomic_bool() {
                __test_atomic_bool!(AtomicBool);
            }
            let _ = write!(hstdout, "test test_atomic_bool ...");
            test_atomic_bool();
            let _ = writeln!(hstdout, " ok");
        };
    }
    macro_rules! test_atomic_ptr {
        () => {
            fn test_atomic_ptr() {
                __test_atomic_ptr!(AtomicPtr<u8>);
            }
            let _ = write!(hstdout, "test test_atomic_ptr ...");
            test_atomic_ptr();
            let _ = writeln!(hstdout, " ok");
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

    loop {
        semihosting::debug::exit(semihosting::debug::EXIT_SUCCESS);
    }
}

#[inline(never)]
#[panic_handler]
fn panic(info: &PanicInfo<'_>) -> ! {
    if let Ok(mut hstdout) = semihosting::hio::hstdout() {
        if let Some(s) = info.message() {
            if let Some(l) = info.location() {
                let _ = writeln!(hstdout, "panicked at '{:?}', {}", s, l);
            } else {
                let _ = writeln!(hstdout, "panicked at '{:?}' (no location info)", s);
            }
        } else {
            let _ = writeln!(hstdout, "panic occurred (no message)");
        }
    }

    loop {
        semihosting::debug::exit(semihosting::debug::EXIT_FAILURE);
    }
}
