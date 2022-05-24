// Atomic{I,U}128 implementation for x86_64 using cmpxchg16b (DWCAS).

#[path = "detect/cmpxchg16b.rs"]
mod detect;

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::{cell::UnsafeCell, sync::atomic::Ordering};

use crate::utils::{
    assert_compare_exchange_ordering, assert_load_ordering, assert_store_ordering,
    strongest_failure_ordering,
};

/// A 128-bit value represented as a pair of 64-bit values.
// This type is #[repr(C)], both fields have the same in-memory representation
// and are plain old datatypes, so access to the fields is always safe.
#[derive(Clone, Copy)]
#[repr(C)]
union U128 {
    u128: u128,
    pair: [u64; 2],
}

#[inline]
unsafe fn __cmpxchg16b(dst: *mut u128, old: u128, new: u128) -> (u128, bool) {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must guarantee that `dst` is valid for both writes and
    // reads, 16-byte aligned (required by cmpxchg16b), that there are no
    // concurrent non-atomic operations, and that the CPU supports cmpxchg16b.
    //
    // If the value at `dst` (destination operand) and rdx:rax are equal, the
    // 128-bit value in rcx:rbx is stored in the `dst`, otherwise the value at
    // `dst` is loaded to rdx:rax.
    //
    // The ZF flag is set if the value at `dst` and rdx:rax are equal,
    // otherwise it is cleared. Other flags are unaffected.
    //
    // Refs: https://www.felixcloutier.com/x86/cmpxchg8b:cmpxchg16b
    //
    // Generated asm: https://godbolt.org/z/xK3odG94j
    unsafe {
        let r: u8;
        let old: U128 = U128 { u128: old };
        let new: U128 = U128 { u128: new };
        let (prev_lo, prev_hi);
        asm!(
            // rbx is reserved by LLVM
            "xchg {rbx_tmp}, rbx",
            "lock cmpxchg16b xmmword ptr [rdi]",
            "sete r8b",
            "mov rbx, {rbx_tmp}",
            rbx_tmp = inout(reg) new.pair[0] => _,
            in("rdi") dst,
            inout("rax") old.pair[0] => prev_lo,
            inout("rdx") old.pair[1] => prev_hi,
            in("rcx") new.pair[1],
            out("r8b") r,
            // Should not use `preserves_flags` because cmpxchg16b modifies the ZF flag.
            options(nostack),
        );
        (U128 { pair: [prev_lo, prev_hi] }.u128, r != 0)
    }
}

#[inline]
unsafe fn cmpxchg16b(
    dst: *mut u128,
    old: u128,
    new: u128,
    success: Ordering,
    failure: Ordering,
) -> (u128, bool) {
    #[cfg_attr(
        any(all(test, portable_atomic_nightly), portable_atomic_cmpxchg16b_dynamic),
        target_feature(enable = "cmpxchg16b")
    )]
    #[cfg_attr(
        any(portable_atomic_target_feature_cmpxchg16b, target_feature = "cmpxchg16b"),
        inline
    )]
    #[cfg_attr(
        not(any(portable_atomic_target_feature_cmpxchg16b, target_feature = "cmpxchg16b")),
        inline(never)
    )]
    unsafe fn _cmpxchg16b(
        dst: *mut u128,
        old: u128,
        new: u128,
        success: Ordering,
        failure: Ordering,
    ) -> (u128, bool) {
        #[cfg(portable_atomic_cmpxchg16b_stdsimd)]
        // SAFETY: the caller must uphold the safety contract for `_cmpxchg16b`.
        unsafe {
            let res = core::arch::x86_64::cmpxchg16b(dst, old, new, success, failure);
            (res, res == old)
        }
        #[cfg(not(portable_atomic_cmpxchg16b_stdsimd))]
        // SAFETY: the caller must uphold the safety contract for `_cmpxchg16b`.
        unsafe {
            let _ = (success, failure);
            __cmpxchg16b(dst, old, new)
        }
    }

    #[cfg(any(portable_atomic_target_feature_cmpxchg16b, target_feature = "cmpxchg16b"))]
    {
        // SAFETY: the caller must guarantee that `dst` is valid for both writes and
        // reads, 16-byte aligned, that there are no concurrent non-atomic operations,
        // and cfg guarantees that cmpxchg16b is statically available.
        unsafe { _cmpxchg16b(dst, old, new, success, failure) }
    }
    #[cfg(portable_atomic_cmpxchg16b_dynamic)]
    #[cfg(not(any(portable_atomic_target_feature_cmpxchg16b, target_feature = "cmpxchg16b")))]
    {
        #[cold]
        unsafe fn _fallback(
            dst: *mut u128,
            old: u128,
            new: u128,
            success: Ordering,
            failure: Ordering,
        ) -> (u128, bool) {
            #[allow(clippy::cast_ptr_alignment)]
            // SAFETY: the caller must uphold the safety contract.
            unsafe {
                match (*(dst as *const super::fallback::AtomicU128))
                    .compare_exchange(old, new, success, failure)
                {
                    Ok(v) => (v, true),
                    Err(v) => (v, false),
                }
            }
        }
        // SAFETY: the caller must guarantee that `dst` is valid for both writes and
        // reads, 16-byte aligned, and that there are no different kinds of concurrent accesses.
        unsafe {
            ifunc!(unsafe fn(dst: *mut u128, old: u128, new: u128, success: Ordering, failure: Ordering) -> (u128, bool)
                = if detect::has_cmpxchg16b() { _cmpxchg16b } else { _fallback })
        }
    }
}

