// Atomic{I,U}128 implementation for s390x.
//
// s390x supports 128-bit atomic load/store/cmpxchg:
// https://github.com/llvm/llvm-project/commit/a11f63a952664f700f076fd754476a2b9eb158cc
//
// Note: On Miri and ThreadSanitizer which do not support inline assembly, we don't use
// this module and use intrinsics.rs instead.
//
// Refs:
// - z/Architecture Reference Summary https://www.ibm.com/support/pages/zarchitecture-reference-summary
// - atomic-maybe-uninit https://github.com/taiki-e/atomic-maybe-uninit
//
// Generated asm:
// - s390x https://godbolt.org/z/oP5bhbqce

include!("macros.rs");

use core::{arch::asm, sync::atomic::Ordering};

/// A 128-bit value represented as a pair of 64-bit values.
///
/// This type is `#[repr(C)]`, both fields have the same in-memory representation
/// and are plain old datatypes, so access to the fields is always safe.
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

    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        // atomic load is always SeqCst.
        let _ = order;
        let (out_hi, out_lo);
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

    // SAFETY: the caller must uphold the safety contract.
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

    // SAFETY: the caller must uphold the safety contract.
    let res = unsafe {
        // atomic CAS is always SeqCst.
        let _ = (success, failure);
        let old = U128 { whole: old };
        let new = U128 { whole: new };
        let (prev_hi, prev_lo);
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

#[inline(always)]
unsafe fn atomic_update<F>(dst: *mut u128, order: Ordering, mut f: F) -> u128
where
    F: FnMut(u128) -> u128,
{
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        // This is a private function and all instances of `f` only operate on the value
        // loaded, so there is no need to synchronize the first load/failed CAS.
        let mut old = atomic_load(dst, Ordering::Relaxed);
        loop {
            let next = f(old);
            match atomic_compare_exchange_weak(dst, old, next, order, Ordering::Relaxed) {
                Ok(x) => return x,
                Err(x) => old = x,
            }
        }
    }
}

