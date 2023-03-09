// Atomic load/store implementation on MSP430.
//
// Adapted from https://github.com/pftbest/msp430-atomic.
// Including https://github.com/pftbest/msp430-atomic/pull/4 for a compile error fix.
// Including https://github.com/pftbest/msp430-atomic/pull/5 for a soundness bug fix.
//
// Operations not supported here are provided by disabling interrupts.
// See also src/imp/interrupt/msp430.rs.
//
// Note: Ordering is always SeqCst.

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
#[cfg(any(test, not(feature = "critical-section")))]
use core::cell::UnsafeCell;
use core::sync::atomic::Ordering;

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

#[cfg(any(test, not(feature = "critical-section")))]
#[repr(transparent)]
pub(crate) struct AtomicBool {
    #[allow(dead_code)]
    v: UnsafeCell<u8>,
}

#[cfg(any(test, not(feature = "critical-section")))]
// Send is implicitly implemented.
// SAFETY: any data races are prevented by atomic operations.
unsafe impl Sync for AtomicBool {}

#[cfg(any(test, not(feature = "critical-section")))]
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
        unsafe { &mut *self.v.get().cast::<bool>() }
    }

    #[cfg(test)]
    #[inline]
    pub(crate) fn into_inner(self) -> bool {
        self.v.into_inner() != 0
    }

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn load(&self, order: Ordering) -> bool {
        self.as_atomic_u8().load(order) != 0
    }

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn store(&self, val: bool, order: Ordering) {
        self.as_atomic_u8().store(val as u8, order);
    }

    #[inline]
    pub(crate) fn and(&self, val: bool, order: Ordering) {
        self.as_atomic_u8().and(val as u8, order);
    }

    #[inline]
    pub(crate) fn or(&self, val: bool, order: Ordering) {
        self.as_atomic_u8().or(val as u8, order);
    }

    #[inline]
    pub(crate) fn xor(&self, val: bool, order: Ordering) {
        self.as_atomic_u8().xor(val as u8, order);
    }

    #[inline]
    fn as_atomic_u8(&self) -> &AtomicU8 {
        // SAFETY: AtomicBool and AtomicU8 have the same layout,
        unsafe { &*(self as *const AtomicBool).cast::<AtomicU8>() }
    }
}

#[cfg(any(test, not(feature = "critical-section")))]
#[repr(transparent)]
pub(crate) struct AtomicPtr<T> {
    #[allow(dead_code)]
    p: UnsafeCell<*mut T>,
}

#[cfg(any(test, not(feature = "critical-section")))]
// SAFETY: any data races are prevented by atomic operations.
unsafe impl<T> Send for AtomicPtr<T> {}
#[cfg(any(test, not(feature = "critical-section")))]
// SAFETY: any data races are prevented by atomic operations.
unsafe impl<T> Sync for AtomicPtr<T> {}

#[cfg(any(test, not(feature = "critical-section")))]
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
        // TODO: remove int to ptr cast
        self.as_atomic_usize().load(order) as *mut T
    }

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
        // TODO: remove int to ptr cast
        self.as_atomic_usize().store(ptr as usize, order);
    }

    #[inline]
    fn as_atomic_usize(&self) -> &AtomicUsize {
        // SAFETY: AtomicPtr and AtomicUsize have the same layout,
        unsafe { &*(self as *const AtomicPtr<T>).cast::<AtomicUsize>() }
    }
}

