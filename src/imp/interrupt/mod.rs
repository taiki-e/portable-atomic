// Critical section based fallback implementations
//
// Since critical session-based fallback is not sound on multi-core systems,
// this module will only be enabled in one of the following cases:
//
// - If the user explicitly declares the target to be single-core using an unsafe cfg.
// - If the target can be safely assumed to be single-core.

#![cfg_attr(test, allow(dead_code))] // TODO

// On some platforms, atomic load/store can be implemented in a more efficient
// way than disabling interrupts.
//
// Note: On single-core systems, it is okay to use critical session-based
// CAS together with atomic load/store. The load/store will not be
// called while interrupts are disabled, and since the load/store is
// atomic, it is not affected by interrupts even if interrupts are enabled.
#[cfg(target_arch = "msp430")]
use super::msp430 as atomic;
#[cfg(any(target_arch = "riscv32", target_arch = "riscv64"))]
use super::riscv as atomic;
#[cfg(target_arch = "arm")]
use core::sync::atomic;

#[cfg_attr(thumbv6m, path = "thumbv6m.rs")]
#[cfg_attr(target_arch = "avr", path = "avr.rs")]
#[cfg_attr(target_arch = "msp430", path = "msp430.rs")]
#[cfg_attr(any(target_arch = "riscv32", target_arch = "riscv64"), path = "riscv.rs")]
mod arch;

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::{cell::UnsafeCell, sync::atomic::Ordering};

use crate::utils::{assert_load_ordering, assert_store_ordering};

const IS_ALWAYS_LOCK_FREE: bool = false;

// HACK: std compiler_fence is not guaranteed not to emit machine code.
// https://github.com/rust-lang/rust/issues/62256.
#[cfg(any(target_arch = "arm", target_arch = "riscv32", target_arch = "riscv64"))]
#[inline]
pub(super) fn compiler_fence() {
    // SAFETY: we don't call any instructions.
    unsafe {
        asm!("", options(nostack, preserves_flags));
    }
}
#[cfg(any(target_arch = "avr", target_arch = "msp430"))]
#[inline]
pub(super) fn compiler_fence() {
    // SAFETY: we don't call any instructions.
    unsafe {
        #[cfg(not(portable_atomic_no_asm))]
        asm!("", options(nostack, preserves_flags));
        #[cfg(portable_atomic_no_asm)]
        llvm_asm!("" ::: "memory" : "volatile");
    }
}

#[inline]
fn with<F, R>(f: F) -> R
where
    F: FnOnce() -> R,
{
    // Get current interrupt state
    let interrupts_enabled = arch::is_enabled();

    // Disable interrupts
    arch::disable();

    // Ensure no subsequent memory accesses are reordered to before interrupts are disabled.
    // https://github.com/rust-embedded/cortex-m/pull/264
    compiler_fence();

    let r = f();

    // Restore interrupt state
    if interrupts_enabled {
        // Ensure no preceding memory accesses are reordered to after interrupts are enabled.
        // https://github.com/rust-embedded/cortex-m/pull/264
        compiler_fence();

        // SAFETY: we've checked that interrupts were enabled before disabling interrupts.
        unsafe { arch::enable() }
    }

    r
}

