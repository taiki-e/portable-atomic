// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
Atomic implementation on MSP430.

Adapted from https://github.com/pftbest/msp430-atomic.

Operations not supported here are provided by disabling interrupts.
See also src/imp/interrupt/msp430.rs.

See "Atomic operation overview by architecture" in atomic-maybe-uninit for a more comprehensive and
detailed description of the atomic and synchronize instructions in this architecture:
https://github.com/taiki-e/atomic-maybe-uninit/blob/HEAD/src/arch/README.md#msp430

Note: Ordering is always SeqCst.

Refs:
- MSP430x5xx and MSP430x6xx Family User's Guide, Rev. Q
  https://www.ti.com/lit/ug/slau208q/slau208q.pdf
- atomic-maybe-uninit
  https://github.com/taiki-e/atomic-maybe-uninit

See tests/asm-test/asm/portable-atomic for generated assembly.
*/

#![cfg_attr(portable_atomic_no_asm, allow(deprecated))]

#[cfg(not(feature = "critical-section"))]
use core::cell::UnsafeCell;
use core::sync::atomic::Ordering;

/// An atomic fence.
///
/// # Panics
///
/// Panics if `order` is [`Relaxed`](Ordering::Relaxed).
#[inline]
#[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
pub fn fence(order: Ordering) {
    match order {
        Ordering::Relaxed => panic!("there is no such thing as a relaxed fence"),
        // MSP430 is single-core and a compiler fence works as an atomic fence.
        _ => compiler_fence(order),
    }
}

/// A compiler memory fence.
///
/// # Panics
///
/// Panics if `order` is [`Relaxed`](Ordering::Relaxed).
#[inline]
#[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
pub fn compiler_fence(order: Ordering) {
    match order {
        Ordering::Relaxed => panic!("there is no such thing as a relaxed compiler fence"),
        _ => {}
    }
    // SAFETY: using an empty asm is safe.
    unsafe {
        // Do not use `nomem` and `readonly` because prevent preceding and subsequent memory accesses from being reordered.
        #[cfg(not(portable_atomic_no_asm))]
        __asm!("", options(nostack, preserves_flags));
        #[cfg(portable_atomic_no_asm)]
        llvm_asm!("" ::: "memory" : "volatile");
    }
}

