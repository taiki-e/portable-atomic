// Atomic load/store implementation on ARMv6-M.
//
// Refs:
// - atomic-maybe-uninit https://github.com/taiki-e/atomic-maybe-uninit
//
// Generated asm: https://godbolt.org/z/hx3a6j9vv

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::{cell::UnsafeCell, sync::atomic::Ordering};

use crate::utils::{assert_load_ordering, assert_store_ordering};

// Only a full system barrier exists in the M-class architectures.
macro_rules! dmb {
    () => {
        "dmb sy"
    };
}

#[repr(transparent)]
pub(crate) struct AtomicBool {
    v: UnsafeCell<u8>,
}

// Send is implicitly implemented.
// SAFETY: any data races are prevented by atomic operations.
unsafe impl Sync for AtomicBool {}

impl AtomicBool {
    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) const fn new(v: bool) -> Self {
        Self { v: UnsafeCell::new(v as u8) }
    }

    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) fn is_lock_free() -> bool {
        Self::is_always_lock_free()
    }
    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) const fn is_always_lock_free() -> bool {
        true
    }

    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) fn get_mut(&mut self) -> &mut bool {
        // SAFETY: the mutable reference guarantees unique ownership.
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
        // SAFETY: any data races are prevented by atomic intrinsics and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe { u8::atomic_load(self.v.get(), order) != 0 }
    }

    #[inline]
    pub(crate) fn store(&self, val: bool, order: Ordering) {
        assert_store_ordering(order);
        // SAFETY: any data races are prevented by atomic intrinsics and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            u8::atomic_store(self.v.get(), val as u8, order);
        }
    }
}

#[repr(transparent)]
pub(crate) struct AtomicPtr<T> {
    p: UnsafeCell<*mut T>,
}

// SAFETY: any data races are prevented by atomic operations.
unsafe impl<T> Send for AtomicPtr<T> {}
// SAFETY: any data races are prevented by atomic operations.
unsafe impl<T> Sync for AtomicPtr<T> {}

impl<T> AtomicPtr<T> {
    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) const fn new(p: *mut T) -> Self {
        Self { p: UnsafeCell::new(p) }
    }

    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) fn is_lock_free() -> bool {
        Self::is_always_lock_free()
    }
    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) const fn is_always_lock_free() -> bool {
        true
    }

    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) fn get_mut(&mut self) -> &mut *mut T {
        self.p.get_mut()
    }

    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) fn into_inner(self) -> *mut T {
        self.p.into_inner()
    }

    #[inline]
    pub(crate) fn load(&self, order: Ordering) -> *mut T {
        assert_load_ordering(order);
        // SAFETY: any data races are prevented by atomic intrinsics and the raw
        // pointer passed in is valid because we got it from a reference.
        // TODO: remove int to ptr cast
        unsafe { usize::atomic_load(self.p.get() as *mut usize, order) as *mut T }
    }

    #[inline]
    pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
        assert_store_ordering(order);
        // SAFETY: any data races are prevented by atomic intrinsics and the raw
        // pointer passed in is valid because we got it from a reference.
        // TODO: remove int to ptr cast
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

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by atomic operations.
        unsafe impl Sync for $atomic_type {}

        impl $atomic_type {
            #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
            #[inline]
            pub(crate) const fn new(v: $int_type) -> Self {
                Self { v: UnsafeCell::new(v) }
            }

            #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
            #[inline]
            pub(crate) fn is_lock_free() -> bool {
                Self::is_always_lock_free()
            }
            #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
            #[inline]
            pub(crate) const fn is_always_lock_free() -> bool {
                true
            }

            #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
            #[inline]
            pub(crate) fn get_mut(&mut self) -> &mut $int_type {
                self.v.get_mut()
            }

            #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
            #[inline]
            pub(crate) fn into_inner(self) -> $int_type {
                 self.v.into_inner()
            }

            #[inline]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                assert_load_ordering(order);
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { $int_type::atomic_load(self.v.get(), order) }
            }

            #[inline]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                assert_store_ordering(order);
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    $int_type::atomic_store(self.v.get(), val, order);
                }
            }
        }

        impl AtomicLoadStore for $int_type {
            #[inline]
            unsafe fn atomic_load(src: *const Self, order: Ordering) -> Self {
                // SAFETY: the caller must uphold the safety contract for `atomic_load`.
                unsafe {
                    let out;
                    match order {
                        Ordering::Relaxed => {
                            asm!(
                                concat!("ldr", $asm_suffix, " {out}, [{src}]"),
                                src = in(reg) src,
                                out = lateout(reg) out,
                                options(nostack, readonly),
                            );
                        }
                        // Acquire and SeqCst loads are equivalent.
                        Ordering::Acquire | Ordering::SeqCst => {
                            asm!(
                                concat!("ldr", $asm_suffix, " {out}, [{src}]"),
                                dmb!(),
                                src = in(reg) src,
                                out = lateout(reg) out,
                                options(nostack),
                            );
                        }
                        _ => unreachable!("{:?}", order),
                    }
                    out
                }
            }

            #[inline]
            unsafe fn atomic_store(dst: *mut Self, val: Self, order: Ordering) {
                // SAFETY: the caller must uphold the safety contract for `atomic_store`.
                unsafe {
                    macro_rules! atomic_store {
                        ($acquire:expr, $release:expr) => {
                            asm!(
                                $release,
                                concat!("str", $asm_suffix, " {val}, [{dst}]"),
                                $acquire,
                                dst = in(reg) dst,
                                val = in(reg) val,
                                options(nostack),
                            )
                        };
                    }
                    match order {
                        Ordering::Relaxed => atomic_store!("", ""),
                        Ordering::Release => atomic_store!("", dmb!()),
                        Ordering::SeqCst => atomic_store!(dmb!(), dmb!()),
                        _ => unreachable!("{:?}", order),
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
atomic_int!(i32, AtomicI32, "");
atomic_int!(u32, AtomicU32, "");
atomic_int!(isize, AtomicIsize, "");
atomic_int!(usize, AtomicUsize, "");

trait AtomicLoadStore: Sized {
    unsafe fn atomic_load(src: *const Self, order: Ordering) -> Self;
    unsafe fn atomic_store(dst: *mut Self, val: Self, order: Ordering);
}

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_bool_load_store!();
    test_atomic_ptr_load_store!();
    test_atomic_int_load_store!(i8);
    test_atomic_int_load_store!(u8);
    test_atomic_int_load_store!(i16);
    test_atomic_int_load_store!(u16);
    test_atomic_int_load_store!(i32);
    test_atomic_int_load_store!(u32);
    test_atomic_int_load_store!(isize);
    test_atomic_int_load_store!(usize);
}
