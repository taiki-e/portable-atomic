#![cfg(any(target_arch = "x86_64", target_arch = "aarch64"))]

// Atomic{I,U}128 implementation using core::intrinsics.
//
// This module is currently only enabled on test and benchmark.

use core::{
    cell::UnsafeCell,
    intrinsics,
    sync::atomic::Ordering::{self, AcqRel, Acquire, Relaxed, Release, SeqCst},
};

use crate::utils::{assert_compare_exchange_ordering, assert_load_ordering, assert_store_ordering};

macro_rules! assert_cmpxchg16b {
    () => {
        #[cfg(all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")))]
        {
            assert!(std::is_x86_feature_detected!("cmpxchg16b"));
        }
    };
}

// https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L2359
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_load(dst: *mut u128, order: Ordering) -> u128 {
    assert_load_ordering(order);
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

// https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L2345
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_store(dst: *mut u128, val: u128, order: Ordering) {
    assert_store_ordering(order);
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

// https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L2374
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_swap(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_swap`.
    unsafe {
        match order {
            Acquire => intrinsics::atomic_xchg_acq(dst, val),
            Release => intrinsics::atomic_xchg_rel(dst, val),
            AcqRel => intrinsics::atomic_xchg_acqrel(dst, val),
            Relaxed => intrinsics::atomic_xchg_relaxed(dst, val),
            SeqCst => intrinsics::atomic_xchg(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

// https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L2421
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_compare_exchange(
    dst: *mut u128,
    old: u128,
    new: u128,
    success: Ordering,
    failure: Ordering,
) -> Result<u128, u128> {
    assert_compare_exchange_ordering(success, failure);
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

// https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L2450
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_compare_exchange_weak(
    dst: *mut u128,
    old: u128,
    new: u128,
    success: Ordering,
    failure: Ordering,
) -> Result<u128, u128> {
    assert_compare_exchange_ordering(success, failure);
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

// https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L2390
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_add(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_add`.
    unsafe {
        match order {
            Acquire => intrinsics::atomic_xadd_acq(dst, val),
            Release => intrinsics::atomic_xadd_rel(dst, val),
            AcqRel => intrinsics::atomic_xadd_acqrel(dst, val),
            Relaxed => intrinsics::atomic_xadd_relaxed(dst, val),
            SeqCst => intrinsics::atomic_xadd(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

// https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L2406
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_sub(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_sub`.
    unsafe {
        match order {
            Acquire => intrinsics::atomic_xsub_acq(dst, val),
            Release => intrinsics::atomic_xsub_rel(dst, val),
            AcqRel => intrinsics::atomic_xsub_acqrel(dst, val),
            Relaxed => intrinsics::atomic_xsub_relaxed(dst, val),
            SeqCst => intrinsics::atomic_xsub(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

// https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L2479
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_and(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_and`
    unsafe {
        match order {
            Acquire => intrinsics::atomic_and_acq(dst, val),
            Release => intrinsics::atomic_and_rel(dst, val),
            AcqRel => intrinsics::atomic_and_acqrel(dst, val),
            Relaxed => intrinsics::atomic_and_relaxed(dst, val),
            SeqCst => intrinsics::atomic_and(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

// https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L2494
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_nand(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_nand`
    unsafe {
        match order {
            Acquire => intrinsics::atomic_nand_acq(dst, val),
            Release => intrinsics::atomic_nand_rel(dst, val),
            AcqRel => intrinsics::atomic_nand_acqrel(dst, val),
            Relaxed => intrinsics::atomic_nand_relaxed(dst, val),
            SeqCst => intrinsics::atomic_nand(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

// https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L2509
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_or(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_or`
    unsafe {
        match order {
            Acquire => intrinsics::atomic_or_acq(dst, val),
            Release => intrinsics::atomic_or_rel(dst, val),
            AcqRel => intrinsics::atomic_or_acqrel(dst, val),
            Relaxed => intrinsics::atomic_or_relaxed(dst, val),
            SeqCst => intrinsics::atomic_or(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

// https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L2524
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_xor(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_xor`
    unsafe {
        match order {
            Acquire => intrinsics::atomic_xor_acq(dst, val),
            Release => intrinsics::atomic_xor_rel(dst, val),
            AcqRel => intrinsics::atomic_xor_acqrel(dst, val),
            Relaxed => intrinsics::atomic_xor_relaxed(dst, val),
            SeqCst => intrinsics::atomic_xor(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

// https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L2540
/// returns the max value (signed comparison)
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_max(dst: *mut i128, val: i128, order: Ordering) -> i128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_max`
    unsafe {
        match order {
            Acquire => intrinsics::atomic_max_acq(dst, val),
            Release => intrinsics::atomic_max_rel(dst, val),
            AcqRel => intrinsics::atomic_max_acqrel(dst, val),
            Relaxed => intrinsics::atomic_max_relaxed(dst, val),
            SeqCst => intrinsics::atomic_max(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

// https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L2556
/// returns the min value (signed comparison)
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_min(dst: *mut i128, val: i128, order: Ordering) -> i128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_min`
    unsafe {
        match order {
            Acquire => intrinsics::atomic_min_acq(dst, val),
            Release => intrinsics::atomic_min_rel(dst, val),
            AcqRel => intrinsics::atomic_min_acqrel(dst, val),
            Relaxed => intrinsics::atomic_min_relaxed(dst, val),
            SeqCst => intrinsics::atomic_min(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

// https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L2572
/// returns the max value (unsigned comparison)
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_umax(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_umax`
    unsafe {
        match order {
            Acquire => intrinsics::atomic_umax_acq(dst, val),
            Release => intrinsics::atomic_umax_rel(dst, val),
            AcqRel => intrinsics::atomic_umax_acqrel(dst, val),
            Relaxed => intrinsics::atomic_umax_relaxed(dst, val),
            SeqCst => intrinsics::atomic_umax(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

// https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L2588
/// returns the min value (unsigned comparison)
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_umin(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_umin`
    unsafe {
        match order {
            Acquire => intrinsics::atomic_umin_acq(dst, val),
            Release => intrinsics::atomic_umin_rel(dst, val),
            AcqRel => intrinsics::atomic_umin_acqrel(dst, val),
            Relaxed => intrinsics::atomic_umin_relaxed(dst, val),
            SeqCst => intrinsics::atomic_umin(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

macro_rules! atomic128 {
    ($atomic_type:ident, $int_type:ident, $atomic_max:ident, $atomic_min:ident) => {
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
                assert_cmpxchg16b!();
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
                assert_cmpxchg16b!();
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
                assert_cmpxchg16b!();
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
                assert_cmpxchg16b!();
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
                assert_cmpxchg16b!();
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
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
                assert_cmpxchg16b!();
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
                assert_cmpxchg16b!();
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
                assert_cmpxchg16b!();
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
                assert_cmpxchg16b!();
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
                assert_cmpxchg16b!();
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
                assert_cmpxchg16b!();
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
                assert_cmpxchg16b!();
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    $atomic_max(self.v.get(), val, order)
                }
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
                assert_cmpxchg16b!();
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    $atomic_min(self.v.get(), val, order)
                }
            }
        }
    };
}

atomic128!(AtomicI128, i128, atomic_max, atomic_min);
atomic128!(AtomicU128, u128, atomic_umax, atomic_umin);

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_int!(test_atomic_i128, AtomicI128, i128);
    test_atomic_int!(test_atomic_u128, AtomicU128, u128);
}