#[repr(C, align(1))]
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
    /// Creates a new `AtomicBool`.
    #[inline]
    #[must_use]
    pub(crate) const fn new(v: bool) -> Self {
        Self { v: UnsafeCell::new(v as u8) }
    }

    #[inline]
    pub(crate) fn get_mut(&mut self) -> &mut bool {
        unsafe { &mut *(self.v.get() as *mut bool) }
    }

    #[inline]
    pub(crate) fn into_inner(self) -> bool {
        self.v.into_inner() != 0
    }

    #[inline]
    pub(crate) fn load(&self, order: Ordering) -> bool {
        assert_load_ordering(order);
        #[cfg(not(target_arch = "avr"))]
        {
            unsafe { (*(self as *const Self as *const atomic::AtomicBool)).load(order) }
        }
        #[cfg(target_arch = "avr")]
        {
            with(|| unsafe { self.v.get().read() != 0 })
        }
    }

    #[inline]
    pub(crate) fn store(&self, val: bool, order: Ordering) {
        assert_store_ordering(order);
        #[cfg(not(target_arch = "avr"))]
        {
            unsafe {
                (*(self as *const Self as *const atomic::AtomicBool)).store(val, order);
            }
        }
        #[cfg(target_arch = "avr")]
        {
            with(|| unsafe { self.v.get().write(val as u8) });
        }
    }

    #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
    #[inline]
    pub(crate) fn swap(&self, val: bool, _order: Ordering) -> bool {
        with(|| unsafe { self.v.get().replace(val as u8) != 0 })
    }

    #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
    #[inline]
    pub(crate) fn compare_exchange(
        &self,
        current: bool,
        new: bool,
        success: Ordering,
        failure: Ordering,
    ) -> Result<bool, bool> {
        crate::utils::assert_compare_exchange_ordering(success, failure);
        with(|| unsafe {
            let result = self.v.get().read();
            if result == current as u8 {
                self.v.get().write(new as u8);
                Ok(result != 0)
            } else {
                Err(result != 0)
            }
        })
    }

    #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
    #[inline]
    pub(crate) fn compare_exchange_weak(
        &self,
        current: bool,
        new: bool,
        success: Ordering,
        failure: Ordering,
    ) -> Result<bool, bool> {
        self.compare_exchange(current, new, success, failure)
    }

    #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
    #[inline]
    pub(crate) fn fetch_and(&self, val: bool, _order: Ordering) -> bool {
        with(|| unsafe {
            let result = self.v.get().read();
            self.v.get().write(result & val as u8);
            result != 0
        })
    }

    #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
    #[inline]
    pub(crate) fn fetch_nand(&self, val: bool, order: Ordering) -> bool {
        if val {
            // !(x & true) == !x
            // We must invert the bool.
            self.fetch_xor(true, order)
        } else {
            // !(x & false) == true
            // We must set the bool to true.
            self.swap(true, order)
        }
    }

    #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
    #[inline]
    pub(crate) fn fetch_or(&self, val: bool, _order: Ordering) -> bool {
        with(|| unsafe {
            let result = self.v.get().read();
            self.v.get().write(result | val as u8);
            result != 0
        })
    }

    #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
    #[inline]
    pub(crate) fn fetch_xor(&self, val: bool, _order: Ordering) -> bool {
        with(|| unsafe {
            let result = self.v.get().read();
            self.v.get().write(result ^ val as u8);
            result != 0
        })
    }
}

#[cfg_attr(target_pointer_width = "16", repr(C, align(2)))]
#[cfg_attr(target_pointer_width = "32", repr(C, align(4)))]
#[cfg_attr(target_pointer_width = "64", repr(C, align(8)))]
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
    #[inline]
    pub(crate) const fn new(p: *mut T) -> Self {
        Self { p: UnsafeCell::new(p) }
    }

    #[inline]
    pub(crate) fn get_mut(&mut self) -> &mut *mut T {
        unsafe { &mut *self.p.get() }
    }

    #[inline]
    pub(crate) fn into_inner(self) -> *mut T {
        self.p.into_inner()
    }

    #[inline]
    pub(crate) fn load(&self, order: Ordering) -> *mut T {
        assert_load_ordering(order);
        #[cfg(not(target_arch = "avr"))]
        {
            unsafe { (*(self as *const Self as *const atomic::AtomicPtr<T>)).load(order) }
        }
        #[cfg(target_arch = "avr")]
        {
            with(|| unsafe { self.p.get().read() })
        }
    }

    #[inline]
    pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
        assert_store_ordering(order);
        #[cfg(not(target_arch = "avr"))]
        {
            unsafe {
                (*(self as *const Self as *const atomic::AtomicPtr<T>)).store(ptr, order);
            }
        }
        #[cfg(target_arch = "avr")]
        {
            with(|| unsafe { self.p.get().write(ptr) });
        }
    }

    #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
    #[inline]
    pub(crate) fn swap(&self, ptr: *mut T, _order: Ordering) -> *mut T {
        with(|| unsafe { self.p.get().replace(ptr) })
    }

    #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
    #[inline]
    pub(crate) fn compare_exchange(
        &self,
        current: *mut T,
        new: *mut T,
        success: Ordering,
        failure: Ordering,
    ) -> Result<*mut T, *mut T> {
        crate::utils::assert_compare_exchange_ordering(success, failure);
        with(|| unsafe {
            let result = self.p.get().read();
            if result == current {
                self.p.get().write(new);
                Ok(result)
            } else {
                Err(result)
            }
        })
    }

    #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
    #[inline]
    pub(crate) fn compare_exchange_weak(
        &self,
        current: *mut T,
        new: *mut T,
        success: Ordering,
        failure: Ordering,
    ) -> Result<*mut T, *mut T> {
        self.compare_exchange(current, new, success, failure)
    }
}

