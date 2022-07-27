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
// Note: As of rustc 1.62.0, -C target-feature=+lse2 does not
// implicitly enable lse. Also, target_feature "lse2" is not available on rustc side:
// https://github.com/rust-lang/rust/blob/1.62.0/compiler/rustc_codegen_ssa/src/target_features.rs#L45
//
// Refs:
// - ARM Compiler armasm User Guide
//   https://developer.arm.com/documentation/dui0801/latest
// - Arm Architecture Reference Manual for A-profile architecture
//   https://developer.arm.com/documentation/ddi0487/latest
// - progress64 https://github.com/ARM-software/progress64
// - atomic-maybe-uninit https://github.com/taiki-e/atomic-maybe-uninit
//
// Generated asm:
// - aarch64 https://godbolt.org/z/9vne9GPKe
// - aarch64 (+lse) https://godbolt.org/z/odMW1rYWe
// - aarch64 (+lse,+lse2) https://godbolt.org/z/Yxfqz75x5

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
    lo: u64,
    hi: u64,
}

// Note: ldxp (by itself) does not guarantee atomicity; to complete an atomic
// operation (even load/store), a corresponding stxp must succeed.
// See Arm Architecture Reference Manual for A-profile architecture
// Section B2.2.1 "Requirements for single-copy atomicity", and
// Section B2.9 "Synchronization and semaphores" for more.
#[inline(always)]
unsafe fn _ldxp(src: *mut u128, order: Ordering) -> u128 {
    debug_assert!(src as usize % 16 == 0);

    // SAFETY: the caller must guarantee that `src` is valid for both writes and
    // reads, 16-byte aligned, and that there are no concurrent non-atomic operations.
    //
    // Refs:
    // - LDXP: https://developer.arm.com/documentation/dui0801/g/A64-Data-Transfer-Instructions/LDXP
    // - LDAXP: https://developer.arm.com/documentation/dui0801/g/A64-Data-Transfer-Instructions/LDAXP
    unsafe {
        let (prev_lo, prev_hi);
        match order {
            Ordering::Relaxed => {
                asm!(
                    concat!("ldxp {prev_lo}, {prev_hi}, [{src", ptr_modifier!(), "}]"),
                    src = in(reg) src,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    options(nostack, preserves_flags),
                );
            }
            Ordering::Acquire | Ordering::SeqCst => {
                asm!(
                    concat!("ldaxp {prev_lo}, {prev_hi}, [{src", ptr_modifier!(), "}]"),
                    src = in(reg) src,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    options(nostack, preserves_flags),
                );
            }
            _ => unreachable!("{:?}", order),
        }
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

#[inline(always)]
unsafe fn _stxp(dst: *mut u128, val: u128, order: Ordering) -> bool {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must guarantee that `dst` is valid for both writes and
    // reads, 16-byte aligned, and that there are no concurrent non-atomic operations.
    //
    // Refs:
    // - STXP: https://developer.arm.com/documentation/dui0801/g/A64-Data-Transfer-Instructions/STXP
    // - STLXP: https://developer.arm.com/documentation/dui0801/g/A64-Data-Transfer-Instructions/STLXP
    unsafe {
        let r: i32;
        let val = U128 { whole: val };
        match order {
            Ordering::Relaxed => {
                asm!(
                    concat!("stxp {r:w}, {val_lo}, {val_hi}, [{dst", ptr_modifier!(), "}]"),
                    dst = in(reg) dst,
                    r = out(reg) r,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    options(nostack, preserves_flags),
                );
            }
            Ordering::Release | Ordering::SeqCst => {
                asm!(
                    concat!("stlxp {r:w}, {val_lo}, {val_hi}, [{dst", ptr_modifier!(), "}]"),
                    dst = in(reg) dst,
                    r = out(reg) r,
                    val_lo = in(reg) val.pair.lo,
                    val_hi = in(reg) val.pair.hi,
                    options(nostack, preserves_flags),
                );
            }
            _ => unreachable!("{:?}", order),
        }
        // 0 if the store was successful, 1 if no store was performed
        debug_assert!(r == 0 || r == 1, "r={}", r);
        r == 0
    }
}

#[cfg(any(
    target_feature = "lse",
    portable_atomic_target_feature = "lse",
    not(portable_atomic_no_aarch64_target_feature),
))]
#[cfg_attr(not(portable_atomic_no_aarch64_target_feature), target_feature(enable = "lse"))]
#[inline]
unsafe fn _casp(dst: *mut u128, old: u128, new: u128, order: Ordering) -> u128 {
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
        macro_rules! atomic_cmpxchg {
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
        match order {
            Ordering::Relaxed => atomic_cmpxchg!("", ""),
            Ordering::Acquire => atomic_cmpxchg!("a", ""),
            Ordering::Release => atomic_cmpxchg!("", "l"),
            // AcqRel and SeqCst swaps are equivalent.
            Ordering::AcqRel | Ordering::SeqCst => atomic_cmpxchg!("a", "l"),
            _ => unreachable_unchecked!("{:?}", order),
        }
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

// If CPU supports FEAT_LSE2, LDP is single-copy atomic reads,
// otherwise it is two single-copy atomic reads.
// Refs: B2.2.1 of the Arm Architecture Reference Manual Armv8, for Armv8-A architecture profile
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
fn _ldx_ordering(order: Ordering) -> Ordering {
    match order {
        Ordering::Release | Ordering::Relaxed => Ordering::Relaxed,
        Ordering::SeqCst => Ordering::SeqCst,
        Ordering::AcqRel | Ordering::Acquire => Ordering::Acquire,
        _ => unreachable!("{:?}", order),
    }
}
#[inline]
fn _stx_ordering(order: Ordering) -> Ordering {
    match order {
        Ordering::Acquire | Ordering::Relaxed => Ordering::Relaxed,
        Ordering::SeqCst => Ordering::SeqCst,
        Ordering::AcqRel | Ordering::Release => Ordering::Release,
        _ => unreachable!("{:?}", order),
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
        () => unsafe { _casp(dst, old, new, success) },
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
                    _casp
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

// LLVM appears to generate strong CAS for aarch64 128-bit weak CAS,
// so we always use strong CAS.
use self::atomic_compare_exchange as atomic_compare_exchange_weak;

#[inline]
unsafe fn _compare_exchange_ldxp_stxp(
    dst: *mut u128,
    old: u128,
    new: u128,
    success: Ordering,
) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `compare_exchange_ldxp_stxp`.
    unsafe { atomic_update(dst, success, |x| if x == old { new } else { x }) }
}

// TODO: On aws graviton2, casp is much faster than ldxp/stxp,
// but it doesn't seem to be true on mac m1.
#[cfg(any(target_feature = "lse", portable_atomic_target_feature = "lse"))]
use _atomic_update_casp as atomic_update;
#[cfg(not(any(target_feature = "lse", portable_atomic_target_feature = "lse")))]
use _atomic_update_ldxp_stxp as atomic_update;

// Note: closure should not panic.
#[inline]
unsafe fn _atomic_update_ldxp_stxp<F>(dst: *mut u128, order: Ordering, mut f: F) -> u128
where
    F: FnMut(u128) -> u128,
{
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `_atomic_update_ldxp_stxp`.
    unsafe {
        let ldx_order = _ldx_ordering(order);
        let stx_order = _stx_ordering(order);
        let mut prev;
        loop {
            prev = _ldxp(dst, ldx_order);
            let next = f(prev);
            if _stxp(dst, next, stx_order) {
                break;
            }
        }
        prev
    }
}

#[cfg(any(
    target_feature = "lse",
    portable_atomic_target_feature = "lse",
    not(portable_atomic_no_aarch64_target_feature),
))]
#[cfg_attr(not(portable_atomic_no_aarch64_target_feature), target_feature(enable = "lse"))]
#[inline]
unsafe fn _atomic_update_casp<F>(dst: *mut u128, order: Ordering, mut f: F) -> u128
where
    F: FnMut(u128) -> u128,
{
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `_atomic_update_casp`.
    unsafe {
        // If FEAT_LSE2 is not supported, this works like byte-wise atomic.
        // This is not single-copy atomic reads, but this is ok because subsequent
        // CAS will check for consistency.
        let mut old = _ldp(dst, Ordering::Relaxed);
        loop {
            let next = f(old);
            let x = _casp(dst, old, next, order);
            if x == old {
                return x;
            }
            old = x;
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
        // TODO: On aws graviton2, casp is much faster than ldxp/stxp,
        // but it doesn't seem to be true on mac m1.
        #[cfg(any(target_feature = "lse", portable_atomic_target_feature = "lse"))]
        #[cfg(not(any(target_feature = "lse2", portable_atomic_target_feature = "lse2")))]
        // SAFETY: the caller must uphold the safety contract for `atomic_load`.
        // cfg guarantee that the CPU supports FEAT_LSE.
        () => unsafe { _casp(src, 0, 0, order) },
        #[cfg(not(any(target_feature = "lse", portable_atomic_target_feature = "lse")))]
        #[cfg(not(any(target_feature = "lse2", portable_atomic_target_feature = "lse2")))]
        // SAFETY: the caller must uphold the safety contract for `atomic_load`.
        () => unsafe { _compare_exchange_ldxp_stxp(src, 0, 0, order) },
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

    atomic128!(AtomicI128, i128);
    atomic128!(AtomicU128, u128);

    mod tests {
        use super::*;

        test_atomic_int!(i128);
        test_atomic_int!(u128);
    }
}
