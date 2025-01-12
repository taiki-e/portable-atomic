// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
64-bit atomic implementation on pre-v7 Arm Linux/Android.

- pre-v6: kuser_cmpxchg64
- v6+: ldrexd/strexd
- v7+ with LPAE: ldrd/strd

QEMU_CPU=arm926      # v5te
QEMU_CPU=arm1026     # v5te
QEMU_CPU=arm11mpcore # v6
QEMU_CPU=cortex-a9   # v7 without lpae
QEMU_CPU=cortex-a15  # v7 with lpae
# no QEMU_CPU        # v8 with lpae

TODO: QEMU doesn't support LPAE

Refs:
- https://github.com/torvalds/linux/blob/v6.12/Documentation/arch/arm/kernel_user_helpers.rst
- https://github.com/rust-lang/compiler-builtins/blob/compiler_builtins-v0.1.124/src/arm_linux.rs

Note: On Miri and ThreadSanitizer which do not support inline assembly, we don't use
this module and use core::sync::atomic or fallback implementation instead.

Generated asm:
- armv7 https://godbolt.org/z/174YW4WsE
*/

// TODO: Since Rust 1.64, the Linux kernel requirement for Rust when using std is 3.2+, so it should
// be possible to omit the dynamic kernel version check if the std feature is enabled on Rust 1.64+.
// https://blog.rust-lang.org/2022/08/01/Increasing-glibc-kernel-requirements.html

include!("macros.rs");

#[path = "../fallback/outline_atomics.rs"]
mod fallback;

// On musl with static linking, it seems that getauxval is not always available.
// See detect/auxv.rs for more.
#[cfg(not(portable_atomic_no_outline_atomics))]
#[cfg(any(
    all(
        target_os = "linux",
        any(
            target_env = "gnu",
            all(
                any(target_env = "musl", target_env = "ohos", target_env = "uclibc"),
                not(target_feature = "crt-static"),
            ),
            portable_atomic_outline_atomics,
        ),
    ),
    target_os = "android",
    target_os = "freebsd",
    all(target_os = "openbsd", not(target_feature = "crt-static")),
))]
#[path = "../detect/auxv.rs"]
mod detect;

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::{mem, sync::atomic::Ordering};

use crate::utils::{Pair, U64};

macro_rules! debug_assert_v7 {
    () => {
        #[cfg(not(any(target_feature = "v7", portable_atomic_target_feature = "v7")))]
        {
            debug_assert!(detect::detect().has_v7());
        }
    };
}

#[cfg(not(any(target_feature = "mclass", portable_atomic_target_feature = "mclass")))]
macro_rules! dmb_ish {
    () => {
        "dmb ish"
    };
}
// Only a full system barrier exists in the M-class architectures.
#[cfg(any(target_feature = "mclass", portable_atomic_target_feature = "mclass"))]
macro_rules! dmb_ish {
    () => {
        "dmb sy"
    };
}

