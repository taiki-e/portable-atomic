// Atomic{I,U}128 implementation on powerpc64.
//
// powerpc64 on pwr8+ support 128-bit atomics:
// https://github.com/llvm/llvm-project/commit/549e118e93c666914a1045fde38a2cac33e1e445
// https://github.com/llvm/llvm-project/blob/llvmorg-16.0.0/llvm/test/CodeGen/PowerPC/atomics-i128-ldst.ll
// https://github.com/llvm/llvm-project/blob/llvmorg-16.0.0/llvm/test/CodeGen/PowerPC/atomics-i128.ll
//
// powerpc64le is pwr8+ by default https://github.com/llvm/llvm-project/blob/llvmorg-16.0.0/llvm/lib/Target/PowerPC/PPC.td#L663
// See also https://github.com/rust-lang/rust/issues/59932
//
// Note that we do not separate LL and SC into separate functions, but handle
// them within a single asm block. This is because it is theoretically possible
// for the compiler to insert operations that might clear the reservation between
// LL and SC. See aarch64.rs for details.
//
// Note: On Miri and ThreadSanitizer which do not support inline assembly, we don't use
// this module and use intrinsics.rs instead.
//
// Refs:
// - Power ISA https://openpowerfoundation.org/specifications/isa
// - AIX Assembler language reference https://www.ibm.com/docs/en/aix/7.3?topic=aix-assembler-language-reference
// - atomic-maybe-uninit https://github.com/taiki-e/atomic-maybe-uninit
//
// Generated asm:
// - powerpc64 (pwr8) https://godbolt.org/z/a8xxWc1Wr
// - powerpc64le https://godbolt.org/z/r1j975Pza

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

    // SAFETY: the caller must uphold the safety contract.
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

    // SAFETY: the caller must uphold the safety contract.
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

    // SAFETY: the caller must uphold the safety contract.
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
                    "3:",
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

// Do not use atomic_rmw_ll_sc_3 because it needs extra MR.
#[inline]
unsafe fn atomic_swap(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_hi, mut prev_lo);
        macro_rules! op {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    out("r0") _,
                    // Quadword atomic instructions work with even/odd pair of specified register and subsequent register.
                    // We cannot use r1 and r2, so starting with r4.
                    out("r6") prev_hi,
                    out("r7") prev_lo,
                    in("r8") val.pair.hi,
                    in("r9") val.pair.lo,
                    out("cr0") _,
                    options(nostack),
                )
            };
        }
        atomic_rmw!(op, order);
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

