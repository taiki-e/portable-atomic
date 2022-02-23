//! Atomic{I8,U8,I16,U16,I32,U32,Isize,Usize,Bool,Ptr} implementation on riscv (load/store only).
//!
//! Based on:
//! - "Mappings from C/C++ primitives to RISC-V primitives." table in RISC-V Instruction Set Manual:
//!   <https://five-embeddev.com/riscv-isa-manual/latest/memory.html#sec:memory:porting>
//! - asm generated for riscv64gc linux: <https://godbolt.org/z/Pb9Mj7d8x>

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::{cell::UnsafeCell, sync::atomic::Ordering};

use crate::utils::{assert_load_ordering, assert_store_ordering};

const IS_ALWAYS_LOCK_FREE: bool = true;

#[repr(transparent)]
pub(crate) struct AtomicBool {
    v: UnsafeCell<u8>,
}

impl crate::utils::AtomicRepr for AtomicBool {
    const IS_ALWAYS_LOCK_FREE: bool = IS_ALWAYS_LOCK_FREE;
    #[inline]
    fn is_lock_free() -> bool {
        IS_ALWAYS_LOCK_FREE
    }
}

// Send is implicitly implemented.
unsafe impl Sync for AtomicBool {}

impl AtomicBool {
    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) const fn new(v: bool) -> Self {
        Self { v: UnsafeCell::new(v as u8) }
    }

    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) fn get_mut(&mut self) -> &mut bool {
        unsafe { &mut *(self.v.get() as *mut bool) }
    }

    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) fn into_inner(self) -> bool {
        self.v.into_inner() != 0
    }

    #[inline]
    pub(crate) fn load(&self, order: Ordering) -> bool {
        assert_load_ordering(order);
        unsafe { u8::atomic_load(self.v.get(), order) != 0 }
    }

    #[inline]
    pub(crate) fn store(&self, val: bool, order: Ordering) {
        assert_store_ordering(order);
        unsafe {
            u8::atomic_store(self.v.get(), val as u8, order);
        }
    }
}

#[repr(transparent)]
pub(crate) struct AtomicPtr<T> {
    p: UnsafeCell<*mut T>,
}

impl<T> crate::utils::AtomicRepr for AtomicPtr<T> {
    const IS_ALWAYS_LOCK_FREE: bool = IS_ALWAYS_LOCK_FREE;
    #[inline]
    fn is_lock_free() -> bool {
        IS_ALWAYS_LOCK_FREE
    }
}

unsafe impl<T> Send for AtomicPtr<T> {}
unsafe impl<T> Sync for AtomicPtr<T> {}

impl<T> AtomicPtr<T> {
    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) const fn new(p: *mut T) -> Self {
        Self { p: UnsafeCell::new(p) }
    }

    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) fn get_mut(&mut self) -> &mut *mut T {
        unsafe { &mut *self.p.get() }
    }

    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) fn into_inner(self) -> *mut T {
        self.p.into_inner()
    }

    #[inline]
    pub(crate) fn load(&self, order: Ordering) -> *mut T {
        assert_load_ordering(order);
        unsafe { usize::atomic_load(self.p.get() as *mut usize, order) as *mut T }
    }

    #[inline]
    pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
        assert_store_ordering(order);
        unsafe {
            usize::atomic_store(self.p.get() as *mut usize, ptr as usize, order);
        }
    }
}