// If v7 is available at compile-time, we can always use v7_fn.
#[cfg(any(target_feature = "v7", portable_atomic_target_feature = "v7"))]
use atomic_load_v7 as atomic_load;
// Otherwise, we need to do run-time detection and can use v7_fn only if v7 is available.
#[cfg(not(any(target_feature = "v7", portable_atomic_target_feature = "v7")))]
#[inline]
unsafe fn atomic_load(src: *mut u64, order: Ordering) -> u64 {
    fn_alias! {
        // inline(never) is just a hint and also not strictly necessary
        // because we use ifunc helper macro, but used for clarity.
        #[inline(never)]
        unsafe fn(src: *mut u64) -> u64;
        atomic_load_v7_relaxed = atomic_load_v7(Ordering::Relaxed);
        atomic_load_v7_acquire = atomic_load_v7(Ordering::Acquire);
        atomic_load_kuser_cmpxchg64 = atomic_update_kuser_cmpxchg64(|old| old);
    }
    // SAFETY: the caller must uphold the safety contract.
    // and we've checked if v7/kuser_cmpxchg64 is available.
    unsafe {
        match order {
            Ordering::Relaxed => {
                ifunc!(unsafe fn(src: *mut u64) -> u64 {
                    let cpuinfo = detect::detect();
                    if cpuinfo.has_v7() {
                        atomic_load_v7_relaxed
                    } else if has_kuser_cmpxchg64() {
                        atomic_load_kuser_cmpxchg64
                    } else {
                        fallback::atomic_load_non_seqcst
                    }
                })
            }
            Ordering::Acquire | Ordering::SeqCst => {
                ifunc!(unsafe fn(src: *mut u64) -> u64 {
                    let cpuinfo = detect::detect();
                    if cpuinfo.has_v7() {
                        // Acquire and SeqCst loads are equivalent.
                        atomic_load_v7_acquire
                    } else if has_kuser_cmpxchg64() {
                        atomic_load_kuser_cmpxchg64
                    } else {
                        fallback::atomic_load_seqcst
                    }
                })
            }
            _ => unreachable!(),
        }
    }
}
#[inline]
unsafe fn atomic_load_v7(src: *mut u64, order: Ordering) -> u64 {
    debug_assert!(src as usize % 8 == 0);
    debug_assert_v7!();
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        let (prev_lo, prev_hi);
        macro_rules! atomic_load {
            ($acquire:expr) => {
                asm!(
                    ".arch armv7-a",
                    "ldrexd r0, r1, [{src}]",
                    "clrex",
                    $acquire, // acquire fence
                    src = in(reg) src,
                    // prev pair - must be even-numbered and not R14
                    lateout("r0") prev_lo,
                    lateout("r1") prev_hi,
                    options(nostack, preserves_flags),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_load!(""),
            // Acquire and SeqCst loads are equivalent.
            Ordering::Acquire | Ordering::SeqCst => atomic_load!(dmb_ish!()),
            _ => unreachable!(),
        }
        U64 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

// If v7 is available at compile-time, we can always use v7_fn.
#[cfg(any(target_feature = "v7", portable_atomic_target_feature = "v7"))]
use atomic_store_v7 as atomic_store;
// Otherwise, we need to do run-time detection and can use v7_fn only if v7 is available.
#[cfg(not(any(target_feature = "v7", portable_atomic_target_feature = "v7")))]
#[inline]
unsafe fn atomic_store(dst: *mut u64, val: u64, order: Ordering) {
    fn_alias! {
        // inline(never) is just a hint and also not strictly necessary
        // because we use ifunc helper macro, but used for clarity.
        #[inline(never)]
        unsafe fn(dst: *mut u64, val: u64);
        atomic_store_v7_relaxed = atomic_store_v7(Ordering::Relaxed);
        atomic_store_v7_release = atomic_store_v7(Ordering::Release);
        atomic_store_v7_seqcst = atomic_store_v7(Ordering::SeqCst);
    }
    #[inline(never)]
    unsafe fn atomic_store_kuser_cmpxchg64(dst: *mut u64, val: u64) {
        // SAFETY: the caller must uphold the safety contract.
        unsafe {
            atomic_update_kuser_cmpxchg64(dst, |_| val);
        }
    }
    // SAFETY: the caller must uphold the safety contract.
    // and we've checked if v7/kuser_cmpxchg64 is available.
    unsafe {
        match order {
            Ordering::Relaxed => {
                ifunc!(unsafe fn(dst: *mut u64, val: u64) {
                    let cpuinfo = detect::detect();
                    if cpuinfo.has_v7() {
                        atomic_store_v7_relaxed
                    } else if has_kuser_cmpxchg64() {
                        atomic_store_kuser_cmpxchg64
                    } else {
                        fallback::atomic_store_non_seqcst
                    }
                })
            }
            Ordering::Release => {
                ifunc!(unsafe fn(dst: *mut u64, val: u64) {
                    let cpuinfo = detect::detect();
                    if cpuinfo.has_v7() {
                        atomic_store_v7_release
                    } else if has_kuser_cmpxchg64() {
                        atomic_store_kuser_cmpxchg64
                    } else {
                        fallback::atomic_store_seqcst
                    }
                })
            }
            Ordering::SeqCst => {
                ifunc!(unsafe fn(dst: *mut u64, val: u64) {
                    let cpuinfo = detect::detect();
                    if cpuinfo.has_v7() {
                        atomic_store_v7_seqcst
                    } else if has_kuser_cmpxchg64() {
                        atomic_store_kuser_cmpxchg64
                    } else {
                        fallback::atomic_store_seqcst
                    }
                })
            }
            _ => unreachable!(),
        }
    }
}
#[inline]
unsafe fn atomic_store_v7(dst: *mut u64, val: u64, order: Ordering) {
    debug_assert!(dst as usize % 8 == 0);
    debug_assert_v7!();
    let val = U64 { whole: val };
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        macro_rules! atomic_store {
            ($acquire:expr, $release:expr) => {
                asm!(
                    ".arch armv7-a",
                    $release, // release fence
                    "2:",
                        "ldrexd r4, r5, [{dst}]",
                        "strexd r4, r2, r3, [{dst}]",
                        // 0 if the store was successful, 1 if no store was performed
                        "cmp r4, #0",
                        "bne 2b",
                    $acquire, // acquire fence
                    dst = in(reg) dst,
                    // val pair - must be even-numbered and not R14
                    inout("r2") val.pair.lo => _,
                    inout("r3") val.pair.hi => _,
                    // tmp pair - must be even-numbered and not R14
                    out("r4") _,
                    out("r5") _,
                    // Do not use `preserves_flags` because CMP modifies the condition flags.
                    options(nostack),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_store!("", ""),
            Ordering::Release => atomic_store!("", dmb_ish!()),
            Ordering::SeqCst => atomic_store!(dmb_ish!(), dmb_ish!()),
            _ => unreachable!(),
        }
    }
}

#[inline]
unsafe fn atomic_compare_exchange(
    dst: *mut u64,
    old: u64,
    new: u64,
    success: Ordering,
    failure: Ordering,
) -> Result<u64, u64> {
    // If v7 is available at compile-time, we can always use v7_fn.
    #[cfg(any(target_feature = "v7", portable_atomic_target_feature = "v7"))]
    // SAFETY: the caller must uphold the safety contract.
    // cfg guarantees that quadword atomics instructions are available at compile-time.
    let (prev, ok) = unsafe { atomic_compare_exchange_v7(dst, old, new, success, failure) };
    // Otherwise, we need to do run-time detection and can use v7_fn only if v7 is available.
    #[cfg(not(any(target_feature = "v7", portable_atomic_target_feature = "v7")))]
    // SAFETY: the caller must uphold the safety contract.
    // and we've checked if v7/kuser_cmpxchg64 is available.
    let (prev, ok) = unsafe {
        fn_alias! {
            // inline(never) is just a hint and also not strictly necessary
            // because we use ifunc helper macro, but used for clarity.
            #[inline(never)]
            unsafe fn(dst: *mut u64, old: u64, new: u64) -> (u64, bool);
            v7_relaxed_fn = atomic_compare_exchange_v7(Ordering::Relaxed, Ordering::Relaxed);
            v7_acquire_fn = atomic_compare_exchange_v7(Ordering::Acquire, Ordering::Acquire);
            v7_release_fn = atomic_compare_exchange_v7(Ordering::Release, Ordering::Relaxed);
            // AcqRel and SeqCst RMWs are equivalent.
            v7_seqcst_fn = atomic_compare_exchange_v7(Ordering::SeqCst, Ordering::SeqCst);
        }
        #[inline(never)]
        unsafe fn kuser_cmpxchg64_fn(dst: *mut u64, old: u64, new: u64) -> (u64, bool) {
            // SAFETY: the caller must uphold the safety contract.
            let prev =
                unsafe { atomic_update_kuser_cmpxchg64(dst, |v| if v == old { new } else { v }) };
            (prev, prev == old)
        }
        let success = crate::utils::upgrade_success_ordering(success, failure);
        match success {
            Ordering::Relaxed => {
                ifunc!(unsafe fn(dst: *mut u64, old: u64, new: u64) -> (u64, bool) {
                    let cpuinfo = detect::detect();
                    if cpuinfo.has_v7() {
                        v7_relaxed_fn
                    } else if has_kuser_cmpxchg64() {
                        kuser_cmpxchg64_fn
                    } else {
                        fallback::atomic_compare_exchange_non_seqcst
                    }
                })
            }
            Ordering::Acquire => {
                ifunc!(unsafe fn(dst: *mut u64, old: u64, new: u64) -> (u64, bool) {
                    let cpuinfo = detect::detect();
                    if cpuinfo.has_v7() {
                        v7_acquire_fn
                    } else if has_kuser_cmpxchg64() {
                        kuser_cmpxchg64_fn
                    } else {
                        fallback::atomic_compare_exchange_non_seqcst
                    }
                })
            }
            Ordering::Release => {
                ifunc!(unsafe fn(dst: *mut u64, old: u64, new: u64) -> (u64, bool) {
                    let cpuinfo = detect::detect();
                    if cpuinfo.has_v7() {
                        v7_release_fn
                    } else if has_kuser_cmpxchg64() {
                        kuser_cmpxchg64_fn
                    } else {
                        fallback::atomic_compare_exchange_non_seqcst
                    }
                })
            }
            // AcqRel and SeqCst RMWs are equivalent.
            Ordering::AcqRel | Ordering::SeqCst => {
                ifunc!(unsafe fn(dst: *mut u64, old: u64, new: u64) -> (u64, bool) {
                    let cpuinfo = detect::detect();
                    if cpuinfo.has_v7() {
                        v7_seqcst_fn
                    } else if has_kuser_cmpxchg64() {
                        kuser_cmpxchg64_fn
                    } else {
                        fallback::atomic_compare_exchange_seqcst
                    }
                })
            }
            _ => unreachable!(),
        }
    };
    if ok {
        Ok(prev)
    } else {
        Err(prev)
    }
}
use self::atomic_compare_exchange as atomic_compare_exchange_weak;
#[inline]
unsafe fn atomic_compare_exchange_v7(
    dst: *mut u64,
    old: u64,
    new: u64,
    success: Ordering,
    failure: Ordering,
) -> (u64, bool) {
    debug_assert!(dst as usize % 8 == 0);
    debug_assert_v7!();
    let old = U64 { whole: old };
    let new = U64 { whole: new };
    let (mut prev_lo, mut prev_hi);
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        use core::sync::atomic::Ordering::{AcqRel, Acquire, Relaxed, Release, SeqCst};
        let mut r: i32;
        macro_rules! cmpxchg_store_relaxed {
            ($acquire_success:expr, $acquire_failure:expr) => {
                asm!(
                    ".arch armv7-a",
                    "2:",
                        "ldrexd r2, r3, [{dst}]",
                        "eor {tmp}, r3, {old_hi}",
                        "eor {r}, r2, {old_lo}",
                        "orrs {r}, {r}, {tmp}",
                        "bne 3f", // jump if compare failed
                        "strexd {r}, r4, r5, [{dst}]",
                        // 0 if the store was successful, 1 if no store was performed
                        "cmp {r}, #0",
                        "bne 2b", // continue loop if store failed
                        $acquire_success,
                        "b 4f",
                    "3:",
                        // compare failed, set r to 1 and clear exclusive
                        "mov {r}, #1",
                        "clrex",
                        $acquire_failure,
                    "4:",
                    dst = in(reg) dst,
                    old_lo = in(reg) old.pair.lo,
                    old_hi = in(reg) old.pair.hi,
                    r = out(reg) r,
                    tmp = out(reg) _,
                    // prev pair - must be even-numbered and not R14
                    out("r2") prev_lo,
                    out("r3") prev_hi,
                    // new pair - must be even-numbered and not R14
                    inout("r4") new.pair.lo => _,
                    inout("r5") new.pair.hi => _,
                    // Do not use `preserves_flags` because CMP and ORRS modify the condition flags.
                    options(nostack),
                )
            };
        }
        macro_rules! cmpxchg_release {
            ($acquire_failure:expr) => {
                asm!(
                    ".arch armv7-a",
                    "ldrexd r2, r3, [{dst}]",
                    "eor {tmp}, r3, {old_hi}",
                    "eor {r}, r2, {old_lo}",
                    "orrs {r}, {r}, {tmp}",
                    "bne 3f", // jump if compare failed
                    dmb_ish!(), // release
                    "2:",
                        "strexd {r}, r4, r5, [{dst}]",
                        // 0 if the store was successful, 1 if no store was performed
                        "cmp {r}, #0",
                        "beq 4f", // jump if store succeed
                        "ldrexd r2, r3, [{dst}]",
                        "eor {tmp}, r3, {old_hi}",
                        "eor {r}, r2, {old_lo}",
                        "orrs {r}, {r}, {tmp}",
                        "beq 2b", // continue loop if compare succeed
                    "3:",
                        // compare failed, set r to 1 and clear exclusive
                        "mov {r}, #1",
                        "clrex",
                        $acquire_failure,
                    "4:",
                    dst = in(reg) dst,
                    old_lo = in(reg) old.pair.lo,
                    old_hi = in(reg) old.pair.hi,
                    r = out(reg) r,
                    tmp = out(reg) _,
                    // prev pair - must be even-numbered and not R14
                    out("r2") prev_lo,
                    out("r3") prev_hi,
                    // new pair - must be even-numbered and not R14
                    inout("r4") new.pair.lo => _,
                    inout("r5") new.pair.hi => _,
                    // Do not use `preserves_flags` because CMP and ORRS modify the condition flags.
                    options(nostack),
                )
            };
        }
        macro_rules! cmpxchg_acqrel {
            ($acquire_failure:expr) => {
                asm!(
                    ".arch armv7-a",
                    "ldrexd r2, r3, [{dst}]",
                    "eor {tmp}, r3, {old_hi}",
                    "eor {r}, r2, {old_lo}",
                    "orrs {r}, {r}, {tmp}",
                    "bne 3f", // jump if compare failed
                    dmb_ish!(), // release
                    "2:",
                        "strexd {r}, r4, r5, [{dst}]",
                        // 0 if the store was successful, 1 if no store was performed
                        "cmp {r}, #0",
                        "beq 4f", // jump if store succeed
                        "ldrexd r2, r3, [{dst}]",
                        "eor {tmp}, r3, {old_hi}",
                        "eor {r}, r2, {old_lo}",
                        "orrs {r}, {r}, {tmp}",
                        "beq 2b", // continue loop if compare succeed
                    "3:",
                        // compare failed, set r to 1 and clear exclusive
                        "mov {r}, #1",
                        "clrex",
                        $acquire_failure,
                        "b 5f",
                    "4:", // store succeed
                        dmb_ish!(), // acquire_success
                    "5:",
                    dst = in(reg) dst,
                    old_lo = in(reg) old.pair.lo,
                    old_hi = in(reg) old.pair.hi,
                    r = out(reg) r,
                    tmp = out(reg) _,
                    // prev pair - must be even-numbered and not R14
                    out("r2") prev_lo,
                    out("r3") prev_hi,
                    // new pair - must be even-numbered and not R14
                    inout("r4") new.pair.lo => _,
                    inout("r5") new.pair.hi => _,
                    // Do not use `preserves_flags` because CMP and ORRS modify the condition flags.
                    options(nostack),
                )
            };
        }
        match (success, failure) {
            (Relaxed, Relaxed) => cmpxchg_store_relaxed!("", ""),
            (Relaxed, Acquire | SeqCst) => cmpxchg_store_relaxed!("", dmb_ish!()),
            (Acquire, Relaxed) => cmpxchg_store_relaxed!(dmb_ish!(), ""),
            (Acquire, Acquire | SeqCst) => cmpxchg_store_relaxed!(dmb_ish!(), dmb_ish!()),
            (Release, Relaxed) => cmpxchg_release!(""),
            (Release, Acquire | SeqCst) => cmpxchg_release!(dmb_ish!()),
            // AcqRel and SeqCst compare_exchange are equivalent.
            (AcqRel | SeqCst, Relaxed) => cmpxchg_acqrel!(""),
            (AcqRel | SeqCst, _) => cmpxchg_acqrel!(dmb_ish!()),
            _ => unreachable!(),
        }
        crate::utils::assert_unchecked(r == 0 || r == 1); // may help remove extra test
                                                          // 0 if the store was successful, 1 if no store was performed
        (U64 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole, r == 0)
    }
}

// Do not use atomic_rmw_ll_sc_3 because it needs extra mov to implement swap.
#[inline]
unsafe fn atomic_swap_v7(dst: *mut u64, val: u64, order: Ordering) -> u64 {
    debug_assert!(dst as usize % 8 == 0);
    debug_assert_v7!();
    let val = U64 { whole: val };
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        let (mut prev_lo, mut prev_hi);
        macro_rules! atomic_swap {
            ($acquire:expr, $release:expr) => {
                asm!(
                    ".arch armv7-a",
                    $release, // release fence
                    "2:",
                        "ldrexd r4, r5, [{dst}]",
                        "strexd {r}, r2, r3, [{dst}]",
                        // 0 if the store was successful, 1 if no store was performed
                        "cmp {r}, #0",
                        "bne 2b",
                    $acquire, // acquire fence
                    dst = in(reg) dst,
                    r = out(reg) _,
                    // val pair - must be even-numbered and not R14
                    inout("r2") val.pair.lo => _,
                    inout("r3") val.pair.hi => _,
                    // prev pair - must be even-numbered and not R14
                    out("r4") prev_lo,
                    out("r5") prev_hi,
                    // Do not use `preserves_flags` because CMP modifies the condition flags.
                    options(nostack),
                )
            };
        }
        match order {
            Ordering::Relaxed => atomic_swap!("", ""),
            Ordering::Acquire => atomic_swap!(dmb_ish!(), ""),
            Ordering::Release => atomic_swap!("", dmb_ish!()),
            // AcqRel and SeqCst RMWs are equivalent.
            Ordering::AcqRel | Ordering::SeqCst => atomic_swap!(dmb_ish!(), dmb_ish!()),
            _ => unreachable!(),
        }
        U64 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

/// Atomic RMW by LL/SC loop (3 arguments)
/// `unsafe fn(dst: *mut u64, val: u64, order: Ordering) -> u64;`
///
/// `$op` can use the following registers:
/// - val_lo/val_hi pair: val argument (read-only for `$op`)
/// - r4/r5 pair: previous value loaded by ll (read-only for `$op`)
/// - r2/r3 pair: new value that will be stored by sc
macro_rules! atomic_rmw_ll_sc_3 {
    ($name_v7:ident, $($op:tt)*) => {
        #[inline]
        unsafe fn $name_v7(dst: *mut u64, val: u64, order: Ordering) -> u64 {
            debug_assert!(dst as usize % 8 == 0);
            debug_assert_v7!();
            let val = U64 { whole: val };
            // SAFETY: the caller must uphold the safety contract.
            unsafe {
                let (mut prev_lo, mut prev_hi);
                macro_rules! op {
                    ($acquire:expr, $release:expr) => {
                        asm!(
                            ".arch armv7-a",
                            $release, // release fence
                            "2:",
                                "ldrexd r4, r5, [{dst}]",
                                $($op)*
                                "strexd {r}, r2, r3, [{dst}]",
                                // 0 if the store was successful, 1 if no store was performed
                                "cmp {r}, #0",
                                "bne 2b",
                            $acquire, // acquire fence
                            dst = in(reg) dst,
                            val_lo = in(reg) val.pair.lo,
                            val_hi = in(reg) val.pair.hi,
                            r = out(reg) _,
                            // new pair - must be even-numbered and not R14
                            out("r2") _,
                            out("r3") _,
                            // prev pair - must be even-numbered and not R14
                            out("r4") prev_lo,
                            out("r5") prev_hi,
                            // Do not use `preserves_flags` because CMP modifies the condition flags.
                            options(nostack),
                        )
                    };
                }
                match order {
                    Ordering::Relaxed => op!("", ""),
                    Ordering::Acquire => op!(dmb_ish!(), ""),
                    Ordering::Release => op!("", dmb_ish!()),
                    // AcqRel and SeqCst RMWs are equivalent.
                    Ordering::AcqRel | Ordering::SeqCst => op!(dmb_ish!(), dmb_ish!()),
                    _ => unreachable!(),
                }
                U64 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
            }
        }
    };
}
/// Atomic RMW by LL/SC loop (2 arguments)
/// `unsafe fn(dst: *mut u64, order: Ordering) -> u64;`
///
/// `$op` can use the following registers:
/// - r4/r5 pair: previous value loaded by ll (read-only for `$op`)
/// - r2/r3 pair: new value that will be stored by sc
macro_rules! atomic_rmw_ll_sc_2 {
    ($name_v7:ident, $($op:tt)*) => {
        #[inline]
        unsafe fn $name_v7(dst: *mut u64, order: Ordering) -> u64 {
            debug_assert!(dst as usize % 8 == 0);
            debug_assert_v7!();
            // SAFETY: the caller must uphold the safety contract.
            unsafe {
                let (mut prev_lo, mut prev_hi);
                macro_rules! op {
                    ($acquire:expr, $release:expr) => {
                        asm!(
                            ".arch armv7-a",
                            $release, // release fence
                            "2:",
                                "ldrexd r4, r5, [{dst}]",
                                $($op)*
                                "strexd {r}, r2, r3, [{dst}]",
                                // 0 if the store was successful, 1 if no store was performed
                                "cmp {r}, #0",
                                "bne 2b",
                            $acquire, // acquire fence
                            dst = in(reg) dst,
                            r = out(reg) _,
                            // new pair - must be even-numbered and not R14
                            out("r2") _,
                            out("r3") _,
                            // prev pair - must be even-numbered and not R14
                            out("r4") prev_lo,
                            out("r5") prev_hi,
                            // Do not use `preserves_flags` because CMP modifies the condition flags.
                            options(nostack),
                        )
                    };
                }
                match order {
                    Ordering::Relaxed => op!("", ""),
                    Ordering::Acquire => op!(dmb_ish!(), ""),
                    Ordering::Release => op!("", dmb_ish!()),
                    // AcqRel and SeqCst RMWs are equivalent.
                    Ordering::AcqRel | Ordering::SeqCst => op!(dmb_ish!(), dmb_ish!()),
                    _ => unreachable!(),
                }
                U64 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
            }
        }
    };
}

atomic_rmw_ll_sc_3! {
    atomic_add_v7,
    "adds r2, r4, {val_lo}",
    "adc r3, r5, {val_hi}",
}
atomic_rmw_ll_sc_3! {
    atomic_sub_v7,
    "subs r2, r4, {val_lo}",
    "sbc r3, r5, {val_hi}",
}
atomic_rmw_ll_sc_3! {
    atomic_and_v7,
    "and r2, r4, {val_lo}",
    "and r3, r5, {val_hi}",
}
atomic_rmw_ll_sc_3! {
    atomic_nand_v7,
    "and r2, r4, {val_lo}",
    "and r3, r5, {val_hi}",
    "mvn r2, r2",
    "mvn r3, r3",
}
atomic_rmw_ll_sc_3! {
    atomic_or_v7,
    "orr r2, r4, {val_lo}",
    "orr r3, r5, {val_hi}",
}
atomic_rmw_ll_sc_3! {
    atomic_xor_v7,
    "eor r2, r4, {val_lo}",
    "eor r3, r5, {val_hi}",
}

atomic_rmw_ll_sc_2! {
    atomic_not_v7,
    "mvn r2, r4",
    "mvn r3, r5",
}
atomic_rmw_ll_sc_2! {
    atomic_neg_v7,
    "rsbs r2, r4, #0",
    "rsc r3, r5, #0",
}

atomic_rmw_ll_sc_3! {
    atomic_max_v7,
    "mov r3, {val_hi}",
    "subs {r}, {val_lo}, r4",
    "sbcs {r}, {val_hi}, r5",
    "mov {r}, #0",
    "movwlt {r}, #1",
    "cmp {r}, #0",
    "movne r3, r5",
    "mov r2, {val_lo}",
    "movne r2, r4",
}
atomic_rmw_ll_sc_3! {
    atomic_umax_v7,
    "mov r3, {val_hi}",
    "subs {r}, {val_lo}, r4",
    "sbcs {r}, {val_hi}, r5",
    "mov {r}, #0",
    "movwlo {r}, #1",
    "cmp {r}, #0",
    "movne r3, r5",
    "mov r2, {val_lo}",
    "movne r2, r4",
}
atomic_rmw_ll_sc_3! {
    atomic_min_v7,
    "mov r3, {val_hi}",
    "subs {r}, {val_lo}, r4",
    "sbcs {r}, {val_hi}, r5",
    "mov {r}, #0",
    "movwge {r}, #1",
    "cmp {r}, #0",
    "movne r3, r5",
    "mov r2, {val_lo}",
    "movne r2, r4",
}
atomic_rmw_ll_sc_3! {
    atomic_umin_v7,
    "mov r3, {val_hi}",
    "subs {r}, {val_lo}, r4",
    "sbcs {r}, {val_hi}, r5",
    "mov {r}, #0",
    "movwhs {r}, #1",
    "cmp {r}, #0",
    "movne r3, r5",
    "mov r2, {val_lo}",
    "movne r2, r4",
}

// https://github.com/torvalds/linux/blob/v6.11/Documentation/arch/arm/kernel_user_helpers.rst
const KUSER_HELPER_VERSION: usize = 0xFFFF0FFC;
// __kuser_helper_version >= 3 (kernel version 2.6.15+)
// const KUSER_MEMORY_BARRIER: usize = 0xFFFF0FA0;
// __kuser_helper_version >= 5 (kernel version 3.1+)
const KUSER_CMPXCHG64: usize = 0xFFFF0F60;
#[inline]
fn __kuser_helper_version() -> i32 {
    use core::sync::atomic::AtomicI32;

    static CACHE: AtomicI32 = AtomicI32::new(0);
    let mut v = CACHE.load(Ordering::Relaxed);
    if v != 0 {
        return v;
    }
    // SAFETY: core assumes that at least __kuser_memory_barrier (__kuser_helper_version >= 3,
    // kernel version 2.6.15+) is available on this platform. __kuser_helper_version
    // is always available on such a platform.
    v = unsafe { crate::utils::ptr::with_exposed_provenance::<i32>(KUSER_HELPER_VERSION).read() };
    CACHE.store(v, Ordering::Relaxed);
    v
}
#[inline]
fn has_kuser_cmpxchg64() -> bool {
    // Note: detect_false cfg is intended to make it easy for portable-atomic developers to
    // test cases such as has_cmpxchg16b == false, has_lse == false,
    // __kuser_helper_version < 5, etc., and is not a public API.
    if cfg!(portable_atomic_test_outline_atomics_detect_false) {
        return false;
    }
    __kuser_helper_version() >= 5
}
#[inline]
unsafe fn __kuser_cmpxchg64(old_val: *const u64, new_val: *const u64, ptr: *mut u64) -> bool {
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        let f: extern "C" fn(*const u64, *const u64, *mut u64) -> u32 =
            mem::transmute(crate::utils::ptr::with_exposed_provenance::<()>(KUSER_CMPXCHG64));
        f(old_val, new_val, ptr) == 0
    }
}

// 64-bit atomic load by two 32-bit atomic loads.
#[inline]
unsafe fn byte_wise_atomic_load(src: *const u64) -> u64 {
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        let (out_lo, out_hi);
        asm!(
            "ldr {out_lo}, [{src}]",
            "ldr {out_hi}, [{src}, #4]",
            src = in(reg) src,
            out_lo = out(reg) out_lo,
            out_hi = out(reg) out_hi,
            options(pure, nostack, preserves_flags, readonly),
        );
        U64 { pair: Pair { lo: out_lo, hi: out_hi } }.whole
    }
}

#[inline(always)]
unsafe fn atomic_update_kuser_cmpxchg64<F>(dst: *mut u64, mut f: F) -> u64
where
    F: FnMut(u64) -> u64,
{
    debug_assert!(dst as usize % 8 == 0);
    debug_assert!(has_kuser_cmpxchg64());
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        loop {
            // This is not single-copy atomic reads, but this is ok because subsequent
            // CAS will check for consistency.
            //
            // Arm's memory model allow mixed-sized atomic access.
            // https://github.com/rust-lang/unsafe-code-guidelines/issues/345#issuecomment-1172891466
            //
            // Note that the C++20 memory model does not allow mixed-sized atomic access,
            // so we must use inline assembly to implement byte_wise_atomic_load.
            // (i.e., byte-wise atomic based on the standard library's atomic types
            // cannot be used here).
            let prev = byte_wise_atomic_load(dst);
            let next = f(prev);
            if __kuser_cmpxchg64(&prev, &next, dst) {
                return prev;
            }
        }
    }
}

macro_rules! select_atomic_rmw {
    (
        unsafe fn $name:ident($($arg:tt)*) $(-> $ret_ty:ty)? { $($kuser_cmpxchg64_fn_body:tt)* }
        v7 = $v7_fn:ident;
        non_seqcst_fallback = $non_seqcst_fallback_fn:ident;
        seqcst_fallback = $seqcst_fallback_fn:ident;
    ) => {
        // If v7 is available at compile-time, we can always use v7_fn.
        #[cfg(any(
            target_feature = "v7",
            portable_atomic_target_feature = "v7",
        ))]
        use $v7_fn as $name;
        // Otherwise, we need to do run-time detection and can use v7_fn only if v7 is available.
        #[cfg(not(any(
            target_feature = "v7",
            portable_atomic_target_feature = "v7",
        )))]
        #[inline]
        unsafe fn $name($($arg)*, order: Ordering) $(-> $ret_ty)? {
            fn_alias! {
                // inline(never) is just a hint and also not strictly necessary
                // because we use ifunc helper macro, but used for clarity.
                #[inline(never)]
                unsafe fn($($arg)*) $(-> $ret_ty)?;
                v7_relaxed_fn = $v7_fn(Ordering::Relaxed);
                v7_acquire_fn = $v7_fn(Ordering::Acquire);
                v7_release_fn = $v7_fn(Ordering::Release);
                // AcqRel and SeqCst RMWs are equivalent.
                v7_seqcst_fn = $v7_fn(Ordering::SeqCst);
            }
            #[inline(never)]
            unsafe fn kuser_cmpxchg64_fn($($arg)*) $(-> $ret_ty)? {
                $($kuser_cmpxchg64_fn_body)*
            }
            // SAFETY: the caller must uphold the safety contract.
            // and we've checked if v7/kuser_cmpxchg64 is available.
            unsafe {
                match order {
                    Ordering::Relaxed => {
                        ifunc!(unsafe fn($($arg)*) $(-> $ret_ty)? {
                            let cpuinfo = detect::detect();
                            if cpuinfo.has_v7() {
                                v7_relaxed_fn
                            } else if has_kuser_cmpxchg64() {
                                kuser_cmpxchg64_fn
                            } else {
                                fallback::$non_seqcst_fallback_fn
                            }
                        })
                    }
                    Ordering::Acquire => {
                        ifunc!(unsafe fn($($arg)*) $(-> $ret_ty)? {
                            let cpuinfo = detect::detect();
                            if cpuinfo.has_v7() {
                                v7_acquire_fn
                            } else if has_kuser_cmpxchg64() {
                                kuser_cmpxchg64_fn
                            } else {
                                fallback::$non_seqcst_fallback_fn
                            }
                        })
                    }
                    Ordering::Release => {
                        ifunc!(unsafe fn($($arg)*) $(-> $ret_ty)? {
                            let cpuinfo = detect::detect();
                            if cpuinfo.has_v7() {
                                v7_release_fn
                            } else if has_kuser_cmpxchg64() {
                                kuser_cmpxchg64_fn
                            } else {
                                fallback::$non_seqcst_fallback_fn
                            }
                        })
                    }
                    // AcqRel and SeqCst RMWs are equivalent.
                    Ordering::AcqRel | Ordering::SeqCst => {
                        ifunc!(unsafe fn($($arg)*) $(-> $ret_ty)? {
                            let cpuinfo = detect::detect();
                            if cpuinfo.has_v7() {
                                v7_seqcst_fn
                            } else if has_kuser_cmpxchg64() {
                                kuser_cmpxchg64_fn
                            } else {
                                fallback::$seqcst_fallback_fn
                            }
                        })
                    }
                    _ => unreachable!(),
                }
            }
        }
    };
}

