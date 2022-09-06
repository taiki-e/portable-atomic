// Critical section based fallback implementations
//
// Critical session (disabling interrupts) based fallback is not sound on multi-core systems.
// Also, this uses privileged instructions to disable interrupts, so it usually
// doesn't work on unprivileged mode. Using this fallback in an environment where privileged
// instructions are not available is also usually considered **unsound**,
// although the details are system-dependent.
//
// Therefore, this implementation will only be enabled in one of the following cases:
//
// - When the user explicitly declares that the system is single-core and that
//   privileged instructions are available using an unsafe cfg.
// - When we can safely assume that the system is single-core and that
//   privileged instructions are available on the system.
//
// AVR, which is single core[^avr1] and LLVM also generates code that disables
// interrupts [^avr2] in atomic ops by default, is considered the latter.
// MSP430 as well.
//
// [^avr1]: https://github.com/llvm/llvm-project/blob/llvmorg-15.0.0/llvm/lib/Target/AVR/AVRExpandPseudoInsts.cpp#L1008
// [^avr2]: https://github.com/llvm/llvm-project/blob/llvmorg-15.0.0/llvm/test/CodeGen/AVR/atomics/load16.ll#L5

// On some platforms, atomic load/store can be implemented in a more efficient
// way than disabling interrupts.
//
// Note: On single-core systems, it is okay to use critical session-based
// CAS together with atomic load/store. The load/store will not be
// called while interrupts are disabled, and since the load/store is
// atomic, it is not affected by interrupts even if interrupts are enabled.
#[cfg(not(target_arch = "avr"))]
use arch::atomic;

#[cfg_attr(portable_atomic_armv6m, path = "armv6m.rs")]
#[cfg_attr(
    all(
        target_arch = "arm",
        not(any(target_feature = "v6", portable_atomic_target_feature = "v6"))
    ),
    path = "armv4t.rs"
)]
#[cfg_attr(target_arch = "avr", path = "avr.rs")]
#[cfg_attr(target_arch = "msp430", path = "msp430.rs")]
#[cfg_attr(any(target_arch = "riscv32", target_arch = "riscv64"), path = "riscv.rs")]
mod arch;

use core::{cell::UnsafeCell, sync::atomic::Ordering};

// Consider atomic operations based on disabling interrupts on single-core
// systems are lock-free. (We consider the pre-v6 ARM Linux's atomic operations
// provided in a similar way by the Linux kernel to be lock-free.)
const IS_ALWAYS_LOCK_FREE: bool = true;

#[inline]
fn with<F, R>(f: F) -> R
where
    F: FnOnce() -> R,
{
    // Get current interrupt state and disable interrupts
    let state = arch::disable();

    let r = f();

    // Restore interrupt state
    // SAFETY: the state was retrieved by the previous `disable`.
    unsafe { arch::restore(state) }

    r
}

#[repr(C, align(1))]
pub(crate) struct AtomicBool {
    v: UnsafeCell<u8>,
}

// Send is implicitly implemented.
// SAFETY: any data races are prevented by disabling interrupts or
// atomic intrinsics (see module-level comments) and the raw pointer is
// valid because we got it from a reference.
unsafe impl Sync for AtomicBool {}

impl AtomicBool {
    #[inline]
    pub(crate) const fn new(v: bool) -> Self {
        Self { v: UnsafeCell::new(v as u8) }
    }

    #[inline]
    pub(crate) fn is_lock_free() -> bool {
        Self::is_always_lock_free()
    }
    #[inline]
    pub(crate) const fn is_always_lock_free() -> bool {
        IS_ALWAYS_LOCK_FREE
    }

    #[inline]
    pub(crate) fn get_mut(&mut self) -> &mut bool {
        // SAFETY: the mutable reference guarantees unique ownership.
        unsafe { &mut *(self.v.get() as *mut bool) }
    }

    #[inline]
    pub(crate) fn into_inner(self) -> bool {
        self.v.into_inner() != 0
    }

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn load(&self, order: Ordering) -> bool {
        crate::utils::assert_load_ordering(order);
        #[deny(unreachable_patterns)]
        match () {
            #[cfg(not(target_arch = "avr"))]
            // SAFETY: any data races are prevented by atomic intrinsics (see
            // module-level comments) and the raw pointer is valid because we got it
            // from a reference.
            () => unsafe { (*(self as *const Self as *const atomic::AtomicBool)).load(order) },
            #[cfg(target_arch = "avr")]
            // SAFETY: any data races are prevented by disabling interrupts (see
            // module-level comments) and the raw pointer is valid because we got it
            // from a reference.
            () => with(|| unsafe { self.v.get().read() != 0 }),
        }
    }

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn store(&self, val: bool, order: Ordering) {
        crate::utils::assert_store_ordering(order);
        #[deny(unreachable_patterns)]
        match () {
            #[cfg(not(target_arch = "avr"))]
            // SAFETY: any data races are prevented by atomic intrinsics (see
            // module-level comments) and the raw pointer is valid because we got it
            // from a reference.
            () => unsafe {
                (*(self as *const Self as *const atomic::AtomicBool)).store(val, order);
            },
            #[cfg(target_arch = "avr")]
            // SAFETY: any data races are prevented by disabling interrupts (see
            // module-level comments) and the raw pointer is valid because we got it
            // from a reference.
            () => with(|| unsafe { self.v.get().write(val as u8) }),
        }
    }

