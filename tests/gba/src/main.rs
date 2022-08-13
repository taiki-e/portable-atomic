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

use core::{ffi::c_int, mem};

// Refs: https://gcc.gnu.org/wiki/Atomic/GCCMM/LIbrary
const MEMORY_ORDER_RELAXED: c_int = 0;
const MEMORY_ORDER_CONSUME: c_int = 1;
const MEMORY_ORDER_ACQUIRE: c_int = 2;
// const MEMORY_ORDER_RELEASE: c_int = 3;
// const MEMORY_ORDER_ACQ_REL: c_int = 4;
// const MEMORY_ORDER_SEQ_CST: c_int = 5;

#[inline]
fn c_load_ordering(order: c_int) -> Ordering {
    match order {
        MEMORY_ORDER_RELAXED => Ordering::Relaxed,
        MEMORY_ORDER_CONSUME | MEMORY_ORDER_ACQUIRE => Ordering::Acquire,
        _ => Ordering::SeqCst,
    }
}

struct FFIPanicGuard;
impl Drop for FFIPanicGuard {
    fn drop(&mut self) {
        core::intrinsics::abort();
    }
}
macro_rules! atomic_load {
    ($name:ident, $int_ty:ty, $atomic_ty:ident) => {
        #[no_mangle]
        #[cfg_attr(all(not(windows), not(target_vendor = "apple")), linkage = "weak")]
        pub unsafe extern "C" fn $name(dst: *mut $int_ty, ordering: c_int) -> $int_ty {
            unsafe {
                let guard = FFIPanicGuard;
                let res = mem::transmute(
                    (*dst.cast::<portable_atomic::$atomic_ty>()).load(c_load_ordering(ordering)),
                );
                mem::forget(guard);
                res
            }
        }
    };
}
atomic_load!(__atomic_load_1, u8, AtomicU8);
atomic_load!(__atomic_load_2, u16, AtomicU16);
atomic_load!(__atomic_load_4, u32, AtomicU32);

#[no_mangle]
fn main() -> ! {
    macro_rules! test_atomic {
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
    // TODO: AtomicF{32,64}

    warning!("starting tests...");

    test_atomic_bool!();
    test_atomic_ptr!();
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

    warning!("all tests passed");

    loop {}
}

#[inline(never)]
#[panic_handler]
fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
    fatal!("{}", info)
}
