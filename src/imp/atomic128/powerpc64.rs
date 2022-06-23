// Atomic{I,U}128 implementation on powerpc64.
//
// powerpc64 on pwr8+ support 128-bit atomics:
// https://github.com/llvm/llvm-project/commit/549e118e93c666914a1045fde38a2cac33e1e445
// https://github.com/llvm/llvm-project/blob/2ba5d820e2b0e5016ec706e324060a329f9a83a3/llvm/test/CodeGen/PowerPC/atomics-i128-ldst.ll
// https://github.com/llvm/llvm-project/blob/2ba5d820e2b0e5016ec706e324060a329f9a83a3/llvm/test/CodeGen/PowerPC/atomics-i128.ll
//
// powerpc64le is pwr8+ https://github.com/llvm/llvm-project/blob/2ba5d820e2b0e5016ec706e324060a329f9a83a3/llvm/lib/Target/PowerPC/PPC.td#L652
// See also https://github.com/rust-lang/rust/issues/59932
//
// Refs:
// - https://openpowerfoundation.org/specifications/isa
// - https://www.ibm.com/docs/en/aix/7.3?topic=aix-assembler-language-reference
// - atomic-maybe-uninit https://github.com/taiki-e/atomic-maybe-uninit
//
// Generated asm:
// - powerpc64 (pwr8) https://godbolt.org/z/rW4rWaefM
// - powerpc64le https://godbolt.org/z/c9b65TWz7

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
    //
    // Refs: https://www.ibm.com/docs/en/aix/7.3?topic=set-lq-load-quad-word-instruction
    unsafe {
        let (out_hi, out_lo);
        match order {
            Ordering::Relaxed => {
                asm!(
                    // (atomic) load from src to r4-r5 pair
                    "lq %r4, 0({src})",
                    src = in(reg) src,
                    out("r0") _,
                    // lq loads value into even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r4") out_hi,
                    out("r5") out_lo,
                    options(nostack),
                );
            }
            Ordering::Acquire => {
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
                    // lq loads value into even/odd pair of specified register and subsequent register.
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
                    // (atomic) load from src to r4-r5 pair
                    "lq %r4, 0({src})",
                    // Refs: https://github.com/boostorg/atomic/blob/a17267547071e0dd60c81945bcb6bf0162a5db07/include/boost/atomic/detail/core_arch_ops_gcc_ppc.hpp
                    "cmpd %cr7, %r4, %r4",
                    "bne- %cr7, 2f",
                    "2:",
                    "isync",
                    src = in(reg) src,
                    out("r0") _,
                    // lq loads value into even/odd pair of specified register and subsequent register.
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
    // Refs: https://www.ibm.com/docs/en/aix/7.3?topic=set-stq-store-quad-word-instruction
    unsafe {
        let val = U128 { whole: val };
        macro_rules! atomic_store {
            ($release:tt) => {
                asm!(
                    // (atomic) store r4-r5 pair to dst
                    $release,
                    "stq %r4, 0({dst})",
                    dst = in(reg) dst,
                    out("r0") _,
                    // lq loads value into even/odd pair of specified register and subsequent register.
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
    let success = crate::utils::upgrade_success_ordering(success, failure);

    // SAFETY: the caller must uphold the safety contract for `atomic_compare_exchange`.
    let res = unsafe {
        let old = U128 { whole: old };
        let new = U128 { whole: new };
        let (prev_hi, prev_lo);
        macro_rules! atomic_compare_exchange {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r8, 0, {dst}",
                        "xor %r11, %r9, %r5",
                        "xor %r10, %r8, %r4",
                        "or. %r11, %r11, %r10",
                        "bne %cr0, 3f",
                        "mr %r11, %r7",
                        "mr %r10, %r6",
                        "stqcx. %r10, 0, {dst}",
                        "bne %cr0, 2b",
                        "b 4f",
                    "3:",
                        "stqcx. %r8, 0, {dst}",
                    "4:",
                    $acquire,
                    dst = in(reg) dst,
                    out("r0") _,
                    // lq loads value into even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    in("r4") old.pair.hi,
                    in("r5") old.pair.lo,
                    in("r6") new.pair.hi,
                    in("r7") new.pair.lo,
                    out("r8") prev_hi,
                    out("r9") prev_lo,
                    out("r10") _,
                    out("r11") _,
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        match success {
            Ordering::Relaxed => atomic_compare_exchange!("", ""),
            Ordering::Acquire => atomic_compare_exchange!("lwsync", ""),
            Ordering::Release => atomic_compare_exchange!("", "lwsync"),
            Ordering::AcqRel => atomic_compare_exchange!("lwsync", "lwsync"),
            Ordering::SeqCst => atomic_compare_exchange!("lwsync", "sync"),
            _ => unreachable!("{:?}", success),
        }
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
unsafe fn atomic_swap(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_swap`.
    unsafe {
        let val = U128 { whole: val };
        let (prev_hi, prev_lo);
        macro_rules! atomic_swap {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "mr %r9, %r5",
                        "mr %r8, %r4",
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    out("r0") _,
                    // lq loads value into even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    in("r4") val.pair.hi,
                    in("r5") val.pair.lo,
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _,
                    out("r9") _,
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_swap!("", ""),
            Ordering::Acquire => atomic_swap!("lwsync", ""),
            Ordering::Release => atomic_swap!("", "lwsync"),
            Ordering::AcqRel => atomic_swap!("lwsync", "lwsync"),
            Ordering::SeqCst => atomic_swap!("lwsync", "sync"),
            _ => unreachable!("{:?}", order),
        }
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_add(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_add`.
    unsafe {
        let val = U128 { whole: val };
        let (prev_hi, prev_lo);
        macro_rules! atomic_add {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "addc %r9, %r5, %r7",
                        "adde %r8, %r4, %r6",
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    out("r0") _,
                    // lq loads value into even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    in("r4") val.pair.hi,
                    in("r5") val.pair.lo,
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _,
                    out("r9") _,
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_add!("", ""),
            Ordering::Acquire => atomic_add!("lwsync", ""),
            Ordering::Release => atomic_add!("", "lwsync"),
            Ordering::AcqRel => atomic_add!("lwsync", "lwsync"),
            Ordering::SeqCst => atomic_add!("lwsync", "sync"),
            _ => unreachable!("{:?}", order),
        }
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_sub(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_sub`.
    unsafe {
        let val = U128 { whole: val };
        let (prev_hi, prev_lo);
        macro_rules! atomic_sub {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "subc %r9, %r7, %r5",
                        "subfe %r8, %r4, %r6",
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    out("r0") _,
                    // lq loads value into even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    in("r4") val.pair.hi,
                    in("r5") val.pair.lo,
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _,
                    out("r9") _,
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_sub!("", ""),
            Ordering::Acquire => atomic_sub!("lwsync", ""),
            Ordering::Release => atomic_sub!("", "lwsync"),
            Ordering::AcqRel => atomic_sub!("lwsync", "lwsync"),
            Ordering::SeqCst => atomic_sub!("lwsync", "sync"),
            _ => unreachable!("{:?}", order),
        }
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_and(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_and`.
    unsafe {
        let val = U128 { whole: val };
        let (prev_hi, prev_lo);
        macro_rules! atomic_and {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "and %r9, %r5, %r7",
                        "and %r8, %r4, %r6",
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    out("r0") _,
                    // lq loads value into even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    in("r4") val.pair.hi,
                    in("r5") val.pair.lo,
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _,
                    out("r9") _,
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_and!("", ""),
            Ordering::Acquire => atomic_and!("lwsync", ""),
            Ordering::Release => atomic_and!("", "lwsync"),
            Ordering::AcqRel => atomic_and!("lwsync", "lwsync"),
            Ordering::SeqCst => atomic_and!("lwsync", "sync"),
            _ => unreachable!("{:?}", order),
        }
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_nand(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_nand`.
    unsafe {
        let val = U128 { whole: val };
        let (prev_hi, prev_lo);
        macro_rules! atomic_nand {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "nand %r9, %r5, %r7",
                        "nand %r8, %r4, %r6",
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    out("r0") _,
                    // lq loads value into even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    in("r4") val.pair.hi,
                    in("r5") val.pair.lo,
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _,
                    out("r9") _,
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_nand!("", ""),
            Ordering::Acquire => atomic_nand!("lwsync", ""),
            Ordering::Release => atomic_nand!("", "lwsync"),
            Ordering::AcqRel => atomic_nand!("lwsync", "lwsync"),
            Ordering::SeqCst => atomic_nand!("lwsync", "sync"),
            _ => unreachable!("{:?}", order),
        }
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_or(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_or`.
    unsafe {
        let val = U128 { whole: val };
        let (prev_hi, prev_lo);
        macro_rules! atomic_or {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "or %r9, %r5, %r7",
                        "or %r8, %r4, %r6",
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    out("r0") _,
                    // lq loads value into even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    in("r4") val.pair.hi,
                    in("r5") val.pair.lo,
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _,
                    out("r9") _,
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_or!("", ""),
            Ordering::Acquire => atomic_or!("lwsync", ""),
            Ordering::Release => atomic_or!("", "lwsync"),
            Ordering::AcqRel => atomic_or!("lwsync", "lwsync"),
            Ordering::SeqCst => atomic_or!("lwsync", "sync"),
            _ => unreachable!("{:?}", order),
        }
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_xor(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_xor`.
    unsafe {
        let val = U128 { whole: val };
        let (prev_hi, prev_lo);
        macro_rules! atomic_xor {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "xor %r9, %r5, %r7",
                        "xor %r8, %r4, %r6",
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    out("r0") _,
                    // lq loads value into even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    in("r4") val.pair.hi,
                    in("r5") val.pair.lo,
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _,
                    out("r9") _,
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_xor!("", ""),
            Ordering::Acquire => atomic_xor!("lwsync", ""),
            Ordering::Release => atomic_xor!("", "lwsync"),
            Ordering::AcqRel => atomic_xor!("lwsync", "lwsync"),
            Ordering::SeqCst => atomic_xor!("lwsync", "sync"),
            _ => unreachable!("{:?}", order),
        }
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_max(dst: *mut i128, val: i128, order: Ordering) -> i128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_max`.
    unsafe {
        let val = I128 { whole: val };
        let (prev_hi, prev_lo);
        macro_rules! atomic_max {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "cmpld %r6, %r4",       // cmp hi 64-bit, store result to cr0
                        "cmpd %cr1, %r6, %r4",  // (signed) cmp hi 64-bit, store result to cr1
                        "crandc 20, 5, 2",
                        "cmpld %cr1, %r7, %r5", // cmp lo 64-bit, store result to cr1
                        "crand 21, 2, 5",
                        "cror 20, 21, 20",
                        "isel %r8, %r6, %r4, 20", // select hi 64-bit
                        "isel %r9, %r7, %r5, 20", // select lo 64-bit
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    out("r0") _,
                    // lq loads value into even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    in("r4") val.pair.hi,
                    in("r5") val.pair.lo,
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _,
                    out("r9") _,
                    out("cr0") _,
                    out("cr1") _,
                    options(nostack),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_max!("", ""),
            Ordering::Acquire => atomic_max!("lwsync", ""),
            Ordering::Release => atomic_max!("", "lwsync"),
            Ordering::AcqRel => atomic_max!("lwsync", "lwsync"),
            Ordering::SeqCst => atomic_max!("lwsync", "sync"),
            _ => unreachable!("{:?}", order),
        }
        I128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_umax(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_umax`.
    unsafe {
        let val = U128 { whole: val };
        let (prev_hi, prev_lo);
        macro_rules! atomic_umax {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "cmpld %r6, %r4",       // cmp hi 64-bit, store result to cr0
                        "cmpld %cr1, %r7, %r5", // cmp lo 64-bit, store result to cr1
                        "crandc 20, 1, 2",
                        "crand 21, 2, 5",
                        "cror 20, 21, 20",
                        "isel %r8, %r6, %r4, 20", // select hi 64-bit
                        "isel %r9, %r7, %r5, 20", // select lo 64-bit
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    out("r0") _,
                    // lq loads value into even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    in("r4") val.pair.hi,
                    in("r5") val.pair.lo,
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _,
                    out("r9") _,
                    out("cr0") _,
                    out("cr1") _,
                    options(nostack),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_umax!("", ""),
            Ordering::Acquire => atomic_umax!("lwsync", ""),
            Ordering::Release => atomic_umax!("", "lwsync"),
            Ordering::AcqRel => atomic_umax!("lwsync", "lwsync"),
            Ordering::SeqCst => atomic_umax!("lwsync", "sync"),
            _ => unreachable!("{:?}", order),
        }
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_min(dst: *mut i128, val: i128, order: Ordering) -> i128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_min`.
    unsafe {
        let val = I128 { whole: val };
        let (prev_hi, prev_lo);
        macro_rules! atomic_min {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "cmpld %r6, %r4",       // cmp hi 64-bit, store result to cr0
                        "cmpd %cr1, %r6, %r4",  // (signed) cmp hi 64-bit, store result to cr1
                        "crandc 20, 5, 2",
                        "cmpld %cr1, %r7, %r5", // cmp lo 64-bit, store result to cr1
                        "crand 21, 2, 5",
                        "cror 20, 21, 20",
                        "isel %r8, %r4, %r6, 20", // select hi 64-bit
                        "isel %r9, %r5, %r7, 20", // select lo 64-bit
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    out("r0") _,
                    // lq loads value into even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    in("r4") val.pair.hi,
                    in("r5") val.pair.lo,
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _,
                    out("r9") _,
                    out("cr0") _,
                    out("cr1") _,
                    options(nostack),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_min!("", ""),
            Ordering::Acquire => atomic_min!("lwsync", ""),
            Ordering::Release => atomic_min!("", "lwsync"),
            Ordering::AcqRel => atomic_min!("lwsync", "lwsync"),
            Ordering::SeqCst => atomic_min!("lwsync", "sync"),
            _ => unreachable!("{:?}", order),
        }
        I128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

#[inline]
unsafe fn atomic_umin(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_umin`.
    unsafe {
        let val = U128 { whole: val };
        let (prev_hi, prev_lo);
        macro_rules! atomic_umin {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "cmpld %r6, %r4",       // cmp hi 64-bit, store result to cr0
                        "cmpld %cr1, %r7, %r5", // cmp lo 64-bit, store result to cr1
                        "crandc 20, 1, 2",
                        "crand 21, 2, 5",
                        "cror 20, 21, 20",
                        "isel %r8, %r4, %r6, 20", // select hi 64-bit
                        "isel %r9, %r5, %r7, 20", // select lo 64-bit
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    out("r0") _,
                    // lq loads value into even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    in("r4") val.pair.hi,
                    in("r5") val.pair.lo,
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    out("r8") _,
                    out("r9") _,
                    out("cr0") _,
                    out("cr1") _,
                    options(nostack),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_umin!("", ""),
            Ordering::Acquire => atomic_umin!("lwsync", ""),
            Ordering::Release => atomic_umin!("", "lwsync"),
            Ordering::AcqRel => atomic_umin!("lwsync", "lwsync"),
            Ordering::SeqCst => atomic_umin!("lwsync", "sync"),
            _ => unreachable!("{:?}", order),
        }
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

macro_rules! atomic128 {
    ($atomic_type:ident, $int_type:ident, $atomic_max:ident, $atomic_min:ident) => {
        #[repr(C, align(16))]
        pub(crate) struct $atomic_type {
            v: core::cell::UnsafeCell<$int_type>,
        }

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by atomic intrinsics.
        unsafe impl Sync for $atomic_type {}

        impl $atomic_type {
            #[inline]
            pub(crate) const fn new(v: $int_type) -> Self {
                Self { v: core::cell::UnsafeCell::new(v) }
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
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                crate::utils::assert_load_ordering(order);
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_load(self.v.get().cast(), order) as $int_type }
            }

            #[inline]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
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
                crate::utils::assert_compare_exchange_ordering(success, failure);
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
                crate::utils::assert_compare_exchange_ordering(success, failure);
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
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { $atomic_max(self.v.get(), val, order) }
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
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
