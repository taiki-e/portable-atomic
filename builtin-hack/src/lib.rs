#![no_std]
#![doc(test(
    no_crate_inject,
    attr(
        deny(warnings, rust_2018_idioms, single_use_lifetimes),
        allow(dead_code, unused_variables)
    )
))]
#![warn(
    improper_ctypes_definitions,
    improper_ctypes,
    rust_2018_idioms,
    single_use_lifetimes,
    unreachable_pub
)]
#![cfg_attr(not(portable_atomic_no_unsafe_op_in_unsafe_fn), warn(unsafe_op_in_unsafe_fn))] // unsafe_op_in_unsafe_fn requires Rust 1.52
#![cfg_attr(portable_atomic_no_unsafe_op_in_unsafe_fn, allow(unused_unsafe))]
#![warn(
    clippy::pedantic,
    // lints for public library
    clippy::alloc_instead_of_core,
    clippy::exhaustive_enums,
    clippy::exhaustive_structs,
    clippy::std_instead_of_alloc,
    clippy::std_instead_of_core,
    // lints that help writing unsafe code
    clippy::default_union_representation,
    clippy::trailing_empty_array,
    clippy::transmute_undefined_repr,
    // clippy::undocumented_unsafe_blocks,
    // misc
    clippy::inline_asm_x86_att_syntax,
    // clippy::missing_inline_in_public_items,
)]
#![allow(
    clippy::cast_lossless,
    clippy::doc_markdown,
    clippy::float_cmp,
    clippy::inline_always,
    clippy::missing_errors_doc,
    clippy::module_inception,
    clippy::type_complexity
)]
// 128-bit atomic
#![cfg_attr(
    all(
        target_arch = "x86_64",
        any(all(test, portable_atomic_nightly), portable_atomic_cmpxchg16b_dynamic)
    ),
    feature(cmpxchg16b_target_feature)
)]
// cfg(cfg_target_has_atomic) on old nightly
// This feature has not been changed since the change in nightly-2019-10-14
// until it was stabilized in nightly-2022-02-11, so it can be safely enabled in
// nightly, which is older than nightly-2022-02-11.
#![cfg_attr(portable_atomic_unstable_cfg_target_has_atomic, feature(cfg_target_has_atomic))]
// asm
#![cfg_attr(
    all(
        portable_atomic_nightly,
        not(portable_atomic_no_asm),
        any(
            target_arch = "avr",
            target_arch = "msp430",
            target_arch = "powerpc64",
            target_arch = "s390x",
        ),
    ),
    feature(asm_experimental_arch)
)]
// asm on old nightly
#![cfg_attr(
    all(
        portable_atomic_nightly,
        portable_atomic_no_asm,
        any(
            all(
                any(target_arch = "arm", target_arch = "riscv32", target_arch = "riscv64"),
                not(target_has_atomic = "ptr")
            ),
            target_arch = "aarch64",
            target_arch = "x86_64",
        ),
    ),
    feature(asm)
)]
// llvm_asm on old nightly
// TODO: remove use of llvm_asm when https://github.com/rust-lang/compiler-builtins/issues/400 fixed.
#![cfg_attr(
    all(any(target_arch = "avr", target_arch = "msp430"), portable_atomic_no_asm),
    feature(llvm_asm)
)]
// miri or tsan only
#![cfg_attr(
    all(
        target_arch = "x86_64",
        any(all(test, portable_atomic_nightly), miri, portable_atomic_sanitize_thread)
    ),
    feature(stdsimd)
)]
#![feature(linkage, core_intrinsics)]
#![allow(clippy::missing_safety_doc)]

#[macro_use]
#[path = "../../src/utils.rs"]
mod utils;

#[allow(dead_code, unused_imports)]
#[path = "../../src/imp/mod.rs"]
mod imp;

use core::{
    ffi::{c_int, c_void},
    mem,
    sync::atomic::Ordering,
};

