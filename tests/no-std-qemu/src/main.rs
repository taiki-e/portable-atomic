#![no_main]
#![no_std]
#![warn(rust_2018_idioms, single_use_lifetimes, unsafe_op_in_unsafe_fn)]

#[macro_use]
#[path = "../../api-test/src/helper.rs"]
mod helper;

use core::sync::atomic::Ordering;

use portable_atomic::*;
use semihosting::{print, println};

#[cfg(mclass)]
#[cortex_m_rt::entry]
fn main() -> ! {
    run();
    semihosting::process::exit(0)
}
#[cfg(not(mclass))]
#[no_mangle]
unsafe fn _start(_: usize, _: usize) -> ! {
    #[cfg(any(target_arch = "riscv32", target_arch = "riscv64"))]
    unsafe {
        core::arch::asm!("la sp, _stack");
    }
    #[cfg(armv5te)]
    unsafe {
        #[instruction_set(arm::a32)]
        #[inline]
        unsafe fn init() {
            unsafe {
                core::arch::asm!("mov sp, #0x8000");
            }
        }
        init();
    }
    run();
    semihosting::process::exit(0)
}

fn run() {
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
    #[cfg_attr(any(target_arch = "riscv32", target_arch = "riscv64"), cfg(f))]
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

    // TODO: undefined reference to `__sync_synchronize'
    #[cfg(not(armv5te))]
    for &order in &test_helper::FENCE_ORDERINGS {
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
    // TODO: undefined reference to f{max,min}{,f}
    #[cfg_attr(any(target_arch = "riscv32", target_arch = "riscv64"), cfg(f))]
    test_atomic_float!(f32);
    #[cfg_attr(any(target_arch = "riscv32", target_arch = "riscv64"), cfg(d))]
    test_atomic_float!(f64);
}