macro_rules! atomic_int {
    ($int_type:ident, $atomic_type:ident, $asm_suffix:expr) => {
        #[repr(transparent)]
        pub(crate) struct $atomic_type {
            v: UnsafeCell<$int_type>,
        }

        impl crate::utils::AtomicRepr for $atomic_type {
            const IS_ALWAYS_LOCK_FREE: bool = IS_ALWAYS_LOCK_FREE;
            #[inline]
            fn is_lock_free() -> bool {
                IS_ALWAYS_LOCK_FREE
            }
        }

        // Send is implicitly implemented.
        unsafe impl Sync for $atomic_type {}

        impl $atomic_type {
            #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
            #[inline]
            pub(crate) const fn new(v: $int_type) -> Self {
                Self { v: UnsafeCell::new(v) }
            }

            #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
            #[inline]
            pub(crate) fn get_mut(&mut self) -> &mut $int_type {
                unsafe { &mut *self.v.get() }
            }

            #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
            #[inline]
            pub(crate) fn into_inner(self) -> $int_type {
                 self.v.into_inner()
            }

            #[inline]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                assert_load_ordering(order);
                unsafe { $int_type::atomic_load(self.v.get(), order) }
            }

            #[inline]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                assert_store_ordering(order);
                unsafe {
                    $int_type::atomic_store(self.v.get(), val, order);
                }
            }
        }

        impl AtomicOperations for $int_type {
            #[inline(never)] // needed for correct codegen on release mode
            unsafe fn atomic_load(src: *const Self, order: Ordering) -> Self {
                unsafe {
                    let out;
                    match order {
                        Ordering::Relaxed => {
                            asm!(
                                concat!("l", $asm_suffix, " {0}, 0({1})"),
                                in(reg) src,
                                lateout(reg) out,
                                options(nostack),
                            );
                        }
                        Ordering::Acquire  => {
                            asm!(
                                concat!("l", $asm_suffix, " {0}, 0({1})"),
                                "fence r, rw",
                                in(reg) src,
                                lateout(reg) out,
                                options(nostack),
                            );
                        }
                        Ordering::SeqCst => {
                            asm!(
                                "fence rw, rw",
                                concat!("l", $asm_suffix, " {0}, 0({1})"),
                                "fence r, rw",
                                in(reg) src,
                                lateout(reg) out,
                                options(nostack),
                            );
                        }
                        // This function is `inline(never)`, so normal
                        // `unreachable!` cannot be removed by optimization.
                        // SAFETY: The caller must guarantee that the `order` is valid.
                        _ => unreachable_unchecked!(),
                    }
                    out
                }
            }

            #[inline(never)] // needed for correct codegen on release mode
            unsafe fn atomic_store(dst: *mut Self, val: Self, order: Ordering) {
                unsafe {
                    match order {
                        Ordering::Relaxed => {
                            asm!(
                                concat!("s", $asm_suffix, " {1}, 0({0})"),
                                in(reg) dst,
                                in(reg) val,
                                options(nostack),
                            );
                        }
                        Ordering::Release | Ordering::SeqCst => {
                            asm!(
                                "fence rw, w",
                                concat!("s", $asm_suffix, " {1}, 0({0})"),
                                in(reg) dst,
                                in(reg) val,
                                options(nostack),
                            );
                        }
                        // This function is `inline(never)`, so normal
                        // `unreachable!` cannot be removed by optimization.
                        // SAFETY: The caller must guarantee that the `order` is valid.
                        _ => unreachable_unchecked!(),
                    }
                }
            }
        }
    }
}

atomic_int!(i8, AtomicI8, "b");
atomic_int!(u8, AtomicU8, "b");
atomic_int!(i16, AtomicI16, "h");
atomic_int!(u16, AtomicU16, "h");
atomic_int!(i32, AtomicI32, "w");
atomic_int!(u32, AtomicU32, "w");
#[cfg(target_pointer_width = "64")]
atomic_int!(i64, AtomicI64, "d");
#[cfg(target_pointer_width = "64")]
atomic_int!(u64, AtomicU64, "d");
#[cfg(target_pointer_width = "32")]
atomic_int!(isize, AtomicIsize, "w");
#[cfg(target_pointer_width = "32")]
atomic_int!(usize, AtomicUsize, "w");
#[cfg(target_pointer_width = "64")]
atomic_int!(isize, AtomicIsize, "d");
#[cfg(target_pointer_width = "64")]
atomic_int!(usize, AtomicUsize, "d");

trait AtomicOperations {
    unsafe fn atomic_load(src: *const Self, order: Ordering) -> Self;
    unsafe fn atomic_store(dst: *mut Self, val: Self, order: Ordering);
}

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_bool_load_store!(test_atomic_bool, AtomicBool);
    test_atomic_ptr_load_store!(test_atomic_ptr, AtomicPtr<u8>);
    test_atomic_int_load_store!(test_atomic_i8, AtomicI8, i8);
    test_atomic_int_load_store!(test_atomic_u8, AtomicU8, u8);
    test_atomic_int_load_store!(test_atomic_i16, AtomicI16, i16);
    test_atomic_int_load_store!(test_atomic_u16, AtomicU16, u16);
    test_atomic_int_load_store!(test_atomic_i32, AtomicI32, i32);
    test_atomic_int_load_store!(test_atomic_u32, AtomicU32, u32);
    #[cfg(target_pointer_width = "64")]
    test_atomic_int_load_store!(test_atomic_i64, AtomicI64, i64);
    #[cfg(target_pointer_width = "64")]
    test_atomic_int_load_store!(test_atomic_u64, AtomicU64, u64);
    test_atomic_int_load_store!(test_atomic_isize, AtomicIsize, isize);
    test_atomic_int_load_store!(test_atomic_usize, AtomicUsize, usize);
}