select_atomic_rmw! {
    unsafe fn atomic_swap(dst: *mut u64, val: u64) -> u64 {
        |_x| val
    }
    v7 = atomic_swap_v7;
    non_seqcst_fallback = atomic_swap_non_seqcst;
    seqcst_fallback = atomic_swap_seqcst;
}
select_atomic_rmw! {
    unsafe fn atomic_add(dst: *mut u64, val: u64) -> u64 {
        |x| x.wrapping_add(val)
    }
    v7 = atomic_add_v7;
    non_seqcst_fallback = atomic_add_non_seqcst;
    seqcst_fallback = atomic_add_seqcst;
}
select_atomic_rmw! {
    unsafe fn atomic_sub(dst: *mut u64, val: u64) -> u64 {
        |x| x.wrapping_sub(val)
    }
    v7 = atomic_sub_v7;
    non_seqcst_fallback = atomic_sub_non_seqcst;
    seqcst_fallback = atomic_sub_seqcst;
}
select_atomic_rmw! {
    unsafe fn atomic_and(dst: *mut u64, val: u64) -> u64 {
        |x| x & val
    }
    v7 = atomic_and_v7;
    non_seqcst_fallback = atomic_and_non_seqcst;
    seqcst_fallback = atomic_and_seqcst;
}
select_atomic_rmw! {
    unsafe fn atomic_nand(dst: *mut u64, val: u64) -> u64 {
        |x| !(x & val)
    }
    v7 = atomic_nand_v7;
    non_seqcst_fallback = atomic_nand_non_seqcst;
    seqcst_fallback = atomic_nand_seqcst;
}
select_atomic_rmw! {
    unsafe fn atomic_or(dst: *mut u64, val: u64) -> u64 {
        |x| x | val
    }
    v7 = atomic_or_v7;
    non_seqcst_fallback = atomic_or_non_seqcst;
    seqcst_fallback = atomic_or_seqcst;
}
select_atomic_rmw! {
    unsafe fn atomic_xor(dst: *mut u64, val: u64) -> u64 {
        |x| x ^ val
    }
    v7 = atomic_xor_v7;
    non_seqcst_fallback = atomic_xor_non_seqcst;
    seqcst_fallback = atomic_xor_seqcst;
}
select_atomic_rmw! {
    unsafe fn atomic_max(dst: *mut u64, val: u64) -> u64 {
        |x| {
            #[allow(clippy::cast_possible_wrap, clippy::cast_sign_loss)]
            { core::cmp::max(x as i64, val as i64) as u64 }
        }
    }
    v7 = atomic_max_v7;
    non_seqcst_fallback = atomic_max_non_seqcst;
    seqcst_fallback = atomic_max_seqcst;
}
select_atomic_rmw! {
    unsafe fn atomic_umax(dst: *mut u64, val: u64) -> u64 {
        |x| core::cmp::max(x, val)
    }
    v7 = atomic_umax_v7;
    non_seqcst_fallback = atomic_umax_non_seqcst;
    seqcst_fallback = atomic_umax_seqcst;
}
select_atomic_rmw! {
    unsafe fn atomic_min(dst: *mut u64, val: u64) -> u64 {
        |x| {
            #[allow(clippy::cast_possible_wrap, clippy::cast_sign_loss)]
            { core::cmp::min(x as i64, val as i64) as u64 }
        }
    }
    v7 = atomic_min_v7;
    non_seqcst_fallback = atomic_min_non_seqcst;
    seqcst_fallback = atomic_min_seqcst;
}
select_atomic_rmw! {
    unsafe fn atomic_umin(dst: *mut u64, val: u64) -> u64 {
        |x| core::cmp::min(x, val)
    }
    v7 = atomic_umin_v7;
    non_seqcst_fallback = atomic_umin_non_seqcst;
    seqcst_fallback = atomic_umin_seqcst;
}
select_atomic_rmw! {
    unsafe fn atomic_not(dst: *mut u64) -> u64 {
        |x| !x
    }
    v7 = atomic_not_v7;
    non_seqcst_fallback = atomic_not_non_seqcst;
    seqcst_fallback = atomic_not_seqcst;
}
select_atomic_rmw! {
    unsafe fn atomic_neg(dst: *mut u64) -> u64 {
        |x| x.wrapping_neg()
    }
    v7 = atomic_neg_v7;
    non_seqcst_fallback = atomic_neg_non_seqcst;
    seqcst_fallback = atomic_neg_seqcst;
}

#[inline]
fn is_lock_free() -> bool {
    has_kuser_cmpxchg64()
}
const IS_ALWAYS_LOCK_FREE: bool = false;

atomic64!(AtomicI64, i64, atomic_max, atomic_min);
atomic64!(AtomicU64, u64, atomic_umax, atomic_umin);

#[allow(
    clippy::alloc_instead_of_core,
    clippy::std_instead_of_alloc,
    clippy::std_instead_of_core,
    clippy::undocumented_unsafe_blocks,
    clippy::wildcard_imports
)]
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn kuser_helper_version() {
        let version = __kuser_helper_version();
        assert!(version >= 5, "{:?}", version);
        assert_eq!(version, unsafe {
            crate::utils::ptr::with_exposed_provenance::<i32>(KUSER_HELPER_VERSION).read()
        });
    }

    test_atomic_int!(i64);
    test_atomic_int!(u64);

    // load/store/swap implementation is not affected by signedness, so it is
    // enough to test only unsigned types.
    stress_test!(u64);
}