/// Atomic RMW by LL/SC loop (3 arguments)
/// `unsafe fn(dst: *mut u128, val: u128, order: Ordering) -> u128;`
///
/// $op can use the following registers:
/// - val_hi/val_lo pair: val argument
/// - r6/r7 pair: previous value loaded by ll
/// - r8/r9 pair: new value that will to stored by sc
macro_rules! atomic_rmw_ll_sc_3 {
    ($name:ident, $($op:tt)*) => {
        #[inline]
        unsafe fn $name(dst: *mut u128, val: u128, order: Ordering) -> u128 {
            debug_assert!(dst as usize % 16 == 0);
            // SAFETY: the caller must uphold the safety contract.
            unsafe {
                let val = U128 { whole: val };
                let (mut prev_hi, mut prev_lo);
                macro_rules! op {
                    ($acquire:tt, $release:tt) => {
                        asm!(
                            $release,
                            "2:",
                                "lqarx %r6, 0, {dst}",
                                $($op)*
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
                atomic_rmw!(op, order);
                U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
            }
        }
        #[cfg(test)]
        paste::paste! {
            // Helper to test $op separately.
            unsafe fn [<$name _op>](dst: *mut u128, val: u128) -> u128 {
                debug_assert!(dst as usize % 16 == 0);
                // SAFETY: the caller must uphold the safety contract.
                unsafe {
                    let val = U128 { whole: val };
                    let (mut prev_hi, mut prev_lo);
                    asm!(
                        "lq %r6, 0({dst})",
                        $($op)*
                        "stq %r8, 0({dst})",
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
                    );
                    U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
                }
            }
        }
    };
}
atomic_rmw_ll_sc_3! {
    atomic_add,
    "addc %r9, {val_lo}, %r7",
    "adde %r8, {val_hi}, %r6",
}
atomic_rmw_ll_sc_3! {
    atomic_sub,
    "subc %r9, %r7, {val_lo}",
    "subfe %r8, {val_hi}, %r6",
}
atomic_rmw_ll_sc_3! {
    atomic_and,
    "and %r9, {val_lo}, %r7",
    "and %r8, {val_hi}, %r6",
}
atomic_rmw_ll_sc_3! {
    atomic_nand,
    "nand %r9, {val_lo}, %r7",
    "nand %r8, {val_hi}, %r6",
}
atomic_rmw_ll_sc_3! {
    atomic_or,
    "or %r9, {val_lo}, %r7",
    "or %r8, {val_hi}, %r6",
}
atomic_rmw_ll_sc_3! {
    atomic_xor,
    "xor %r9, {val_lo}, %r7",
    "xor %r8, {val_hi}, %r6",
}

#[inline]
unsafe fn atomic_not(dst: *mut u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract.
    unsafe { atomic_xor(dst, core::u128::MAX, order) }
}

#[inline]
unsafe fn atomic_neg(dst: *mut u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        let (mut prev_hi, mut prev_lo);
        macro_rules! neg {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    "2:",
                        "lqarx %r6, 0, {dst}",
                        // TODO: can we use subfic (Subtract from Immediate Carrying) here?
                        "subc %r9, {zero}, %r7",
                        "subfze %r8, %r6",
                        "stqcx. %r8, 0, {dst}",
                        "bne %cr0, 2b",
                    $acquire,
                    dst = in(reg) dst,
                    zero = in(reg) 0_u64,
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
        atomic_rmw!(neg, order);
        U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
    }
}

/// Atomic RMW by LL/SC loop (min/max)
/// `unsafe fn(dst: *mut $int_type, val: $int_type, order: Ordering) -> $int_type;`
///
/// $op can use the following registers:
/// - val_hi/val_lo pair: val argument
/// - r6/r7 pair: previous value loaded by ll
/// - r8/r9 pair: new value that will to stored by sc
macro_rules! atomic_rmw_ll_sc_cmp {
    ($name:ident, $($op:tt)*) => {
        #[inline]
        unsafe fn $name(dst: *mut u128, val: u128, order: Ordering) -> u128 {
            debug_assert!(dst as usize % 16 == 0);
            // SAFETY: the caller must uphold the safety contract.
            unsafe {
                let val = U128 { whole: val };
                let (mut prev_hi, mut prev_lo);
                macro_rules! op {
                    ($acquire:tt, $release:tt) => {
                        asm!(
                            $release,
                            "2:",
                                "lqarx %r6, 0, {dst}",
                                $($op)*
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
                atomic_rmw!(op, order);
                U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
            }
        }
        #[cfg(test)]
        paste::paste! {
            // Helper to test $op separately.
            unsafe fn [<$name _op>](dst: *mut u128, val: u128) -> u128 {
                debug_assert!(dst as usize % 16 == 0);
                // SAFETY: the caller must uphold the safety contract.
                unsafe {
                    let val = U128 { whole: val };
                    let (mut prev_hi, mut prev_lo);
                    asm!(
                        "lq %r6, 0({dst})",
                        $($op)*
                        "stq %r8, 0({dst})",
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
                    );
                    U128 { pair: Pair { hi: prev_hi, lo: prev_lo } }.whole
                }
            }
        }
    };
}
atomic_rmw_ll_sc_cmp! {
    atomic_max,
    "cmpld %r6, {val_hi}",       // compare hi 64-bit, store result to cr0
    "cmpd %cr1, %r6, {val_hi}",  // (signed) compare hi 64-bit, store result to cr1
    "crandc 20, 5, 2",
    "cmpld %cr1, %r7, {val_lo}", // compare lo 64-bit, store result to cr1
    "crand 21, 2, 5",
    "cror 20, 21, 20",
    "isel %r8, %r6, {val_hi}, 20", // select hi 64-bit
    "isel %r9, %r7, {val_lo}, 20", // select lo 64-bit
}
atomic_rmw_ll_sc_cmp! {
    atomic_umax,
    "cmpld %r6, {val_hi}",       // compare hi 64-bit, store result to cr0
    "cmpld %cr1, %r7, {val_lo}", // compare lo 64-bit, store result to cr1
    "crandc 20, 1, 2",
    "crand 21, 2, 5",
    "cror 20, 21, 20",
    "isel %r8, %r6, {val_hi}, 20", // select hi 64-bit
    "isel %r9, %r7, {val_lo}, 20", // select lo 64-bit
}
atomic_rmw_ll_sc_cmp! {
    atomic_min,
    "cmpld %r6, {val_hi}",       // compare hi 64-bit, store result to cr0
    "cmpd %cr1, %r6, {val_hi}",  // (signed) compare hi 64-bit, store result to cr1
    "crandc 20, 5, 2",
    "cmpld %cr1, %r7, {val_lo}", // compare lo 64-bit, store result to cr1
    "crand 21, 2, 5",
    "cror 20, 21, 20",
    "isel %r8, {val_hi}, %r6, 20", // select hi 64-bit
    "isel %r9, {val_lo}, %r7, 20", // select lo 64-bit
}
atomic_rmw_ll_sc_cmp! {
    atomic_umin,
    "cmpld %r6, {val_hi}",       // compare hi 64-bit, store result to cr0
    "cmpld %cr1, %r7, {val_lo}", // compare lo 64-bit, store result to cr1
    "crandc 20, 1, 2",
    "crand 21, 2, 5",
    "cror 20, 21, 20",
    "isel %r8, {val_hi}, %r6, 20", // select hi 64-bit
    "isel %r9, {val_lo}, %r7, 20", // select lo 64-bit
}

#[inline]
const fn is_always_lock_free() -> bool {
    true
}
use is_always_lock_free as is_lock_free;

atomic128!(AtomicI128, i128, atomic_max, atomic_min);
atomic128!(AtomicU128, u128, atomic_umax, atomic_umin);

#[cfg(test)]
mod tests {
    use super::*;

    #[cfg(not(qemu))]
    test_atomic_int!(i128);
    #[cfg(not(qemu))]
    test_atomic_int!(u128);
    // As of QEMU 7.2, using lqarx/stqcx. with qemu-user hangs.
    // To test this, use real powerpc64 hardware or use POWER Functional
    // Simulator. See DEVELOPMENT.md for more.
    #[cfg(qemu)]
    test_atomic_int_load_store!(i128);
    #[cfg(qemu)]
    test_atomic_int_load_store!(u128);

    test_atomic128_op!();
}
