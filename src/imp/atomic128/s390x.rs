// Atomic{I,U}128 implementation for s390x.
//
// s390x supports 128-bit atomic load/store/cmpxchg:
// https://github.com/llvm/llvm-project/commit/a11f63a952664f700f076fd754476a2b9eb158cc
//
// Note that LLVM currently generates libcalls for other operations:
// https://godbolt.org/z/6E6fchxvP
//
// Refs:
// - z/Architecture Reference Summary https://www.ibm.com/support/pages/zarchitecture-reference-summary
// - atomic-maybe-uninit https://github.com/taiki-e/atomic-maybe-uninit
//
// Generated asm:
// - s390x https://godbolt.org/z/qcoxxq1K1

include!("macros.rs");

#[cfg(not(all(
    any(miri, portable_atomic_sanitize_thread),
    portable_atomic_new_atomic_intrinsics
)))]
use core::arch::asm;
use core::sync::atomic::Ordering;

/// A 128-bit value represented as a pair of 64-bit values.
// This type is #[repr(C)], both fields have the same in-memory representation
// and are plain old datatypes, so access to the fields is always safe.
#[derive(Clone, Copy)]
#[repr(C)]
union U128 {
    whole: u128,
    pair: Pair,
}

#[derive(Clone, Copy)]
#[repr(C)]
struct Pair {
    hi: u64,
    lo: u64,
}

