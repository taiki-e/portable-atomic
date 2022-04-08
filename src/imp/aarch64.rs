// Atomic{I,U}128 implementation for AArch64.
//
// There are two ways to implement 128-bit atomic operations in AArch64.
//
// - LDXP/STXP loop (DW LL/SC)
// - CASP (DWCAS) added as FEAT_LSE
//
// If the `outline-atomics` feature is not enabled, we always use CASP if
// FEAT_LSE is enabled at compile-time, otherwise, always use LDXP/STXP loop.
// If the `outline-atomics` feature is enabled, we use CASP for
// compare_exchange(_weak) if FEAT_LSE is available at run-time.
//
// Refs:
// - ARM Compiler armasm User Guide
//   https://developer.arm.com/documentation/dui0801/latest
// - Arm Architecture Reference Manual for A-profile architecture
//   https://developer.arm.com/documentation/ddi0487/latest
// - progress64 https://github.com/ARM-software/progress64
// - atomic-maybe-uninit https://github.com/taiki-e/atomic-maybe-uninit
//
// Generated asm(default): https://godbolt.org/z/391vjWcKo
// Generated asm(+lse): https://godbolt.org/z/3jWf8jxYT

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::{cell::UnsafeCell, sync::atomic::Ordering};

use crate::utils::{assert_compare_exchange_ordering, assert_load_ordering, assert_store_ordering};

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
unsafe fn ldxp(src: *mut u128, order: Ordering) -> u128 {
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
                    "ldxp {prev_lo}, {prev_hi}, [{src}]",
                    src = in(reg) src,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    options(nostack),
                );
            }
            Ordering::Acquire | Ordering::SeqCst => {
                asm!(
                    "ldaxp {prev_lo}, {prev_hi}, [{src}]",
                    src = in(reg) src,
                    prev_lo = out(reg) prev_lo,
                    prev_hi = out(reg) prev_hi,
                    options(nostack),
                );
            }
            _ => unreachable!("{:?}", order),
        }
        U128 { pair: [prev_lo, prev_hi] }.u128
    }
}

