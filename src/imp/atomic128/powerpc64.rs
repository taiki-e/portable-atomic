// Atomic{I,U}128 implementation on powerpc64.
//
// powerpc64 on pwr8+ support 128-bit atomics:
// https://github.com/llvm/llvm-project/commit/549e118e93c666914a1045fde38a2cac33e1e445
// https://github.com/llvm/llvm-project/blob/llvmorg-15.0.0/llvm/test/CodeGen/PowerPC/atomics-i128-ldst.ll
// https://github.com/llvm/llvm-project/blob/llvmorg-15.0.0/llvm/test/CodeGen/PowerPC/atomics-i128.ll
//
// powerpc64le is pwr8+ by default https://github.com/llvm/llvm-project/blob/llvmorg-15.0.0/llvm/lib/Target/PowerPC/PPC.td#L652
// See also https://github.com/rust-lang/rust/issues/59932
//
// Note that we do not separate LL and SC into separate functions, but handle
// them within a single asm block. This is because it is theoretically possible
// for the compiler to insert operations that might clear the reservation between
// LL and SC. See aarch64.rs for details.
//
// Refs:
// - Power ISA https://openpowerfoundation.org/specifications/isa
// - AIX Assembler language reference https://www.ibm.com/docs/en/aix/7.3?topic=aix-assembler-language-reference
// - atomic-maybe-uninit https://github.com/taiki-e/atomic-maybe-uninit
//
// Generated asm:
// - powerpc64 (pwr8) https://godbolt.org/z/EzMTYq8ne
// - powerpc64le https://godbolt.org/z/cE1511Ks1

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
#[repr(C)]
union I128 {
    whole: i128,
    pair: Pair,
}

#[derive(Clone, Copy)]
#[repr(C)]
struct Pair {
    #[cfg(target_endian = "big")]
    hi: u64,
    lo: u64,
    #[cfg(target_endian = "little")]
    hi: u64,
}

macro_rules! atomic_rmw {
    ($op:ident, $order:ident) => {
        match $order {
            Ordering::Relaxed => $op!("", ""),
            Ordering::Acquire => $op!("lwsync", ""),
            Ordering::Release => $op!("", "lwsync"),
            Ordering::AcqRel => $op!("lwsync", "lwsync"),
            Ordering::SeqCst => $op!("lwsync", "sync"),
            _ => unreachable!("{:?}", $order),
        }
    };
}

