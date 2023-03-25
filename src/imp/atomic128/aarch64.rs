// Atomic{I,U}128 implementation for AArch64.
//
// There are a few ways to implement 128-bit atomic operations in AArch64.
//
// - LDXP/STXP loop (DW LL/SC)
// - CASP (DWCAS) added as FEAT_LSE (mandatory from armv8.1-a)
// - LDP/STP (DW load/store) if FEAT_LSE2 (optional from armv8.2-a, mandatory from armv8.4-a) is available
//
// If outline-atomics is not enabled and FEAT_LSE is not available at
// compile-time, we use LDXP/STXP loop.
// If outline-atomics is enabled and FEAT_LSE is not available at
// compile-time, we use CASP for CAS if FEAT_LSE is available
// at run-time, otherwise, use LDXP/STXP loop.
// If FEAT_LSE is available at compile-time, we use CASP for load/store/CAS/RMW.
// If FEAT_LSE2 is available at compile-time, we use LDP/STP for load/store.
// When portable_atomic_ll_sc_rmw cfg is set, use LDXP/STXP loop instead of CASP
// loop for RMW. (by default, it is set on Apple hardware; see build script for details)
//
// Note: FEAT_LSE2 doesn't imply FEAT_LSE.
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
// Also, even when using a CAS loop to implement atomic RMW, include the loop itself
// in the asm block because it is more efficient for some codegen backends.
// https://github.com/rust-lang/compiler-builtins/issues/339#issuecomment-1191260474
//
// Note: On Miri and ThreadSanitizer which do not support inline assembly, we don't use
// this module and use intrinsics.rs instead.
//
// Refs:
// - ARM Compiler armasm User Guide
//   https://developer.arm.com/documentation/dui0801/latest
// - Arm A-profile A64 Instruction Set Architecture
//   https://developer.arm.com/documentation/ddi0602/2022-12/Base-Instructions?lang=en
// - Arm Architecture Reference Manual for A-profile architecture
//   https://developer.arm.com/documentation/ddi0487/latest
// - atomic-maybe-uninit https://github.com/taiki-e/atomic-maybe-uninit
//
// Generated asm:
// - aarch64 https://godbolt.org/z/qKPb1asj4
// - aarch64 (+lse) https://godbolt.org/z/dqxj9z9Ps
// - aarch64 (+lse,+lse2) https://godbolt.org/z/x4a135Psb

include!("macros.rs");

#[cfg(not(portable_atomic_no_outline_atomics))]
#[cfg(any(
    all(target_os = "linux", target_env = "gnu"),
    target_os = "android",
    target_os = "freebsd",
))]
#[path = "detect/aarch64_auxv.rs"]
mod detect;
#[cfg(not(portable_atomic_no_outline_atomics))]
#[cfg(target_os = "openbsd")]
#[path = "detect/aarch64_aa64reg.rs"]
mod detect;
#[cfg(not(portable_atomic_no_outline_atomics))]
#[cfg(target_os = "fuchsia")]
#[path = "detect/aarch64_fuchsia.rs"]
mod detect;
#[cfg(not(portable_atomic_no_outline_atomics))]
#[cfg(target_os = "windows")]
#[path = "detect/aarch64_windows.rs"]
mod detect;
#[cfg(not(portable_atomic_no_outline_atomics))]
#[cfg(all(target_os = "linux", not(target_env = "gnu")))]
#[path = "detect/aarch64_std.rs"]
mod detect;

// test only
#[cfg(test)]
#[cfg(not(qemu))]
#[cfg(not(valgrind))]
#[cfg(not(portable_atomic_no_outline_atomics))]
#[cfg(any(target_os = "linux", target_os = "android", target_os = "freebsd"))]
#[path = "detect/aarch64_aa64reg.rs"]
mod detect_aa64reg;
#[cfg(test)]
#[cfg(not(portable_atomic_no_outline_atomics))]
#[cfg(target_os = "macos")]
#[path = "detect/aarch64_macos.rs"]
mod detect_macos;

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
            _ => unreachable!("{:?}", $order),
        }
    };
}