#[inline]
unsafe fn stxp(dst: *mut u128, val: u128, order: Ordering) -> bool {
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

#[cfg(any(
    portable_atomic_target_feature_lse,
    target_feature = "lse",
    portable_atomic_aarch64_target_feature,
))]
#[cfg_attr(portable_atomic_aarch64_target_feature, target_feature(enable = "lse"))]
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
                    // must be allocated to even/odd register pair
                    inout("x6") old.pair[0] => prev_lo,
                    inout("x7") old.pair[1] => prev_hi,
                    // must be allocated to even/odd register pair
                    in("x4") new.pair[0],
                    in("x5") new.pair[1],
                    options(nostack),
                );
            }
            Ordering::Acquire => {
                asm!(
                    "caspa x6, x7, x4, x5, [{dst}]",
                    dst = in(reg) dst,
                    // must be allocated to even/odd register pair
                    inout("x6") old.pair[0] => prev_lo,
                    inout("x7") old.pair[1] => prev_hi,
                    // must be allocated to even/odd register pair
                    in("x4") new.pair[0],
                    in("x5") new.pair[1],
                    options(nostack),
                );
            }
            Ordering::Release => {
                asm!(
                    "caspl x6, x7, x4, x5, [{dst}]",
                    dst = in(reg) dst,
                    // must be allocated to even/odd register pair
                    inout("x6") old.pair[0] => prev_lo,
                    inout("x7") old.pair[1] => prev_hi,
                    // must be allocated to even/odd register pair
                    in("x4") new.pair[0],
                    in("x5") new.pair[1],
                    options(nostack),
                );
            }
            Ordering::AcqRel | Ordering::SeqCst => {
                asm!(
                    "caspal x6, x7, x4, x5, [{dst}]",
                    dst = in(reg) dst,
                    // must be allocated to even/odd register pair
                    inout("x6") old.pair[0] => prev_lo,
                    inout("x7") old.pair[1] => prev_hi,
                    // must be allocated to even/odd register pair
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
fn ldx_ordering(order: Ordering) -> Ordering {
    match order {
        Ordering::Release | Ordering::Relaxed => Ordering::Relaxed,
        Ordering::SeqCst => Ordering::SeqCst,
        Ordering::AcqRel | Ordering::Acquire => Ordering::Acquire,
        _ => unreachable!("{:?}", order),
    }
}
#[inline]
fn stx_ordering(order: Ordering) -> Ordering {
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
    let res = unsafe { _casp(dst, old, new, success) };
    #[cfg(not(all(
        portable_atomic_aarch64_target_feature,
        feature = "outline-atomics",
        // https://github.com/rust-lang/stdarch/blob/bcbe010614f398ec86f3a9274d22e33e5f2ee60b/crates/std_detect/src/detect/mod.rs
        // TODO: aarch64 freebsd https://github.com/rust-lang/stdarch/issues/1289
        any(feature = "std", target_os = "linux", target_os = "windows", /* target_os = "freebsd" */)
    )))]
    #[cfg(not(any(portable_atomic_target_feature_lse, target_feature = "lse")))]
    // SAFETY: the caller must uphold the safety contract for `atomic_compare_exchange`.
    let res = unsafe { compare_exchange_ldxp_stxp(dst, old, new, success) };
    #[cfg(all(
        portable_atomic_aarch64_target_feature,
        feature = "outline-atomics",
        // https://github.com/rust-lang/stdarch/blob/bcbe010614f398ec86f3a9274d22e33e5f2ee60b/crates/std_detect/src/detect/mod.rs
        // TODO: aarch64 freebsd https://github.com/rust-lang/stdarch/issues/1289
        any(feature = "std", target_os = "linux", target_os = "windows", /* target_os = "freebsd" */)
    ))]
    #[cfg(not(any(portable_atomic_target_feature_lse, target_feature = "lse")))]
    let res = {
        extern crate std;
        // Adapted from https://github.com/BurntSushi/memchr/blob/2.4.1/src/memchr/x86/mod.rs#L9-L71.
        use core::{mem, sync::atomic::AtomicPtr};
        type FnRaw = *mut ();
        type FnTy = unsafe fn(*mut u128, u128, u128, Ordering) -> u128;
        static FUNC: AtomicPtr<()> = AtomicPtr::new(detect as FnRaw);
        #[cold]
        unsafe fn detect(dst: *mut u128, old: u128, new: u128, success: Ordering) -> u128 {
            let func: FnTy = if std::arch::is_aarch64_feature_detected!("lse") {
                _casp
            } else {
                compare_exchange_ldxp_stxp
            };
            FUNC.store(func as FnRaw, Ordering::Relaxed);
            // SAFETY: the caller must guarantee that `dst` is valid for both writes and
            // reads, 16-byte aligned, that there are no concurrent non-atomic operations,
            // and we’ve checked if FEAT_LSE is available,
            unsafe { func(dst, old, new, success) }
        }
        // SAFETY: `FnTy` is a function pointer, which is always safe to transmute with a `*mut ()`.
        // the caller must guarantee that `dst` is valid for both writes and
        // reads, 16-byte aligned, and that there are no concurrent non-atomic operations.
        unsafe {
            let func = FUNC.load(Ordering::Relaxed);
            mem::transmute::<FnRaw, FnTy>(func)(dst, old, new, success)
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
unsafe fn compare_exchange_ldxp_stxp(
    dst: *mut u128,
    old: u128,
    new: u128,
    success: Ordering,
) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `compare_exchange_ldxp_stxp`.
    unsafe { atomic_update_ldxp_stxp(dst, success, |x| if x == old { new } else { x }) }
}

#[inline]
unsafe fn atomic_update_ldxp_stxp<F>(dst: *mut u128, order: Ordering, mut f: F) -> u128
where
    F: FnMut(u128) -> u128,
{
    // SAFETY: the caller must uphold the safety contract for `atomic_update`.
    unsafe {
        let ldx_order = ldx_ordering(order);
        let stx_order = stx_ordering(order);
        let mut prev;
        loop {
            prev = ldxp(dst, ldx_order);
            let next = f(prev);
            if stxp(dst, next, stx_order) {
                break;
            }
        }
        prev
    }
}

#[inline]
unsafe fn atomic_load(src: *mut u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_load`.
    unsafe { compare_exchange_ldxp_stxp(src, 0, 0, order) }
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
    unsafe { atomic_update_ldxp_stxp(dst, order, |_| val) }
}
#[inline]
unsafe fn atomic_add(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_add`.
    unsafe { atomic_update_ldxp_stxp(dst, order, |x| x.wrapping_add(val)) }
}
#[inline]
unsafe fn atomic_sub(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_sub`.
    unsafe { atomic_update_ldxp_stxp(dst, order, |x| x.wrapping_sub(val)) }
}
#[inline]
unsafe fn atomic_and(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_and`.
    unsafe { atomic_update_ldxp_stxp(dst, order, |x| x & val) }
}
#[inline]
unsafe fn atomic_nand(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_nand`.
    unsafe { atomic_update_ldxp_stxp(dst, order, |x| !(x & val)) }
}
#[inline]
unsafe fn atomic_or(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_or`.
    unsafe { atomic_update_ldxp_stxp(dst, order, |x| x | val) }
}
#[inline]
unsafe fn atomic_xor(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_xor`.
    unsafe { atomic_update_ldxp_stxp(dst, order, |x| x ^ val) }
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
                    atomic_update_ldxp_stxp(self.v.get().cast(), order, |x| {
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
                    atomic_update_ldxp_stxp(self.v.get().cast(), order, |x| {
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

    test_atomic_int!(i128);
    test_atomic_int!(u128);
}

#[cfg(test)]
#[allow(dead_code, clippy::undocumented_unsafe_blocks, clippy::wildcard_imports)]
mod no_outline_atomics {
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
        let res = unsafe { compare_exchange_ldxp_stxp(dst, old, new, success) };
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