    #[inline]
    pub(crate) fn swap(&self, val: bool, _order: Ordering) -> bool {
        // SAFETY: any data races are prevented by disabling interrupts (see
        // module-level comments) and the raw pointer is valid because we got it
        // from a reference.
        with(|| unsafe { self.v.get().replace(val as u8) != 0 })
    }

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn compare_exchange(
        &self,
        current: bool,
        new: bool,
        success: Ordering,
        failure: Ordering,
    ) -> Result<bool, bool> {
        crate::utils::assert_compare_exchange_ordering(success, failure);
        // SAFETY: any data races are prevented by disabling interrupts (see
        // module-level comments) and the raw pointer is valid because we got it
        // from a reference.
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

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn compare_exchange_weak(
        &self,
        current: bool,
        new: bool,
        success: Ordering,
        failure: Ordering,
    ) -> Result<bool, bool> {
        self.compare_exchange(current, new, success, failure)
    }

    #[inline]
    pub(crate) fn fetch_and(&self, val: bool, _order: Ordering) -> bool {
        // SAFETY: any data races are prevented by disabling interrupts (see
        // module-level comments) and the raw pointer is valid because we got it
        // from a reference.
        with(|| unsafe {
            let result = self.v.get().read();
            self.v.get().write(result & val as u8);
            result != 0
        })
    }

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

    #[inline]
    pub(crate) fn fetch_or(&self, val: bool, _order: Ordering) -> bool {
        // SAFETY: any data races are prevented by disabling interrupts (see
        // module-level comments) and the raw pointer is valid because we got it
        // from a reference.
        with(|| unsafe {
            let result = self.v.get().read();
            self.v.get().write(result | val as u8);
            result != 0
        })
    }

    #[inline]
    pub(crate) fn fetch_xor(&self, val: bool, _order: Ordering) -> bool {
        // SAFETY: any data races are prevented by disabling interrupts (see
        // module-level comments) and the raw pointer is valid because we got it
        // from a reference.
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
#[cfg_attr(target_pointer_width = "128", repr(C, align(16)))]
pub(crate) struct AtomicPtr<T> {
    p: UnsafeCell<*mut T>,
}

// SAFETY: any data races are prevented by disabling interrupts or
// atomic intrinsics (see module-level comments) and the raw pointer is
// valid because we got it from a reference.
unsafe impl<T> Send for AtomicPtr<T> {}
// SAFETY: any data races are prevented by disabling interrupts or
// atomic intrinsics (see module-level comments) and the raw pointer is
// valid because we got it from a reference.
unsafe impl<T> Sync for AtomicPtr<T> {}

impl<T> AtomicPtr<T> {
    #[inline]
    pub(crate) const fn new(p: *mut T) -> Self {
        Self { p: UnsafeCell::new(p) }
    }

    #[inline]
    pub(crate) fn is_lock_free() -> bool {
        Self::is_always_lock_free()
    }
    #[inline]
    pub(crate) const fn is_always_lock_free() -> bool {
        IS_ALWAYS_LOCK_FREE
    }

    #[inline]
    pub(crate) fn get_mut(&mut self) -> &mut *mut T {
        // SAFETY: the mutable reference guarantees unique ownership.
        // (UnsafeCell::get_mut requires Rust 1.50)
        unsafe { &mut *self.p.get() }
    }

    #[inline]
    pub(crate) fn into_inner(self) -> *mut T {
        self.p.into_inner()
    }

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn load(&self, order: Ordering) -> *mut T {
        crate::utils::assert_load_ordering(order);
        #[deny(unreachable_patterns)]
        match () {
            #[cfg(not(target_arch = "avr"))]
            // SAFETY: any data races are prevented by atomic intrinsics (see
            // module-level comments) and the raw pointer is valid because we got it
            // from a reference.
            () => unsafe { (*(self as *const Self as *const atomic::AtomicPtr<T>)).load(order) },
            #[cfg(target_arch = "avr")]
            // SAFETY: any data races are prevented by disabling interrupts (see
            // module-level comments) and the raw pointer is valid because we got it
            // from a reference.
            () => with(|| unsafe { self.p.get().read() }),
        }
    }

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
        crate::utils::assert_store_ordering(order);
        #[deny(unreachable_patterns)]
        match () {
            #[cfg(not(target_arch = "avr"))]
            // SAFETY: any data races are prevented by atomic intrinsics (see
            // module-level comments) and the raw pointer is valid because we got it
            // from a reference.
            () => unsafe {
                (*(self as *const Self as *const atomic::AtomicPtr<T>)).store(ptr, order);
            },
            #[cfg(target_arch = "avr")]
            // SAFETY: any data races are prevented by disabling interrupts (see
            // module-level comments) and the raw pointer is valid because we got it
            // from a reference.
            () => with(|| unsafe { self.p.get().write(ptr) }),
        }
    }

    #[inline]
    pub(crate) fn swap(&self, ptr: *mut T, _order: Ordering) -> *mut T {
        // SAFETY: any data races are prevented by disabling interrupts (see
        // module-level comments) and the raw pointer is valid because we got it
        // from a reference.
        with(|| unsafe { self.p.get().replace(ptr) })
    }

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn compare_exchange(
        &self,
        current: *mut T,
        new: *mut T,
        success: Ordering,
        failure: Ordering,
    ) -> Result<*mut T, *mut T> {
        crate::utils::assert_compare_exchange_ordering(success, failure);
        // SAFETY: any data races are prevented by disabling interrupts (see
        // module-level comments) and the raw pointer is valid because we got it
        // from a reference.
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

    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
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

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by disabling interrupts or
        // atomic intrinsics (see module-level comments) and the raw pointer is
        // valid because we got it from a reference.
        unsafe impl Sync for $atomic_type {}

        impl $atomic_type {
            #[inline]
            pub(crate) const fn new(v: $int_type) -> Self {
                Self { v: UnsafeCell::new(v) }
            }

            #[inline]
            pub(crate) fn is_lock_free() -> bool {
                Self::is_always_lock_free()
            }
            #[inline]
            pub(crate) const fn is_always_lock_free() -> bool {
                IS_ALWAYS_LOCK_FREE
            }

            #[inline]
            pub(crate) fn get_mut(&mut self) -> &mut $int_type {
                // SAFETY: the mutable reference guarantees unique ownership.
                // (UnsafeCell::get_mut requires Rust 1.50)
                unsafe { &mut *self.v.get() }
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
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                crate::utils::assert_load_ordering(order);
                #[deny(unreachable_patterns)]
                match () {
                    #[cfg(not(target_arch = "avr"))]
                    // SAFETY: any data races are prevented by atomic intrinsics (see
                    // module-level comments) and the raw pointer is valid because we got it
                    // from a reference.
                    () => unsafe {
                        (*(self as *const Self as *const atomic::$atomic_type)).load(order)
                    },
                    #[cfg(target_arch = "avr")]
                    // SAFETY: any data races are prevented by disabling interrupts (see
                    // module-level comments) and the raw pointer is valid because we got it
                    // from a reference.
                    () => with(|| unsafe { self.v.get().read() }),
                }
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                #[deny(unreachable_patterns)]
                match () {
                    #[cfg(not(target_arch = "avr"))]
                    // SAFETY: any data races are prevented by atomic intrinsics (see
                    // module-level comments) and the raw pointer is valid because we got it
                    // from a reference.
                    () => unsafe {
                        (*(self as *const Self as *const atomic::$atomic_type)).store(val, order);
                    },
                    #[cfg(target_arch = "avr")]
                    // SAFETY: any data races are prevented by disabling interrupts (see
                    // module-level comments) and the raw pointer is valid because we got it
                    // from a reference.
                    () => with(|| unsafe { self.v.get().write(val) }),
                }
            }
        }
    };
    (load_store_critical_session, $atomic_type:ident, $int_type:ident, $align:expr) => {
        atomic_int!(base, $atomic_type, $int_type, $align);
        atomic_int!(cas, $atomic_type, $int_type, $align);
        impl $atomic_type {
            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                crate::utils::assert_load_ordering(order);
                // SAFETY: any data races are prevented by disabling interrupts (see
                // module-level comments) and the raw pointer is valid because we got it
                // from a reference.
                with(|| unsafe { self.v.get().read() })
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                // SAFETY: any data races are prevented by disabling interrupts (see
                // module-level comments) and the raw pointer is valid because we got it
                // from a reference.
                with(|| unsafe { self.v.get().write(val) });
            }
        }
    };
    (cas, $atomic_type:ident, $int_type:ident, $align:expr) => {
        impl $atomic_type {
            #[inline]
            pub(crate) fn swap(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by disabling interrupts (see
                // module-level comments) and the raw pointer is valid because we got it
                // from a reference.
                with(|| unsafe { self.v.get().replace(val) })
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn compare_exchange(
                &self,
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                crate::utils::assert_compare_exchange_ordering(success, failure);
                // SAFETY: any data races are prevented by disabling interrupts (see
                // module-level comments) and the raw pointer is valid because we got it
                // from a reference.
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

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn compare_exchange_weak(
                &self,
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                self.compare_exchange(current, new, success, failure)
            }

            #[inline]
            pub(crate) fn fetch_add(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by disabling interrupts (see
                // module-level comments) and the raw pointer is valid because we got it
                // from a reference.
                with(|| unsafe {
                    let result = self.v.get().read();
                    self.v.get().write(result.wrapping_add(val));
                    result
                })
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by disabling interrupts (see
                // module-level comments) and the raw pointer is valid because we got it
                // from a reference.
                with(|| unsafe {
                    let result = self.v.get().read();
                    self.v.get().write(result.wrapping_sub(val));
                    result
                })
            }

            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by disabling interrupts (see
                // module-level comments) and the raw pointer is valid because we got it
                // from a reference.
                with(|| unsafe {
                    let result = self.v.get().read();
                    self.v.get().write(result & val);
                    result
                })
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by disabling interrupts (see
                // module-level comments) and the raw pointer is valid because we got it
                // from a reference.
                with(|| unsafe {
                    let result = self.v.get().read();
                    self.v.get().write(!(result & val));
                    result
                })
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by disabling interrupts (see
                // module-level comments) and the raw pointer is valid because we got it
                // from a reference.
                with(|| unsafe {
                    let result = self.v.get().read();
                    self.v.get().write(result | val);
                    result
                })
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by disabling interrupts (see
                // module-level comments) and the raw pointer is valid because we got it
                // from a reference.
                with(|| unsafe {
                    let result = self.v.get().read();
                    self.v.get().write(result ^ val);
                    result
                })
            }

            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by disabling interrupts (see
                // module-level comments) and the raw pointer is valid because we got it
                // from a reference.
                with(|| unsafe {
                    let result = self.v.get().read();
                    self.v.get().write(core::cmp::max(result, val));
                    result
                })
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by disabling interrupts (see
                // module-level comments) and the raw pointer is valid because we got it
                // from a reference.
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
#[cfg(target_pointer_width = "128")]
atomic_int!(load_store_atomic, AtomicIsize, isize, 16);
#[cfg(target_pointer_width = "128")]
atomic_int!(load_store_atomic, AtomicUsize, usize, 16);

atomic_int!(load_store_atomic, AtomicI8, i8, 1);
atomic_int!(load_store_atomic, AtomicU8, u8, 1);
atomic_int!(load_store_atomic, AtomicI16, i16, 2);
atomic_int!(load_store_atomic, AtomicU16, u16, 2);

#[cfg(not(target_pointer_width = "16"))]
atomic_int!(load_store_atomic, AtomicI32, i32, 4);
#[cfg(not(target_pointer_width = "16"))]
atomic_int!(load_store_atomic, AtomicU32, u32, 4);
#[cfg(target_pointer_width = "16")]
#[cfg(any(test, feature = "fallback"))]
atomic_int!(load_store_critical_session, AtomicI32, i32, 4);
#[cfg(target_pointer_width = "16")]
#[cfg(any(test, feature = "fallback"))]
atomic_int!(load_store_critical_session, AtomicU32, u32, 4);

#[cfg(not(any(target_pointer_width = "16", target_pointer_width = "32")))]
atomic_int!(load_store_atomic, AtomicI64, i64, 8);
#[cfg(not(any(target_pointer_width = "16", target_pointer_width = "32")))]
atomic_int!(load_store_atomic, AtomicU64, u64, 8);
#[cfg(any(target_pointer_width = "16", target_pointer_width = "32"))]
#[cfg(any(test, feature = "fallback"))]
atomic_int!(load_store_critical_session, AtomicI64, i64, 8);
#[cfg(any(target_pointer_width = "16", target_pointer_width = "32"))]
#[cfg(any(test, feature = "fallback"))]
atomic_int!(load_store_critical_session, AtomicU64, u64, 8);

#[cfg(any(test, feature = "fallback"))]
atomic_int!(load_store_critical_session, AtomicI128, i128, 16);
#[cfg(any(test, feature = "fallback"))]
atomic_int!(load_store_critical_session, AtomicU128, u128, 16);

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_bool_single_thread!();
    test_atomic_ptr_single_thread!();
    test_atomic_int_single_thread!(i8);
    test_atomic_int_single_thread!(u8);
    test_atomic_int_single_thread!(i16);
    test_atomic_int_single_thread!(u16);
    test_atomic_int_single_thread!(i32);
    test_atomic_int_single_thread!(u32);
    test_atomic_int_single_thread!(i64);
    test_atomic_int_single_thread!(u64);
    test_atomic_int_single_thread!(isize);
    test_atomic_int_single_thread!(usize);
}
