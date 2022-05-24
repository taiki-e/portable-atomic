// Atomic{I,U}128 implementation for s390x using core::intrinsics.
//
// s390x supports 128-bit atomic load/store/cmpxchg:
// https://github.com/llvm/llvm-project/commit/a11f63a952664f700f076fd754476a2b9eb158cc
//
// Note that LLVM currently generates libcalls for other operations:
// https://godbolt.org/z/6E6fchxvP

use core::{
    cell::UnsafeCell,
    intrinsics,
    sync::atomic::Ordering::{self, AcqRel, Acquire, Relaxed, Release, SeqCst},
};

use crate::utils::{
    assert_compare_exchange_ordering, assert_load_ordering, assert_store_ordering,
    strongest_failure_ordering,
};

#[inline]
unsafe fn atomic_load(dst: *mut u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_load`.
    unsafe {
        match order {
            Acquire => intrinsics::atomic_load_acq(dst),
            Relaxed => intrinsics::atomic_load_relaxed(dst),
            SeqCst => intrinsics::atomic_load(dst),
            _ => unreachable!("{:?}", order),
        }
    }
}

#[inline]
unsafe fn atomic_store(dst: *mut u128, val: u128, order: Ordering) {
    // SAFETY: the caller must uphold the safety contract for `atomic_store`.
    unsafe {
        match order {
            Release => intrinsics::atomic_store_rel(dst, val),
            Relaxed => intrinsics::atomic_store_relaxed(dst, val),
            SeqCst => intrinsics::atomic_store(dst, val),
            _ => unreachable!("{:?}", order),
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
    let (val, ok) = unsafe {
        match (success, failure) {
            (Acquire, Acquire) => intrinsics::atomic_cxchg_acq(dst, old, new),
            (Release, Relaxed) => intrinsics::atomic_cxchg_rel(dst, old, new),
            (AcqRel, Acquire) => intrinsics::atomic_cxchg_acqrel(dst, old, new),
            (Relaxed, Relaxed) => intrinsics::atomic_cxchg_relaxed(dst, old, new),
            (SeqCst, SeqCst) => intrinsics::atomic_cxchg(dst, old, new),
            (Acquire, Relaxed) => intrinsics::atomic_cxchg_acq_failrelaxed(dst, old, new),
            (AcqRel, Relaxed) => intrinsics::atomic_cxchg_acqrel_failrelaxed(dst, old, new),
            (SeqCst, Relaxed) => intrinsics::atomic_cxchg_failrelaxed(dst, old, new),
            (SeqCst, Acquire) => intrinsics::atomic_cxchg_failacq(dst, old, new),
            _ => unreachable!("{:?}, {:?}", success, failure),
        }
    };
    if ok {
        Ok(val)
    } else {
        Err(val)
    }
}

#[inline]
unsafe fn atomic_compare_exchange_weak(
    dst: *mut u128,
    old: u128,
    new: u128,
    success: Ordering,
    failure: Ordering,
) -> Result<u128, u128> {
    // SAFETY: the caller must uphold the safety contract for `atomic_compare_exchange_weak`.
    let (val, ok) = unsafe {
        match (success, failure) {
            (Acquire, Acquire) => intrinsics::atomic_cxchgweak_acq(dst, old, new),
            (Release, Relaxed) => intrinsics::atomic_cxchgweak_rel(dst, old, new),
            (AcqRel, Acquire) => intrinsics::atomic_cxchgweak_acqrel(dst, old, new),
            (Relaxed, Relaxed) => intrinsics::atomic_cxchgweak_relaxed(dst, old, new),
            (SeqCst, SeqCst) => intrinsics::atomic_cxchgweak(dst, old, new),
            (Acquire, Relaxed) => intrinsics::atomic_cxchgweak_acq_failrelaxed(dst, old, new),
            (AcqRel, Relaxed) => intrinsics::atomic_cxchgweak_acqrel_failrelaxed(dst, old, new),
            (SeqCst, Relaxed) => intrinsics::atomic_cxchgweak_failrelaxed(dst, old, new),
            (SeqCst, Acquire) => intrinsics::atomic_cxchgweak_failacq(dst, old, new),
            _ => unreachable!("{:?}, {:?}", success, failure),
        }
    };
    if ok {
        Ok(val)
    } else {
        Err(val)
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
            const IS_ALWAYS_LOCK_FREE: bool = true;
            #[inline]
            fn is_lock_free() -> bool {
                true
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
                assert_load_ordering(order);
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_load(self.v.get().cast(), order) as $int_type }
            }

            #[inline]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                assert_store_ordering(order);
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_store(self.v.get().cast(), val as u128, order) }
            }

            #[inline]
            pub(crate) fn swap(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_swap(self.v.get().cast(), val as u128, order) as $int_type }
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
                assert_compare_exchange_ordering(success, failure);
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    match atomic_compare_exchange_weak(
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
            pub(crate) fn fetch_add(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_add(self.v.get().cast(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_sub(self.v.get().cast(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_and(self.v.get().cast(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_nand(self.v.get().cast(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_or(self.v.get().cast(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_xor(self.v.get().cast(), val as u128, order) as $int_type }
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

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_int!(i128);
    test_atomic_int!(u128);
}
