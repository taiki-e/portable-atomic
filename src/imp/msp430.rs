// Atomic load/store implementation on MSP430.
//
// Adapted from https://github.com/pftbest/msp430-atomic.
// Including https://github.com/pftbest/msp430-atomic/pull/4 for a compile error fix.
// Including https://github.com/pftbest/msp430-atomic/pull/5 for a soundness bug fix.
//
// Note: Ordering is always SeqCst.

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::{cell::UnsafeCell, sync::atomic::Ordering};

/// An atomic fence.
///
/// # Panics
///
/// Panics if `order` is [`Relaxed`](Ordering::Relaxed).
#[inline]
#[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
pub fn fence(order: Ordering) {
    match order {
        Ordering::Relaxed => panic!("there is no such thing as a relaxed fence"),
        // MSP430 is single-core and a compiler fence works as an atomic fence.
        _ => compiler_fence(order),
    }
}

/// A compiler memory fence.
///
/// # Panics
///
/// Panics if `order` is [`Relaxed`](Ordering::Relaxed).
#[inline]
#[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
pub fn compiler_fence(order: Ordering) {
    match order {
        Ordering::Relaxed => panic!("there is no such thing as a relaxed compiler fence"),
        _ => {}
    }
    // SAFETY: using an empty asm is safe.
    unsafe {
        // Do not use `nomem` and `readonly` because prevent preceding and subsequent memory accesses from being reordered.
        #[cfg(not(portable_atomic_no_asm))]
        asm!("", options(nostack, preserves_flags));
        #[cfg(portable_atomic_no_asm)]
        llvm_asm!("" ::: "memory" : "volatile");
    }
}

#[repr(transparent)]
pub(crate) struct AtomicBool {
    v: UnsafeCell<u8>,
}

// Send is implicitly implemented.
// SAFETY: any data races are prevented by atomic operations.
unsafe impl Sync for AtomicBool {}

impl AtomicBool {
    #[cfg(test)]
    #[inline]
    pub(crate) const fn new(v: bool) -> Self {
        Self { v: UnsafeCell::new(v as u8) }
    }

    #[cfg(test)]
    #[inline]
    pub(crate) fn is_lock_free() -> bool {
        Self::is_always_lock_free()
    }
    #[cfg(test)]
    #[inline]
    pub(crate) const fn is_always_lock_free() -> bool {
        true
    }

    #[cfg(test)]
    #[inline]
    pub(crate) fn get_mut(&mut self) -> &mut bool {
        // SAFETY: the mutable reference guarantees unique ownership.
        unsafe { &mut *(self.v.get() as *mut bool) }
    }

    #[cfg(test)]
    #[inline]
    pub(crate) fn into_inner(self) -> bool {
        self.v.into_inner() != 0
    }

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn load(&self, order: Ordering) -> bool {
        crate::utils::assert_load_ordering(order);
        // SAFETY: any data races are prevented by atomic intrinsics and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe { u8::atomic_load(self.v.get()) != 0 }
    }

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn store(&self, val: bool, order: Ordering) {
        crate::utils::assert_store_ordering(order);
        // SAFETY: any data races are prevented by atomic intrinsics and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            u8::atomic_store(self.v.get(), val as u8);
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
    #[cfg(test)]
    #[inline]
    pub(crate) const fn new(p: *mut T) -> Self {
        Self { p: UnsafeCell::new(p) }
    }

    #[cfg(test)]
    #[inline]
    pub(crate) fn is_lock_free() -> bool {
        Self::is_always_lock_free()
    }
    #[cfg(test)]
    #[inline]
    pub(crate) const fn is_always_lock_free() -> bool {
        true
    }

    #[cfg(test)]
    #[inline]
    pub(crate) fn get_mut(&mut self) -> &mut *mut T {
        // SAFETY: the mutable reference guarantees unique ownership.
        // (UnsafeCell::get_mut requires Rust 1.50)
        unsafe { &mut *self.p.get() }
    }

    #[cfg(test)]
    #[inline]
    pub(crate) fn into_inner(self) -> *mut T {
        self.p.into_inner()
    }

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn load(&self, order: Ordering) -> *mut T {
        crate::utils::assert_load_ordering(order);
        // SAFETY: any data races are prevented by atomic intrinsics and the raw
        // pointer passed in is valid because we got it from a reference.
        // TODO: remove int to ptr cast
        unsafe { usize::atomic_load(self.p.get() as *mut usize) as *mut T }
    }

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
        crate::utils::assert_store_ordering(order);
        // SAFETY: any data races are prevented by atomic intrinsics and the raw
        // pointer passed in is valid because we got it from a reference.
        // TODO: remove int to ptr cast
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

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by atomic operations.
        unsafe impl Sync for $atomic_type {}

        impl $atomic_type {
            #[cfg(test)]
            #[inline]
            pub(crate) const fn new(v: $int_type) -> Self {
                Self { v: UnsafeCell::new(v) }
            }

            #[cfg(test)]
            #[inline]
            pub(crate) fn is_lock_free() -> bool {
                Self::is_always_lock_free()
            }
            #[cfg(test)]
            #[inline]
            pub(crate) const fn is_always_lock_free() -> bool {
                true
            }

            #[cfg(test)]
            #[inline]
            pub(crate) fn get_mut(&mut self) -> &mut $int_type {
                // SAFETY: the mutable reference guarantees unique ownership.
                // (UnsafeCell::get_mut requires Rust 1.50)
                unsafe { &mut *self.v.get() }
            }

            #[cfg(test)]
            #[inline]
            pub(crate) fn into_inner(self) -> $int_type {
                 self.v.into_inner()
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                crate::utils::assert_load_ordering(order);
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { $int_type::atomic_load(self.v.get()) }
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    $int_type::atomic_store(self.v.get(), val);
                }
            }
        }

        impl AtomicOperations for $int_type {
            #[inline]
            unsafe fn atomic_load(src: *const Self) -> Self {
                // SAFETY: the caller must uphold the safety contract for `atomic_load`.
                unsafe {
                    let out;
                    #[cfg(not(portable_atomic_no_asm))]
                    asm!(
                        concat!("mov", $asm_suffix, " @{src}, {out}"),
                        src = in(reg) src,
                        out = lateout(reg) out,
                        options(nostack, preserves_flags),
                    );
                    #[cfg(portable_atomic_no_asm)]
                    llvm_asm!(
                        concat!("mov", $asm_suffix, " $1, $0")
                        : "=r"(out) : "*m"(src) : "memory" : "volatile"
                    );
                    out
                }
            }

            #[inline]
            unsafe fn atomic_store(dst: *mut Self, val: Self) {
                // SAFETY: the caller must uphold the safety contract for `atomic_store`.
                unsafe {
                    #[cfg(not(portable_atomic_no_asm))]
                    asm!(
                        concat!("mov", $asm_suffix, " {val}, 0({dst})"),
                        dst = in(reg) dst,
                        val = in(reg) val,
                        options(nostack, preserves_flags),
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

trait AtomicOperations: Sized {
    unsafe fn atomic_load(src: *const Self) -> Self;
    unsafe fn atomic_store(dst: *mut Self, val: Self);
}
