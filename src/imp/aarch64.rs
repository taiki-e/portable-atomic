// Atomic{I,U}128 implementation for aarch64.
//
// There are two ways to implement 128-bit atomic operations in aarch64.
//
// - LDXP/STXP loop (DW LL/SC)
// - CASP (DWCAS) added as FEAT_LSE
//
// Currently, we always use CASP if FEAT_LSE is enabled at compile-time,
// otherwise, always use LDXP/STXP loop. In the future, we may want to support
// outline atomics or mix of both methods.
//
// Implementation is based on:
// - asm generated for aarch64 linux:
//   - default: https://godbolt.org/z/4nvGW91Mh
//   - +lse: https://godbolt.org/z/s7Tc59odP
// - progress64 https://github.com/ARM-software/progress64

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::{cell::UnsafeCell, sync::atomic::Ordering};

use crate::utils::{
    assert_compare_exchange_ordering, assert_load_ordering, assert_store_ordering,
    strongest_failure_ordering,
};

/// A 128-bit value represented as a pair of 64-bit values.
// This type is #[repr(C)], both fields have the same in-memory representation
// and are plain old datatypes, so access to the fields is always safe.
#[derive(Clone, Copy)]
#[repr(C)]
union U128 {
    u128: u128,
    pair: [u64; 2],
}

// Note: ldxp (by itself) does not guarantee atomicity; to complete an atomic
// operation (even load/store), a corresponding stxp must succeed.
// See Arm Architecture Reference Manual for A-profile architecture
// Section B2.2.1 "Requirements for single-copy atomicity", and
// Section B2.9 "Synchronization and semaphores" for more.
#[inline]
unsafe fn _ldxp(src: *mut u128, order: Ordering) -> u128 {
    debug_assert!(src as usize % 16 == 0);

    // SAFETY: the caller must guarantee that `dst` is valid for both writes and
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
                    "ldxp {prev_lo}, {prev_hi}, [{src}]",
                    src = in(reg) src,
                    prev_lo = lateout(reg) prev_lo,
                    prev_hi = lateout(reg) prev_hi,
                    options(nostack),
                );
            }
            Ordering::Acquire | Ordering::SeqCst => {
                asm!(
                    "ldaxp {prev_lo}, {prev_hi}, [{src}]",
                    src = in(reg) src,
                    prev_lo = lateout(reg) prev_lo,
                    prev_hi = lateout(reg) prev_hi,
                    options(nostack),
                );
            }
            _ => unreachable!("{:?}", order),
        }
        U128 { pair: [prev_lo, prev_hi] }.u128
    }
}

#[inline]
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
        let val = U128 { u128: val };
        match order {
            Ordering::Relaxed => {
                asm!(
                    "stxp {r:w}, {val_lo}, {val_hi}, [{dst}]",
                    dst = in(reg) dst,
                    r = out(reg) r,
                    val_lo = in(reg) val.pair[0],
                    val_hi = in(reg) val.pair[1],
                    options(nostack),
                );
            }
            Ordering::Release | Ordering::SeqCst => {
                asm!(
                    "stlxp {r:w}, {val_lo}, {val_hi}, [{dst}]",
                    dst = in(reg) dst,
                    r = out(reg) r,
                    val_lo = in(reg) val.pair[0],
                    val_hi = in(reg) val.pair[1],
                    options(nostack),
                );
            }
            _ => unreachable!("{:?}", order),
        }
        // 0 if the store was successful, 1 if no store was performed
        debug_assert!(r == 0 || r == 1);
        r == 0
    }
}