// FFI-safe 128-bit value.
#[allow(dead_code)]
#[derive(Clone, Copy)]
#[repr(C, align(16))]
pub struct U128(u64, u64);

// Refs: https://gcc.gnu.org/wiki/Atomic/GCCMM/LIbrary
const MEMORY_ORDER_RELAXED: c_int = 0;
const MEMORY_ORDER_CONSUME: c_int = 1;
const MEMORY_ORDER_ACQUIRE: c_int = 2;
const MEMORY_ORDER_RELEASE: c_int = 3;
const MEMORY_ORDER_ACQ_REL: c_int = 4;
// const MEMORY_ORDER_SEQ_CST: c_int = 5;

#[inline]
fn c_load_ordering(order: c_int) -> Ordering {
    match order {
        MEMORY_ORDER_RELAXED => Ordering::Relaxed,
        MEMORY_ORDER_CONSUME | MEMORY_ORDER_ACQUIRE => Ordering::Acquire,
        _ => Ordering::SeqCst,
    }
}
#[inline]
fn c_store_ordering(order: c_int) -> Ordering {
    match order {
        MEMORY_ORDER_RELAXED => Ordering::Relaxed,
        MEMORY_ORDER_RELEASE => Ordering::Release,
        _ => Ordering::SeqCst,
    }
}
#[inline]
fn c_swap_ordering(order: c_int) -> Ordering {
    match order {
        MEMORY_ORDER_RELAXED => Ordering::Relaxed,
        MEMORY_ORDER_CONSUME | MEMORY_ORDER_ACQUIRE => Ordering::Acquire,
        MEMORY_ORDER_RELEASE => Ordering::Release,
        MEMORY_ORDER_ACQ_REL => Ordering::AcqRel,
        _ => Ordering::SeqCst,
    }
}

#[cold]
fn ffi_panic() -> ! {
    core::intrinsics::abort();
}
struct FFIPanicGuard;
impl Drop for FFIPanicGuard {
    fn drop(&mut self) {
        ffi_panic();
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
                    (*dst.cast::<imp::$atomic_ty>()).load(c_load_ordering(ordering)),
                );
                mem::forget(guard);
                res
            }
        }
    };
}
macro_rules! atomic_store {
    ($name:ident, $int_ty:ty, $atomic_ty:ident) => {
        #[no_mangle]
        #[cfg_attr(all(not(windows), not(target_vendor = "apple")), linkage = "weak")]
        pub unsafe extern "C" fn $name(dst: *mut $int_ty, val: $int_ty, ordering: c_int) {
            unsafe {
                let guard = FFIPanicGuard;
                (*dst.cast::<imp::$atomic_ty>())
                    .store(mem::transmute(val), c_store_ordering(ordering));
                mem::forget(guard);
            }
        }
    };
}
macro_rules! atomic_rmw {
    ($name:ident, $op:ident, $int_ty:ty, $atomic_ty:ident) => {
        #[no_mangle]
        #[cfg_attr(all(not(windows), not(target_vendor = "apple")), linkage = "weak")]
        pub unsafe extern "C" fn $name(
            dst: *mut $int_ty,
            val: $int_ty,
            ordering: c_int,
        ) -> $int_ty {
            unsafe {
                let guard = FFIPanicGuard;
                let res = mem::transmute(
                    (*dst.cast::<imp::$atomic_ty>())
                        .$op(mem::transmute(val), c_swap_ordering(ordering)),
                );
                mem::forget(guard);
                res
            }
        }
    };
}
macro_rules! atomic_cmpxchg {
    ($name:ident, $int_ty:ty, $atomic_ty:ident) => {
        #[no_mangle]
        #[cfg_attr(all(not(windows), not(target_vendor = "apple")), linkage = "weak")]
        pub unsafe extern "C" fn $name(
            dst: *mut $int_ty,
            expected: *mut $int_ty,
            desired: $int_ty,
            success_order: c_int,
            failure_order: c_int,
        ) -> bool {
            unsafe {
                let guard = FFIPanicGuard;
                let res = (*dst.cast::<imp::$atomic_ty>()).compare_exchange(
                    mem::transmute(*expected),
                    mem::transmute(desired),
                    c_swap_ordering(success_order),
                    c_load_ordering(failure_order),
                );
                mem::forget(guard);
                *expected = mem::transmute(res.unwrap_or_else(|x| x));
                res.is_ok()
            }
        }
    };
}