#[inline]
unsafe fn atomic_load(src: *mut u128, order: Ordering) -> u128 {
    debug_assert!(src as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_load`.
    //
    // Refs: "3.3.4 Fixed Point Load and Store Quadword Instructions" of Power ISA
    unsafe {
        let (out_hi, out_lo);
        match order {
            Ordering::Relaxed => {
                asm!(
                    "lq %r4, 0({src})",
                    src = in(reg) src,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r4") out_hi,
                    out("r5") out_lo,
                    options(nostack, readonly),
                );
            }
            Ordering::Acquire => {
                asm!(
                    "lq %r4, 0({src})",
                    // Lightweight acquire sync
                    // Refs: https://github.com/boostorg/atomic/blob/boost-1.79.0/include/boost/atomic/detail/core_arch_ops_gcc_ppc.hpp#L47-L62
                    "cmpd %cr7, %r4, %r4",
                    "bne- %cr7, 2f",
                    "2:",
                    "isync",
                    src = in(reg) src,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r4") out_hi,
                    out("r5") out_lo,
                    out("cr7") _,
                    options(nostack),
                );
            }
            Ordering::SeqCst => {
                asm!(
                    "sync",
                    "lq %r4, 0({src})",
                    // Lightweight acquire sync
                    // Refs: https://github.com/boostorg/atomic/blob/boost-1.79.0/include/boost/atomic/detail/core_arch_ops_gcc_ppc.hpp#L47-L62
                    "cmpd %cr7, %r4, %r4",
                    "bne- %cr7, 2f",
                    "2:",
                    "isync",
                    src = in(reg) src,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r4") out_hi,
                    out("r5") out_lo,
                    out("cr7") _,
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
    //
    // Refs: "3.3.4 Fixed Point Load and Store Quadword Instructions" of Power ISA
    unsafe {
        let val = U128 { whole: val };
        macro_rules! atomic_store {
            ($release:tt) => {
                asm!(
                    $release,
                    "stq %r4, 0({dst})",
                    dst = in(reg) dst,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
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
unsafe fn atomic_compare_exchange(
    dst: *mut u128,
    old: u128,
    new: u128,
    success: Ordering,
    failure: Ordering,
) -> Result<u128, u128> {
    debug_assert!(dst as usize % 16 == 0);
    let order = crate::utils::upgrade_success_ordering(success, failure);

    // SAFETY: the caller must uphold the safety contract for `atomic_compare_exchange`.
    //
    // Refs: "4.6.2.2 128-bit Load And Reserve and Store Conditional Instructions" of Power ISA
    let res = unsafe {
        let old = U128 { whole: old };
        let new = U128 { whole: new };
        let (mut prev_hi, mut prev_lo);
        macro_rules! cmpxchg {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r8, 0, {dst}",
                        "xor {tmp_lo}, %r9, {old_lo}",
                        "xor {tmp_hi}, %r8, {old_hi}",
                        "or. {tmp_lo}, {tmp_lo}, {tmp_hi}",
                        "bne %cr0, 3f",
                        "stqcx. %r6, 0, {dst}",
                        "bne %cr0, 2b",
                        "b 4f",
                    "3:",
                        "stqcx. %r8, 0, {dst}",
                    "4:",
                    $acquire,
                    dst = in(reg) dst,
                    old_hi = in(reg) old.pair.hi,
                    old_lo = in(reg) old.pair.lo,
                    tmp_hi = out(reg) _,
                    tmp_lo = out(reg) _,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    in("r6") new.pair.hi,
                    in("r7") new.pair.lo,
                    out("r8") prev_hi,
                    out("r9") prev_lo,
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        atomic_rmw!(cmpxchg, order);
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    };
    if res == old {
        Ok(res)
    } else {
        Err(res)
    }
}

// LLVM appears to generate strong CAS for powerpc64 128-bit weak CAS,
// so we always use strong CAS for now.
use atomic_compare_exchange as atomic_compare_exchange_weak;

#[inline]
unsafe fn atomic_swap(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_swap`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_hi, mut prev_lo);
        macro_rules! swap {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "mr %r9, {val_lo}",
                        "mr %r8, {val_hi}",
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    val_hi = in(reg) val.pair.hi,
                    val_lo = in(reg) val.pair.lo,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _, // new (hi)
                    out("r9") _, // new (lo)
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        atomic_rmw!(swap, order);
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_add(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_add`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_hi, mut prev_lo);
        macro_rules! add {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "addc %r9, {val_lo}, %r7",
                        "adde %r8, {val_hi}, %r6",
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    val_hi = in(reg) val.pair.hi,
                    val_lo = in(reg) val.pair.lo,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _, // new (hi)
                    out("r9") _, // new (lo)
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        atomic_rmw!(add, order);
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_sub(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_sub`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_hi, mut prev_lo);
        macro_rules! sub {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "subc %r9, %r7, {val_lo}",
                        "subfe %r8, {val_hi}, %r6",
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    val_hi = in(reg) val.pair.hi,
                    val_lo = in(reg) val.pair.lo,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _, // new (hi)
                    out("r9") _, // new (lo)
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        atomic_rmw!(sub, order);
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_and(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_and`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_hi, mut prev_lo);
        macro_rules! and {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "and %r9, {val_lo}, %r7",
                        "and %r8, {val_hi}, %r6",
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    val_hi = in(reg) val.pair.hi,
                    val_lo = in(reg) val.pair.lo,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _, // new (hi)
                    out("r9") _, // new (lo)
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        atomic_rmw!(and, order);
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_nand(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_nand`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_hi, mut prev_lo);
        macro_rules! nand {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "nand %r9, {val_lo}, %r7",
                        "nand %r8, {val_hi}, %r6",
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    val_hi = in(reg) val.pair.hi,
                    val_lo = in(reg) val.pair.lo,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _, // new (hi)
                    out("r9") _, // new (lo)
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        atomic_rmw!(nand, order);
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_or(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_or`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_hi, mut prev_lo);
        macro_rules! or {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "or %r9, {val_lo}, %r7",
                        "or %r8, {val_hi}, %r6",
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    val_hi = in(reg) val.pair.hi,
                    val_lo = in(reg) val.pair.lo,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _, // new (hi)
                    out("r9") _, // new (lo)
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        atomic_rmw!(or, order);
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_xor(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_xor`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_hi, mut prev_lo);
        macro_rules! xor {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "xor %r9, {val_lo}, %r7",
                        "xor %r8, {val_hi}, %r6",
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    val_hi = in(reg) val.pair.hi,
                    val_lo = in(reg) val.pair.lo,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _, // new (hi)
                    out("r9") _, // new (lo)
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        atomic_rmw!(xor, order);
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_max(dst: *mut i128, val: i128, order: Ordering) -> i128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_max`.
    unsafe {
        let val = I128 { whole: val };
        let (mut prev_hi, mut prev_lo);
        macro_rules! max {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "cmpld %r6, {val_hi}",       // compare hi 64-bit, store result to cr0
                        "cmpd %cr1, %r6, {val_hi}",  // (signed) compare hi 64-bit, store result to cr1
                        "crandc 20, 5, 2",
                        "cmpld %cr1, %r7, {val_lo}", // compare lo 64-bit, store result to cr1
                        "crand 21, 2, 5",
                        "cror 20, 21, 20",
                        "isel %r8, %r6, {val_hi}, 20", // select hi 64-bit
                        "isel %r9, %r7, {val_lo}, 20", // select lo 64-bit
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    val_hi = in(reg) val.pair.hi,
                    val_lo = in(reg) val.pair.lo,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _, // new (hi)
                    out("r9") _, // new (lo)
                    out("cr0") _,
                    out("cr1") _,
                    options(nostack),
                )
            };
        }
        atomic_rmw!(max, order);
        I128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_umax(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_umax`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_hi, mut prev_lo);
        macro_rules! umax {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "cmpld %r6, {val_hi}",       // compare hi 64-bit, store result to cr0
                        "cmpld %cr1, %r7, {val_lo}", // compare lo 64-bit, store result to cr1
                        "crandc 20, 1, 2",
                        "crand 21, 2, 5",
                        "cror 20, 21, 20",
                        "isel %r8, %r6, {val_hi}, 20", // select hi 64-bit
                        "isel %r9, %r7, {val_lo}, 20", // select lo 64-bit
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    val_hi = in(reg) val.pair.hi,
                    val_lo = in(reg) val.pair.lo,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _, // new (hi)
                    out("r9") _, // new (lo)
                    out("cr0") _,
                    out("cr1") _,
                    options(nostack),
                )
            };
        }
        atomic_rmw!(umax, order);
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_min(dst: *mut i128, val: i128, order: Ordering) -> i128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_min`.
    unsafe {
        let val = I128 { whole: val };
        let (mut prev_hi, mut prev_lo);
        macro_rules! min {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "cmpld %r6, {val_hi}",       // compare hi 64-bit, store result to cr0
                        "cmpd %cr1, %r6, {val_hi}",  // (signed) compare hi 64-bit, store result to cr1
                        "crandc 20, 5, 2",
                        "cmpld %cr1, %r7, {val_lo}", // compare lo 64-bit, store result to cr1
                        "crand 21, 2, 5",
                        "cror 20, 21, 20",
                        "isel %r8, {val_hi}, %r6, 20", // select hi 64-bit
                        "isel %r9, {val_lo}, %r7, 20", // select lo 64-bit
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    val_hi = in(reg) val.pair.hi,
                    val_lo = in(reg) val.pair.lo,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _, // new (hi)
                    out("r9") _, // new (lo)
                    out("cr0") _,
                    out("cr1") _,
                    options(nostack),
                )
            };
        }
        atomic_rmw!(min, order);
        I128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_umin(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_umin`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_hi, mut prev_lo);
        macro_rules! umin {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "cmpld %r6, {val_hi}",       // compare hi 64-bit, store result to cr0
                        "cmpld %cr1, %r7, {val_lo}", // compare lo 64-bit, store result to cr1
                        "crandc 20, 1, 2",
                        "crand 21, 2, 5",
                        "cror 20, 21, 20",
                        "isel %r8, {val_hi}, %r6, 20", // select hi 64-bit
                        "isel %r9, {val_lo}, %r7, 20", // select lo 64-bit
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    val_hi = in(reg) val.pair.hi,
                    val_lo = in(reg) val.pair.lo,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _, // new (hi)
                    out("r9") _, // new (lo)
                    out("cr0") _,
                    out("cr1") _,
                    options(nostack),
                )
            };
        }
        atomic_rmw!(umin, order);
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

atomic128!(AtomicI128, i128, atomic_max, atomic_min);
atomic128!(AtomicU128, u128, atomic_umax, atomic_umin);

#[cfg(test)]
mod tests {
    use super::*;

    #[cfg(not(qemu))]
    test_atomic_int!(i128);
    #[cfg(not(qemu))]
    test_atomic_int!(u128);
    // As of qemu 7.0.0 , using lqarx/stqcx. with qemu-user hangs.
    // To test this, use real powerpc64le hardware or use POWER Functional
    // Simulator. See DEVELOPMENT.md for more.
    #[cfg(qemu)]
    test_atomic_int_load_store!(i128);
    #[cfg(qemu)]
    test_atomic_int_load_store!(u128);
}
