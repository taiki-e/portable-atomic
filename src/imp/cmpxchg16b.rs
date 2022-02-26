// Atomic{I,U}128 implementation using cmpxchg16b.

#[path = "cmpxchg16b_detect.rs"]
mod detect;

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::{cell::UnsafeCell, sync::atomic::Ordering};

use crate::utils::{
    assert_compare_exchange_ordering, assert_load_ordering, assert_store_ordering,
    strongest_failure_ordering,
};

// Refs:
// - https://www.felixcloutier.com/x86/cmpxchg8b:cmpxchg16b
// - https://doc.rust-lang.org/nightly/reference/inline-assembly.html
//
// Generated asm:
// - https://godbolt.org/z/9frds7oav
#[inline(never)] // needed for correct codegen on release mode
#[cfg_attr(
    any(all(test, portable_atomic_nightly), portable_atomic_cmpxchg16b_dynamic),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn _cmpxchg16b(dst: *mut u128, old: u128, new: u128) -> (u128, bool) {
    #[derive(Clone, Copy)]
    #[repr(C)]
    struct U128 {
        /// The low-order 64 bits of a 128-bit value.
        lo: u64,
        /// The high-order 64 bits of a 128-bit value.
        hi: u64,
    }

    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `_cmpxchg16b`.
    // Should not use `preserves_flags` because cmpxchg16b may change the ZF flag.
    unsafe {
        let r: u8;
        let mut old: U128 = core::mem::transmute(old);
        let new: U128 = core::mem::transmute(new);
        asm!(
            // rbx is reserved by LLVM
            "xchg {b}, rbx",
            "lock cmpxchg16b xmmword ptr [rdi]",
            "sete {r}",
            "mov rbx, {b}",
            b = in(reg) new.lo,
            r = out(reg_byte) r,
            in("rcx") new.hi,
            in("rdi") dst,
            // If the value at `dst` is not the same as `old`,
            // the value at `dst` will be written to rdx:rax.
            inout("rax") old.lo,
            inout("rdx") old.hi,
            options(nostack),
        );
        (core::mem::transmute(old), r != 0)
    }
}

#[inline]
#[cfg_attr(
    any(all(test, portable_atomic_nightly), portable_atomic_cmpxchg16b_dynamic),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn cmpxchg16b(
    dst: *mut u128,
    old: u128,
    new: u128,
    success: Ordering,
    failure: Ordering,
) -> (u128, bool) {
    debug_assert!(detect::has_cmpxchg16b());
    // SAFETY: the caller must uphold the safety contract for `cmpxchg16b`.
    #[cfg(all(portable_atomic_cmpxchg16b_stdsimd, any(target_feature_cmpxchg16b, miri)))]
    unsafe {
        let res = core::arch::x86_64::cmpxchg16b(dst, old, new, success, failure);
        (res, res == old)
    }
    // SAFETY: the caller must uphold the safety contract for `cmpxchg16b`.
    #[cfg(not(all(portable_atomic_cmpxchg16b_stdsimd, any(target_feature_cmpxchg16b, miri))))]
    unsafe {
        let _ = (success, failure);
        _cmpxchg16b(dst, old, new)
    }
}

#[inline]
#[cfg_attr(
    any(all(test, portable_atomic_nightly), portable_atomic_cmpxchg16b_dynamic),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_load(dst: *mut u128, order: Ordering) -> u128 {
    let fail_order = strongest_failure_ordering(order);
    // SAFETY: the caller must uphold the safety contract for `atomic_load`.
    unsafe { cmpxchg16b(dst, 0, 0, order, fail_order).0 }
}

#[inline]
#[cfg_attr(
    any(all(test, portable_atomic_nightly), portable_atomic_cmpxchg16b_dynamic),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_store(dst: *mut u128, val: u128, order: Ordering) {
    let failure = strongest_failure_ordering(order);
    let mut old = val;
    let new = val;
    loop {
        // SAFETY: the caller must uphold the safety contract for `atomic_store`.
        match unsafe { atomic_compare_exchange(dst, old, new, order, failure) } {
            Ok(_) => return,
            Err(x) => old = x,
        }
    }
}

#[inline]
#[cfg_attr(
    any(all(test, portable_atomic_nightly), portable_atomic_cmpxchg16b_dynamic),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_swap(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    let failure = strongest_failure_ordering(order);
    let mut old = val;
    let new = val;
    loop {
        // SAFETY: the caller must uphold the safety contract for `atomic_swap`.
        match unsafe { atomic_compare_exchange(dst, old, new, order, failure) } {
            Ok(old) => return old,
            Err(x) => old = x,
        }
    }
}

