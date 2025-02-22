// SPDX-License-Identifier: Apache-2.0 OR MIT

#![no_main]
#![no_std]
#![warn(unsafe_op_in_unsafe_fn)]
#![allow(clippy::wildcard_imports)]

#[macro_use]
#[path = "../../api-test/src/helper.rs"]
mod helper;

use portable_atomic::*;
use semihosting::{print, println};

semihosting_no_std_test_rt::entry!(run);
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
    // TODO: size issue with LLVM 20
    if cfg!(not(all(any(target_arch = "riscv32", target_arch = "riscv64"), debug_assertions))) {
        // TODO: undefined reference to f{max,min}{,f} (fixed in Rust 1.79, but we run tests also on 1.64)
        #[cfg_attr(any(target_arch = "riscv32", target_arch = "riscv64"), cfg(f))]
        test_atomic_float!(f32);
        #[cfg_attr(any(target_arch = "riscv32", target_arch = "riscv64"), cfg(d))]
        test_atomic_float!(f64);
    }
}