#[inline]
unsafe fn atomic_swap(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract.
    //
    // We could use atomic_update here, but using an inline assembly allows omitting
    // the comparison of results and the storing/comparing of condition flags.
    //
    // Do not use atomic_rmw_cas_3 because it needs extra LGR to implement swap.
    unsafe {
        // atomic swap is always SeqCst.
        let _ = order;
        let val = U128 { whole: val };
        let (mut prev_hi, mut prev_lo);
        asm!(
            "lpq %r0, 0({dst})",
            "2:",
                "cdsg %r0, %r12, 0({dst})",
                "jl 2b",
            dst = in(reg) dst,
            // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
            out("r0") prev_hi,
            out("r1") prev_lo,
            in("r12") val.pair.hi,
            in("r13") val.pair.lo,
            options(nostack),
        );
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

/// Atomic RMW by CAS loop (3 arguments)
/// `unsafe fn(dst: *mut u128, val: u128, order: Ordering) -> u128;`
///
/// `$op` can use the following registers:
/// - val_hi/val_lo pair: val argument (read-only for `$op`)
/// - r0/r1 pair: previous value loaded (read-only for `$op`)
/// - r12/r13 pair: new value that will to stored
// We could use atomic_update here, but using an inline assembly allows omitting
// the comparison of results and the storing/comparing of condition flags.
macro_rules! atomic_rmw_cas_3 {
    ($name:ident, $($op:tt)*) => {
        #[inline]
        unsafe fn $name(dst: *mut u128, val: u128, _order: Ordering) -> u128 {
            debug_assert!(dst as usize % 16 == 0);
            // SAFETY: the caller must uphold the safety contract.
            unsafe {
                // atomic RMW is always SeqCst.
                let val = U128 { whole: val };
                let (mut prev_hi, mut prev_lo);
                asm!(
                    "lpq %r0, 0({dst})",
                    "2:",
                        $($op)*
                        "cdsg %r0, %r12, 0({dst})",
                        "jl 2b",
                    dst = in(reg) dst,
                    val_hi = in(reg) val.pair.hi,
                    val_lo = in(reg) val.pair.lo,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    out("r0") prev_hi,
                    out("r1") prev_lo,
                    out("r12") _,
                    out("r13") _,
                    options(nostack),
                );
                U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
            }
        }
    };
}
/// Atomic RMW by CAS loop (2 arguments)
/// `unsafe fn(dst: *mut u128, order: Ordering) -> u128;`
///
/// `$op` can use the following registers:
/// - r0/r1 pair: previous value loaded (read-only for `$op`)
/// - r12/r13 pair: new value that will to stored
// We could use atomic_update here, but using an inline assembly allows omitting
// the comparison of results and the storing/comparing of condition flags.
macro_rules! atomic_rmw_cas_2 {
    ($name:ident, $($op:tt)*) => {
        #[inline]
        unsafe fn $name(dst: *mut u128, _order: Ordering) -> u128 {
            debug_assert!(dst as usize % 16 == 0);
            // SAFETY: the caller must uphold the safety contract.
            unsafe {
                // atomic RMW is always SeqCst.
                let (mut prev_hi, mut prev_lo);
                asm!(
                    "lpq %r0, 0({dst})",
                    "2:",
                        $($op)*
                        "cdsg %r0, %r12, 0({dst})",
                        "jl 2b",
                    dst = in(reg) dst,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    out("r0") prev_hi,
                    out("r1") prev_lo,
                    out("r12") _,
                    out("r13") _,
                    options(nostack),
                );
                U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
            }
        }
    };
}

atomic_rmw_cas_3! {
    atomic_add,
    "lgr %r13, %r1",
    "algr %r13, {val_lo}",
    "lgr %r12, %r0",
    "alcgr %r12, {val_hi}",
}
atomic_rmw_cas_3! {
    atomic_sub,
    "lgr %r13, %r1",
    "slgr %r13, {val_lo}",
    "lgr %r12, %r0",
    "slbgr %r12, {val_hi}",
}
atomic_rmw_cas_3! {
    atomic_and,
    "lgr %r13, %r1",
    "ngr %r13, {val_lo}",
    "lgr %r12, %r0",
    "ngr %r12, {val_hi}",
}
atomic_rmw_cas_3! {
    atomic_nand,
    "lgr %r13, %r1",
    "ngr %r13, {val_lo}",
    "xihf %r13, 4294967295",
    "xilf %r13, 4294967295",
    "lgr %r12, %r0",
    "ngr %r12, {val_hi}",
    "xihf %r12, 4294967295",
    "xilf %r12, 4294967295",
}
atomic_rmw_cas_3! {
    atomic_or,
    "lgr %r13, %r1",
    "ogr %r13, {val_lo}",
    "lgr %r12, %r0",
    "ogr %r12, {val_hi}",
}
atomic_rmw_cas_3! {
    atomic_xor,
    "lgr %r13, %r1",
    "xgr %r13, {val_lo}",
    "lgr %r12, %r0",
    "xgr %r12, {val_hi}",
}

atomic_rmw_cas_2! {
    atomic_not,
    "lgr %r13, %r1",
    "xihf %r13, 4294967295",
    "xilf %r13, 4294967295",
    "lgr %r12, %r0",
    "xihf %r12, 4294967295",
    "xilf %r12, 4294967295",
}
atomic_rmw_cas_2! {
    atomic_neg,
    "lghi %r13, 0",
    "slgr %r13, %r1",
    "lghi %r12, 0",
    "slbgr %r12, %r0",
}

// We use atomic_update for atomic min/max in all cases because
// pre-z13 doesn't seem to have a good way to implement 128-bit min/max.
// https://godbolt.org/z/53fnrET7o
// (LLVM 16's minimal supported architecture level is z10:
// https://github.com/llvm/llvm-project/blob/llvmorg-16.0.0/llvm/lib/Target/SystemZ/SystemZProcessors.td)
atomic_rmw_by_atomic_update!(cmp);

#[inline]
const fn is_lock_free() -> bool {
    IS_ALWAYS_LOCK_FREE
}
const IS_ALWAYS_LOCK_FREE: bool = true;

atomic128!(AtomicI128, i128, atomic_max, atomic_min);
atomic128!(AtomicU128, u128, atomic_umax, atomic_umin);

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_int!(i128);
    test_atomic_int!(u128);

    // load/store/swap implementation is not affected by signedness, so it is
    // enough to test only unsigned types.
    stress_test_load_store!(u128);
    stress_test_load_swap!(u128);
}