#[inline]
unsafe fn atomic_load(src: *mut u128, order: Ordering) -> u128 {
    let fail_order = strongest_failure_ordering(order);
    // SAFETY: the caller must uphold the safety contract for `atomic_load`.
    unsafe { cmpxchg16b(src, 0, 0, order, fail_order).0 }
}

#[inline]
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
            const IS_ALWAYS_LOCK_FREE: bool =
                cfg!(any(portable_atomic_target_feature_cmpxchg16b, target_feature = "cmpxchg16b"));
            #[inline]
            fn is_lock_free() -> bool {
                detect::has_cmpxchg16b()
            }
        }

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by atomic operations.
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
                assert_load_ordering(order);
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_load(self.v.get().cast(), order) as $int_type
                }
            }

            #[inline]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                assert_store_ordering(order);
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_store(self.v.get().cast(), val as u128, order)
                }
            }

            #[inline]
            pub(crate) fn swap(&self, val: $int_type, order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_swap(self.v.get().cast(), val as u128, order) as $int_type
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
                assert_compare_exchange_ordering(success, failure);
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
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
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_add(self.v.get().cast(), val as u128, order) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_sub(self.v.get().cast(), val as u128, order) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_and(self.v.get().cast(), val as u128, order) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_nand(self.v.get().cast(), val as u128, order) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_or(self.v.get().cast(), val as u128, order) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_xor(self.v.get().cast(), val as u128, order) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, order: Ordering) -> $int_type {
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
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
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

    test_atomic_int!(i128);
    test_atomic_int!(u128);

    #[test]
    #[cfg_attr(miri, ignore)] // Miri doesn't support inline assembly
    fn test() {
        assert!(std::is_x86_feature_detected!("cmpxchg16b"));
        assert!(AtomicI128::is_lock_free());
        assert!(AtomicU128::is_lock_free());
    }

    #[cfg(any(portable_atomic_target_feature_cmpxchg16b, target_feature = "cmpxchg16b"))]
    mod quickcheck {
        use crate::tests::helper::Align16;

        use super::super::*;

        ::quickcheck::quickcheck! {
            #[cfg_attr(miri, ignore)] // Miri doesn't support inline assembly
            #[cfg_attr(sanitize_thread, ignore)] // TSan doesn't know the semantics of the asm synchronization instructions.
            fn test(x: u128, y: u128, z: u128) -> bool {
                assert!(std::is_x86_feature_detected!("cmpxchg16b"));
                unsafe {
                    let a = Align16(UnsafeCell::new(x));
                    let (res, ok) = __cmpxchg16b(a.get(), y, z);
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