#[cfg(any(test, portable_atomic_target_feature_lse, target_feature = "lse"))]
#[inline]
unsafe fn _casp(dst: *mut u128, old: u128, new: u128, order: Ordering) -> u128 {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must guarantee that `dst` is valid for both writes and
    // reads, 16-byte aligned, that there are no concurrent non-atomic operations.
    // cfg guarantee that the CPU supports casp*.
    //
    // Refs:
    // - https://developer.arm.com/documentation/dui0801/g/A64-Data-Transfer-Instructions/CASPA--CASPAL--CASP--CASPL--CASPAL--CASP--CASPL
    unsafe {
        let old = U128 { u128: old };
        let new = U128 { u128: new };
        let (prev_lo, prev_hi);
        match order {
            Ordering::Relaxed => {
                asm!(
                    "casp x6, x7, x4, x5, [{dst}]",
                    dst = in(reg) dst,
                    // Note: `old` and `new` must be allocated to even/odd register pairs.
                    inlateout("x6") old.pair[0] => prev_lo,
                    inlateout("x7") old.pair[1] => prev_hi,
                    in("x4") new.pair[0],
                    in("x5") new.pair[1],
                    options(nostack),
                );
            }
            Ordering::Acquire => {
                asm!(
                    "caspa x6, x7, x4, x5, [{dst}]",
                    dst = in(reg) dst,
                    // Note: `old` and `new` must be allocated to even/odd register pairs.
                    inlateout("x6") old.pair[0] => prev_lo,
                    inlateout("x7") old.pair[1] => prev_hi,
                    in("x4") new.pair[0],
                    in("x5") new.pair[1],
                    options(nostack),
                );
            }
            Ordering::Release => {
                asm!(
                    "caspl x6, x7, x4, x5, [{dst}]",
                    dst = in(reg) dst,
                    // Note: `old` and `new` must be allocated to even/odd register pairs.
                    inlateout("x6") old.pair[0] => prev_lo,
                    inlateout("x7") old.pair[1] => prev_hi,
                    in("x4") new.pair[0],
                    in("x5") new.pair[1],
                    options(nostack),
                );
            }
            Ordering::AcqRel | Ordering::SeqCst => {
                asm!(
                    "caspal x6, x7, x4, x5, [{dst}]",
                    dst = in(reg) dst,
                    // Note: `old` and `new` must be allocated to even/odd register pairs.
                    inlateout("x6") old.pair[0] => prev_lo,
                    inlateout("x7") old.pair[1] => prev_hi,
                    in("x4") new.pair[0],
                    in("x5") new.pair[1],
                    options(nostack),
                );
            }
            _ => unreachable!("{:?}", order),
        }
        U128 { pair: [prev_lo, prev_hi] }.u128
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
    _failure: Ordering,
) -> Result<u128, u128> {
    #[cfg(any(portable_atomic_target_feature_lse, target_feature = "lse"))]
    // SAFETY: the caller must uphold the safety contract for `atomic_compare_exchange`.
    unsafe {
        let res = _casp(dst, old, new, success);
        if res == old {
            Ok(res)
        } else {
            Err(res)
        }
    }
    #[cfg(not(any(portable_atomic_target_feature_lse, target_feature = "lse")))]
    // SAFETY: the caller must uphold the safety contract for `atomic_compare_exchange`.
    unsafe {
        let res = atomic_update(dst, success, |x| if x == old { new } else { x });
        if res == old {
            Ok(res)
        } else {
            Err(res)
        }
    }
}

// LLVM appears to generate strong CAS for aarch64 128-bit weak CAS,
// so we always use strong CAS.
use self::atomic_compare_exchange as atomic_compare_exchange_weak;

#[inline]
unsafe fn atomic_update<F>(dst: *mut u128, order: Ordering, mut f: F) -> u128
where
    F: FnMut(u128) -> u128,
{
    #[cfg(any(portable_atomic_target_feature_lse, target_feature = "lse"))]
    // SAFETY: the caller must uphold the safety contract for `atomic_update`.
    unsafe {
        let fail_order = strongest_failure_ordering(order);
        let mut prev = atomic_load(dst, fail_order);
        loop {
            let next = f(prev);
            let x = _casp(dst, prev, next, order);
            if prev == x {
                break;
            }
            prev = x;
        }
        prev
    }
    #[cfg(not(any(portable_atomic_target_feature_lse, target_feature = "lse")))]
    // SAFETY: the caller must uphold the safety contract for `atomic_update`.
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

#[inline]
unsafe fn atomic_load(src: *mut u128, order: Ordering) -> u128 {
    let fail_order = strongest_failure_ordering(order);
    // SAFETY: the caller must uphold the safety contract for `atomic_load`.
    unsafe {
        match atomic_compare_exchange(src, 0, 0, order, fail_order) {
            Ok(v) | Err(v) => v,
        }
    }
}
#[inline]
unsafe fn atomic_store(dst: *mut u128, val: u128, order: Ordering) {
    // SAFETY: the caller must uphold the safety contract for `atomic_store`.
    unsafe {
        atomic_swap(dst, val, order);
    }
}
#[inline]
unsafe fn atomic_swap(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_swap`.
    unsafe { atomic_update(dst, order, |_| val) }
}
#[inline]
unsafe fn atomic_add(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_add`.
    unsafe { atomic_update(dst, order, |x| x.wrapping_add(val)) }
}
#[inline]
unsafe fn atomic_sub(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_sub`.
    unsafe { atomic_update(dst, order, |x| x.wrapping_sub(val)) }
}
#[inline]
unsafe fn atomic_and(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_and`.
    unsafe { atomic_update(dst, order, |x| x & val) }
}
#[inline]
unsafe fn atomic_nand(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_nand`.
    unsafe { atomic_update(dst, order, |x| !(x & val)) }
}
#[inline]
unsafe fn atomic_or(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_or`.
    unsafe { atomic_update(dst, order, |x| x | val) }
}
#[inline]
unsafe fn atomic_xor(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_xor`.
    unsafe { atomic_update(dst, order, |x| x ^ val) }
}

macro_rules! atomic128 {
    ($atomic_type:ident, $int_type:ident) => {
        #[repr(C, align(16))]
        pub(crate) struct $atomic_type {
            v: UnsafeCell<$int_type>,
        }

        impl crate::utils::AtomicRepr for $atomic_type {
            const IS_ALWAYS_LOCK_FREE: bool = true;
            #[inline]
            fn is_lock_free() -> bool {
                true
            }
        }

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by atomic intrinsics.
        unsafe impl Sync for $atomic_type {}

        impl $atomic_type {
            #[inline]
            pub(crate) const fn new(v: $int_type) -> Self {
                Self { v: UnsafeCell::new(v) }
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
                assert_load_ordering(order);
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_load(self.v.get().cast(), order) as $int_type
                }
            }

            #[inline]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                assert_store_ordering(order);
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_store(self.v.get().cast(), val as u128, order)
                }
            }

            #[inline]
            pub(crate) fn swap(&self, val: $int_type, order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_swap(self.v.get().cast(), val as u128, order) as $int_type
                }
            }

            #[inline]
            pub(crate) fn compare_exchange(
                &self,
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                assert_compare_exchange_ordering(success, failure);
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
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
                assert_compare_exchange_ordering(success, failure);
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
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
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_add(self.v.get().cast(), val as u128, order) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_sub(self.v.get().cast(), val as u128, order) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_and(self.v.get().cast(), val as u128, order) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_nand(self.v.get().cast(), val as u128, order) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_or(self.v.get().cast(), val as u128, order) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_xor(self.v.get().cast(), val as u128, order) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_update(self.v.get().cast(), order, |x| {
                        core::cmp::max(x as $int_type, val) as u128
                    }) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_update(self.v.get().cast(), order, |x| {
                        core::cmp::min(x as $int_type, val) as u128
                    }) as $int_type
                }
            }
        }
    };
}

atomic128!(AtomicI128, i128);
atomic128!(AtomicU128, u128);

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_int!(test_atomic_i128, AtomicI128, i128);
    test_atomic_int!(test_atomic_u128, AtomicU128, u128);
}