#[cfg(not(feature = "critical-section"))]
items!({
    macro_rules! atomic {
        (load_store, $([$($generics:tt)*])? $atomic_type:ident, $value_type:ty, $size:tt) => {
            #[repr(transparent)]
            pub(crate) struct $atomic_type $(<$($generics)*>)? {
                v: UnsafeCell<$value_type>,
            }

            // Send is implicitly implemented for atomic integers, but not for atomic pointers.
            // SAFETY: any data races are prevented by atomic operations.
            unsafe impl $(<$($generics)*>)? Send for $atomic_type $(<$($generics)*>)? {}
            // SAFETY: any data races are prevented by atomic operations.
            unsafe impl $(<$($generics)*>)? Sync for $atomic_type $(<$($generics)*>)? {}

            impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
                #[inline]
                #[cfg_attr(
                    all(debug_assertions, not(portable_atomic_no_track_caller)),
                    track_caller
                )]
                pub(crate) fn load(&self, order: Ordering) -> $value_type {
                    crate::utils::assert_load_ordering(order);
                    let src = self.v.get();
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        let out;
                        #[cfg(not(portable_atomic_no_asm))]
                        __asm!(
                            concat!("mov.", $size, " @{src}, {out}"), // atomic { out = *src }
                            src = in(reg) src,
                            out = lateout(reg) out,
                            options(nostack, preserves_flags),
                        );
                        #[cfg(portable_atomic_no_asm)]
                        llvm_asm!(
                            concat!("mov.", $size, " $1, $0")
                            : "=r"(out) : "*m"(src) : "memory" : "volatile"
                        );
                        out
                    }
                }

                #[inline]
                #[cfg_attr(
                    all(debug_assertions, not(portable_atomic_no_track_caller)),
                    track_caller
                )]
                pub(crate) fn store(&self, val: $value_type, order: Ordering) {
                    crate::utils::assert_store_ordering(order);
                    let dst = self.v.get();
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        #[cfg(not(portable_atomic_no_asm))]
                        __asm!(
                            concat!("mov.", $size, " {val}, 0({dst})"), // atomic { *dst = val }
                            dst = in(reg) dst,
                            val = in(reg) val,
                            options(nostack, preserves_flags),
                        );
                        #[cfg(portable_atomic_no_asm)]
                        llvm_asm!(
                            concat!("mov.", $size, " $1, $0")
                            :: "*m"(dst), "ir"(val) : "memory" : "volatile"
                        );
                    }
                }
            }
        };
        ($([$($generics:tt)*])? $atomic_type:ident, $value_type:ty, $size:tt) => {
            atomic!(load_store, $([$($generics)*])? $atomic_type, $value_type, $size);
            impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
                #[inline]
                pub(crate) fn add(&self, val: $value_type, _order: Ordering) {
                    let dst = self.v.get();
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        #[cfg(not(portable_atomic_no_asm))]
                        __asm!(
                            concat!("add.", $size, " {val}, 0({dst})"), // atomic { *dst += val }
                            dst = in(reg) dst,
                            val = in(reg) val,
                            // Do not use `preserves_flags` because ADD modifies the V, N, Z, and C bits of the status register.
                            options(nostack),
                        );
                        #[cfg(portable_atomic_no_asm)]
                        llvm_asm!(
                            concat!("add.", $size, " $1, $0")
                            :: "*m"(dst), "ir"(val) : "memory", "sr" : "volatile"
                        );
                    }
                }

                #[inline]
                pub(crate) fn sub(&self, val: $value_type, _order: Ordering) {
                    let dst = self.v.get();
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        #[cfg(not(portable_atomic_no_asm))]
                        __asm!(
                            concat!("sub.", $size, " {val}, 0({dst})"), // atomic { *dst -= val }
                            dst = in(reg) dst,
                            val = in(reg) val,
                            // Do not use `preserves_flags` because SUB modifies the V, N, Z, and C bits of the status register.
                            options(nostack),
                        );
                        #[cfg(portable_atomic_no_asm)]
                        llvm_asm!(
                            concat!("sub.", $size, " $1, $0")
                            :: "*m"(dst), "ir"(val) : "memory", "sr" : "volatile"
                        );
                    }
                }

                #[inline]
                pub(crate) fn and(&self, val: $value_type, _order: Ordering) {
                    let dst = self.v.get();
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        #[cfg(not(portable_atomic_no_asm))]
                        __asm!(
                            concat!("and.", $size, " {val}, 0({dst})"), // atomic { *dst &= val }
                            dst = in(reg) dst,
                            val = in(reg) val,
                            // Do not use `preserves_flags` because AND modifies the V, N, Z, and C bits of the status register.
                            options(nostack),
                        );
                        #[cfg(portable_atomic_no_asm)]
                        llvm_asm!(
                            concat!("and.", $size, " $1, $0")
                            :: "*m"(dst), "ir"(val) : "memory", "sr" : "volatile"
                        );
                    }
                }

                #[inline]
                pub(crate) fn or(&self, val: $value_type, _order: Ordering) {
                    let dst = self.v.get();
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        #[cfg(not(portable_atomic_no_asm))]
                        __asm!(
                            concat!("bis.", $size, " {val}, 0({dst})"), // atomic { *dst |= val }
                            dst = in(reg) dst,
                            val = in(reg) val,
                            options(nostack, preserves_flags),
                        );
                        #[cfg(portable_atomic_no_asm)]
                        llvm_asm!(
                            concat!("bis.", $size, " $1, $0")
                            :: "*m"(dst), "ir"(val) : "memory" : "volatile"
                        );
                    }
                }

                #[inline]
                pub(crate) fn xor(&self, val: $value_type, _order: Ordering) {
                    let dst = self.v.get();
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        #[cfg(not(portable_atomic_no_asm))]
                        __asm!(
                            concat!("xor.", $size, " {val}, 0({dst})"), // atomic { *dst ^= val }
                            dst = in(reg) dst,
                            val = in(reg) val,
                            // Do not use `preserves_flags` because XOR modifies the V, N, Z, and C bits of the status register.
                            options(nostack),
                        );
                        #[cfg(portable_atomic_no_asm)]
                        llvm_asm!(
                            concat!("xor.", $size, " $1, $0")
                            :: "*m"(dst), "ir"(val) : "memory", "sr" : "volatile"
                        );
                    }
                }

                #[inline]
                pub(crate) fn not(&self, _order: Ordering) {
                    let dst = self.v.get();
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        #[cfg(not(portable_atomic_no_asm))]
                        __asm!(
                            concat!("inv.", $size, " 0({dst})"), // atomic { *dst = !*dst }
                            dst = in(reg) dst,
                            // Do not use `preserves_flags` because INV modifies the V, N, Z, and C bits of the status register.
                            options(nostack),
                        );
                        #[cfg(portable_atomic_no_asm)]
                        llvm_asm!(
                            concat!("inv.", $size, " $0")
                            :: "*m"(dst) : "memory", "sr" : "volatile"
                        );
                    }
                }
            }
        };
    }

    atomic!(AtomicI8, i8, "b");
    atomic!(AtomicU8, u8, "b");
    atomic!(AtomicI16, i16, "w");
    atomic!(AtomicU16, u16, "w");
    atomic!(AtomicIsize, isize, "w");
    atomic!(AtomicUsize, usize, "w");
    atomic!(load_store, [T] AtomicPtr, *mut T, "w");

    // For AtomicBool
    impl AtomicU8 {
        #[inline]
        pub(crate) fn fetch_and_bool(&self, val: bool) -> bool {
            let dst = self.v.get();
            let sr: u8;
            // SAFETY: any data races are prevented by atomic intrinsics and the raw
            // pointer passed in is valid because we got it from a reference.
            unsafe {
                if val {
                    #[cfg(not(portable_atomic_no_asm))]
                    __asm!(
                        "and.b #1, 0({dst})",  // atomic { *dst &= 1 }
                        "mov r2, {sr}",          // sr = SR
                        dst = in(reg) dst,
                        sr = lateout(reg) sr,
                        // Do not use `preserves_flags` because AND modifies the V, N, Z, and C bits of the status register.
                        options(nostack),
                    );
                    #[cfg(portable_atomic_no_asm)]
                    llvm_asm!(
                        "and.b #1, $1
                         mov r2, $0"
                        : "=r"(sr) : "*m"(dst) : "memory", "sr" : "volatile"
                    );
                    // C bit is set if result is not zero.
                } else {
                    #[cfg(not(portable_atomic_no_asm))]
                    __asm!(
                        "rra.b 0({dst})",  // atomic { *dst >>= 1 }
                        "mov r2, {sr}",    // sr = SR
                        dst = in(reg) dst,
                        sr = lateout(reg) sr,
                        // Do not use `preserves_flags` because AND modifies the V, N, Z, and C bits of the status register.
                        options(nostack),
                    );
                    #[cfg(portable_atomic_no_asm)]
                    llvm_asm!(
                        "rra.b $1
                         mov r2, $0"
                        : "=r"(sr) : "*m"(dst) : "memory", "sr" : "volatile"
                    );
                    // C bit is the previous LSB.
                }
                crate::utils::bool_from_u8_unchecked(sr & 1)
            }
        }

        #[inline]
        pub(crate) fn fetch_xor_bool(&self, val: bool) -> bool {
            let dst = self.v.get();
            let val = val as u8;
            let sr: u8;
            // SAFETY: any data races are prevented by atomic intrinsics and the raw
            // pointer passed in is valid because we got it from a reference.
            unsafe {
                #[cfg(not(portable_atomic_no_asm))]
                __asm!(
                    "xor.b {val}, 0({dst})", // atomic { *dst ^= val; SR.C = *dst != 0 }
                    "mov r2, {sr}",          // sr = SR
                    dst = in(reg) dst,
                    val = in(reg) val,
                    sr = lateout(reg) sr,
                    // Do not use `preserves_flags` because XOR modifies the V, N, Z, and C bits of the status register.
                    options(nostack),
                );
                #[cfg(portable_atomic_no_asm)]
                llvm_asm!(
                    "xor.b $2, $1
                     mov r2, $0"
                    : "=r"(sr) : "*m"(dst), "ir"(val) : "memory", "sr" : "volatile"
                );
                // C bit is set if result is not zero.
                crate::utils::bool_from_u8_unchecked(sr & 1 ^ val)
            }
        }

        #[inline]
        pub(crate) fn fetch_not_bool(&self) -> bool {
            let dst = self.v.get();
            let r;
            // SAFETY: any data races are prevented by atomic intrinsics and the raw
            // pointer passed in is valid because we got it from a reference.
            unsafe {
                #[cfg(not(portable_atomic_no_asm))]
                __asm!(
                    "xor.b #1, 0({dst})", // atomic { *dst ^= 1; SR.C = *dst != 0 }
                    "mov #1, {r}",        // r = 1
                    "bic r2, {r}",        // r &= !SR
                    dst = in(reg) dst,
                    r = lateout(reg) r,
                    // Do not use `preserves_flags` because XOR modifies the V, N, Z, and C bits of the status register.
                    options(nostack),
                );
                #[cfg(portable_atomic_no_asm)]
                llvm_asm!(
                    "xor.b #1, $1
                     mov #1, $0
                     bic r2, $0"
                    : "=r"(r) : "*m"(dst) : "memory", "sr" : "volatile"
                );
                crate::utils::bool_from_reg_unchecked(r)
            }
        }

        #[inline]
        pub(crate) fn not_bool(&self) {
            let dst = self.v.get();
            // SAFETY: any data races are prevented by atomic intrinsics and the raw
            // pointer passed in is valid because we got it from a reference.
            unsafe {
                #[cfg(not(portable_atomic_no_asm))]
                __asm!(
                    "xor.b #1, 0({dst})", // atomic { *dst ^= 1 }
                    dst = in(reg) dst,
                    // Do not use `preserves_flags` because XOR modifies the V, N, Z, and C bits of the status register.
                    options(nostack),
                );
                #[cfg(portable_atomic_no_asm)]
                llvm_asm!(
                    "xor.b #1, $0"
                    :: "*m"(dst) : "memory", "sr" : "volatile"
                );
            }
        }
    }
});
