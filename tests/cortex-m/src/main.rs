#![no_main]
#![no_std]
#![warn(rust_2018_idioms, single_use_lifetimes, unsafe_op_in_unsafe_fn)]
#![feature(panic_info_message)]

use core::{fmt::Write, panic::PanicInfo, sync::atomic::Ordering};

use cortex_m::asm;
use cortex_m_rt::entry;
use cortex_m_semihosting as semihosting;
use portable_atomic::*;

macro_rules! __test_atomic {
    ($int_type:ident, $atomic_type:ty) => {
        load_store();
        fn load_store() {
            static VAR: $atomic_type = <$atomic_type>::new(10);
            for (load_order, store_order) in load_orderings().into_iter().zip(store_orderings()) {
                assert_eq!(VAR.load(load_order), 10);
                VAR.store(5, store_order);
                assert_eq!(VAR.load(load_order), 5);
                VAR.store(10, store_order);
                let a = <$atomic_type>::new(1);
                assert_eq!(a.load(load_order), 1);
                a.store(2, store_order);
                assert_eq!(a.load(load_order), 2);
            }
        }
        swap();
        fn swap() {
            for order in swap_orderings() {
                let a = <$atomic_type>::new(5);
                assert_eq!(a.swap(10, order), 5);
                assert_eq!(a.swap(5, order), 10);
            }
        }
        compare_exchange();
        fn compare_exchange() {
            for (success, failure) in compare_exchange_orderings() {
                let a = <$atomic_type>::new(5);
                assert_eq!(a.compare_exchange(5, 10, success, failure), Ok(5));
                assert_eq!(a.load(Ordering::Relaxed), 10);
                assert_eq!(a.compare_exchange(6, 12, success, failure), Err(10));
                assert_eq!(a.load(Ordering::Relaxed), 10);
            }
        }
        compare_exchange_weak();
        fn compare_exchange_weak() {
            for (success, failure) in compare_exchange_orderings() {
                let a = <$atomic_type>::new(4);
                assert_eq!(a.compare_exchange_weak(6, 8, success, failure), Err(4));
                let mut old = a.load(Ordering::Relaxed);
                loop {
                    let new = old * 2;
                    match a.compare_exchange_weak(old, new, success, failure) {
                        Ok(_) => break,
                        Err(x) => old = x,
                    }
                }
                assert_eq!(a.load(Ordering::Relaxed), 8);
            }
        }
        fetch_add();
        fn fetch_add() {
            for order in swap_orderings() {
                let a = <$atomic_type>::new(0);
                assert_eq!(a.fetch_add(10, order), 0);
                assert_eq!(a.load(Ordering::SeqCst), 10);
                let a = <$atomic_type>::new($int_type::MAX);
                assert_eq!(a.fetch_add(1, order), $int_type::MAX);
                assert_eq!(a.load(Ordering::SeqCst), $int_type::MAX.wrapping_add(1));
            }
        }
        fetch_sub();
        fn fetch_sub() {
            for order in swap_orderings() {
                let a = <$atomic_type>::new(20);
                assert_eq!(a.fetch_sub(10, order), 20);
                assert_eq!(a.load(Ordering::SeqCst), 10);
                let a = <$atomic_type>::new($int_type::MIN);
                assert_eq!(a.fetch_sub(1, order), $int_type::MIN);
                assert_eq!(a.load(Ordering::SeqCst), $int_type::MIN.wrapping_sub(1));
            }
        }
        fetch_and();
        fn fetch_and() {
            for order in swap_orderings() {
                let a = <$atomic_type>::new(0b101101);
                assert_eq!(a.fetch_and(0b110011, order), 0b101101);
                assert_eq!(a.load(Ordering::SeqCst), 0b100001);
            }
        }
        fetch_nand();
        fn fetch_nand() {
            for order in swap_orderings() {
                let a = <$atomic_type>::new(0x13);
                assert_eq!(a.fetch_nand(0x31, order), 0x13);
                assert_eq!(a.load(Ordering::SeqCst), !(0x13 & 0x31));
            }
        }
        fetch_or();
        fn fetch_or() {
            for order in swap_orderings() {
                let a = <$atomic_type>::new(0b101101);
                assert_eq!(a.fetch_or(0b110011, order), 0b101101);
                assert_eq!(a.load(Ordering::SeqCst), 0b111111);
            }
        }
        fetch_xor();
        fn fetch_xor() {
            for order in swap_orderings() {
                let a = <$atomic_type>::new(0b101101);
                assert_eq!(a.fetch_xor(0b110011, order), 0b101101);
                assert_eq!(a.load(Ordering::SeqCst), 0b011110);
            }
        }
        fetch_max();
        fn fetch_max() {
            for order in swap_orderings() {
                let a = <$atomic_type>::new(23);
                assert_eq!(a.fetch_max(22, order), 23);
                assert_eq!(a.load(Ordering::SeqCst), 23);
                assert_eq!(a.fetch_max(24, order), 23);
                assert_eq!(a.load(Ordering::SeqCst), 24);
            }
        }
        fetch_min();
        fn fetch_min() {
            for order in swap_orderings() {
                let a = <$atomic_type>::new(23);
                assert_eq!(a.fetch_min(24, order), 23);
                assert_eq!(a.load(Ordering::SeqCst), 23);
                assert_eq!(a.fetch_min(22, order), 23);
                assert_eq!(a.load(Ordering::SeqCst), 22);
            }
        }
    };
}

