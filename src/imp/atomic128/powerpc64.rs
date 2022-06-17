// Atomic{I,U}128 implementation on powerpc64.
//
// powerpc64 on pwr8+ support 128-bit atomics:
// https://github.com/llvm/llvm-project/commit/549e118e93c666914a1045fde38a2cac33e1e445
//
// powerpc64le is pwr8+ https://github.com/llvm/llvm-project/blob/2ba5d820e2b0e5016ec706e324060a329f9a83a3/llvm/lib/Target/PowerPC/PPC.td#L652
// See also https://github.com/rust-lang/rust/issues/59932
//
// Refs:
// - https://www.ibm.com/docs/en/aix/7.3?topic=aix-assembler-language-reference
// - atomic-maybe-uninit https://github.com/taiki-e/atomic-maybe-uninit
//
// Generated asm:
// - powerpc64 (pwr8) https://godbolt.org/z/Ecrn78ra6
// - powerpc64le https://godbolt.org/z/n8zscrM9x

include!("macros.rs");

use core::{arch::asm, sync::atomic::Ordering};

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
#[repr(C, align(16))]
struct Pair {
    #[cfg(target_endian = "big")]
    hi: u64,
    lo: u64,
    #[cfg(target_endian = "little")]
    hi: u64,
}

#[inline]
unsafe fn atomic_load(src: *mut u128, order: Ordering) -> u128 {
    debug_assert!(src as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_load`.
    unsafe {
        let (out_hi, out_lo);
        match order {
            Ordering::Relaxed => {
                asm!(
                    // (atomic) load from src to r4-r5 pair
                    "lq %r4, 0({src})",
                    src = in(reg) src,
                    out("r0") _,
                    // lq loads value into the pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r4") out_hi,
                    out("r5") out_lo,
                    options(nostack),
                );
            }
            // Acquire and SeqCst loads are equivalent.
            Ordering::Acquire | Ordering::SeqCst => {
                asm!(
                    // (atomic) load from src to r4-r5 pair
                    "lq %r4, 0({src})",
                    // Refs: https://github.com/boostorg/atomic/blob/a17267547071e0dd60c81945bcb6bf0162a5db07/include/boost/atomic/detail/core_arch_ops_gcc_ppc.hpp
                    "cmpd %cr7, %r4, %r4",
                    "bne- %cr7, 2f",
                    "2:",
                    "isync",
                    src = in(reg) src,
                    out("r0") _,
                    // lq loads value into the pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r4") out_hi,
                    out("r5") out_lo,
                    options(nostack),
                );
            }
            _ => unreachable!("{:?}", order),
        }
        U128 { pair: Pair { hi: out_hi, lo: out_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_store(dst: *mut u128, val: u128, order: Ordering) {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_store`.
    unsafe {
        let val = U128 { whole: val };
        macro_rules! atomic_store {
            ($release:tt) => {
                asm!(
                    // (atomic) store r4-r5 pair to dst
                    $release,
                    "stq %r4, 0({dst})",
                    dst = inout(reg) dst => _,
                    out("r0") _,
                    // lq loads value into the pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    in("r4") val.pair.hi,
                    in("r5") val.pair.lo,
                    options(nostack),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_store!(""),
            Ordering::Release => atomic_store!("lwsync"),
            Ordering::SeqCst => atomic_store!("sync"),
            _ => unreachable!("{:?}", order),
        }
    }
}

#[inline]
unsafe fn lqarx(dst: *mut u128) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `lqarx`.
    unsafe {
        let (prev_hi, prev_lo);
        asm!(
            "lqarx %r6, 0, {dst}",
            dst = in(reg) dst,
            out("r0") _,
            // lqarx loads value into the pair of specified register and subsequent register.
            // We cannot use r1 and r2, and we use r4 and r5 for val of stqcx, so starting with r6.
            out("r6") prev_hi,
            out("r7") prev_lo,
            options(nostack),
        );
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn stqcx(dst: *mut u128, val: u128) -> bool {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `stqcx`.
    unsafe {
        let r: i32;
        let val = U128 { whole: val };
        asm!(
            "stqcx. %r4, 0, {dst}",
            "mfcr {r}",
            dst = in(reg) dst,
            r = out(reg) r,
            out("r0") _,
            // stqcx. loads value into the pair of specified register and subsequent register.
            // We cannot use r1 and r2, so starting with r4.
            in("r4") val.pair.hi,
            in("r5") val.pair.lo,
            options(nostack),
        );
        r != 0
    }
}

// Note: closure should not panic.
#[inline]
unsafe fn atomic_update<F>(dst: *mut u128, order: Ordering, mut f: F) -> u128
where
    F: FnMut(u128) -> u128,
{
    // SAFETY: the caller must uphold the safety contract for `atomic_update`.
    unsafe {
        let mut prev;
        // release
        match order {
            Ordering::Relaxed | Ordering::Acquire => {}
            Ordering::Release => asm!("lwsync", options(nostack)),
            Ordering::AcqRel => asm!("lwsync", options(nostack)),
            Ordering::SeqCst => asm!("sync", options(nostack)),
            _ => unreachable!("{:?}", order),
        }
        loop {
            prev = lqarx(dst);
            let next = f(prev);
            if stqcx(dst, next) {
                break;
            }
        }
        // acquire
        match order {
            Ordering::Relaxed | Ordering::Release => {}
            Ordering::Acquire => asm!("lwsync", options(nostack)),
            Ordering::AcqRel => asm!("lwsync", options(nostack)),
            Ordering::SeqCst => asm!("lwsync", options(nostack)),
            _ => unreachable!("{:?}", order),
        }
        prev
    }
}

#[inline]
unsafe fn atomic_compare_exchange(
    dst: *mut u128,
    old: u128,
    new: u128,
    success: Ordering,
    _failure: Ordering,
) -> Result<u128, u128> {
    // SAFETY: the caller must uphold the safety contract for `compare_exchange_ldxp_stxp`.
    let res = unsafe { atomic_update(dst, success, |x| if x == old { new } else { x }) };
    if res == old {
        Ok(res)
    } else {
        Err(res)
    }
}

use atomic_compare_exchange as atomic_compare_exchange_weak;

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