#[inline]
unsafe fn atomic_load(src: *mut u128, order: Ordering) -> u128 {
    #[cfg(any(target_feature = "lse2", portable_atomic_target_feature = "lse2"))]
    // SAFETY: the caller must uphold the safety contract.
    // cfg guarantee that the CPU supports FEAT_LSE2.
    unsafe {
        _atomic_load_ldp(src, order)
    }
    #[cfg(not(any(target_feature = "lse2", portable_atomic_target_feature = "lse2")))]
    {
        #[cfg(any(target_feature = "lse", portable_atomic_target_feature = "lse"))]
        // SAFETY: the caller must uphold the safety contract.
        // cfg guarantee that the CPU supports FEAT_LSE.
        unsafe {
            _atomic_compare_exchange_casp(src, 0, 0, order)
        }
        #[cfg(not(any(target_feature = "lse", portable_atomic_target_feature = "lse")))]
        // SAFETY: the caller must uphold the safety contract.
        unsafe {
            _atomic_load_ldxp_stxp(src, order)
        }
    }
}
// If CPU supports FEAT_LSE2, LDP is single-copy atomic reads,
// otherwise it is two single-copy atomic reads.
// Refs: B2.2.1 of the Arm Architecture Reference Manual Armv8, for Armv8-A architecture profile
#[inline]
unsafe fn _atomic_load_ldp(src: *mut u128, order: Ordering) -> u128 {
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
            _ => unreachable!("{:?}", order),
        }
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}
#[inline]
unsafe fn _atomic_load_ldxp_stxp(src: *mut u128, order: Ordering) -> u128 {
    debug_assert!(src as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract.
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
            _ => unreachable!("{:?}", order),
        }
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

#[inline]
unsafe fn atomic_store(dst: *mut u128, val: u128, order: Ordering) {
    #[cfg(any(target_feature = "lse2", portable_atomic_target_feature = "lse2"))]
    // SAFETY: the caller must uphold the safety contract.
    // cfg guarantee that the CPU supports FEAT_LSE2.
    unsafe {
        _atomic_store_stp(dst, val, order);
    }
    #[cfg(not(any(target_feature = "lse2", portable_atomic_target_feature = "lse2")))]
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        atomic_swap(dst, val, order);
    }
}
// If CPU supports FEAT_LSE2, STP is single-copy atomic writes,
// otherwise it is two single-copy atomic writes.
// Refs: B2.2.1 of the Arm Architecture Reference Manual Armv8, for Armv8-A architecture profile
#[cfg(any(target_feature = "lse2", portable_atomic_target_feature = "lse2", test))]
#[inline]
unsafe fn _atomic_store_stp(dst: *mut u128, val: u128, order: Ordering) {
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
    let success = crate::utils::upgrade_success_ordering(success, failure);

    #[cfg(any(target_feature = "lse", portable_atomic_target_feature = "lse"))]
    // SAFETY: the caller must uphold the safety contract.
    // cfg guarantee that the CPU supports FEAT_LSE.
    let res = unsafe { _atomic_compare_exchange_casp(dst, old, new, success) };
    #[cfg(not(all(
        not(portable_atomic_no_aarch64_target_feature),
        not(portable_atomic_no_outline_atomics),
        any(
            target_os = "linux",
            target_os = "android",
            target_os = "freebsd",
            target_os = "openbsd",
            target_os = "fuchsia",
            target_os = "windows",
        ),
    )))]
    #[cfg(not(any(target_feature = "lse", portable_atomic_target_feature = "lse")))]
    // SAFETY: the caller must uphold the safety contract.
    let res = unsafe { _atomic_compare_exchange_ldxp_stxp(dst, old, new, success) };
    #[cfg(all(
        not(portable_atomic_no_aarch64_target_feature),
        not(portable_atomic_no_outline_atomics),
        any(
            target_os = "linux",
            target_os = "android",
            target_os = "freebsd",
            target_os = "openbsd",
            target_os = "fuchsia",
            target_os = "windows",
        ),
    ))]
    #[cfg(not(any(target_feature = "lse", portable_atomic_target_feature = "lse")))]
    let res = {
        // SAFETY: the caller must guarantee that `dst` is valid for both writes and
        // reads, 16-byte aligned, that there are no concurrent non-atomic operations,
        // and we've checked if FEAT_LSE is available.
        unsafe {
            match success {
                Ordering::Relaxed => {
                    ifunc!(unsafe fn(dst: *mut u128, old: u128, new: u128) -> u128 {
                        if detect::has_lse() {
                            _atomic_compare_exchange_casp_relaxed
                        } else {
                            _atomic_compare_exchange_ldxp_stxp_relaxed
                        }
                    })
                }
                Ordering::Acquire => {
                    ifunc!(unsafe fn(dst: *mut u128, old: u128, new: u128) -> u128 {
                        if detect::has_lse() {
                            _atomic_compare_exchange_casp_acquire
                        } else {
                            _atomic_compare_exchange_ldxp_stxp_acquire
                        }
                    })
                }
                Ordering::Release => {
                    ifunc!(unsafe fn(dst: *mut u128, old: u128, new: u128) -> u128 {
                        if detect::has_lse() {
                            _atomic_compare_exchange_casp_release
                        } else {
                            _atomic_compare_exchange_ldxp_stxp_release
                        }
                    })
                }
                // AcqRel and SeqCst RMWs are equivalent in both implementations.
                Ordering::AcqRel | Ordering::SeqCst => {
                    ifunc!(unsafe fn(dst: *mut u128, old: u128, new: u128) -> u128 {
                        if detect::has_lse() {
                            _atomic_compare_exchange_casp_acqrel
                        } else {
                            _atomic_compare_exchange_ldxp_stxp_acqrel
                        }
                    })
                }
                _ => unreachable!("{:?}", success),
            }
        }
    };
    if res == old {
        Ok(res)
    } else {
        Err(res)
    }
}
#[cfg(not(portable_atomic_no_outline_atomics))]
fn_alias! {
    #[cfg(any(
        target_feature = "lse",
        portable_atomic_target_feature = "lse",
        all(
            not(portable_atomic_no_aarch64_target_feature),
            not(portable_atomic_no_outline_atomics),
        ),
    ))]
    #[cfg_attr(
        not(any(target_feature = "lse", portable_atomic_target_feature = "lse")),
        target_feature(enable = "lse")
    )]
    unsafe fn(dst: *mut u128, old: u128, new: u128) -> u128;
    _atomic_compare_exchange_casp_relaxed = _atomic_compare_exchange_casp(Ordering::Relaxed);
    _atomic_compare_exchange_casp_acquire = _atomic_compare_exchange_casp(Ordering::Acquire);
    _atomic_compare_exchange_casp_release = _atomic_compare_exchange_casp(Ordering::Release);
    _atomic_compare_exchange_casp_acqrel = _atomic_compare_exchange_casp(Ordering::AcqRel);
}
#[cfg(not(portable_atomic_no_outline_atomics))]
fn_alias! {
    unsafe fn(dst: *mut u128, old: u128, new: u128) -> u128;
    _atomic_compare_exchange_ldxp_stxp_relaxed
        = _atomic_compare_exchange_ldxp_stxp(Ordering::Relaxed);
    _atomic_compare_exchange_ldxp_stxp_acquire
        = _atomic_compare_exchange_ldxp_stxp(Ordering::Acquire);
    _atomic_compare_exchange_ldxp_stxp_release
        = _atomic_compare_exchange_ldxp_stxp(Ordering::Release);
    _atomic_compare_exchange_ldxp_stxp_acqrel
        = _atomic_compare_exchange_ldxp_stxp(Ordering::AcqRel);
}
#[cfg(any(
    target_feature = "lse",
    portable_atomic_target_feature = "lse",
    all(not(portable_atomic_no_aarch64_target_feature), not(portable_atomic_no_outline_atomics)),
))]
#[cfg_attr(
    not(any(target_feature = "lse", portable_atomic_target_feature = "lse")),
    target_feature(enable = "lse")
)]
#[inline]
unsafe fn _atomic_compare_exchange_casp(
    dst: *mut u128,
    old: u128,
    new: u128,
    order: Ordering,
) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must guarantee that `dst` is valid for both writes and
    // reads, 16-byte aligned, that there are no concurrent non-atomic operations,
    // and the CPU supports FEAT_LSE.
    //
    // Refs:
    // - https://developer.arm.com/documentation/dui0801/g/A64-Data-Transfer-Instructions/CASPA--CASPAL--CASP--CASPL--CASPAL--CASP--CASPL
    // - https://developer.arm.com/documentation/ddi0602/2022-12/Base-Instructions/CASP--CASPA--CASPAL--CASPL--Compare-and-Swap-Pair-of-words-or-doublewords-in-memory-
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
unsafe fn _atomic_compare_exchange_ldxp_stxp(
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
    #[cfg(all(
        any(target_feature = "lse", portable_atomic_target_feature = "lse"),
        not(portable_atomic_ll_sc_rmw),
    ))]
    // SAFETY: the caller must uphold the safety contract.
    // cfg guarantee that the CPU supports FEAT_LSE.
    unsafe {
        _atomic_swap_casp(dst, val, order)
    }
    #[cfg(not(all(
        any(target_feature = "lse", portable_atomic_target_feature = "lse"),
        not(portable_atomic_ll_sc_rmw),
    )))]
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        _atomic_swap_ldxp_stxp(dst, val, order)
    }
}
// Do not use atomic_rmw_cas_3 because it needs extra MOV to implement swap.
#[cfg(any(target_feature = "lse", portable_atomic_target_feature = "lse"))]
#[inline]
unsafe fn _atomic_swap_casp(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);
    // SAFETY: the caller must uphold the safety contract.
    // cfg guarantee that the CPU supports FEAT_LSE.
    unsafe {
        let val = U128 { whole: val };
        let (mut prev_lo, mut prev_hi);
        macro_rules! op {
            ($acquire:tt, $release:tt) => {
                asm!(
                    // If FEAT_LSE2 is not supported, this works like byte-wise atomic.
                    // This is not single-copy atomic reads, but this is ok because subsequent
                    // CAS will check for consistency.
                    concat!("ldp x6, x7, [{dst", ptr_modifier!(), "}]"),
                    "2:",
                        // casp writes the current value to the first register pair,
                        // so copy the `out`'s value for later comparison.
                        "mov {tmp_lo}, x6",
                        "mov {tmp_hi}, x7",
                        concat!("casp", $acquire, $release, " x6, x7, x4, x5, [{dst", ptr_modifier!(), "}]"),
                        "cmp {tmp_hi}, x7",
                        "ccmp {tmp_lo}, x6, #0, eq",
                        "b.ne 2b",
                    dst = in(reg) dst,
                    tmp_lo = out(reg) _,
                    tmp_hi = out(reg) _,
                    // must be allocated to even/odd register pair
                    out("x6") prev_lo,
                    out("x7") prev_hi,
                    // must be allocated to even/odd register pair
                    in("x4") val.pair.lo,
                    in("x5") val.pair.hi,
                    // Do not use `preserves_flags` because CMP and CCMP modify the condition flags.
                    options(nostack),
                )
            };
        }
        atomic_rmw!(op, order);
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}
// Do not use atomic_rmw_ll_sc_3 because it needs extra MOV to implement swap.
#[inline]
unsafe fn _atomic_swap_ldxp_stxp(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract.
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

/// Atomic RMW by LL/SC loop (3 arguments)
/// `unsafe fn(dst: *mut u128, val: u128, order: Ordering) -> u128;`
///
/// `$op` can use the following registers:
/// - val_lo/val_hi pair: val argument (read-only for `$op`)
/// - prev_lo/prev_hi pair: previous value loaded by ll (read-only for `$op`)
/// - new_lo/new_hi pair: new value that will to stored by sc
macro_rules! atomic_rmw_ll_sc_3 {
    ($name:ident as $reexport_name:ident, options($($options:tt)*), $($op:tt)*) => {
        // If FEAT_LSE is available at compile-time, we use CAS based Atomic RMW
        // generated by atomic_rmw_by_atomic_update! macro.
        #[cfg(not(all(
            any(target_feature = "lse", portable_atomic_target_feature = "lse"),
            not(portable_atomic_ll_sc_rmw),
        )))]
        use $name as $reexport_name;
        #[inline]
        unsafe fn $name(dst: *mut u128, val: u128, order: Ordering) -> u128 {
            debug_assert!(dst as usize % 16 == 0);
            // SAFETY: the caller must uphold the safety contract.
            unsafe {
                let val = U128 { whole: val };
                let (mut prev_lo, mut prev_hi);
                macro_rules! op {
                    ($acquire:tt, $release:tt) => {
                        asm!(
                            "2:",
                                concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                                $($op)*
                                concat!("st", $release, "xp {r:w}, {new_lo}, {new_hi}, [{dst", ptr_modifier!(), "}]"),
                                // 0 if the store was successful, 1 if no store was performed
                                "cbnz {r:w}, 2b",
                            dst = in(reg) dst,
                            val_lo = in(reg) val.pair.lo,
                            val_hi = in(reg) val.pair.hi,
                            prev_lo = out(reg) prev_lo,
                            prev_hi = out(reg) prev_hi,
                            new_lo = out(reg) _,
                            new_hi = out(reg) _,
                            r = out(reg) _,
                            options($($options)*),
                        )
                    };
                }
                atomic_rmw!(op, order);
                U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
            }
        }
        #[cfg(test)]
        paste::paste! {
            // Helper to test $op separately.
            unsafe fn [<$reexport_name _op>](dst: *mut u128, val: u128) -> u128 {
                // SAFETY: the caller must uphold the safety contract.
                unsafe {
                    $name(dst, val, Ordering::Relaxed)
                }
            }
        }
    };
}
/// Atomic RMW by CAS loop (3 arguments)
/// `unsafe fn(dst: *mut u128, val: u128, order: Ordering) -> u128;`
///
/// `$op` can use the following registers:
/// - val_lo/val_hi pair: val argument (read-only for `$op`)
/// - x6/x7 pair: previous value loaded (read-only for `$op`)
/// - x4/x5 pair: new value that will to stored
macro_rules! atomic_rmw_cas_3 {
    ($name:ident as $reexport_name:ident, $($op:tt)*) => {
        #[cfg(all(
            any(target_feature = "lse", portable_atomic_target_feature = "lse"),
            not(portable_atomic_ll_sc_rmw),
        ))]
        use $name as $reexport_name;
        #[cfg(any(target_feature = "lse", portable_atomic_target_feature = "lse"))]
        #[inline]
        unsafe fn $name(dst: *mut u128, val: u128, order: Ordering) -> u128 {
            debug_assert!(dst as usize % 16 == 0);
            // SAFETY: the caller must uphold the safety contract.
            // cfg guarantee that the CPU supports FEAT_LSE.
            unsafe {
                let val = U128 { whole: val };
                let (mut prev_lo, mut prev_hi);
                macro_rules! op {
                    ($acquire:tt, $release:tt) => {
                        asm!(
                            // If FEAT_LSE2 is not supported, this works like byte-wise atomic.
                            // This is not single-copy atomic reads, but this is ok because subsequent
                            // CAS will check for consistency.
                            concat!("ldp x6, x7, [{dst", ptr_modifier!(), "}]"),
                            "2:",
                                // casp writes the current value to the first register pair,
                                // so copy the `out`'s value for later comparison.
                                "mov {tmp_lo}, x6",
                                "mov {tmp_hi}, x7",
                                $($op)*
                                concat!("casp", $acquire, $release, " x6, x7, x4, x5, [{dst", ptr_modifier!(), "}]"),
                                "cmp {tmp_hi}, x7",
                                "ccmp {tmp_lo}, x6, #0, eq",
                                "b.ne 2b",
                            dst = in(reg) dst,
                            val_lo = in(reg) val.pair.lo,
                            val_hi = in(reg) val.pair.hi,
                            tmp_lo = out(reg) _,
                            tmp_hi = out(reg) _,
                            // must be allocated to even/odd register pair
                            out("x6") prev_lo,
                            out("x7") prev_hi,
                            // must be allocated to even/odd register pair
                            out("x4") _,
                            out("x5") _,
                            // Do not use `preserves_flags` because CMP and CCMP modify the condition flags.
                            options(nostack),
                        )
                    };
                }
                atomic_rmw!(op, order);
                U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
            }
        }
    };
}

