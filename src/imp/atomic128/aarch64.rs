// Atomic{I,U}128 implementation for AArch64.
//
// There are a few ways to implement 128-bit atomic operations in AArch64.
//
// - LDXP/STXP loop (DW LL/SC)
// - CASP (DWCAS) added as FEAT_LSE (armv8.1-a)
// - LDP/STP (DW load/store) if FEAT_LSE2 (armv8.4-a) is available
//
// If the `outline-atomics` feature is not enabled, we use CASP if
// FEAT_LSE is enabled at compile-time, otherwise, use LDXP/STXP loop.
// If the `outline-atomics` feature is enabled, we use CASP for
// compare_exchange(_weak) if FEAT_LSE is available at run-time.
// If FEAT_LSE2 is available at compile-time, we use LDP/STP for load/store.
//
// Note: As of rustc 1.63, -C target-feature=+lse2 does not
// implicitly enable target_feature "lse". Also, target_feature "lse2" is not available on rustc side:
// https://github.com/rust-lang/rust/blob/1.63.0/compiler/rustc_codegen_ssa/src/target_features.rs#L45
//
// Note that we do not separate LL and SC into separate functions, but handle
// them within a single asm block. This is because it is theoretically possible
// for the compiler to insert operations that might clear the reservation between
// LL and SC. Considering the type of operations we are providing and the fact
// that progress64 (https://github.com/ARM-software/progress64) uses such code,
// this is probably not a problem for aarch64, but it seems that aarch64 doesn't
// guarantee it and hexagon is the only architecture that has hardware guarantees
// that such code will work. See also:
// - https://yarchive.net/comp/linux/cmpxchg_ll_sc_portability.html
// - https://lists.llvm.org/pipermail/llvm-dev/2016-May/099490.html
// - https://lists.llvm.org/pipermail/llvm-dev/2018-June/123993.html
//
// Refs:
// - ARM Compiler armasm User Guide
//   https://developer.arm.com/documentation/dui0801/latest
// - Arm Architecture Reference Manual for A-profile architecture
//   https://developer.arm.com/documentation/ddi0487/latest
// - atomic-maybe-uninit https://github.com/taiki-e/atomic-maybe-uninit
//
// Generated asm:
// - aarch64 https://godbolt.org/z/z5cd5W8fh
// - aarch64 (+lse) https://godbolt.org/z/offxb8rrj
// - aarch64 (+lse,+lse2) https://godbolt.org/z/8nn4WE4cj

include!("macros.rs");

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::sync::atomic::Ordering;

#[cfg(target_pointer_width = "32")]
macro_rules! ptr_modifier {
    () => {
        ":w"
    };
}
#[cfg(target_pointer_width = "64")]
macro_rules! ptr_modifier {
    () => {
        ""
    };
}
#[cfg(target_endian = "little")]
macro_rules! select_le_or_be {
    ($le:expr, $be:expr) => {
        $le
    };
}
#[cfg(target_endian = "big")]
macro_rules! select_le_or_be {
    ($le:expr, $be:expr) => {
        $be
    };
}

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
    lo: u64,
    hi: u64,
}

macro_rules! atomic_rmw {
    ($op:ident, $order:ident) => {
        match $order {
            Ordering::Relaxed => $op!("", ""),
            Ordering::Acquire => $op!("a", ""),
            Ordering::Release => $op!("", "l"),
            // AcqRel and SeqCst RMWs are equivalent.
            Ordering::AcqRel | Ordering::SeqCst => $op!("a", "l"),
            _ => unreachable_unchecked!("{:?}", $order),
        }
    };
}