#[inline]
#[cfg_attr(
    any(all(test, portable_atomic_nightly), portable_atomic_cmpxchg16b_dynamic),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_compare_exchange(
    dst: *mut u128,
    old: u128,
    new: u128,
    success: Ordering,
    failure: Ordering,
) -> Result<u128, u128> {
    // SAFETY: the caller must uphold the safety contract for `atomic_compare_exchange`.
    let (res, ok) = unsafe { cmpxchg16b(dst, old, new, success, failure) };
    if ok {
        Ok(res)
    } else {
        Err(res)
    }
}

#[inline]
#[cfg_attr(
    any(all(test, portable_atomic_nightly), portable_atomic_cmpxchg16b_dynamic),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_add(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    let mut old = 0;
    let mut new = val;
    let failure = strongest_failure_ordering(order);
    loop {
        // SAFETY: the caller must uphold the safety contract for `atomic_add`.
        match unsafe { atomic_compare_exchange(dst, old, new, order, failure) } {
            Ok(old) => return old,
            Err(x) => {
                old = x;
                new = x.wrapping_add(val);
            }
        }
    }
}

#[inline]
#[cfg_attr(
    any(all(test, portable_atomic_nightly), portable_atomic_cmpxchg16b_dynamic),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_sub(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    let mut old = val;
    let mut new = 0;
    let failure = strongest_failure_ordering(order);
    loop {
        // SAFETY: the caller must uphold the safety contract for `atomic_sub`.
        match unsafe { atomic_compare_exchange(dst, old, new, order, failure) } {
            Ok(old) => return old,
            Err(x) => {
                old = x;
                new = x.wrapping_sub(val);
            }
        }
    }
}

#[inline]
#[cfg_attr(
    any(all(test, portable_atomic_nightly), portable_atomic_cmpxchg16b_dynamic),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_and(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    let mut old = 0;
    let mut new = 0;
    let failure = strongest_failure_ordering(order);
    loop {
        // SAFETY: the caller must uphold the safety contract for `atomic_and`.
        match unsafe { atomic_compare_exchange(dst, old, new, order, failure) } {
            Ok(old) => return old,
            Err(x) => {
                old = x;
                new = x & val;
            }
        }
    }
}

#[inline]
#[cfg_attr(
    any(all(test, portable_atomic_nightly), portable_atomic_cmpxchg16b_dynamic),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_nand(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    let mut old = 0;
    let mut new = !0;
    let failure = strongest_failure_ordering(order);
    loop {
        // SAFETY: the caller must uphold the safety contract for `atomic_nand`.
        match unsafe { atomic_compare_exchange(dst, old, new, order, failure) } {
            Ok(old) => return old,
            Err(x) => {
                old = x;
                new = !(x & val);
            }
        }
    }
}

#[inline]
#[cfg_attr(
    any(all(test, portable_atomic_nightly), portable_atomic_cmpxchg16b_dynamic),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_or(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    let mut old = 0;
    let mut new = val;
    let failure = strongest_failure_ordering(order);
    loop {
        // SAFETY: the caller must uphold the safety contract for `atomic_or`.
        match unsafe { atomic_compare_exchange(dst, old, new, order, failure) } {
            Ok(old) => return old,
            Err(x) => {
                old = x;
                new = x | val;
            }
        }
    }
}

#[inline]
#[cfg_attr(
    any(all(test, portable_atomic_nightly), portable_atomic_cmpxchg16b_dynamic),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_xor(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    let mut old = 0;
    let mut new = val;
    let failure = strongest_failure_ordering(order);
    loop {
        // SAFETY: the caller must uphold the safety contract for `atomic_xor`.
        match unsafe { atomic_compare_exchange(dst, old, new, order, failure) } {
            Ok(old) => return old,
            Err(x) => {
                old = x;
                new = x ^ val;
            }
        }
    }
}