/// Atomic RMW by LL/SC loop (2 arguments)
/// `unsafe fn(dst: *mut u128, order: Ordering) -> u128;`
///
/// `$op` can use the following registers:
/// - prev_lo/prev_hi pair: previous value loaded by ll (read-only for `$op`)
/// - new_lo/new_hi pair: new value that will to stored by sc
macro_rules! atomic_rmw_ll_sc_2 {
    ($name:ident as $reexport_name:ident, options($($options:tt)*), $($op:tt)*) => {
        // If FEAT_LSE is available at compile-time, we use CAS based Atomic RMW
        // generated by atomic_rmw_by_atomic_update! macro.
        #[cfg(not(all(
            any(target_feature = "lse", portable_atomic_target_feature = "lse"),
            not(portable_atomic_ll_sc_rmw),
        )))]
        use $name as $reexport_name;
        #[inline]
        unsafe fn $name(dst: *mut u128, order: Ordering) -> u128 {
            debug_assert!(dst as usize % 16 == 0);
            // SAFETY: the caller must uphold the safety contract.
            unsafe {
                let (mut prev_lo, mut prev_hi);
                macro_rules! op {
                    ($acquire:tt, $release:tt) => {
                        asm!(
                            "2:",
                                concat!("ld", $acquire, "xp {prev_lo}, {prev_hi}, [{dst", ptr_modifier!(), "}]"),
                                $($op)*
                                concat!("st", $release, "xp {r:w}, {new_lo}, {new_hi}, [{dst", ptr_modifier!(), "}]"),
                                // 0 if the store was successful, 1 if no store was performed
                                "cbnz {r:w}, 2b",
                            dst = in(reg) dst,
                            prev_lo = out(reg) prev_lo,
                            prev_hi = out(reg) prev_hi,
                            new_lo = out(reg) _,
                            new_hi = out(reg) _,
                            r = out(reg) _,
                            options($($options)*),
                        )
                    };
                }
                atomic_rmw!(op, order);
                U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
            }
        }
        #[cfg(test)]
        paste::paste! {
            // Helper to test $op separately.
            unsafe fn [<$reexport_name _op>](dst: *mut u128) -> u128 {
                // SAFETY: the caller must uphold the safety contract.
                unsafe {
                    $name(dst, Ordering::Relaxed)
                }
            }
        }
    };
}
/// Atomic RMW by CAS loop (2 arguments)
/// `unsafe fn(dst: *mut u128, order: Ordering) -> u128;`
///
/// `$op` can use the following registers:
/// - x6/x7 pair: previous value loaded (read-only for `$op`)
/// - x4/x5 pair: new value that will to stored
macro_rules! atomic_rmw_cas_2 {
    ($name:ident as $reexport_name:ident, $($op:tt)*) => {
        #[cfg(all(
            any(target_feature = "lse", portable_atomic_target_feature = "lse"),
            not(portable_atomic_ll_sc_rmw),
        ))]
        use $name as $reexport_name;
        #[cfg(any(target_feature = "lse", portable_atomic_target_feature = "lse"))]
        #[inline]
        unsafe fn $name(dst: *mut u128, order: Ordering) -> u128 {
            debug_assert!(dst as usize % 16 == 0);
            // SAFETY: the caller must uphold the safety contract.
            // cfg guarantee that the CPU supports FEAT_LSE.
            unsafe {
                let (mut prev_lo, mut prev_hi);
                macro_rules! op {
                    ($acquire:tt, $release:tt) => {
                        asm!(
                            // If FEAT_LSE2 is not supported, this works like byte-wise atomic.
                            // This is not single-copy atomic reads, but this is ok because subsequent
                            // CAS will check for consistency.
                            concat!("ldp x6, x7, [{dst", ptr_modifier!(), "}]"),
                            "2:",
                                // casp writes the current value to the first register pair,
                                // so copy the `out`'s value for later comparison.
                                "mov {tmp_lo}, x6",
                                "mov {tmp_hi}, x7",
                                $($op)*
                                concat!("casp", $acquire, $release, " x6, x7, x4, x5, [{dst", ptr_modifier!(), "}]"),
                                "cmp {tmp_hi}, x7",
                                "ccmp {tmp_lo}, x6, #0, eq",
                                "b.ne 2b",
                            dst = in(reg) dst,
                            tmp_lo = out(reg) _,
                            tmp_hi = out(reg) _,
                            // must be allocated to even/odd register pair
                            out("x6") prev_lo,
                            out("x7") prev_hi,
                            // must be allocated to even/odd register pair
                            out("x4") _,
                            out("x5") _,
                            // Do not use `preserves_flags` because CMP and CCMP modify the condition flags.
                            options(nostack),
                        )
                    };
                }
                atomic_rmw!(op, order);
                U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
            }
        }
    };
}

