// Atomic load/store implementation on RISC-V.
//
// Refs:
// - "Mappings from C/C++ primitives to RISC-V primitives." table in RISC-V Instruction Set Manual:
//   https://five-embeddev.com/riscv-isa-manual/latest/memory.html#sec:memory:porting
// - atomic-maybe-uninit https://github.com/taiki-e/atomic-maybe-uninit
//
// Generated asm:
// - riscv64gc https://godbolt.org/z/a8qhfdrc4

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::{cell::UnsafeCell, sync::atomic::Ordering};

#[repr(transparent)]
pub(crate) struct AtomicBool {
    #[allow(dead_code)]
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
        unsafe { &mut *self.v.get().cast::<bool>() }
    }

    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
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

    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) const fn as_ptr(&self) -> *mut bool {
        self.v.get().cast::<bool>()
    }

    #[inline]
    fn as_atomic_u8(&self) -> &AtomicU8 {
        // SAFETY: AtomicBool and AtomicU8 have the same layout,
        unsafe { &*(self as *const AtomicBool).cast::<AtomicU8>() }
    }
}

#[repr(transparent)]
pub(crate) struct AtomicPtr<T> {
    #[allow(dead_code)]
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
        // TODO: remove int to ptr cast
        self.as_atomic_usize().load(order) as *mut T
    }

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
        // TODO: remove int to ptr cast
        self.as_atomic_usize().store(ptr as usize, order);
    }

    #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
    #[inline]
    pub(crate) const fn as_ptr(&self) -> *mut *mut T {
        self.p.get()
    }

    #[inline]
    fn as_atomic_usize(&self) -> &AtomicUsize {
        // SAFETY: AtomicPtr and AtomicUsize have the same layout,
        unsafe { &*(self as *const AtomicPtr<T>).cast::<AtomicUsize>() }
    }
}

macro_rules! atomic_int {
    ($atomic_type:ident, $int_type:ident, $asm_suffix:tt) => {
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
                let src = self.v.get();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
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
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                let dst = self.v.get();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
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

            #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
            #[inline]
            pub(crate) const fn as_ptr(&self) -> *mut $int_type {
                self.v.get()
            }
        }
    }
}

atomic_int!(AtomicI8, i8, "b");
atomic_int!(AtomicU8, u8, "b");
atomic_int!(AtomicI16, i16, "h");
atomic_int!(AtomicU16, u16, "h");
atomic_int!(AtomicI32, i32, "w");
atomic_int!(AtomicU32, u32, "w");
#[cfg(target_arch = "riscv64")]
atomic_int!(AtomicI64, i64, "d");
#[cfg(target_arch = "riscv64")]
atomic_int!(AtomicU64, u64, "d");
#[cfg(target_pointer_width = "32")]
atomic_int!(AtomicIsize, isize, "w");
#[cfg(target_pointer_width = "32")]
atomic_int!(AtomicUsize, usize, "w");
#[cfg(target_pointer_width = "64")]
atomic_int!(AtomicIsize, isize, "d");
#[cfg(target_pointer_width = "64")]
atomic_int!(AtomicUsize, usize, "d");

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