fn load_orderings() -> [Ordering; 3] {
    [Ordering::Relaxed, Ordering::Acquire, Ordering::SeqCst]
}
fn store_orderings() -> [Ordering; 3] {
    [Ordering::Relaxed, Ordering::Release, Ordering::SeqCst]
}
fn swap_orderings() -> [Ordering; 5] {
    [Ordering::Relaxed, Ordering::Release, Ordering::Acquire, Ordering::AcqRel, Ordering::SeqCst]
}
fn compare_exchange_orderings() -> [(Ordering, Ordering); 15] {
    [
        (Ordering::Relaxed, Ordering::Relaxed),
        (Ordering::Relaxed, Ordering::Acquire),
        (Ordering::Relaxed, Ordering::SeqCst),
        (Ordering::Acquire, Ordering::Relaxed),
        (Ordering::Acquire, Ordering::Acquire),
        (Ordering::Acquire, Ordering::SeqCst),
        (Ordering::Release, Ordering::Relaxed),
        (Ordering::Release, Ordering::Acquire),
        (Ordering::Release, Ordering::SeqCst),
        (Ordering::AcqRel, Ordering::Relaxed),
        (Ordering::AcqRel, Ordering::Acquire),
        (Ordering::AcqRel, Ordering::SeqCst),
        (Ordering::SeqCst, Ordering::Relaxed),
        (Ordering::SeqCst, Ordering::Acquire),
        (Ordering::SeqCst, Ordering::SeqCst),
    ]
}

#[entry]
fn main() -> ! {
    asm::nop();

    let mut hstdout = semihosting::hio::hstdout().unwrap();

    macro_rules! test_atomic {
        ($int_type:ident) => {
            paste::paste! {
                fn [<test_atomic_ $int_type>]() {
                    __test_atomic!($int_type, [<Atomic $int_type:camel>]);
                }
                let _ = write!(hstdout, "test test_atomic_{} ...", stringify!($int_type));
                [<test_atomic_ $int_type>]();
                let _ = writeln!(hstdout, " ok");
            }
        };
    }

    test_atomic!(isize);
    test_atomic!(usize);
    test_atomic!(i8);
    test_atomic!(u8);
    test_atomic!(i16);
    test_atomic!(u16);
    test_atomic!(i32);
    test_atomic!(u32);
    test_atomic!(i64);
    test_atomic!(u64);
    test_atomic!(i128);
    test_atomic!(u128);

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