atomic_rmw_ll_sc_3! {
    _atomic_add_ldxp_stxp as atomic_add,
    // Do not use `preserves_flags` because ADDS and ADCS modify the condition flags.
    options(nostack),
    concat!(
        "adds ",
        select_le_or_be!("{new_lo}, {prev_lo}, {val_lo}", "{new_hi}, {prev_hi}, {val_hi}")
    ),
    concat!(
        "adc ",
        select_le_or_be!("{new_hi}, {prev_hi}, {val_hi}", "{new_lo}, {prev_lo}, {val_lo}")
    ),
}
atomic_rmw_cas_3! {
    _atomic_add_casp as atomic_add,
    concat!(
        "adds ",
        select_le_or_be!("x4, x6, {val_lo}", "x5, x7, {val_hi}")
    ),
    concat!(
        "adc ",
        select_le_or_be!("x5, x7, {val_hi}", "x4, x6, {val_lo}")
    ),
}
atomic_rmw_ll_sc_3! {
    _atomic_sub_ldxp_stxp as atomic_sub,
    // Do not use `preserves_flags` because SUBS and SBCS modify the condition flags.
    options(nostack),
    concat!(
        "subs ",
        select_le_or_be!("{new_lo}, {prev_lo}, {val_lo}", "{new_hi}, {prev_hi}, {val_hi}")
    ),
    concat!(
        "sbc ",
        select_le_or_be!("{new_hi}, {prev_hi}, {val_hi}", "{new_lo}, {prev_lo}, {val_lo}")
    ),
}
atomic_rmw_cas_3! {
    _atomic_sub_casp as atomic_sub,
    concat!(
        "subs ",
        select_le_or_be!("x4, x6, {val_lo}", "x5, x7, {val_hi}")
    ),
    concat!(
        "sbc ",
        select_le_or_be!("x5, x7, {val_hi}", "x4, x6, {val_lo}")
    ),
}
atomic_rmw_ll_sc_3! {
    _atomic_and_ldxp_stxp as atomic_and,
    options(nostack, preserves_flags),
    "and {new_lo}, {prev_lo}, {val_lo}",
    "and {new_hi}, {prev_hi}, {val_hi}",
}
atomic_rmw_cas_3! {
    _atomic_and_casp as atomic_and,
    "and x4, x6, {val_lo}",
    "and x5, x7, {val_hi}",
}
atomic_rmw_ll_sc_3! {
    _atomic_nand_ldxp_stxp as atomic_nand,
    options(nostack, preserves_flags),
    "and {new_lo}, {prev_lo}, {val_lo}",
    "mvn {new_lo}, {new_lo}",
    "and {new_hi}, {prev_hi}, {val_hi}",
    "mvn {new_hi}, {new_hi}",
}
atomic_rmw_cas_3! {
    _atomic_nand_casp as atomic_nand,
    "and x4, x6, {val_lo}",
    "mvn x4, x4",
    "and x5, x7, {val_hi}",
    "mvn x5, x5",
}
atomic_rmw_ll_sc_3! {
    _atomic_or_ldxp_stxp as atomic_or,
    options(nostack, preserves_flags),
    "orr {new_lo}, {prev_lo}, {val_lo}",
    "orr {new_hi}, {prev_hi}, {val_hi}",
}
atomic_rmw_cas_3! {
    _atomic_or_casp as atomic_or,
    "orr x4, x6, {val_lo}",
    "orr x5, x7, {val_hi}",
}
atomic_rmw_ll_sc_3! {
    _atomic_xor_ldxp_stxp as atomic_xor,
    options(nostack, preserves_flags),
    "eor {new_lo}, {prev_lo}, {val_lo}",
    "eor {new_hi}, {prev_hi}, {val_hi}",
}
atomic_rmw_cas_3! {
    _atomic_xor_casp as atomic_xor,
    "eor x4, x6, {val_lo}",
    "eor x5, x7, {val_hi}",
}

