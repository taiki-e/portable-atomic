// Atomic load/store implementation on RISC-V.
//
// Refs:
// - "Mappings from C/C++ primitives to RISC-V primitives." table in RISC-V Instruction Set Manual:
//   https://five-embeddev.com/riscv-isa-manual/latest/memory.html#sec:memory:porting
// - atomic-maybe-uninit https://github.com/taiki-e/atomic-maybe-uninit
//
// Generated asm:
// - riscv64gc https://godbolt.org/z/6z47vqj5v

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::{cell::UnsafeCell, sync::atomic::Ordering};

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
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn load(&self, order: Ordering) -> bool {
        crate::utils::assert_load_ordering(order);
        // SAFETY: any data races are prevented by atomic intrinsics and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe { u8::atomic_load(self.v.get(), order) != 0 }
    }

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn store(&self, val: bool, order: Ordering) {
        crate::utils::assert_store_ordering(order);
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
        // SAFETY: the mutable reference guarantees unique ownership.
        // (UnsafeCell::get_mut requires Rust 1.50)
        unsafe { &mut *self.p.get() }
    }

    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
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
        unsafe { usize::atomic_load(self.p.get() as *mut usize, order) as *mut T }
    }

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
        crate::utils::assert_store_ordering(order);
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
                // SAFETY: the mutable reference guarantees unique ownership.
                // (UnsafeCell::get_mut requires Rust 1.50)
                unsafe { &mut *self.v.get() }
            }

            #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
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
                unsafe { $int_type::atomic_load(self.v.get(), order) }
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    $int_type::atomic_store(self.v.get(), val, order);
                }
            }
        }

        impl AtomicOperations for $int_type {
            #[inline]
            unsafe fn atomic_load(src: *const Self, order: Ordering) -> Self {
                // SAFETY: the caller must uphold the safety contract for `atomic_load`.
                unsafe {
                    let out;
                    match order {
                        Ordering::Relaxed => {
                            asm!(
                                concat!("l", $asm_suffix, " {out}, 0({src})"),
                                src = in(reg) src,
                                out = lateout(reg) out,
                                options(nostack, preserves_flags, readonly),
                            );
                        }
                        Ordering::Acquire => {
                            asm!(
                                concat!("l", $asm_suffix, " {out}, 0({src})"),
                                "fence r, rw",
                                src = in(reg) src,
                                out = lateout(reg) out,
                                options(nostack, preserves_flags),
                            );
                        }
                        Ordering::SeqCst => {
                            asm!(
                                "fence rw, rw",
                                concat!("l", $asm_suffix, " {out}, 0({src})"),
                                "fence r, rw",
                                src = in(reg) src,
                                out = lateout(reg) out,
                                options(nostack, preserves_flags),
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
                    match order {
                        Ordering::Relaxed => {
                            asm!(
                                concat!("s", $asm_suffix, " {val}, 0({dst})"),
                                dst = in(reg) dst,
                                val = in(reg) val,
                                options(nostack, preserves_flags),
                            );
                        }
                        // Release and SeqCst stores are equivalent.
                        Ordering::Release | Ordering::SeqCst => {
                            asm!(
                                "fence rw, w",
                                concat!("s", $asm_suffix, " {val}, 0({dst})"),
                                dst = in(reg) dst,
                                val = in(reg) val,
                                options(nostack, preserves_flags),
                            );
                        }
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
atomic_int!(i32, AtomicI32, "w");
atomic_int!(u32, AtomicU32, "w");
#[cfg(target_arch = "riscv64")]
atomic_int!(i64, AtomicI64, "d");
#[cfg(target_arch = "riscv64")]
atomic_int!(u64, AtomicU64, "d");
#[cfg(target_pointer_width = "32")]
atomic_int!(isize, AtomicIsize, "w");
#[cfg(target_pointer_width = "32")]
atomic_int!(usize, AtomicUsize, "w");
#[cfg(target_pointer_width = "64")]
atomic_int!(isize, AtomicIsize, "d");
#[cfg(target_pointer_width = "64")]
atomic_int!(usize, AtomicUsize, "d");

trait AtomicOperations: Sized {
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
    #[cfg(target_arch = "riscv64")]
    test_atomic_int_load_store!(i64);
    #[cfg(target_arch = "riscv64")]
    test_atomic_int_load_store!(u64);
    test_atomic_int_load_store!(isize);
    test_atomic_int_load_store!(usize);
}
