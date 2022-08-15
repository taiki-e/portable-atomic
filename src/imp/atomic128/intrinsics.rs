// Atomic{I,U}128 implementation using core::intrinsics.
//
// Refs: https://github.com/rust-lang/rust/blob/7b68106ffb71f853ea32f0e0dc0785d9d647cbbf/library/core/src/sync/atomic.rs
//
// On aarch64 and powerpc64, this module is currently only enabled on Miri and ThreadSanitizer
// which do not support inline assembly. (Note: on powerpc64, it requires LLVM 15+)
// On x86_64, this module is currently only enabled on benchmark.
//
// Note that we cannot use this module on s390x because LLVM currently generates
// libcalls for operations other than load/store/cmpxchg: https://godbolt.org/z/6E6fchxvP

use core::{
    cell::UnsafeCell,
    intrinsics,
    sync::atomic::Ordering::{self, AcqRel, Acquire, Relaxed, Release, SeqCst},
};

// On x86_64, this module is only enabled on benchmark.
macro_rules! assert_cmpxchg16b {
    () => {
        #[cfg(all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")))]
        {
            assert!(std::is_x86_feature_detected!("cmpxchg16b"));
        }
    };
}

#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_load(src: *mut u128, order: Ordering) -> u128 {
    crate::utils::assert_load_ordering(order);
    // SAFETY: the caller must uphold the safety contract for `atomic_load`.
    unsafe {
        match order {
            Acquire => intrinsics::atomic_load_acquire(src),
            Relaxed => intrinsics::atomic_load_relaxed(src),
            SeqCst => intrinsics::atomic_load_seqcst(src),
            _ => unreachable!("{:?}", order),
        }
    }
}