atomic_rmw_ll_sc_2! {
    _atomic_not_ldxp_stxp as atomic_not,
    options(nostack, preserves_flags),
    "mvn {new_lo}, {prev_lo}",
    "mvn {new_hi}, {prev_hi}",
}
atomic_rmw_cas_2! {
    _atomic_not_casp as atomic_not,
    "mvn x4, x6",
    "mvn x5, x7",
}
atomic_rmw_ll_sc_2! {
    _atomic_neg_ldxp_stxp as atomic_neg,
    // Do not use `preserves_flags` because NEGS modifies the condition flags.
    options(nostack),
    concat!("negs ", select_le_or_be!("{new_lo}, {prev_lo}", "{new_hi}, {prev_hi}")),
    concat!("ngc ", select_le_or_be!("{new_hi}, {prev_hi}", "{new_lo}, {prev_lo}")),
}
atomic_rmw_cas_2! {
    _atomic_neg_casp as atomic_neg,
    concat!("negs ", select_le_or_be!("x4, x6", "x5, x7")),
    concat!("ngc ", select_le_or_be!("x5, x7", "x4, x6")),
}

atomic_rmw_ll_sc_3! {
    _atomic_max_ldxp_stxp as atomic_max,
    // Do not use `preserves_flags` because CMP and SBCS modify the condition flags.
    options(nostack),
    select_le_or_be!("cmp {val_lo}, {prev_lo}", "cmp {val_hi}, {prev_hi}"),
    select_le_or_be!("sbcs xzr, {val_hi}, {prev_hi}", "sbcs xzr, {val_lo}, {prev_lo}"),
    "csel {new_hi}, {prev_hi}, {val_hi}, lt", // select hi 64-bit
    "csel {new_lo}, {prev_lo}, {val_lo}, lt", // select lo 64-bit
}
atomic_rmw_cas_3! {
    _atomic_max_casp as atomic_max,
    select_le_or_be!("cmp {val_lo}, x6", "cmp {val_hi}, x7"),
    select_le_or_be!("sbcs xzr, {val_hi}, x7", "sbcs xzr, {val_lo}, x6"),
    "csel x5, x7, {val_hi}, lt", // select hi 64-bit
    "csel x4, x6, {val_lo}, lt", // select lo 64-bit
}