// If CPU supports FEAT_LSE2, LDP is single-copy atomic reads,
// otherwise it is two single-copy atomic reads.
// Refs: B2.2.1 of the Arm Architecture Reference Manual Armv8, for Armv8-A architecture profile
#[cfg(any(target_feature = "lse2", portable_atomic_target_feature = "lse2", test))]
#[inline]
unsafe fn _ldp(src: *mut u128, order: Ordering) -> u128 {
    debug_assert!(src as usize % 16 == 0);

    // SAFETY: the caller must guarantee that `dst` is valid for reads,
    // 16-byte aligned, that there are no concurrent non-atomic operations.
    //
    // Refs:
    // - LDP: https://developer.arm.com/documentation/dui0801/g/A64-Data-Transfer-Instructions/LDP
    unsafe {
        let (prev_lo, prev_hi);
        macro_rules! atomic_load {
            ($acquire:tt $(, $readonly:tt)?) => {
                asm!(
                    concat!("ldp {prev_lo}, {prev_hi}, [{src", ptr_modifier!(), "}]"),
                    $acquire,
                    src = in(reg) src,
                    prev_hi = lateout(reg) prev_hi,
                    prev_lo = lateout(reg) prev_lo,
                    options(nostack, preserves_flags $(, $readonly)?),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_load!("", readonly),
            Ordering::Acquire => atomic_load!("dmb ishld"),
            Ordering::SeqCst => atomic_load!("dmb ish"),
            _ => unreachable_unchecked!("{:?}", order),
        }
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

// If CPU supports FEAT_LSE2, STP is single-copy atomic writes,
// otherwise it is two single-copy atomic writes.
// Refs: B2.2.1 of the Arm Architecture Reference Manual Armv8, for Armv8-A architecture profile
#[cfg(any(target_feature = "lse2", portable_atomic_target_feature = "lse2", test))]
#[inline]
unsafe fn _stp(dst: *mut u128, val: u128, order: Ordering) {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must guarantee that `dst` is valid for writes,
    // 16-byte aligned, that there are no concurrent non-atomic operations.
    //
    // Refs:
    // - STP: https://developer.arm.com/documentation/dui0801/g/A64-Data-Transfer-Instructions/STP
    unsafe {
        let val = U128 { whole: val };
        macro_rules! atomic_store {
            ($acquire:tt, $release:tt) => {
                asm!(
                    $release,
                    concat!("stp {val_lo}, {val_hi}, [{dst", ptr_modifier!(), "}]"),
                    $acquire,
                    dst = in(reg) dst,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    options(nostack, preserves_flags),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_store!("", ""),
            Ordering::Release => atomic_store!("", "dmb ish"),
            Ordering::SeqCst => atomic_store!("dmb ish", "dmb ish"),
            _ => unreachable_unchecked!("{:?}", order),
        }
    }
}

#[inline]
unsafe fn atomic_load(src: *mut u128, order: Ordering) -> u128 {
    #[deny(unreachable_patterns)]
    match () {
        #[cfg(any(target_feature = "lse2", portable_atomic_target_feature = "lse2"))]
        // SAFETY: the caller must uphold the safety contract for `atomic_load`.
        // cfg guarantee that the CPU supports FEAT_LSE2.
        () => unsafe { _ldp(src, order) },
        #[cfg(any(target_feature = "lse", portable_atomic_target_feature = "lse"))]
        #[cfg(not(any(target_feature = "lse2", portable_atomic_target_feature = "lse2")))]
        // SAFETY: the caller must uphold the safety contract for `atomic_load`.
        // cfg guarantee that the CPU supports FEAT_LSE.
        () => unsafe { _compare_exchange_casp(src, 0, 0, order) },
        #[cfg(not(any(target_feature = "lse", portable_atomic_target_feature = "lse")))]
        #[cfg(not(any(target_feature = "lse2", portable_atomic_target_feature = "lse2")))]
        // SAFETY: the caller must uphold the safety contract for `atomic_load`.
        () => unsafe { _atomic_load_ldxp_stxp(src, order) },
    }
}

#[inline]
unsafe fn _atomic_load_ldxp_stxp(src: *mut u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_swap`.
    unsafe {
        let (mut prev_lo, mut prev_hi);
        macro_rules! atomic_load {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{src", ptr_modifier!(), "}]"),
                        concat!("st", $release, "xp {r:w}, {prev_lo}, {prev_hi}, [{src", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r:w}, 2b",
                    src = in(reg) src,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    r = out(reg) _,
                    options(nostack, preserves_flags),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_load!("", ""),
            Ordering::Acquire => atomic_load!("a", ""),
            Ordering::SeqCst => atomic_load!("a", "l"),
            _ => unreachable_unchecked!("{:?}", order),
        }
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

#[inline]
unsafe fn atomic_store(dst: *mut u128, val: u128, order: Ordering) {
    #[deny(unreachable_patterns)]
    match () {
        #[cfg(any(target_feature = "lse2", portable_atomic_target_feature = "lse2"))]
        // SAFETY: the caller must uphold the safety contract for `atomic_store`.
        // cfg guarantee that the CPU supports FEAT_LSE2.
        () => unsafe { _stp(dst, val, order) },
        #[cfg(not(any(target_feature = "lse2", portable_atomic_target_feature = "lse2")))]
        // SAFETY: the caller must uphold the safety contract for `atomic_store`.
        () => unsafe {
            atomic_swap(dst, val, order);
        },
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
    let success = crate::utils::upgrade_success_ordering(success, failure);

    #[deny(unreachable_patterns)]
    let res = match () {
        #[cfg(any(target_feature = "lse", portable_atomic_target_feature = "lse"))]
        // SAFETY: the caller must uphold the safety contract for `atomic_compare_exchange`.
        // cfg guarantee that the CPU supports FEAT_LSE.
        () => unsafe { _compare_exchange_casp(dst, old, new, success) },
        #[cfg(not(all(
            not(portable_atomic_no_aarch64_target_feature),
            feature = "outline-atomics",
            // https://github.com/rust-lang/stdarch/blob/28335054b1f417175ab5005cf1d9cf7937737930/crates/std_detect/src/detect/mod.rs
            // Note: aarch64 freebsd is tier 3, so std may not be available.
            any(feature = "std", target_os = "linux", target_os = "windows", /* target_os = "freebsd" */)
        )))]
        #[cfg(not(any(target_feature = "lse", portable_atomic_target_feature = "lse")))]
        // SAFETY: the caller must uphold the safety contract for `atomic_compare_exchange`.
        () => unsafe { _compare_exchange_ldxp_stxp(dst, old, new, success) },
        #[cfg(all(
            not(portable_atomic_no_aarch64_target_feature),
            feature = "outline-atomics",
            // https://github.com/rust-lang/stdarch/blob/28335054b1f417175ab5005cf1d9cf7937737930/crates/std_detect/src/detect/mod.rs
            // Note: aarch64 freebsd is tier 3, so std may not be available.
            any(feature = "std", target_os = "linux", target_os = "windows", /* target_os = "freebsd" */)
        ))]
        #[cfg(not(any(target_feature = "lse", portable_atomic_target_feature = "lse")))]
        () => {
            extern crate std;
            // SAFETY: the caller must guarantee that `dst` is valid for both writes and
            // reads, 16-byte aligned, that there are no concurrent non-atomic operations,
            // and we've checked if FEAT_LSE is available.
            unsafe {
                ifunc!(unsafe fn(dst: *mut u128, old: u128, new: u128, success: Ordering) -> u128;
                if std::arch::is_aarch64_feature_detected!("lse") {
                    _compare_exchange_casp
                } else {
                    _compare_exchange_ldxp_stxp
                })
            }
        }
    };
    if res == old {
        Ok(res)
    } else {
        Err(res)
    }
}

#[cfg(any(
    target_feature = "lse",
    portable_atomic_target_feature = "lse",
    not(portable_atomic_no_aarch64_target_feature),
))]
#[cfg_attr(not(portable_atomic_no_aarch64_target_feature), target_feature(enable = "lse"))]
#[inline]
unsafe fn _compare_exchange_casp(dst: *mut u128, old: u128, new: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must guarantee that `dst` is valid for both writes and
    // reads, 16-byte aligned, that there are no concurrent non-atomic operations,
    // and the CPU supports FEAT_LSE.
    //
    // Refs:
    // - CASP(AL): https://developer.arm.com/documentation/dui0801/g/A64-Data-Transfer-Instructions/CASPA--CASPAL--CASP--CASPL--CASPAL--CASP--CASPL
    unsafe {
        let old = U128 { whole: old };
        let new = U128 { whole: new };
        let (prev_lo, prev_hi);
        macro_rules! cmpxchg {
            ($acquire:tt, $release:tt) => {
                asm!(
                    concat!("casp", $acquire, $release, " x6, x7, x4, x5, [{dst", ptr_modifier!(), "}]"),
                    dst = in(reg) dst,
                    // must be allocated to even/odd register pair
                    inout("x6") old.pair.lo => prev_lo,
                    inout("x7") old.pair.hi => prev_hi,
                    // must be allocated to even/odd register pair
                    in("x4") new.pair.lo,
                    in("x5") new.pair.hi,
                    options(nostack, preserves_flags),
                )
            };
        }
        atomic_rmw!(cmpxchg, order);
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

#[inline]
unsafe fn _compare_exchange_ldxp_stxp(
    dst: *mut u128,
    old: u128,
    new: u128,
    order: Ordering,
) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must guarantee that `dst` is valid for both writes and
    // reads, 16-byte aligned, and that there are no concurrent non-atomic operations.
    //
    // Refs:
    // - LDXP: https://developer.arm.com/documentation/dui0801/g/A64-Data-Transfer-Instructions/LDXP
    // - LDAXP: https://developer.arm.com/documentation/dui0801/g/A64-Data-Transfer-Instructions/LDAXP
    // - STXP: https://developer.arm.com/documentation/dui0801/g/A64-Data-Transfer-Instructions/STXP
    // - STLXP: https://developer.arm.com/documentation/dui0801/g/A64-Data-Transfer-Instructions/STLXP
    //
    // Note: Load-Exclusive pair (by itself) does not guarantee atomicity; to complete an atomic
    // operation (even load/store), a corresponding Store-Exclusive pair must succeed.
    // See Arm Architecture Reference Manual for A-profile architecture
    // Section B2.2.1 "Requirements for single-copy atomicity", and
    // Section B2.9 "Synchronization and semaphores" for more.
    unsafe {
        let old = U128 { whole: old };
        let new = U128 { whole: new };
        let (mut prev_lo, mut prev_hi);
        macro_rules! cmpxchg {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {out_lo}, {out_hi}, [{dst", ptr_modifier!(), "}]"),
                        "cmp {out_lo}, {old_lo}",
                        "cset {r:w}, ne",
                        "cmp {out_hi}, {old_hi}",
                        "cinc {r:w}, {r:w}, ne",
                        "cbz {r:w}, 3f",
                        concat!("st", $release, "xp {r:w}, {out_lo}, {out_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r:w}, 2b",
                        "b 4f",
                    "3:",
                        concat!("st", $release, "xp {r:w}, {new_lo}, {new_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r:w}, 2b",
                    "4:",
                    dst = in(reg) dst,
                    old_lo = in(reg) old.pair.lo,
                    old_hi = in(reg) old.pair.hi,
                    new_lo = in(reg) new.pair.lo,
                    new_hi = in(reg) new.pair.hi,
                    out_lo = out(reg) prev_lo,
                    out_hi = out(reg) prev_hi,
                    r = out(reg) _,
                    // Do not use `preserves_flags` because CMP modifies the condition flags.
                    options(nostack),
                )
            };
        }
        atomic_rmw!(cmpxchg, order);
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

// LLVM appears to generate strong CAS for aarch64 128-bit weak CAS,
// so we always use strong CAS for now.
use self::atomic_compare_exchange as atomic_compare_exchange_weak;

#[inline]
unsafe fn atomic_swap(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_swap`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_lo, mut prev_hi);
        macro_rules! swap {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                        concat!("st", $release, "xp {r:w}, {val_lo}, {val_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r:w}, 2b",
                    dst = in(reg) dst,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    r = out(reg) _,
                    options(nostack, preserves_flags),
                )
            };
        }
        atomic_rmw!(swap, order);
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

#[inline]
unsafe fn atomic_add(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_add`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_lo, mut prev_hi);
        macro_rules! add {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                        concat!("adds ", select_le_or_be!("{tmp_lo}, {prev_lo}, {val_lo}", "{tmp_hi}, {prev_hi}, {val_hi}")),
                        concat!("adcs ", select_le_or_be!("{tmp_hi}, {prev_hi}, {val_hi}", "{tmp_lo}, {prev_lo}, {val_lo}")),
                        concat!("st", $release, "xp {r:w}, {tmp_lo}, {tmp_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r:w}, 2b",
                    dst = in(reg) dst,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    tmp_lo = out(reg) _,
                    tmp_hi = out(reg) _,
                    r = out(reg) _,
                    // Do not use `preserves_flags` because ADDS and ADCS modify the condition flags.
                    options(nostack),
                )
            };
        }
        atomic_rmw!(add, order);
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

#[inline]
unsafe fn atomic_sub(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_sub`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_lo, mut prev_hi);
        macro_rules! sub {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                        concat!("subs ", select_le_or_be!("{tmp_lo}, {prev_lo}, {val_lo}", "{tmp_hi}, {prev_hi}, {val_hi}")),
                        concat!("sbcs ", select_le_or_be!("{tmp_hi}, {prev_hi}, {val_hi}", "{tmp_lo}, {prev_lo}, {val_lo}")),
                        concat!("st", $release, "xp {r:w}, {tmp_lo}, {tmp_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r:w}, 2b",
                    dst = in(reg) dst,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    tmp_lo = out(reg) _,
                    tmp_hi = out(reg) _,
                    r = out(reg) _,
                    // Do not use `preserves_flags` because SUBS and SBCS modify the condition flags.
                    options(nostack),
                )
            };
        }
        atomic_rmw!(sub, order);
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

#[inline]
unsafe fn atomic_and(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_and`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_lo, mut prev_hi);
        macro_rules! and {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                        "and {tmp_lo}, {prev_lo}, {val_lo}",
                        "and {tmp_hi}, {prev_hi}, {val_hi}",
                        concat!("st", $release, "xp {r:w}, {tmp_lo}, {tmp_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r:w}, 2b",
                    dst = in(reg) dst,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    tmp_lo = out(reg) _,
                    tmp_hi = out(reg) _,
                    r = out(reg) _,
                    options(nostack, preserves_flags),
                )
            };
        }
        atomic_rmw!(and, order);
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

#[inline]
unsafe fn atomic_nand(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_nand`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_lo, mut prev_hi);
        macro_rules! nand {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                        "and {tmp_lo}, {prev_lo}, {val_lo}",
                        "mvn {tmp_lo}, {tmp_lo}",
                        "and {tmp_hi}, {prev_hi}, {val_hi}",
                        "mvn {tmp_hi}, {tmp_hi}",
                        concat!("st", $release, "xp {r:w}, {tmp_lo}, {tmp_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r:w}, 2b",
                    dst = in(reg) dst,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    tmp_lo = out(reg) _,
                    tmp_hi = out(reg) _,
                    r = out(reg) _,
                    options(nostack, preserves_flags),
                )
            };
        }
        atomic_rmw!(nand, order);
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

#[inline]
unsafe fn atomic_or(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_or`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_lo, mut prev_hi);
        macro_rules! or {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                        "orr {tmp_lo}, {prev_lo}, {val_lo}",
                        "orr {tmp_hi}, {prev_hi}, {val_hi}",
                        concat!("st", $release, "xp {r:w}, {tmp_lo}, {tmp_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r:w}, 2b",
                    dst = in(reg) dst,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    tmp_lo = out(reg) _,
                    tmp_hi = out(reg) _,
                    r = out(reg) _,
                    options(nostack, preserves_flags),
                )
            };
        }
        atomic_rmw!(or, order);
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

#[inline]
unsafe fn atomic_xor(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_xor`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_lo, mut prev_hi);
        macro_rules! xor {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                        "eor {tmp_lo}, {prev_lo}, {val_lo}",
                        "eor {tmp_hi}, {prev_hi}, {val_hi}",
                        concat!("st", $release, "xp {r:w}, {tmp_lo}, {tmp_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r:w}, 2b",
                    dst = in(reg) dst,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    tmp_lo = out(reg) _,
                    tmp_hi = out(reg) _,
                    r = out(reg) _,
                    options(nostack, preserves_flags),
                )
            };
        }
        atomic_rmw!(xor, order);
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

#[inline]
unsafe fn atomic_max(dst: *mut i128, val: i128, order: Ordering) -> i128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_max`.
    unsafe {
        let val = I128 { whole: val };
        let (mut prev_lo, mut prev_hi);
        #[cfg(target_endian = "little")]
        macro_rules! max {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                        "cmp {prev_lo}, {val_lo}", // compare lo 64-bit
                        "cset {r_lo:w}, hi",       // store comparison result
                        "cmp {prev_hi}, {val_hi}", // compare hi 64-bit
                        "cset {r_hi:w}, gt",       // store comparison result
                        "csel {r_lo:w}, {r_lo:w}, {r_hi:w}, eq",
                        "cmp {r_lo:w}, #0",
                        "csel {new_hi}, {prev_hi}, {val_hi}, ne", // select hi 64-bit
                        "csel {new_lo}, {prev_lo}, {val_lo}, ne", // select lo 64-bit
                        concat!("st", $release, "xp {r_lo:w}, {new_lo}, {new_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r_lo:w}, 2b",
                    dst = in(reg) dst,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    new_lo = out(reg) _,
                    new_hi = out(reg) _,
                    r_lo = out(reg) _,
                    r_hi = out(reg) _,
                    // Do not use `preserves_flags` because CMP modifies the condition flags.
                    options(nostack),
                )
            };
        }
        #[cfg(target_endian = "big")]
        macro_rules! max {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                        "cmp {prev_hi}, {val_hi}", // compare hi 64-bit
                        "cset {r_hi:w}, hi",       // store comparison result
                        "cmp {prev_lo}, {val_lo}", // compare lo 64-bit
                        "cset {r_lo:w}, gt",       // store comparison result
                        "csel {r_hi:w}, {r_hi:w}, {r_lo:w}, eq",
                        "cmp {r_hi:w}, #0",
                        "csel {new_lo}, {prev_lo}, {val_lo}, ne", // select lo 64-bit
                        "csel {new_hi}, {prev_hi}, {val_hi}, ne", // select hi 64-bit
                        concat!("st", $release, "xp {r_hi:w}, {new_lo}, {new_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r_hi:w}, 2b",
                    dst = in(reg) dst,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    new_lo = out(reg) _,
                    new_hi = out(reg) _,
                    r_lo = out(reg) _,
                    r_hi = out(reg) _,
                    // Do not use `preserves_flags` because CMP modifies the condition flags.
                    options(nostack),
                )
            };
        }
        atomic_rmw!(max, order);
        I128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

#[inline]
unsafe fn atomic_umax(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_umax`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_lo, mut prev_hi);
        #[cfg(target_endian = "little")]
        macro_rules! umax {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                        "cmp {prev_lo}, {val_lo}", // compare lo 64-bit
                        "cset {r_lo:w}, hi",       // store comparison result
                        "cmp {prev_hi}, {val_hi}", // compare hi 64-bit
                        "cset {r_hi:w}, hi",       // store comparison result
                        "csel {r_lo:w}, {r_lo:w}, {r_hi:w}, eq",
                        "cmp {r_lo:w}, #0",
                        "csel {new_hi}, {prev_hi}, {val_hi}, ne", // select hi 64-bit
                        "csel {new_lo}, {prev_lo}, {val_lo}, ne", // select lo 64-bit
                        concat!("st", $release, "xp {r_lo:w}, {new_lo}, {new_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r_lo:w}, 2b",
                    dst = in(reg) dst,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    new_lo = out(reg) _,
                    new_hi = out(reg) _,
                    r_lo = out(reg) _,
                    r_hi = out(reg) _,
                    // Do not use `preserves_flags` because CMP modifies the condition flags.
                    options(nostack),
                )
            };
        }
        #[cfg(target_endian = "big")]
        macro_rules! umax {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                        "cmp {prev_hi}, {val_hi}", // compare hi 64-bit
                        "cset {r_hi:w}, hi",       // store comparison result
                        "cmp {prev_lo}, {val_lo}", // compare lo 64-bit
                        "cset {r_lo:w}, hi",       // store comparison result
                        "csel {r_hi:w}, {r_hi:w}, {r_lo:w}, eq",
                        "cmp {r_hi:w}, #0",
                        "csel {new_lo}, {prev_lo}, {val_lo}, ne", // select lo 64-bit
                        "csel {new_hi}, {prev_hi}, {val_hi}, ne", // select hi 64-bit
                        concat!("st", $release, "xp {r_hi:w}, {new_lo}, {new_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r_hi:w}, 2b",
                    dst = in(reg) dst,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    new_lo = out(reg) _,
                    new_hi = out(reg) _,
                    r_lo = out(reg) _,
                    r_hi = out(reg) _,
                    // Do not use `preserves_flags` because CMP modifies the condition flags.
                    options(nostack),
                )
            };
        }
        atomic_rmw!(umax, order);
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