macro_rules! atomic128 {
    ($atomic_type:ident, $int_type:ident) => {
        #[repr(C, align(16))]
        pub(crate) struct $atomic_type {
            v: UnsafeCell<$int_type>,
        }

        impl crate::utils::AtomicRepr for $atomic_type {
            const IS_ALWAYS_LOCK_FREE: bool = cfg!(target_feature_cmpxchg16b);
            #[inline]
            fn is_lock_free() -> bool {
                detect::has_cmpxchg16b()
            }
        }

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by atomic intrinsics.
        unsafe impl Sync for $atomic_type {}

        impl $atomic_type {
            #[inline]
            pub(crate) const fn new(v: $int_type) -> Self {
                Self { v: UnsafeCell::new(v) }
            }

            #[inline]
            pub(crate) fn get_mut(&mut self) -> &mut $int_type {
                self.v.get_mut()
            }

            #[inline]
            pub(crate) fn into_inner(self) -> $int_type {
                self.v.into_inner()
            }

            #[inline]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                if detect::has_cmpxchg16b() {
                    assert_load_ordering(order);
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is available.
                    unsafe {
                        atomic_load(self.v.get().cast(), order) as $int_type
                    }
                } else {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is not available.
                    #[cfg(portable_atomic_cmpxchg16b_dynamic)]
                    unsafe {
                        self.as_fallback().load(order)
                    }
                    #[cfg(not(portable_atomic_cmpxchg16b_dynamic))]
                    unreachable!()
                }
            }

            #[inline]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                if detect::has_cmpxchg16b() {
                    assert_store_ordering(order);
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is available.
                    unsafe {
                        atomic_store(self.v.get().cast(), val as u128, order)
                    }
                } else {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is not available.
                    #[cfg(portable_atomic_cmpxchg16b_dynamic)]
                    unsafe {
                        self.as_fallback().store(val, order);
                    }
                    #[cfg(not(portable_atomic_cmpxchg16b_dynamic))]
                    unreachable!()
                }
            }

            #[inline]
            pub(crate) fn swap(&self, val: $int_type, order: Ordering) -> $int_type {
                if detect::has_cmpxchg16b() {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is available.
                    unsafe {
                        atomic_swap(self.v.get().cast(), val as u128, order) as $int_type
                    }
                } else {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is not available.
                    #[cfg(portable_atomic_cmpxchg16b_dynamic)]
                    unsafe {
                        self.as_fallback().swap(val, order)
                    }
                    #[cfg(not(portable_atomic_cmpxchg16b_dynamic))]
                    unreachable!()
                }
            }

            #[inline]
            pub(crate) fn compare_exchange(
                &self,
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                if detect::has_cmpxchg16b() {
                    assert_compare_exchange_ordering(success, failure);
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is available.
                    unsafe {
                        match atomic_compare_exchange(
                            self.v.get().cast(),
                            current as u128,
                            new as u128,
                            success,
                            failure,
                        ) {
                            Ok(v) => Ok(v as $int_type),
                            Err(v) => Err(v as $int_type),
                        }
                    }
                } else {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is not available.
                    #[cfg(portable_atomic_cmpxchg16b_dynamic)]
                    unsafe {
                        self.as_fallback().compare_exchange(current, new, success, failure)
                    }
                    #[cfg(not(portable_atomic_cmpxchg16b_dynamic))]
                    unreachable!()
                }
            }

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

            #[inline]
            pub(crate) fn fetch_add(&self, val: $int_type, order: Ordering) -> $int_type {
                if detect::has_cmpxchg16b() {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is available.
                    unsafe {
                        atomic_add(self.v.get().cast(), val as u128, order) as $int_type
                    }
                } else {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is not available.
                    #[cfg(portable_atomic_cmpxchg16b_dynamic)]
                    unsafe {
                        self.as_fallback().fetch_add(val, order)
                    }
                    #[cfg(not(portable_atomic_cmpxchg16b_dynamic))]
                    unreachable!()
                }
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, order: Ordering) -> $int_type {
                if detect::has_cmpxchg16b() {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is available.
                    unsafe {
                        atomic_sub(self.v.get().cast(), val as u128, order) as $int_type
                    }
                } else {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is not available.
                    #[cfg(portable_atomic_cmpxchg16b_dynamic)]
                    unsafe {
                        self.as_fallback().fetch_sub(val, order)
                    }
                    #[cfg(not(portable_atomic_cmpxchg16b_dynamic))]
                    unreachable!()
                }
            }

            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, order: Ordering) -> $int_type {
                if detect::has_cmpxchg16b() {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is available.
                    unsafe {
                        atomic_and(self.v.get().cast(), val as u128, order) as $int_type
                    }
                } else {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is not available.
                    #[cfg(portable_atomic_cmpxchg16b_dynamic)]
                    unsafe {
                        self.as_fallback().fetch_and(val, order)
                    }
                    #[cfg(not(portable_atomic_cmpxchg16b_dynamic))]
                    unreachable!()
                }
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, order: Ordering) -> $int_type {
                if detect::has_cmpxchg16b() {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is available.
                    unsafe {
                        atomic_nand(self.v.get().cast(), val as u128, order) as $int_type
                    }
                } else {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is not available.
                    #[cfg(portable_atomic_cmpxchg16b_dynamic)]
                    unsafe {
                        self.as_fallback().fetch_nand(val, order)
                    }
                    #[cfg(not(portable_atomic_cmpxchg16b_dynamic))]
                    unreachable!()
                }
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, order: Ordering) -> $int_type {
                if detect::has_cmpxchg16b() {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is available.
                    unsafe {
                        atomic_or(self.v.get().cast(), val as u128, order) as $int_type
                    }
                } else {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is not available.
                    #[cfg(portable_atomic_cmpxchg16b_dynamic)]
                    unsafe {
                        self.as_fallback().fetch_or(val, order)
                    }
                    #[cfg(not(portable_atomic_cmpxchg16b_dynamic))]
                    unreachable!()
                }
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, order: Ordering) -> $int_type {
                if detect::has_cmpxchg16b() {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is available.
                    unsafe {
                        atomic_xor(self.v.get().cast(), val as u128, order) as $int_type
                    }
                } else {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is not available.
                    #[cfg(portable_atomic_cmpxchg16b_dynamic)]
                    unsafe {
                        self.as_fallback().fetch_xor(val, order)
                    }
                    #[cfg(not(portable_atomic_cmpxchg16b_dynamic))]
                    unreachable!()
                }
            }

            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, order: Ordering) -> $int_type {
                if detect::has_cmpxchg16b() {
                    let mut old = $int_type::MIN;
                    let mut new = val;
                    let failure = strongest_failure_ordering(order);
                    loop {
                        match self.compare_exchange_weak(old, new, order, failure) {
                            Ok(old) => return old,
                            Err(x) => {
                                old = x;
                                new = core::cmp::max(x, val);
                            }
                        }
                    }
                } else {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is not available.
                    #[cfg(portable_atomic_cmpxchg16b_dynamic)]
                    unsafe {
                        self.as_fallback().fetch_max(val, order)
                    }
                    #[cfg(not(portable_atomic_cmpxchg16b_dynamic))]
                    unreachable!()
                }
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
                if detect::has_cmpxchg16b() {
                    let mut old = $int_type::MAX;
                    let mut new = val;
                    let failure = strongest_failure_ordering(order);
                    loop {
                        match self.compare_exchange_weak(old, new, order, failure) {
                            Ok(old) => return old,
                            Err(x) => {
                                old = x;
                                new = core::cmp::min(x, val);
                            }
                        }
                    }
                } else {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference,
                    // and we've checked that cmpxchg16b is not available.
                    #[cfg(portable_atomic_cmpxchg16b_dynamic)]
                    unsafe {
                        self.as_fallback().fetch_min(val, order)
                    }
                    #[cfg(not(portable_atomic_cmpxchg16b_dynamic))]
                    unreachable!()
                }
            }

            /// # Safety
            ///
            /// This can only be called safely if cmpxchg16b is not available.
            #[cfg(portable_atomic_cmpxchg16b_dynamic)]
            #[inline]
            unsafe fn as_fallback(&self) -> &super::fallback::$atomic_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: $atomic_type and fallback::$atomic_type have the same layout,
                // and the caller must guarantee that lock and atomic are not mixed.
                unsafe {
                    &*(self as *const $atomic_type as *const super::fallback::$atomic_type)
                }
            }
        }
    };
}