atomic_rmw_ll_sc_3! {
    _atomic_umax_ldxp_stxp as atomic_umax,
    // Do not use `preserves_flags` because CMP and SBCS modify the condition flags.
    options(nostack),
    select_le_or_be!("cmp {val_lo}, {prev_lo}", "cmp {val_hi}, {prev_hi}"),
    select_le_or_be!("sbcs xzr, {val_hi}, {prev_hi}", "sbcs xzr, {val_lo}, {prev_lo}"),
    "csel {new_hi}, {prev_hi}, {val_hi}, lo", // select hi 64-bit
    "csel {new_lo}, {prev_lo}, {val_lo}, lo", // select lo 64-bit
}
atomic_rmw_cas_3! {
    _atomic_umax_casp as atomic_umax,
    select_le_or_be!("cmp {val_lo}, x6", "cmp {val_hi}, x7"),
    select_le_or_be!("sbcs xzr, {val_hi}, x7", "sbcs xzr, {val_lo}, x6"),
    "csel x5, x7, {val_hi}, lo", // select hi 64-bit
    "csel x4, x6, {val_lo}, lo", // select lo 64-bit
}

atomic_rmw_ll_sc_3! {
    _atomic_min_ldxp_stxp as atomic_min,
    // Do not use `preserves_flags` because CMP and SBCS modify the condition flags.
    options(nostack),
    select_le_or_be!("cmp {val_lo}, {prev_lo}", "cmp {val_hi}, {prev_hi}"),
    select_le_or_be!("sbcs xzr, {val_hi}, {prev_hi}", "sbcs xzr, {val_lo}, {prev_lo}"),
    "csel {new_hi}, {prev_hi}, {val_hi}, ge", // select hi 64-bit
    "csel {new_lo}, {prev_lo}, {val_lo}, ge", // select lo 64-bit
}
atomic_rmw_cas_3! {
    _atomic_min_casp as atomic_min,
    select_le_or_be!("cmp {val_lo}, x6", "cmp {val_hi}, x7"),
    select_le_or_be!("sbcs xzr, {val_hi}, x7", "sbcs xzr, {val_lo}, x6"),
    "csel x5, x7, {val_hi}, ge", // select hi 64-bit
    "csel x4, x6, {val_lo}, ge", // select lo 64-bit
}