#[inline]
unsafe fn atomic_min(dst: *mut i128, val: i128, order: Ordering) -> i128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_min`.
    unsafe {
        let val = I128 { whole: val };
        let (mut prev_lo, mut prev_hi);
        #[cfg(target_endian = "little")]
        macro_rules! min {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                        "cmp {prev_lo}, {val_lo}", // compare lo 64-bit
                        "cset {r_lo:w}, ls",       // store comparison result
                        "cmp {prev_hi}, {val_hi}", // compare hi 64-bit
                        "cset {r_hi:w}, le",       // store comparison result
                        "csel {r_lo:w}, {r_lo:w}, {r_hi:w}, eq",
                        "cmp {r_lo:w}, #0",
                        "csel {new_hi}, {prev_hi}, {val_hi}, ne", // select hi 64-bit
                        "csel {new_lo}, {prev_lo}, {val_lo}, ne", // select lo 64-bit
                        concat!("st", $release, "xp {r_lo:w}, {new_lo}, {new_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r_lo:w}, 2b",
                    dst = in(reg) dst,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    new_lo = out(reg) _,
                    new_hi = out(reg) _,
                    r_lo = out(reg) _,
                    r_hi = out(reg) _,
                    // Do not use `preserves_flags` because CMP modifies the condition flags.
                    options(nostack),
                )
            };
        }
        #[cfg(target_endian = "big")]
        macro_rules! min {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                        "cmp {prev_hi}, {val_hi}", // compare hi 64-bit
                        "cset {r_hi:w}, hi",       // store comparison result
                        "cmp {prev_lo}, {val_lo}", // compare lo 64-bit
                        "cset {r_lo:w}, gt",       // store comparison result
                        "csel {r_hi:w}, {r_hi:w}, {r_lo:w}, eq",
                        "cmp {r_hi:w}, #0",
                        "csel {new_lo}, {val_lo}, {prev_lo}, ne", // select lo 64-bit
                        "csel {new_hi}, {val_hi}, {prev_hi}, ne", // select hi 64-bit
                        concat!("st", $release, "xp {r_hi:w}, {new_lo}, {new_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r_hi:w}, 2b",
                    dst = in(reg) dst,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    new_lo = out(reg) _,
                    new_hi = out(reg) _,
                    r_lo = out(reg) _,
                    r_hi = out(reg) _,
                    // Do not use `preserves_flags` because CMP modifies the condition flags.
                    options(nostack),
                )
            };
        }
        atomic_rmw!(min, order);
        I128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

#[inline]
unsafe fn atomic_umin(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `atomic_umin`.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_lo, mut prev_hi);
        #[cfg(target_endian = "little")]
        macro_rules! umin {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                        "cmp {prev_lo}, {val_lo}", // compare lo 64-bit
                        "cset {r_lo:w}, ls",       // store comparison result
                        "cmp {prev_hi}, {val_hi}", // compare hi 64-bit
                        "cset {r_hi:w}, ls",       // store comparison result
                        "csel {r_lo:w}, {r_lo:w}, {r_hi:w}, eq",
                        "cmp {r_lo:w}, #0",
                        "csel {new_hi}, {prev_hi}, {val_hi}, ne", // select hi 64-bit
                        "csel {new_lo}, {prev_lo}, {val_lo}, ne", // select lo 64-bit
                        concat!("st", $release, "xp {r_lo:w}, {new_lo}, {new_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r_lo:w}, 2b",
                    dst = in(reg) dst,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    new_lo = out(reg) _,
                    new_hi = out(reg) _,
                    r_lo = out(reg) _,
                    r_hi = out(reg) _,
                    // Do not use `preserves_flags` because CMP modifies the condition flags.
                    options(nostack),
                )
            };
        }
        #[cfg(target_endian = "big")]
        macro_rules! umin {
            ($acquire:tt, $release:tt) => {
                asm!(
                    "2:",
                        concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                        "cmp {prev_hi}, {val_hi}", // compare hi 64-bit
                        "cset {r_hi:w}, ls",       // store comparison result
                        "cmp {prev_lo}, {val_lo}", // compare lo 64-bit
                        "cset {r_lo:w}, ls",       // store comparison result
                        "csel {r_hi:w}, {r_hi:w}, {r_lo:w}, eq",
                        "cmp {r_hi:w}, #0",
                        "csel {new_lo}, {prev_lo}, {val_lo}, ne", // select lo 64-bit
                        "csel {new_hi}, {prev_hi}, {val_hi}, ne", // select hi 64-bit
                        concat!("st", $release, "xp {r_hi:w}, {new_lo}, {new_hi}, [{dst", ptr_modifier!(), "}]"),
                        // 0 if the store was successful, 1 if no store was performed
                        "cbnz {r_hi:w}, 2b",
                    dst = in(reg) dst,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    new_lo = out(reg) _,
                    new_hi = out(reg) _,
                    r_lo = out(reg) _,
                    r_hi = out(reg) _,
                    // Do not use `preserves_flags` because CMP modifies the condition flags.
                    options(nostack),
                )
            };
        }
        atomic_rmw!(umin, order);
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

atomic128!(AtomicI128, i128, atomic_max, atomic_min);
atomic128!(AtomicU128, u128, atomic_umax, atomic_umin);

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_int!(i128);
    test_atomic_int!(u128);
}

#[cfg(test)]
#[allow(dead_code, clippy::undocumented_unsafe_blocks, clippy::wildcard_imports)]
mod tests_no_outline_atomics {
    use super::*;

    #[inline]
    unsafe fn atomic_compare_exchange(
        dst: *mut u128,
        old: u128,
        new: u128,
        success: Ordering,
        _failure: Ordering,
    ) -> Result<u128, u128> {
        // SAFETY: the caller must uphold the safety contract for `atomic_compare_exchange`.
        let res = unsafe { _compare_exchange_ldxp_stxp(dst, old, new, success) };
        if res == old {
            Ok(res)
        } else {
            Err(res)
        }
    }

    // LLVM appears to generate strong CAS for aarch64 128-bit weak CAS,
    // so we always use strong CAS.
    use self::atomic_compare_exchange as atomic_compare_exchange_weak;

    atomic128!(AtomicI128, i128, atomic_max, atomic_min);
    atomic128!(AtomicU128, u128, atomic_umax, atomic_umin);

    mod tests {
        use super::*;

        test_atomic_int!(i128);
        test_atomic_int!(u128);
    }
}