#[inline]
unsafe fn atomic_load(src: *mut u128, order: Ordering) -> u128 {
    debug_assert!(src as usize % 16 == 0);

    // Miri and Sanitizer do not support inline assembly.
    #[cfg(all(any(miri, portable_atomic_sanitize_thread), portable_atomic_new_atomic_intrinsics))]
    // SAFETY: the caller must uphold the safety contract for `atomic_load`.
    unsafe {
        match order {
            Ordering::Acquire => core::intrinsics::atomic_load_acquire(src),
            Ordering::Relaxed => core::intrinsics::atomic_load_relaxed(src),
            Ordering::SeqCst => core::intrinsics::atomic_load_seqcst(src),
            _ => unreachable!("{:?}", order),
        }
    }
    #[cfg(not(all(
        any(miri, portable_atomic_sanitize_thread),
        portable_atomic_new_atomic_intrinsics
    )))]
    // SAFETY: the caller must uphold the safety contract for `atomic_load`.
    unsafe {
        let _ = order;
        let (out_hi, out_lo);
        // atomic load is always SeqCst.
        asm!(
            "lpq %r0, 0({src})",
            src = in(reg) src,
            // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
            out("r0") out_hi,
            out("r1") out_lo,
            options(nostack),
        );
        U128 { pair: Pair { hi: out_hi, lo: out_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_store(dst: *mut u128, val: u128, order: Ordering) {
    debug_assert!(dst as usize % 16 == 0);

    // Miri and Sanitizer do not support inline assembly.
    #[cfg(all(any(miri, portable_atomic_sanitize_thread), portable_atomic_new_atomic_intrinsics))]
    // SAFETY: the caller must uphold the safety contract for `atomic_store`.
    unsafe {
        match order {
            Ordering::Release => core::intrinsics::atomic_store_release(dst, val),
            Ordering::Relaxed => core::intrinsics::atomic_store_relaxed(dst, val),
            Ordering::SeqCst => core::intrinsics::atomic_store_seqcst(dst, val),
            _ => unreachable!("{:?}", order),
        }
    }
    #[cfg(not(all(
        any(miri, portable_atomic_sanitize_thread),
        portable_atomic_new_atomic_intrinsics
    )))]
    // SAFETY: the caller must uphold the safety contract for `atomic_store`.
    unsafe {
        let val = U128 { whole: val };
        match order {
            // Relaxed and Release stores are equivalent.
            Ordering::Relaxed | Ordering::Release => {
                asm!(
                    "stpq %r0, 0({dst})",
                    dst = in(reg) dst,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    in("r0") val.pair.hi,
                    in("r1") val.pair.lo,
                    options(nostack),
                );
            }
            Ordering::SeqCst => {
                asm!(
                    "stpq %r0, 0({dst})",
                    "bcr 15, %r0",
                    dst = in(reg) dst,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    in("r0") val.pair.hi,
                    in("r1") val.pair.lo,
                    options(nostack),
                );
            }
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
    debug_assert!(dst as usize % 16 == 0);

    // Miri and Sanitizer do not support inline assembly.
    #[cfg(all(any(miri, portable_atomic_sanitize_thread), portable_atomic_new_atomic_intrinsics))]
    // SAFETY: the caller must uphold the safety contract for `atomic_compare_exchange`.
    let res = unsafe {
        use core::sync::atomic::Ordering::{AcqRel, Acquire, Relaxed, Release, SeqCst};
        match (success, failure) {
            (Relaxed, Relaxed) => core::intrinsics::atomic_cxchg_relaxed_relaxed(dst, old, new),
            (Relaxed, Acquire) => core::intrinsics::atomic_cxchg_relaxed_acquire(dst, old, new),
            (Relaxed, SeqCst) => core::intrinsics::atomic_cxchg_relaxed_seqcst(dst, old, new),
            (Acquire, Relaxed) => core::intrinsics::atomic_cxchg_acquire_relaxed(dst, old, new),
            (Acquire, Acquire) => core::intrinsics::atomic_cxchg_acquire_acquire(dst, old, new),
            (Acquire, SeqCst) => core::intrinsics::atomic_cxchg_acquire_seqcst(dst, old, new),
            (Release, Relaxed) => core::intrinsics::atomic_cxchg_release_relaxed(dst, old, new),
            (Release, Acquire) => core::intrinsics::atomic_cxchg_release_acquire(dst, old, new),
            (Release, SeqCst) => core::intrinsics::atomic_cxchg_release_seqcst(dst, old, new),
            (AcqRel, Relaxed) => core::intrinsics::atomic_cxchg_acqrel_relaxed(dst, old, new),
            (AcqRel, Acquire) => core::intrinsics::atomic_cxchg_acqrel_acquire(dst, old, new),
            (AcqRel, SeqCst) => core::intrinsics::atomic_cxchg_acqrel_seqcst(dst, old, new),
            (SeqCst, Relaxed) => core::intrinsics::atomic_cxchg_seqcst_relaxed(dst, old, new),
            (SeqCst, Acquire) => core::intrinsics::atomic_cxchg_seqcst_acquire(dst, old, new),
            (SeqCst, SeqCst) => core::intrinsics::atomic_cxchg_seqcst_seqcst(dst, old, new),
            _ => unreachable!("{:?}, {:?}", success, failure),
        }
        .0
    };
    #[cfg(not(all(
        any(miri, portable_atomic_sanitize_thread),
        portable_atomic_new_atomic_intrinsics
    )))]
    // SAFETY: the caller must uphold the safety contract for `atomic_compare_exchange`.
    let res = unsafe {
        let _ = (success, failure);
        let old = U128 { whole: old };
        let new = U128 { whole: new };
        let (prev_hi, prev_lo);
        // atomic compare_exchange is always SeqCst.
        asm!(
            "cdsg %r0, %r12, 0({dst})",
            dst = in(reg) dst,
            // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
            inout("r0") old.pair.hi => prev_hi,
            inout("r1") old.pair.lo => prev_lo,
            in("r12") new.pair.hi,
            in("r13") new.pair.lo,
            options(nostack),
        );
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    };
    if res == old {
        Ok(res)
    } else {
        Err(res)
    }
}

use atomic_compare_exchange as atomic_compare_exchange_weak;

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

#[inline]
unsafe fn atomic_swap(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_swap`.
    unsafe { atomic_update(dst, order, |_| val) }
}

#[inline]
const fn is_always_lock_free() -> bool {
    true
}
use is_always_lock_free as is_lock_free;

atomic128!(AtomicI128, i128);
atomic128!(AtomicU128, u128);

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_int!(i128);
    test_atomic_int!(u128);
}
