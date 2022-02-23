#![no_std]
#![allow(dead_code, unused_imports)]
#![cfg_attr(portable_atomic_unstable_cfg_target_has_atomic, feature(cfg_target_has_atomic))]

use portable_atomic as atomic;
use portable_atomic::{
    hint, AtomicBool, AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicPtr, AtomicU16,
    AtomicU32, AtomicU64, AtomicU8, AtomicUsize, Ordering,
};
#[cfg(feature = "float")]
use portable_atomic::{AtomicF32, AtomicF64};
#[cfg(any(feature = "i128", feature = "i128-dynamic"))]
use portable_atomic::{AtomicI128, AtomicU128};

/// `#[cfg(target_has_atomic = "ptr")]` for stable Rust.
///
/// The following is a list of builtin targets that do *not* support atomic CAS.
///
/// - `avr-unknown-gnu-atmega328`
/// - `bpfeb-unknown-none`
/// - `bpfel-unknown-none`
/// - `msp430-none-elf`
/// - `riscv32i-unknown-none-elf`
/// - `riscv32imc-unknown-none-elf`
/// - `thumbv4t-none-eabi`
/// - `thumbv6m-none-eabi`
#[cfg_attr(not(portable_atomic_cfg_target_has_atomic), cfg(not(portable_atomic_no_atomic_cas)))]
#[cfg_attr(portable_atomic_cfg_target_has_atomic, cfg(target_has_atomic = "ptr"))]
#[macro_export]
macro_rules! cfg_target_has_atomic {
    ($($tt:tt)*) => {
        $($tt)*
    };
}
/// `#[cfg(target_has_atomic = "ptr")]` for stable Rust.
#[cfg_attr(not(portable_atomic_cfg_target_has_atomic), cfg(portable_atomic_no_atomic_cas))]
#[cfg_attr(portable_atomic_cfg_target_has_atomic, cfg(not(target_has_atomic = "ptr")))]
#[macro_export]
macro_rules! cfg_target_has_atomic {
    ($($tt:tt)*) => {};
}

fn all() {
    static _VAL: AtomicUsize = AtomicUsize::new(5);
    const _IS_ALWAYS_LOCK_FREE: bool = AtomicUsize::is_always_lock_free();
    let _is_always_lock_free: bool = AtomicUsize::is_lock_free();

    let mut val = AtomicUsize::new(5);
    *val.get_mut() = 10;
    assert_eq!(val.load(Ordering::SeqCst), 10);
    assert_eq!(val.into_inner(), 10);
    let val = AtomicUsize::default();
    assert_eq!(val.into_inner(), 0);
    let val = AtomicUsize::from(1);
    assert_eq!(val.into_inner(), 1);
    let val = AtomicUsize::new(5);
    val.store(10, Ordering::SeqCst);
    assert_eq!(val.load(Ordering::SeqCst), 10);
    atomic::fence(Ordering::SeqCst);
    atomic::compiler_fence(Ordering::SeqCst);
    hint::spin_loop();
}

cfg_target_has_atomic! {
    fn target_has_cas() {
        let val = AtomicUsize::new(5);
        assert_eq!(val.load(Ordering::SeqCst), 5);
        val.store(10, Ordering::SeqCst);
        assert_eq!(val.swap(15, Ordering::SeqCst), 10);
        assert_eq!(val.compare_exchange(15, 20, Ordering::SeqCst, Ordering::SeqCst).unwrap(), 15);
        assert!(val.compare_exchange_weak(15, 20, Ordering::SeqCst, Ordering::SeqCst).is_err());
        assert_eq!(val.fetch_add(5, Ordering::SeqCst), 20);
        assert_eq!(val.fetch_sub(5, Ordering::SeqCst), 25);
        assert_eq!(val.load(Ordering::SeqCst), 20);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test() {
        all();
        cfg_target_has_atomic! {
            target_has_cas();
        }
    }
}