#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_store(dst: *mut u128, val: u128, order: Ordering) {
    crate::utils::assert_store_ordering(order);
    // SAFETY: the caller must uphold the safety contract for `atomic_store`.
    unsafe {
        match order {
            Release => intrinsics::atomic_store_release(dst, val),
            Relaxed => intrinsics::atomic_store_relaxed(dst, val),
            SeqCst => intrinsics::atomic_store_seqcst(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_swap(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_swap`.
    unsafe {
        match order {
            Acquire => intrinsics::atomic_xchg_acquire(dst, val),
            Release => intrinsics::atomic_xchg_release(dst, val),
            AcqRel => intrinsics::atomic_xchg_acqrel(dst, val),
            Relaxed => intrinsics::atomic_xchg_relaxed(dst, val),
            SeqCst => intrinsics::atomic_xchg_seqcst(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

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
    crate::utils::assert_compare_exchange_ordering(success, failure);
    // SAFETY: the caller must uphold the safety contract for `atomic_compare_exchange`.
    let (val, ok) = unsafe {
        match (success, failure) {
            (Relaxed, Relaxed) => intrinsics::atomic_cxchg_relaxed_relaxed(dst, old, new),
            (Relaxed, Acquire) => intrinsics::atomic_cxchg_relaxed_acquire(dst, old, new),
            (Relaxed, SeqCst) => intrinsics::atomic_cxchg_relaxed_seqcst(dst, old, new),
            (Acquire, Relaxed) => intrinsics::atomic_cxchg_acquire_relaxed(dst, old, new),
            (Acquire, Acquire) => intrinsics::atomic_cxchg_acquire_acquire(dst, old, new),
            (Acquire, SeqCst) => intrinsics::atomic_cxchg_acquire_seqcst(dst, old, new),
            (Release, Relaxed) => intrinsics::atomic_cxchg_release_relaxed(dst, old, new),
            (Release, Acquire) => intrinsics::atomic_cxchg_release_acquire(dst, old, new),
            (Release, SeqCst) => intrinsics::atomic_cxchg_release_seqcst(dst, old, new),
            (AcqRel, Relaxed) => intrinsics::atomic_cxchg_acqrel_relaxed(dst, old, new),
            (AcqRel, Acquire) => intrinsics::atomic_cxchg_acqrel_acquire(dst, old, new),
            (AcqRel, SeqCst) => intrinsics::atomic_cxchg_acqrel_seqcst(dst, old, new),
            (SeqCst, Relaxed) => intrinsics::atomic_cxchg_seqcst_relaxed(dst, old, new),
            (SeqCst, Acquire) => intrinsics::atomic_cxchg_seqcst_acquire(dst, old, new),
            (SeqCst, SeqCst) => intrinsics::atomic_cxchg_seqcst_seqcst(dst, old, new),
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
    crate::utils::assert_compare_exchange_ordering(success, failure);
    // SAFETY: the caller must uphold the safety contract for `atomic_compare_exchange_weak`.
    let (val, ok) = unsafe {
        match (success, failure) {
            (Relaxed, Relaxed) => intrinsics::atomic_cxchgweak_relaxed_relaxed(dst, old, new),
            (Relaxed, Acquire) => intrinsics::atomic_cxchgweak_relaxed_acquire(dst, old, new),
            (Relaxed, SeqCst) => intrinsics::atomic_cxchgweak_relaxed_seqcst(dst, old, new),
            (Acquire, Relaxed) => intrinsics::atomic_cxchgweak_acquire_relaxed(dst, old, new),
            (Acquire, Acquire) => intrinsics::atomic_cxchgweak_acquire_acquire(dst, old, new),
            (Acquire, SeqCst) => intrinsics::atomic_cxchgweak_acquire_seqcst(dst, old, new),
            (Release, Relaxed) => intrinsics::atomic_cxchgweak_release_relaxed(dst, old, new),
            (Release, Acquire) => intrinsics::atomic_cxchgweak_release_acquire(dst, old, new),
            (Release, SeqCst) => intrinsics::atomic_cxchgweak_release_seqcst(dst, old, new),
            (AcqRel, Relaxed) => intrinsics::atomic_cxchgweak_acqrel_relaxed(dst, old, new),
            (AcqRel, Acquire) => intrinsics::atomic_cxchgweak_acqrel_acquire(dst, old, new),
            (AcqRel, SeqCst) => intrinsics::atomic_cxchgweak_acqrel_seqcst(dst, old, new),
            (SeqCst, Relaxed) => intrinsics::atomic_cxchgweak_seqcst_relaxed(dst, old, new),
            (SeqCst, Acquire) => intrinsics::atomic_cxchgweak_seqcst_acquire(dst, old, new),
            (SeqCst, SeqCst) => intrinsics::atomic_cxchgweak_seqcst_seqcst(dst, old, new),
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
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_add(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_add`.
    unsafe {
        match order {
            Acquire => intrinsics::atomic_xadd_acquire(dst, val),
            Release => intrinsics::atomic_xadd_release(dst, val),
            AcqRel => intrinsics::atomic_xadd_acqrel(dst, val),
            Relaxed => intrinsics::atomic_xadd_relaxed(dst, val),
            SeqCst => intrinsics::atomic_xadd_seqcst(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_sub(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_sub`.
    unsafe {
        match order {
            Acquire => intrinsics::atomic_xsub_acquire(dst, val),
            Release => intrinsics::atomic_xsub_release(dst, val),
            AcqRel => intrinsics::atomic_xsub_acqrel(dst, val),
            Relaxed => intrinsics::atomic_xsub_relaxed(dst, val),
            SeqCst => intrinsics::atomic_xsub_seqcst(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_and(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_and`
    unsafe {
        match order {
            Acquire => intrinsics::atomic_and_acquire(dst, val),
            Release => intrinsics::atomic_and_release(dst, val),
            AcqRel => intrinsics::atomic_and_acqrel(dst, val),
            Relaxed => intrinsics::atomic_and_relaxed(dst, val),
            SeqCst => intrinsics::atomic_and_seqcst(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_nand(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_nand`
    unsafe {
        match order {
            Acquire => intrinsics::atomic_nand_acquire(dst, val),
            Release => intrinsics::atomic_nand_release(dst, val),
            AcqRel => intrinsics::atomic_nand_acqrel(dst, val),
            Relaxed => intrinsics::atomic_nand_relaxed(dst, val),
            SeqCst => intrinsics::atomic_nand_seqcst(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_or(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_or`
    unsafe {
        match order {
            Acquire => intrinsics::atomic_or_acquire(dst, val),
            Release => intrinsics::atomic_or_release(dst, val),
            AcqRel => intrinsics::atomic_or_acqrel(dst, val),
            Relaxed => intrinsics::atomic_or_relaxed(dst, val),
            SeqCst => intrinsics::atomic_or_seqcst(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_xor(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_xor`
    unsafe {
        match order {
            Acquire => intrinsics::atomic_xor_acquire(dst, val),
            Release => intrinsics::atomic_xor_release(dst, val),
            AcqRel => intrinsics::atomic_xor_acqrel(dst, val),
            Relaxed => intrinsics::atomic_xor_relaxed(dst, val),
            SeqCst => intrinsics::atomic_xor_seqcst(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

#[cfg(target_arch = "powerpc64")]
#[inline]
unsafe fn atomic_update<F>(dst: *mut u128, order: Ordering, mut f: F) -> u128
where
    F: FnMut(u128) -> u128,
{
    let failure = crate::utils::strongest_failure_ordering(order);
    // SAFETY: the caller must uphold the safety contract for `atomic_update`.
    unsafe {
        let mut old = atomic_load(dst, failure);
        loop {
            let next = f(old);
            match atomic_compare_exchange_weak(dst, old, next, order, failure) {
                Ok(x) => return x,
                Err(x) => old = x,
            }
        }
    }
}

/// returns the max value (signed comparison)
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_max(dst: *mut i128, val: i128, order: Ordering) -> i128 {
    // LLVM 15 doesn't support 128-bit atomic min/max for powerpc64.
    #[cfg(target_arch = "powerpc64")]
    // SAFETY: the caller must uphold the safety contract for `atomic_max`
    unsafe {
        atomic_update(dst.cast(), order, |x| core::cmp::max(x as i128, val) as u128) as i128
    }
    #[cfg(not(target_arch = "powerpc64"))]
    // SAFETY: the caller must uphold the safety contract for `atomic_max`
    unsafe {
        match order {
            Acquire => intrinsics::atomic_max_acquire(dst, val),
            Release => intrinsics::atomic_max_release(dst, val),
            AcqRel => intrinsics::atomic_max_acqrel(dst, val),
            Relaxed => intrinsics::atomic_max_relaxed(dst, val),
            SeqCst => intrinsics::atomic_max_seqcst(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

/// returns the min value (signed comparison)
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_min(dst: *mut i128, val: i128, order: Ordering) -> i128 {
    // LLVM 15 doesn't support 128-bit atomic min/max for powerpc64.
    #[cfg(target_arch = "powerpc64")]
    // SAFETY: the caller must uphold the safety contract for `atomic_min`
    unsafe {
        atomic_update(dst.cast(), order, |x| core::cmp::min(x as i128, val) as u128) as i128
    }
    #[cfg(not(target_arch = "powerpc64"))]
    // SAFETY: the caller must uphold the safety contract for `atomic_min`
    unsafe {
        match order {
            Acquire => intrinsics::atomic_min_acquire(dst, val),
            Release => intrinsics::atomic_min_release(dst, val),
            AcqRel => intrinsics::atomic_min_acqrel(dst, val),
            Relaxed => intrinsics::atomic_min_relaxed(dst, val),
            SeqCst => intrinsics::atomic_min_seqcst(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

/// returns the max value (unsigned comparison)
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_umax(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // LLVM 15 doesn't support 128-bit atomic min/max for powerpc64.
    #[cfg(target_arch = "powerpc64")]
    // SAFETY: the caller must uphold the safety contract for `atomic_umax`
    unsafe {
        atomic_update(dst, order, |x| core::cmp::max(x, val))
    }
    #[cfg(not(target_arch = "powerpc64"))]
    // SAFETY: the caller must uphold the safety contract for `atomic_umax`
    unsafe {
        match order {
            Acquire => intrinsics::atomic_umax_acquire(dst, val),
            Release => intrinsics::atomic_umax_release(dst, val),
            AcqRel => intrinsics::atomic_umax_acqrel(dst, val),
            Relaxed => intrinsics::atomic_umax_relaxed(dst, val),
            SeqCst => intrinsics::atomic_umax_seqcst(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
}

/// returns the min value (unsigned comparison)
#[inline]
#[cfg_attr(
    all(target_arch = "x86_64", not(target_feature = "cmpxchg16b")),
    target_feature(enable = "cmpxchg16b")
)]
unsafe fn atomic_umin(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // LLVM 15 doesn't support 128-bit atomic min/max for powerpc64.
    #[cfg(target_arch = "powerpc64")]
    // SAFETY: the caller must uphold the safety contract for `atomic_umin`
    unsafe {
        atomic_update(dst, order, |x| core::cmp::min(x, val))
    }
    #[cfg(not(target_arch = "powerpc64"))]
    // SAFETY: the caller must uphold the safety contract for `atomic_umin`
    unsafe {
        match order {
            Acquire => intrinsics::atomic_umin_acquire(dst, val),
            Release => intrinsics::atomic_umin_release(dst, val),
            AcqRel => intrinsics::atomic_umin_acqrel(dst, val),
            Relaxed => intrinsics::atomic_umin_relaxed(dst, val),
            SeqCst => intrinsics::atomic_umin_seqcst(dst, val),
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

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by atomic intrinsics.
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
                true
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
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                assert_cmpxchg16b!();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_load(self.v.get().cast(), order) as $int_type }
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                assert_cmpxchg16b!();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_store(self.v.get().cast(), val as u128, order) }
            }

            #[inline]
            pub(crate) fn swap(&self, val: $int_type, order: Ordering) -> $int_type {
                assert_cmpxchg16b!();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_swap(self.v.get().cast(), val as u128, order) as $int_type }
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
                assert_cmpxchg16b!();
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
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn compare_exchange_weak(
                &self,
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                assert_cmpxchg16b!();
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
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_add(self.v.get().cast(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, order: Ordering) -> $int_type {
                assert_cmpxchg16b!();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_sub(self.v.get().cast(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, order: Ordering) -> $int_type {
                assert_cmpxchg16b!();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_and(self.v.get().cast(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, order: Ordering) -> $int_type {
                assert_cmpxchg16b!();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_nand(self.v.get().cast(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, order: Ordering) -> $int_type {
                assert_cmpxchg16b!();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_or(self.v.get().cast(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, order: Ordering) -> $int_type {
                assert_cmpxchg16b!();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_xor(self.v.get().cast(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, order: Ordering) -> $int_type {
                assert_cmpxchg16b!();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { $atomic_max(self.v.get(), val, order) }
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
                assert_cmpxchg16b!();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { $atomic_min(self.v.get(), val, order) }
            }
        }
    };
}

atomic128!(AtomicI128, i128, atomic_max, atomic_min);
atomic128!(AtomicU128, u128, atomic_umax, atomic_umin);

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_int!(i128);
    test_atomic_int!(u128);
}
