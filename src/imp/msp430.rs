//! Atomic{I8,U8,I16,U16,Isize,Usize,Bool,Ptr} implementation on msp430 (load/store only).
//!
//! Adapted from https://github.com/pftbest/msp430-atomic.
//! Including https://github.com/pftbest/msp430-atomic/pull/4 for a compile error fix.
//! Including https://github.com/pftbest/msp430-atomic/pull/5 for a soundness bug fix.
//!
//! Note: Ordering is always SeqCst.

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
        unsafe { u8::atomic_load(self.v.get()) != 0 }
    }

    #[inline]
    pub(crate) fn store(&self, val: bool, order: Ordering) {
        assert_store_ordering(order);
        unsafe {
            u8::atomic_store(self.v.get(), val as u8);
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
        unsafe { usize::atomic_load(self.p.get() as *mut usize) as *mut T }
    }

    #[inline]
    pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
        assert_store_ordering(order);
        unsafe {
            usize::atomic_store(self.p.get() as *mut usize, ptr as usize);
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
                unsafe { $int_type::atomic_load(self.v.get()) }
            }

            #[inline]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                assert_store_ordering(order);
                unsafe {
                    $int_type::atomic_store(self.v.get(), val);
                }
            }
        }

        impl AtomicOperations for $int_type {
            #[inline(always)]
            unsafe fn atomic_load(src: *const Self) -> Self {
                unsafe {
                    let out;
                    #[cfg(not(portable_atomic_no_asm))]
                    asm!(
                        concat!("mov", $asm_suffix, " @{0}, {1}"),
                        in(reg) src,
                        lateout(reg) out,
                        options(nostack),
                    );
                    #[cfg(portable_atomic_no_asm)]
                    llvm_asm!(
                        concat!("mov", $asm_suffix, " $1, $0")
                        : "=r"(out) : "*m"(src) : "memory" : "volatile"
                    );
                    out
                }
            }

            #[inline(always)]
            unsafe fn atomic_store(dst: *mut Self, val: Self) {
                unsafe {
                    #[cfg(not(portable_atomic_no_asm))]
                    asm!(
                        concat!("mov", $asm_suffix, " {1}, 0({0})"),
                        in(reg) dst,
                        in(reg) val,
                        options(nostack),
                    );
                    #[cfg(portable_atomic_no_asm)]
                    llvm_asm!(
                        concat!("mov", $asm_suffix, " $1, $0")
                        :: "*m"(dst), "ir"(val) : "memory" : "volatile"
                    );
                }
            }
        }
    }
}

atomic_int!(i8, AtomicI8, ".b");
atomic_int!(u8, AtomicU8, ".b");
atomic_int!(i16, AtomicI16, ".w");
atomic_int!(u16, AtomicU16, ".w");
atomic_int!(isize, AtomicIsize, ".w");
atomic_int!(usize, AtomicUsize, ".w");

trait AtomicOperations {
    unsafe fn atomic_load(src: *const Self) -> Self;
    unsafe fn atomic_store(dst: *mut Self, val: Self);
}