macro_rules! atomic_int {
    (base, $atomic_type:ident, $int_type:ident, $align:expr) => {
        #[repr(C, align($align))]
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
            #[inline]
            pub(crate) const fn new(v: $int_type) -> Self {
                Self { v: UnsafeCell::new(v) }
            }

            #[inline]
            pub(crate) fn get_mut(&mut self) -> &mut $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: This is safe because the mutable reference guarantees that no other
                // threads are concurrently accessing the atomic data.
                unsafe {
                    &mut *self.v.get()
                }
            }

            #[inline]
            pub(crate) fn into_inner(self) -> $int_type {
                self.v.into_inner()
            }
        }
    };
    (load_store_atomic, $atomic_type:ident, $int_type:ident, $align:expr) => {
        atomic_int!(base, $atomic_type, $int_type, $align);
        atomic_int!(cas, $atomic_type, $int_type, $align);
        impl $atomic_type {
            #[inline]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                assert_load_ordering(order);
                #[cfg(not(target_arch = "avr"))]
                {
                    unsafe { (*(self as *const Self as *const atomic::$atomic_type)).load(order) }
                }
                #[cfg(target_arch = "avr")]
                {
                    with(|| unsafe { self.v.get().read() })
                }
            }

            #[inline]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                assert_store_ordering(order);
                #[cfg(not(target_arch = "avr"))]
                {
                    unsafe {
                        (*(self as *const Self as *const atomic::$atomic_type)).store(val, order);
                    }
                }
                #[cfg(target_arch = "avr")]
                {
                    with(|| unsafe { self.v.get().write(val) });
                }
            }
        }
    };
    (load_store_critical_session, $atomic_type:ident, $int_type:ident, $align:expr) => {
        atomic_int!(base, $atomic_type, $int_type, $align);
        atomic_int!(cas, $atomic_type, $int_type, $align);
        impl $atomic_type {
            #[inline]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                assert_load_ordering(order);
                with(|| unsafe { self.v.get().read() })
            }

            #[inline]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                assert_store_ordering(order);
                with(|| unsafe { self.v.get().write(val) });
            }
        }
    };
    (cas, $atomic_type:ident, $int_type:ident, $align:expr) => {
        impl $atomic_type {
            #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
            #[inline]
            pub(crate) fn swap(&self, val: $int_type, _order: Ordering) -> $int_type {
                with(|| unsafe { self.v.get().replace(val) })
            }

            #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
            #[inline]
            pub(crate) fn compare_exchange(
                &self,
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                crate::utils::assert_compare_exchange_ordering(success, failure);
                with(|| unsafe {
                    let result = self.v.get().read();
                    if result == current {
                        self.v.get().write(new);
                        Ok(result)
                    } else {
                        Err(result)
                    }
                })
            }

            #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
            #[inline]
            pub(crate) fn compare_exchange_weak(
                &self,
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                self.compare_exchange(current, new, success, failure)
            }

            #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
            #[inline]
            pub(crate) fn fetch_add(&self, val: $int_type, _order: Ordering) -> $int_type {
                with(|| unsafe {
                    let result = self.v.get().read();
                    self.v.get().write(result.wrapping_add(val));
                    result
                })
            }

            #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, _order: Ordering) -> $int_type {
                with(|| unsafe {
                    let result = self.v.get().read();
                    self.v.get().write(result.wrapping_sub(val));
                    result
                })
            }

            #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, _order: Ordering) -> $int_type {
                with(|| unsafe {
                    let result = self.v.get().read();
                    self.v.get().write(result & val);
                    result
                })
            }

            #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, _order: Ordering) -> $int_type {
                with(|| unsafe {
                    let result = self.v.get().read();
                    self.v.get().write(!(result & val));
                    result
                })
            }

            #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, _order: Ordering) -> $int_type {
                with(|| unsafe {
                    let result = self.v.get().read();
                    self.v.get().write(result | val);
                    result
                })
            }

            #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, _order: Ordering) -> $int_type {
                with(|| unsafe {
                    let result = self.v.get().read();
                    self.v.get().write(result ^ val);
                    result
                })
            }

            #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, _order: Ordering) -> $int_type {
                with(|| unsafe {
                    let result = self.v.get().read();
                    self.v.get().write(core::cmp::max(result, val));
                    result
                })
            }

            #[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, _order: Ordering) -> $int_type {
                with(|| unsafe {
                    let result = self.v.get().read();
                    self.v.get().write(core::cmp::min(result, val));
                    result
                })
            }
        }
    };
}