atomic128!(AtomicI128, i128);
atomic128!(AtomicU128, u128);

#[allow(clippy::undocumented_unsafe_blocks, clippy::wildcard_imports)]
#[cfg(test)]
mod tests {
    use super::*;
    use crate::utils::AtomicRepr;

    test_atomic_int!(test_atomic_i128, AtomicI128, i128);
    test_atomic_int!(test_atomic_u128, AtomicU128, u128);

    #[test]
    #[cfg_attr(miri, ignore)] // Miri doesn't support inline assembly
    fn test() {
        assert!(std::is_x86_feature_detected!("cmpxchg16b"));
        assert!(AtomicI128::is_lock_free());
        assert!(AtomicU128::is_lock_free());
    }

    #[cfg(target_feature_cmpxchg16b)]
    mod quickcheck {
        use crate::tests::helper::Align16;

        use super::super::*;

        ::quickcheck::quickcheck! {
            #[cfg_attr(miri, ignore)] // Miri doesn't support inline assembly
            #[cfg_attr(sanitize_thread, ignore)] // TSan doesn't know the semantic of the asm synchronization instructions.
            fn test(x: u128, y: u128, z: u128) -> bool {
                assert!(std::is_x86_feature_detected!("cmpxchg16b"));
                unsafe {
                    let a = Align16(UnsafeCell::new(x));
                    let (res, ok) = _cmpxchg16b(a.get(), y, z);
                    if x == y {
                        assert!(ok);
                        assert_eq!(res, x);
                        assert_eq!(*a.get(), z);
                    } else {
                        assert!(!ok);
                        assert_eq!(res, x);
                        assert_eq!(*a.get(), x);
                    }

                    #[cfg(portable_atomic_nightly)]
                    let b = Align16(UnsafeCell::new(x));
                    #[cfg(portable_atomic_nightly)]
                    assert_eq!(
                        res,
                        core::arch::x86_64::cmpxchg16b(
                            b.get(),
                            y,
                            z,
                            Ordering::SeqCst,
                            Ordering::SeqCst,
                        ),
                    );
                    #[cfg(portable_atomic_nightly)]
                    assert_eq!(*a.get(), *b.get());
                }
                true
            }
        }
    }
}