#[no_mangle]
#[cfg_attr(all(not(windows), not(target_vendor = "apple")), linkage = "weak")]
pub unsafe extern "C" fn __atomic_is_lock_free(object_size: usize, ptr: *const c_void) -> bool {
    // Pass null ptr to retrieve the lock-free property  for a properly aligned object.
    if !ptr.is_null() && ptr as usize % object_size != 0 {
        return false;
    }
    match object_size {
        1 => imp::AtomicU8::is_lock_free(),
        2 => imp::AtomicU16::is_lock_free(),
        4 => imp::AtomicU32::is_lock_free(),
        8 => imp::AtomicU64::is_lock_free(),
        16 => imp::AtomicU128::is_lock_free(),
        _ => false,
    }
}

#[cfg(not(target_has_atomic = "8"))]
atomic_load!(__atomic_load_1, u8, AtomicU8);
#[cfg(not(target_has_atomic = "16"))]
atomic_load!(__atomic_load_2, u16, AtomicU16);
#[cfg(not(target_has_atomic = "32"))]
atomic_load!(__atomic_load_4, u32, AtomicU32);
#[cfg(not(target_has_atomic = "64"))]
atomic_load!(__atomic_load_8, u64, AtomicU64);
atomic_load!(__atomic_load_16, U128, AtomicU128);

#[cfg(not(target_has_atomic = "8"))]
atomic_store!(__atomic_store_1, u8, AtomicU8);
#[cfg(not(target_has_atomic = "16"))]
atomic_store!(__atomic_store_2, u16, AtomicU16);
#[cfg(not(target_has_atomic = "32"))]
atomic_store!(__atomic_store_4, u32, AtomicU32);
#[cfg(not(target_has_atomic = "64"))]
atomic_store!(__atomic_store_8, u64, AtomicU64);
atomic_store!(__atomic_store_16, U128, AtomicU128);

#[cfg(not(target_has_atomic = "8"))]
atomic_cmpxchg!(__atomic_compare_exchange_1, u8, AtomicU8);
#[cfg(not(target_has_atomic = "16"))]
atomic_cmpxchg!(__atomic_compare_exchange_2, u16, AtomicU16);
#[cfg(not(target_has_atomic = "32"))]
atomic_cmpxchg!(__atomic_compare_exchange_4, u32, AtomicU32);
#[cfg(not(target_has_atomic = "64"))]
atomic_cmpxchg!(__atomic_compare_exchange_8, u64, AtomicU64);
atomic_cmpxchg!(__atomic_compare_exchange_16, U128, AtomicU128);

#[cfg(not(target_has_atomic = "8"))]
atomic_rmw!(__atomic_exchange_1, swap, u8, AtomicU8);
#[cfg(not(target_has_atomic = "16"))]
atomic_rmw!(__atomic_exchange_2, swap, u16, AtomicU16);
#[cfg(not(target_has_atomic = "32"))]
atomic_rmw!(__atomic_exchange_4, swap, u32, AtomicU32);
#[cfg(not(target_has_atomic = "64"))]
atomic_rmw!(__atomic_exchange_8, swap, u64, AtomicU64);
atomic_rmw!(__atomic_exchange_16, swap, U128, AtomicU128);

#[cfg(not(target_has_atomic = "8"))]
atomic_rmw!(__atomic_fetch_add_1, fetch_add, u8, AtomicU8);
#[cfg(not(target_has_atomic = "16"))]
atomic_rmw!(__atomic_fetch_add_2, fetch_add, u16, AtomicU16);
#[cfg(not(target_has_atomic = "32"))]
atomic_rmw!(__atomic_fetch_add_4, fetch_add, u32, AtomicU32);
#[cfg(not(target_has_atomic = "64"))]
atomic_rmw!(__atomic_fetch_add_8, fetch_add, u64, AtomicU64);
atomic_rmw!(__atomic_fetch_add_16, fetch_add, U128, AtomicU128);