#[cfg(target_pointer_width = "16")]
atomic_int!(load_store_atomic, AtomicIsize, isize, 2);
#[cfg(target_pointer_width = "16")]
atomic_int!(load_store_atomic, AtomicUsize, usize, 2);
#[cfg(target_pointer_width = "32")]
atomic_int!(load_store_atomic, AtomicIsize, isize, 4);
#[cfg(target_pointer_width = "32")]
atomic_int!(load_store_atomic, AtomicUsize, usize, 4);
#[cfg(target_pointer_width = "64")]
atomic_int!(load_store_atomic, AtomicIsize, isize, 8);
#[cfg(target_pointer_width = "64")]
atomic_int!(load_store_atomic, AtomicUsize, usize, 8);

atomic_int!(load_store_atomic, AtomicI8, i8, 1);
atomic_int!(load_store_atomic, AtomicU8, u8, 1);
atomic_int!(load_store_atomic, AtomicI16, i16, 2);
atomic_int!(load_store_atomic, AtomicU16, u16, 2);

#[cfg(not(target_pointer_width = "16"))]
#[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
atomic_int!(load_store_atomic, AtomicI32, i32, 4);
#[cfg(not(target_pointer_width = "16"))]
#[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
atomic_int!(load_store_atomic, AtomicU32, u32, 4);
#[cfg(target_pointer_width = "16")]
#[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
atomic_int!(load_store_critical_session, AtomicI32, i32, 4);
#[cfg(target_pointer_width = "16")]
#[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
atomic_int!(load_store_critical_session, AtomicU32, u32, 4);

#[cfg(target_pointer_width = "64")]
#[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
atomic_int!(load_store_atomic, AtomicI64, i64, 8);
#[cfg(target_pointer_width = "64")]
#[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
atomic_int!(load_store_atomic, AtomicU64, u64, 8);
#[cfg(not(target_pointer_width = "64"))]
#[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
atomic_int!(load_store_critical_session, AtomicI64, i64, 8);
#[cfg(not(target_pointer_width = "64"))]
#[cfg(any(test, portable_atomic_unsafe_assume_single_core))]
atomic_int!(load_store_critical_session, AtomicU64, u64, 8);

#[cfg(any(test, all(feature = "i128", portable_atomic_unsafe_assume_single_core)))]
atomic_int!(load_store_critical_session, AtomicI128, i128, 16);
#[cfg(any(test, all(feature = "i128", portable_atomic_unsafe_assume_single_core)))]
atomic_int!(load_store_critical_session, AtomicU128, u128, 16);

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_bool_single_thread!(test_atomic_bool, AtomicBool);
    test_atomic_ptr_single_thread!(test_atomic_ptr, AtomicPtr<u8>);
    test_atomic_int_single_thread!(test_atomic_i8, AtomicI8, i8);
    test_atomic_int_single_thread!(test_atomic_u8, AtomicU8, u8);
    test_atomic_int_single_thread!(test_atomic_i16, AtomicI16, i16);
    test_atomic_int_single_thread!(test_atomic_u16, AtomicU16, u16);
    test_atomic_int_single_thread!(test_atomic_i32, AtomicI32, i32);
    test_atomic_int_single_thread!(test_atomic_u32, AtomicU32, u32);
    test_atomic_int_single_thread!(test_atomic_i64, AtomicI64, i64);
    test_atomic_int_single_thread!(test_atomic_u64, AtomicU64, u64);
    test_atomic_int_single_thread!(test_atomic_isize, AtomicIsize, isize);
    test_atomic_int_single_thread!(test_atomic_usize, AtomicUsize, usize);
}
