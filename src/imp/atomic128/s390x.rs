// Atomic{I,U}128 implementation for s390x using core::intrinsics.
//
// s390x supports 128-bit atomic load/store/cmpxchg:
// https://github.com/llvm/llvm-project/commit/a11f63a952664f700f076fd754476a2b9eb158cc
//
// Note that LLVM currently generates libcalls for other operations:
// https://godbolt.org/z/6E6fchxvP

include!("macros.rs");

use core::{intrinsics, sync::atomic::Ordering};

use crate::utils::strongest_failure_ordering;

#[inline]
unsafe fn atomic_load(dst: *mut u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_load`.
    unsafe {
        match order {
            Ordering::Acquire => intrinsics::atomic_load_acq(dst),
            Ordering::Relaxed => intrinsics::atomic_load_relaxed(dst),
            Ordering::SeqCst => intrinsics::atomic_load(dst),
            _ => unreachable!("{:?}", order),
        }
    }
}

#[inline]
unsafe fn atomic_store(dst: *mut u128, val: u128, order: Ordering) {
    // SAFETY: the caller must uphold the safety contract for `atomic_store`.
    unsafe {
        match order {
            Ordering::Release => intrinsics::atomic_store_rel(dst, val),
            Ordering::Relaxed => intrinsics::atomic_store_relaxed(dst, val),
            Ordering::SeqCst => intrinsics::atomic_store(dst, val),
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
    use core::sync::atomic::Ordering::{AcqRel, Acquire, Relaxed, Release, SeqCst};
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
    use core::sync::atomic::Ordering::{AcqRel, Acquire, Relaxed, Release, SeqCst};
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
unsafe fn atomic_update<F>(dst: *mut u128, order: Ordering, mut f: F) -> u128
where
    F: FnMut(u128) -> u128,
{
    let failure = strongest_failure_ordering(order);
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

#[inline]
unsafe fn atomic_swap(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_swap`.
    unsafe { atomic_update(dst, order, |_| val) }
}

atomic128!(AtomicI128, i128);
atomic128!(AtomicU128, u128);

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_int!(i128);
    test_atomic_int!(u128);
}