atomic_rmw_ll_sc_3! {
    _atomic_umin_ldxp_stxp as atomic_umin,
    // Do not use `preserves_flags` because CMP and SBCS modify the condition flags.
    options(nostack),
    select_le_or_be!("cmp {val_lo}, {prev_lo}", "cmp {val_hi}, {prev_hi}"),
    select_le_or_be!("sbcs xzr, {val_hi}, {prev_hi}", "sbcs xzr, {val_lo}, {prev_lo}"),
    "csel {new_hi}, {prev_hi}, {val_hi}, hs", // select hi 64-bit
    "csel {new_lo}, {prev_lo}, {val_lo}, hs", // select lo 64-bit
}
atomic_rmw_cas_3! {
    _atomic_umin_casp as atomic_umin,
    select_le_or_be!("cmp {val_lo}, x6", "cmp {val_hi}, x7"),
    select_le_or_be!("sbcs xzr, {val_hi}, x7", "sbcs xzr, {val_lo}, x6"),
    "csel x5, x7, {val_hi}, hs", // select hi 64-bit
    "csel x4, x6, {val_lo}, hs", // select lo 64-bit
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

    test_atomic_int!(i128);
    test_atomic_int!(u128);

    test_atomic128_op!();
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
        // SAFETY: the caller must uphold the safety contract.
        let res = unsafe { _atomic_compare_exchange_ldxp_stxp(dst, old, new, success) };
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

    // Do not put this in the nested tests module due to glob imports refer to super::super::Atomic*.
    test_atomic_int!(i128);
    test_atomic_int!(u128);
}