#[cfg(not(target_has_atomic = "8"))]
atomic_rmw!(__atomic_fetch_sub_1, fetch_sub, u8, AtomicU8);
#[cfg(not(target_has_atomic = "16"))]
atomic_rmw!(__atomic_fetch_sub_2, fetch_sub, u16, AtomicU16);
#[cfg(not(target_has_atomic = "32"))]
atomic_rmw!(__atomic_fetch_sub_4, fetch_sub, u32, AtomicU32);
#[cfg(not(target_has_atomic = "64"))]
atomic_rmw!(__atomic_fetch_sub_8, fetch_sub, u64, AtomicU64);
atomic_rmw!(__atomic_fetch_sub_16, fetch_sub, U128, AtomicU128);

#[cfg(not(target_has_atomic = "8"))]
atomic_rmw!(__atomic_fetch_and_1, fetch_and, u8, AtomicU8);
#[cfg(not(target_has_atomic = "16"))]
atomic_rmw!(__atomic_fetch_and_2, fetch_and, u16, AtomicU16);
#[cfg(not(target_has_atomic = "32"))]
atomic_rmw!(__atomic_fetch_and_4, fetch_and, u32, AtomicU32);
#[cfg(not(target_has_atomic = "64"))]
atomic_rmw!(__atomic_fetch_and_8, fetch_and, u64, AtomicU64);
atomic_rmw!(__atomic_fetch_and_16, fetch_and, U128, AtomicU128);

#[cfg(not(target_has_atomic = "8"))]
atomic_rmw!(__atomic_fetch_or_1, fetch_or, u8, AtomicU8);
#[cfg(not(target_has_atomic = "16"))]
atomic_rmw!(__atomic_fetch_or_2, fetch_or, u16, AtomicU16);
#[cfg(not(target_has_atomic = "32"))]
atomic_rmw!(__atomic_fetch_or_4, fetch_or, u32, AtomicU32);
#[cfg(not(target_has_atomic = "64"))]
atomic_rmw!(__atomic_fetch_or_8, fetch_or, u64, AtomicU64);
atomic_rmw!(__atomic_fetch_or_16, fetch_or, U128, AtomicU128);

#[cfg(not(target_has_atomic = "8"))]
atomic_rmw!(__atomic_fetch_xor_1, fetch_xor, u8, AtomicU8);
#[cfg(not(target_has_atomic = "16"))]
atomic_rmw!(__atomic_fetch_xor_2, fetch_xor, u16, AtomicU16);
#[cfg(not(target_has_atomic = "32"))]
atomic_rmw!(__atomic_fetch_xor_4, fetch_xor, u32, AtomicU32);
#[cfg(not(target_has_atomic = "64"))]
atomic_rmw!(__atomic_fetch_xor_8, fetch_xor, u64, AtomicU64);
atomic_rmw!(__atomic_fetch_xor_16, fetch_xor, U128, AtomicU128);

#[cfg(not(target_has_atomic = "8"))]
atomic_rmw!(__atomic_fetch_nand_1, fetch_nand, u8, AtomicU8);
#[cfg(not(target_has_atomic = "16"))]
atomic_rmw!(__atomic_fetch_nand_2, fetch_nand, u16, AtomicU16);
#[cfg(not(target_has_atomic = "32"))]
atomic_rmw!(__atomic_fetch_nand_4, fetch_nand, u32, AtomicU32);
#[cfg(not(target_has_atomic = "64"))]
atomic_rmw!(__atomic_fetch_nand_8, fetch_nand, u64, AtomicU64);
atomic_rmw!(__atomic_fetch_nand_16, fetch_nand, U128, AtomicU128);