macro_rules! atomic_int {
    ($atomic_type:ident, $int_type:ident, $asm_suffix:tt) => {
        #[cfg(any(test, not(feature = "critical-section")))]
        #[repr(transparent)]
        pub(crate) struct $atomic_type {
            v: UnsafeCell<$int_type>,
        }

        #[cfg(any(test, not(feature = "critical-section")))]
        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by atomic operations.
        unsafe impl Sync for $atomic_type {}

        #[cfg(any(test, not(feature = "critical-section")))]
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
                let src = self.v.get();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
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
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                let dst = self.v.get();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
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

            #[inline]
            pub(crate) fn add(&self, val: $int_type, _order: Ordering) {
                let dst = self.v.get();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    #[cfg(not(portable_atomic_no_asm))]
                    asm!(
                        concat!("add", $asm_suffix, " {val}, 0({dst})"),
                        dst = in(reg) dst,
                        val = in(reg) val,
                        options(nostack),
                    );
                    #[cfg(portable_atomic_no_asm)]
                    llvm_asm!(
                        concat!("add", $asm_suffix, " $1, $0")
                        :: "*m"(dst), "ir"(val) : "memory" : "volatile"
                    );
                }
            }

            #[inline]
            pub(crate) fn sub(&self, val: $int_type, _order: Ordering) {
                let dst = self.v.get();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    #[cfg(not(portable_atomic_no_asm))]
                    asm!(
                        concat!("sub", $asm_suffix, " {val}, 0({dst})"),
                        dst = in(reg) dst,
                        val = in(reg) val,
                        options(nostack),
                    );
                    #[cfg(portable_atomic_no_asm)]
                    llvm_asm!(
                        concat!("sub", $asm_suffix, " $1, $0")
                        :: "*m"(dst), "ir"(val) : "memory" : "volatile"
                    );
                }
            }

            #[inline]
            pub(crate) fn and(&self, val: $int_type, _order: Ordering) {
                let dst = self.v.get();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    #[cfg(not(portable_atomic_no_asm))]
                    asm!(
                        concat!("and", $asm_suffix, " {val}, 0({dst})"),
                        dst = in(reg) dst,
                        val = in(reg) val,
                        options(nostack),
                    );
                    #[cfg(portable_atomic_no_asm)]
                    llvm_asm!(
                        concat!("and", $asm_suffix, " $1, $0")
                        :: "*m"(dst), "ir"(val) : "memory" : "volatile"
                    );
                }
            }

            #[inline]
            pub(crate) fn or(&self, val: $int_type, _order: Ordering) {
                let dst = self.v.get();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    #[cfg(not(portable_atomic_no_asm))]
                    asm!(
                        concat!("bis", $asm_suffix, " {val}, 0({dst})"),
                        dst = in(reg) dst,
                        val = in(reg) val,
                        options(nostack),
                    );
                    #[cfg(portable_atomic_no_asm)]
                    llvm_asm!(
                        concat!("bis", $asm_suffix, " $1, $0")
                        :: "*m"(dst), "ir"(val) : "memory" : "volatile"
                    );
                }
            }

            #[inline]
            pub(crate) fn xor(&self, val: $int_type, _order: Ordering) {
                let dst = self.v.get();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    #[cfg(not(portable_atomic_no_asm))]
                    asm!(
                        concat!("xor", $asm_suffix, " {val}, 0({dst})"),
                        dst = in(reg) dst,
                        val = in(reg) val,
                        options(nostack),
                    );
                    #[cfg(portable_atomic_no_asm)]
                    llvm_asm!(
                        concat!("xor", $asm_suffix, " $1, $0")
                        :: "*m"(dst), "ir"(val) : "memory" : "volatile"
                    );
                }
            }

            #[inline]
            pub(crate) fn not(&self, _order: Ordering) {
                let dst = self.v.get();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    #[cfg(not(portable_atomic_no_asm))]
                    asm!(
                        concat!("inv", $asm_suffix, " 0({dst})"),
                        dst = in(reg) dst,
                        options(nostack),
                    );
                    #[cfg(portable_atomic_no_asm)]
                    llvm_asm!(
                        concat!("inv", $asm_suffix, " $0")
                        :: "*m"(dst) : "memory" : "volatile"
                    );
                }
            }
        }
    }
}

atomic_int!(AtomicI8, i8, ".b");
atomic_int!(AtomicU8, u8, ".b");
atomic_int!(AtomicI16, i16, ".w");
atomic_int!(AtomicU16, u16, ".w");
atomic_int!(AtomicIsize, isize, ".w");
atomic_int!(AtomicUsize, usize, ".w");
