// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
PSRAM-aware atomics for ESP32 / ESP32-S3.

These chips implement the Xtensa `S32C1I` instruction, which works for internal
SRAM, but does NOT behave atomically on addresses backed by the external data
bus (PSRAM). Because Rust requires every allocation to support all atomic
operations the target claims to have, the compiler cannot expose atomics on
these chips at all. This module therefore implements the atomic operations
itself: every operation checks the target address at runtime and dispatches to
either inline assembly (fast path, when the atomic lives in internal memory) or
a critical section (when it lives in PSRAM).

Address ranges:
- ESP32:    0x3F80_0000..0x3FC0_0000
- ESP32-S3: 0x3C00_0000..0x3E00_0000

Only load, store, and compare-and-swap are implemented in assembly; the
remaining read-modify-write operations are CAS loops on top of them.

Note that l32ai (acquire load), s32ri (release store), and l32ex/s32ex/getex
(LL/SC) are not yet supported in LLVM, so `memw` is used as a fence, matching
LLVM's codegen for the atomic orderings.

Refs:
- Xtensa Instruction Set Architecture (ISA) Summary for all Xtensa LX Processors
  https://www.cadence.com/content/dam/cadence-www/global/en_US/documents/tools/silicon-solutions/compute-ip/isa-summary.pdf
- https://github.com/espressif/llvm-project/blob/xtensa_release_19.1.2/llvm/test/CodeGen/Xtensa/atomic-load-store.ll
- https://github.com/espressif/llvm-project/blob/xtensa_release_19.1.2/llvm/test/CodeGen/Xtensa/atomic-rmw.ll
- atomic-maybe-uninit
  https://github.com/taiki-e/atomic-maybe-uninit/blob/46661c29448849dd86a631ba4d20f1276d849bdc/src/arch/xtensa.rs

This module is selected in place of `src/imp/core_atomic.rs` by a `#[path]`
attribute in `src/imp/mod.rs`, so it exposes exactly the same public API.

See tests/asm-test/asm/portable-atomic for generated assembly.
*/

use core::{cell::UnsafeCell, sync::atomic::Ordering};

// The external (PSRAM / data bus) address ranges that do not support
// atomic RMW instructions on these CPUs.

// https://documentation.espressif.com/esp32_technical_reference_manual_en.pdf, Table 3.3-4. External Memory Address Mapping
#[cfg(portable_atomic_target_cpu = "esp32")]
const PSRAM: core::ops::Range<usize> = 0x3F80_0000..0x3FC0_0000;

// https://documentation.espressif.com/esp32-s3_technical_reference_manual_en.pdf, Table 4.3-2. External Memory Address Mapping
#[cfg(portable_atomic_target_cpu = "esp32s3")]
const PSRAM: core::ops::Range<usize> = 0x3C00_0000..0x3E00_0000;

#[inline(always)]
fn in_psram<T>(ptr: *const T) -> bool {
    let addr = ptr as usize;
    addr >= PSRAM.start && addr < PSRAM.end
}

#[cfg(not(feature = "critical-section"))]
#[cold]
#[inline(never)]
#[track_caller]
fn psram_rmw_without_cs() -> ! {
    panic!(
        "portable-atomic: atomic read-modify-write on PSRAM requires the \
         `critical-section` feature on ESP32 / ESP32-S3"
    );
}

// -----------------------------------------------------------------------------
// Native (internal memory) operations

#[cfg(target_feature = "density")]
macro_rules! n {
    ($op:tt) => {
        concat!($op, ".n")
    };
}
#[cfg(not(target_feature = "density"))]
macro_rules! n {
    ($op:tt) => {
        $op
    };
}

// `memw` is the only fence LLVM uses for atomic orderings on this target, as
// l32ai/s32ri are not yet supported. Keeping the fences out of the CAS loops
// and around them, as LLVM does, keeps the loop bodies small.
#[inline(always)]
fn memw() {
    // SAFETY: memw is always safe. The asm block is not `nomem`, so it also
    // prevents the compiler from moving memory accesses across it.
    unsafe {
        __asm!("memw", options(nostack, preserves_flags));
    }
}
#[inline(always)]
fn fence_release(order: Ordering) {
    match order {
        Ordering::Release | Ordering::AcqRel | Ordering::SeqCst => memw(),
        _ => {}
    }
}
#[inline(always)]
fn fence_acquire(order: Ordering) {
    match order {
        Ordering::Acquire | Ordering::AcqRel | Ordering::SeqCst => memw(),
        _ => {}
    }
}

// Register-width values that can be accessed by a single instruction and
// compared by s32c1i.
trait Word: Copy + PartialEq {
    /// # Safety
    ///
    /// `src` must be valid, aligned, and in internal memory, and `order` must
    /// be a valid load ordering.
    unsafe fn load(src: *mut Self, order: Ordering) -> Self;
    /// # Safety
    ///
    /// `dst` must be valid, aligned, and in internal memory, and `order` must
    /// be a valid store ordering.
    unsafe fn store(dst: *mut Self, val: Self, order: Ordering);
    /// Stores `new` if the current value is `old`, and returns the previous value.
    ///
    /// This is a relaxed operation; the caller emits the fences for the ordering
    /// it needs.
    ///
    /// # Safety
    ///
    /// `dst` must be valid, aligned, and in internal memory.
    unsafe fn cas_relaxed(dst: *mut Self, old: Self, new: Self) -> Self;
}

/// Stores `new` if the current value is `old`, and returns the previous value.
///
/// # Safety
///
/// `dst` must be valid, aligned, and in internal memory.
#[inline(always)]
unsafe fn cas<W: Word>(dst: *mut W, old: W, new: W, order: Ordering) -> W {
    fence_release(order);
    // SAFETY: the caller must uphold the safety contract.
    let out = unsafe { W::cas_relaxed(dst, old, new) };
    fence_acquire(order);
    out
}

macro_rules! impl_word {
    ($value_type:ty) => {
        impl_word!(@impl impl Word for $value_type);
    };
    ([$($generics:tt)*] $value_type:ty) => {
        impl_word!(@impl impl<$($generics)*> Word for $value_type);
    };
    (@impl $($header:tt)*) => {
        $($header)* {
            #[inline]
            unsafe fn load(src: *mut Self, order: Ordering) -> Self {
                let out;
                // SAFETY: the caller must uphold the safety contract.
                unsafe {
                    macro_rules! atomic_load {
                        ($acquire:tt) => {
                            __asm!(
                                concat!(n!("l32i"), " {out}, {src}, 0"), // atomic { out = *src }
                                $acquire,                               // fence
                                src = in(reg) ptr_reg!(src),
                                out = lateout(reg) out,
                                options(nostack, preserves_flags),
                            )
                        };
                    }
                    match order {
                        Ordering::Relaxed => atomic_load!(""),
                        // Acquire and SeqCst loads are equivalent. This matches with LLVM.
                        Ordering::Acquire | Ordering::SeqCst => atomic_load!("memw"),
                        _ => unreachable!(),
                    }
                }
                out
            }
            #[inline]
            unsafe fn store(dst: *mut Self, val: Self, order: Ordering) {
                // SAFETY: the caller must uphold the safety contract.
                unsafe {
                    macro_rules! atomic_store {
                        ($acquire:tt, $release:tt) => {
                            __asm!(
                                $release,                               // fence
                                concat!(n!("s32i"), " {val}, {dst}, 0"), // atomic { *dst = val }
                                $acquire,                               // fence
                                dst = in(reg) ptr_reg!(dst),
                                val = in(reg) val,
                                options(nostack, preserves_flags),
                            )
                        };
                    }
                    match order {
                        Ordering::Relaxed => atomic_store!("", ""),
                        Ordering::Release => atomic_store!("", "memw"),
                        Ordering::SeqCst => atomic_store!("memw", "memw"),
                        _ => unreachable!(),
                    }
                }
            }
            #[inline]
            unsafe fn cas_relaxed(dst: *mut Self, old: Self, new: Self) -> Self {
                let out;
                // SAFETY: the caller must uphold the safety contract.
                unsafe {
                    __asm!(
                        "wsr {old}, scompare1", // scompare1 = old
                        // atomic { _x = *dst; if _x == scompare1 { *dst = out }; out = _x }
                        "s32c1i {out}, {dst}, 0",
                        dst = in(reg) ptr_reg!(dst),
                        old = in(reg) old,
                        out = inout(reg) new => out,
                        out("scompare1") _,
                        options(nostack, preserves_flags),
                    );
                }
                out
            }
        }
    };
}
impl_word!(u32);
impl_word!([T] *mut T);

/// Applies `f` to the value at `dst` using a CAS loop, and returns the previous value.
///
/// # Safety
///
/// `dst` must be valid, aligned, and in internal memory.
#[inline]
unsafe fn update_word<W: Word, F: FnMut(W) -> W>(dst: *mut W, order: Ordering, mut f: F) -> W {
    fence_release(order);
    // SAFETY: the caller must uphold the safety contract.
    let prev = unsafe {
        let mut prev = W::load(dst, Ordering::Relaxed);
        loop {
            let out = W::cas_relaxed(dst, prev, f(prev));
            if out == prev {
                break prev;
            }
            prev = out;
        }
    };
    fence_acquire(order);
    prev
}

// The operations the public types are built from, for both register-width and
// sub-word integers.
trait AtomicOps: Copy + PartialEq {
    /// # Safety
    ///
    /// `dst` must be valid, aligned, and in internal memory, and `order` must
    /// be a valid load ordering.
    unsafe fn atomic_load(src: *mut Self, order: Ordering) -> Self;
    /// # Safety
    ///
    /// `dst` must be valid, aligned, and in internal memory, and `order` must
    /// be a valid store ordering.
    unsafe fn atomic_store(dst: *mut Self, val: Self, order: Ordering);
    /// # Safety
    ///
    /// `dst` must be valid, aligned, and in internal memory.
    unsafe fn atomic_update<F: FnMut(Self) -> Self>(dst: *mut Self, order: Ordering, f: F) -> Self;
    // These operations get their own methods rather than going through
    // `atomic_update`, because for sub-word integers they can be performed on
    // the containing word with a pre-shifted operand. That keeps the shifts
    // that extract and re-insert the sub-word out of the CAS loop.
    //
    // # Safety
    //
    // `dst` must be valid, aligned, and in internal memory.
    unsafe fn atomic_swap(dst: *mut Self, val: Self, order: Ordering) -> Self;
    /// # Safety
    ///
    /// `dst` must be valid, aligned, and in internal memory.
    unsafe fn atomic_add(dst: *mut Self, val: Self, order: Ordering) -> Self;
    /// # Safety
    ///
    /// `dst` must be valid, aligned, and in internal memory.
    unsafe fn atomic_sub(dst: *mut Self, val: Self, order: Ordering) -> Self;
    /// # Safety
    ///
    /// `dst` must be valid, aligned, and in internal memory.
    unsafe fn atomic_and(dst: *mut Self, val: Self, order: Ordering) -> Self;
    /// # Safety
    ///
    /// `dst` must be valid, aligned, and in internal memory.
    unsafe fn atomic_or(dst: *mut Self, val: Self, order: Ordering) -> Self;
    /// # Safety
    ///
    /// `dst` must be valid, aligned, and in internal memory.
    unsafe fn atomic_xor(dst: *mut Self, val: Self, order: Ordering) -> Self;
    /// # Safety
    ///
    /// `dst` must be valid, aligned, and in internal memory.
    unsafe fn atomic_nand(dst: *mut Self, val: Self, order: Ordering) -> Self;
    /// # Safety
    ///
    /// `dst` must be valid, aligned, and in internal memory.
    unsafe fn atomic_compare_exchange(
        dst: *mut Self,
        old: Self,
        new: Self,
        order: Ordering,
    ) -> Result<Self, Self>;
    /// # Safety
    ///
    /// `dst` must be valid, aligned, and in internal memory.
    unsafe fn atomic_compare_exchange_weak(
        dst: *mut Self,
        old: Self,
        new: Self,
        order: Ordering,
    ) -> Result<Self, Self>;
}

macro_rules! atomic_ops_word {
    ($int_type:ident) => {
        #[allow(
            clippy::cast_possible_truncation,
            clippy::cast_possible_wrap,
            clippy::cast_sign_loss
        )]
        impl AtomicOps for $int_type {
            #[inline]
            unsafe fn atomic_load(src: *mut Self, order: Ordering) -> Self {
                // SAFETY: the caller must uphold the safety contract.
                unsafe { u32::load(src.cast::<u32>(), order) as Self }
            }
            #[inline]
            unsafe fn atomic_store(dst: *mut Self, val: Self, order: Ordering) {
                // SAFETY: the caller must uphold the safety contract.
                unsafe { u32::store(dst.cast::<u32>(), val as u32, order) }
            }
            #[inline]
            unsafe fn atomic_update<F: FnMut(Self) -> Self>(
                dst: *mut Self,
                order: Ordering,
                mut f: F,
            ) -> Self {
                // SAFETY: the caller must uphold the safety contract.
                unsafe { update_word(dst.cast::<u32>(), order, |x| f(x as Self) as u32) as Self }
            }
            #[inline]
            unsafe fn atomic_swap(dst: *mut Self, val: Self, order: Ordering) -> Self {
                // SAFETY: the caller must uphold the safety contract.
                unsafe { Self::atomic_update(dst, order, |_| val) }
            }
            #[inline]
            unsafe fn atomic_add(dst: *mut Self, val: Self, order: Ordering) -> Self {
                // SAFETY: the caller must uphold the safety contract.
                unsafe { Self::atomic_update(dst, order, |x| x.wrapping_add(val)) }
            }
            #[inline]
            unsafe fn atomic_sub(dst: *mut Self, val: Self, order: Ordering) -> Self {
                // SAFETY: the caller must uphold the safety contract.
                unsafe { Self::atomic_update(dst, order, |x| x.wrapping_sub(val)) }
            }
            #[inline]
            unsafe fn atomic_and(dst: *mut Self, val: Self, order: Ordering) -> Self {
                // SAFETY: the caller must uphold the safety contract.
                unsafe { Self::atomic_update(dst, order, |x| x & val) }
            }
            #[inline]
            unsafe fn atomic_or(dst: *mut Self, val: Self, order: Ordering) -> Self {
                // SAFETY: the caller must uphold the safety contract.
                unsafe { Self::atomic_update(dst, order, |x| x | val) }
            }
            #[inline]
            unsafe fn atomic_xor(dst: *mut Self, val: Self, order: Ordering) -> Self {
                // SAFETY: the caller must uphold the safety contract.
                unsafe { Self::atomic_update(dst, order, |x| x ^ val) }
            }
            #[inline]
            unsafe fn atomic_nand(dst: *mut Self, val: Self, order: Ordering) -> Self {
                // SAFETY: the caller must uphold the safety contract.
                unsafe { Self::atomic_update(dst, order, |x| !(x & val)) }
            }
            #[inline]
            unsafe fn atomic_compare_exchange(
                dst: *mut Self,
                old: Self,
                new: Self,
                order: Ordering,
            ) -> Result<Self, Self> {
                // SAFETY: the caller must uphold the safety contract.
                let out = unsafe { cas(dst.cast::<u32>(), old as u32, new as u32, order) };
                let out = out as Self;
                if out == old { Ok(out) } else { Err(out) }
            }
            #[inline]
            unsafe fn atomic_compare_exchange_weak(
                dst: *mut Self,
                old: Self,
                new: Self,
                order: Ordering,
            ) -> Result<Self, Self> {
                // A word-sized CAS is a single instruction, so it cannot fail
                // spuriously and the strong version is already optimal.
                // SAFETY: the caller must uphold the safety contract.
                unsafe { Self::atomic_compare_exchange(dst, old, new, order) }
            }
        }
    };
}
atomic_ops_word!(i32);
atomic_ops_word!(u32);
atomic_ops_word!(isize);
atomic_ops_word!(usize);

// Sub-word atomics are implemented as word-sized CAS loops on the containing
// aligned word. See create_sub_word_mask_values for the shift/mask values.
macro_rules! atomic_ops_sub_word {
    ($int_type:ident, $unsigned_type:ident, $load:tt, $store:tt) => {
        #[allow(
            clippy::cast_possible_truncation,
            clippy::cast_possible_wrap,
            clippy::cast_sign_loss
        )]
        impl AtomicOps for $int_type {
            #[inline]
            unsafe fn atomic_load(src: *mut Self, order: Ordering) -> Self {
                // Use the narrow type for the operand: typing it as u32 would
                // make the compiler zero-extend the result, which the load
                // instruction already does.
                let out: $unsigned_type;
                // SAFETY: the caller must uphold the safety contract.
                unsafe {
                    macro_rules! atomic_load {
                        ($acquire:tt) => {
                            __asm!(
                                // atomic { out = zero_extend(*src) }
                                concat!($load, " {out}, {src}, 0"),
                                $acquire, // fence
                                src = in(reg) ptr_reg!(src),
                                out = lateout(reg) out,
                                options(nostack, preserves_flags),
                            )
                        };
                    }
                    match order {
                        Ordering::Relaxed => atomic_load!(""),
                        // Acquire and SeqCst loads are equivalent. This matches with LLVM.
                        Ordering::Acquire | Ordering::SeqCst => atomic_load!("memw"),
                        _ => unreachable!(),
                    }
                }
                out as Self
            }
            #[inline]
            unsafe fn atomic_store(dst: *mut Self, val: Self, order: Ordering) {
                // The store instruction only reads the low bits, so keep the
                // operand narrow to avoid a zero-extension.
                let val = val as $unsigned_type;
                // SAFETY: the caller must uphold the safety contract.
                unsafe {
                    macro_rules! atomic_store {
                        ($acquire:tt, $release:tt) => {
                            __asm!(
                                $release,                            // fence
                                concat!($store, " {val}, {dst}, 0"), // atomic { *dst = val }
                                $acquire,                            // fence
                                dst = in(reg) ptr_reg!(dst),
                                val = in(reg) val,
                                options(nostack, preserves_flags),
                            )
                        };
                    }
                    match order {
                        Ordering::Relaxed => atomic_store!("", ""),
                        Ordering::Release => atomic_store!("", "memw"),
                        Ordering::SeqCst => atomic_store!("memw", "memw"),
                        _ => unreachable!(),
                    }
                }
            }
            #[inline]
            unsafe fn atomic_update<F: FnMut(Self) -> Self>(
                dst: *mut Self,
                order: Ordering,
                mut f: F,
            ) -> Self {
                let (aligned, shift, mask) = crate::utils::create_sub_word_mask_values(dst);
                fence_release(order);
                // SAFETY: the caller must uphold the safety contract, and the
                // aligned pointer is in the same word as `dst`.
                let prev = unsafe {
                    let mut prev_word = u32::load(aligned, Ordering::Relaxed);
                    loop {
                        let prev = (prev_word >> shift) as Self;
                        let next = (f(prev) as $unsigned_type as u32) << shift;
                        let next_word = prev_word & !mask | next & mask;
                        let out = u32::cas_relaxed(aligned, prev_word, next_word);
                        if out == prev_word {
                            break prev;
                        }
                        prev_word = out;
                    }
                };
                fence_acquire(order);
                prev
            }
            #[inline]
            unsafe fn atomic_swap(dst: *mut Self, val: Self, order: Ordering) -> Self {
                let (aligned, shift, mask) = crate::utils::create_sub_word_mask_values(dst);
                let val = (val as $unsigned_type as u32) << shift;
                // SAFETY: the caller must uphold the safety contract, and the
                // aligned pointer is in the same word as `dst`.
                let prev_word = unsafe {
                    update_word(aligned, order, |word| word & !mask | val)
                };
                (prev_word >> shift) as Self
            }
            #[inline]
            unsafe fn atomic_add(dst: *mut Self, val: Self, order: Ordering) -> Self {
                let (aligned, shift, mask) = crate::utils::create_sub_word_mask_values(dst);
                let val = (val as $unsigned_type as u32) << shift;
                // A carry out of the sub-word lands in the bits that are taken
                // from the previous word, so it is discarded as it should be.
                // SAFETY: the caller must uphold the safety contract, and the
                // aligned pointer is in the same word as `dst`.
                let prev_word = unsafe {
                    update_word(aligned, order, |word| {
                        word & !mask | word.wrapping_add(val) & mask
                    })
                };
                (prev_word >> shift) as Self
            }
            #[inline]
            unsafe fn atomic_sub(dst: *mut Self, val: Self, order: Ordering) -> Self {
                let (aligned, shift, mask) = crate::utils::create_sub_word_mask_values(dst);
                let val = (val as $unsigned_type as u32) << shift;
                // As in `atomic_add`, the borrow out of the sub-word is discarded.
                // SAFETY: the caller must uphold the safety contract, and the
                // aligned pointer is in the same word as `dst`.
                let prev_word = unsafe {
                    update_word(aligned, order, |word| {
                        word & !mask | word.wrapping_sub(val) & mask
                    })
                };
                (prev_word >> shift) as Self
            }
            #[inline]
            unsafe fn atomic_and(dst: *mut Self, val: Self, order: Ordering) -> Self {
                let (aligned, shift, mask) = crate::utils::create_sub_word_mask_values(dst);
                // Setting the bits outside the sub-word keeps them unchanged.
                let val = (val as $unsigned_type as u32) << shift | !mask;
                // SAFETY: the caller must uphold the safety contract, and the
                // aligned pointer is in the same word as `dst`.
                let prev_word = unsafe { update_word(aligned, order, |word| word & val) };
                (prev_word >> shift) as Self
            }
            #[inline]
            unsafe fn atomic_or(dst: *mut Self, val: Self, order: Ordering) -> Self {
                let (aligned, shift, _) = crate::utils::create_sub_word_mask_values(dst);
                // The operand has no bits set outside the sub-word, so the
                // other bits are left unchanged.
                let val = (val as $unsigned_type as u32) << shift;
                // SAFETY: the caller must uphold the safety contract, and the
                // aligned pointer is in the same word as `dst`.
                let prev_word = unsafe { update_word(aligned, order, |word| word | val) };
                (prev_word >> shift) as Self
            }
            #[inline]
            unsafe fn atomic_xor(dst: *mut Self, val: Self, order: Ordering) -> Self {
                let (aligned, shift, _) = crate::utils::create_sub_word_mask_values(dst);
                // As in `atomic_or`, the bits outside the sub-word are unchanged.
                let val = (val as $unsigned_type as u32) << shift;
                // SAFETY: the caller must uphold the safety contract, and the
                // aligned pointer is in the same word as `dst`.
                let prev_word = unsafe { update_word(aligned, order, |word| word ^ val) };
                (prev_word >> shift) as Self
            }
            #[inline]
            unsafe fn atomic_nand(dst: *mut Self, val: Self, order: Ordering) -> Self {
                let (aligned, shift, mask) = crate::utils::create_sub_word_mask_values(dst);
                // As in `atomic_and`, except that the complement is taken of
                // the sub-word only.
                let val = (val as $unsigned_type as u32) << shift | !mask;
                // SAFETY: the caller must uphold the safety contract, and the
                // aligned pointer is in the same word as `dst`.
                let prev_word = unsafe {
                    update_word(aligned, order, |word| word & !mask | !(word & val) & mask)
                };
                (prev_word >> shift) as Self
            }
            #[inline]
            unsafe fn atomic_compare_exchange(
                dst: *mut Self,
                old: Self,
                new: Self,
                order: Ordering,
            ) -> Result<Self, Self> {
                let (aligned, shift, mask) = crate::utils::create_sub_word_mask_values(dst);
                // Comparing in the word domain keeps the shift out of the loop.
                let old = (old as $unsigned_type as u32) << shift;
                let new = (new as $unsigned_type as u32) << shift;
                fence_release(order);
                // SAFETY: the caller must uphold the safety contract, and the
                // aligned pointer is in the same word as `dst`.
                let res = unsafe {
                    let mut prev_word = u32::load(aligned, Ordering::Relaxed);
                    loop {
                        if prev_word & mask != old {
                            break Err(prev_word);
                        }
                        let out = u32::cas_relaxed(aligned, prev_word, prev_word & !mask | new);
                        if out == prev_word {
                            break Ok(prev_word);
                        }
                        prev_word = out;
                    }
                };
                fence_acquire(order);
                match res {
                    Ok(prev_word) => Ok((prev_word >> shift) as Self),
                    Err(prev_word) => Err((prev_word >> shift) as Self),
                }
            }
            #[inline]
            unsafe fn atomic_compare_exchange_weak(
                dst: *mut Self,
                old: Self,
                new: Self,
                order: Ordering,
            ) -> Result<Self, Self> {
                let (aligned, shift, mask) = crate::utils::create_sub_word_mask_values(dst);
                let old = (old as $unsigned_type as u32) << shift;
                let new = (new as $unsigned_type as u32) << shift;
                fence_release(order);
                // SAFETY: the caller must uphold the safety contract, and the
                // aligned pointer is in the same word as `dst`.
                let (expected, out) = unsafe {
                    let prev_word = u32::load(aligned, Ordering::Relaxed);
                    // Expect the bits outside the sub-word to be unchanged. If
                    // they are not, the CAS fails without the sub-word having
                    // changed, which a weak compare_exchange is allowed to do.
                    let expected = prev_word & !mask | old;
                    let desired = prev_word & !mask | new;
                    (expected, u32::cas_relaxed(aligned, expected, desired))
                };
                fence_acquire(order);
                let prev = (out >> shift) as Self;
                if out == expected { Ok(prev) } else { Err(prev) }
            }
        }
    };
}
atomic_ops_sub_word!(i8, u8, "l8ui", "s8i");
atomic_ops_sub_word!(u8, u8, "l8ui", "s8i");
atomic_ops_sub_word!(i16, u16, "l16ui", "s16i");
atomic_ops_sub_word!(u16, u16, "l16ui", "s16i");

// -----------------------------------------------------------------------------
// PSRAM dispatch

// Run an operation either natively (addr in internal memory) or under a
// critical section (addr in PSRAM). When the `critical-section` feature is
// disabled, the PSRAM path panics.
//
// `$ptr` is the backing raw pointer, used by both the native and the CS arm.
macro_rules! rmw {
    ($self:ident, |$ptr:ident| $native:expr, $cs:expr) => {{
        let $ptr: *mut _ = $self.as_ptr();
        if in_psram($ptr) {
            #[cfg(feature = "critical-section")]
            {
                critical_section::with(|_cs| {
                    // SAFETY: inside a critical section, we have exclusive
                    // access to `$ptr` and the pointer is valid because
                    // we got it from `&self`.
                    unsafe { $cs }
                })
            }
            #[cfg(not(feature = "critical-section"))]
            {
                let _ = $ptr; // suppress unused warning for move-only closures
                psram_rmw_without_cs()
            }
        } else {
            // SAFETY: the pointer is valid and aligned because we got it from
            // `&self`, and it is in internal memory, where the atomic
            // instructions behave atomically.
            unsafe { $native }
        }
    }};
}

// PSRAM operations are emulated with non-atomic accesses under a critical section,
// so synchronization lives on the critical section's lock, not on the atomic's
// address. Loads and stores must take the same critical section for every ordering:
// otherwise they race with the emulated write and have no release on this address
// to pair with, and the ordering argument cannot be used to opt out because
// `Relaxed` load + `fence(Acquire)` must work too.
//
// Without the `critical-section` feature, PSRAM RMWs panic instead of being
// emulated, so all accesses are native and the native load/store are correct.
macro_rules! load {
    ($self:ident, $order:ident) => {{
        let p: *mut _ = $self.as_ptr();
        #[cfg(feature = "critical-section")]
        {
            if in_psram(p) {
                return critical_section::with(|_cs| {
                    // SAFETY: `p` is valid and aligned (from `&self`), and the
                    // critical section excludes the RMW and store paths.
                    unsafe { core::ptr::read(p) }
                });
            }
        }
        // SAFETY: `p` is valid and aligned (from `&self`) and in internal memory.
        unsafe { AtomicOps::atomic_load(p, $order) }
    }};
}

macro_rules! store {
    ($self:ident, $val:ident, $order:ident) => {{
        let p: *mut _ = $self.as_ptr();
        #[cfg(feature = "critical-section")]
        {
            if in_psram(p) {
                critical_section::with(|_cs| {
                    // SAFETY: `p` is valid and aligned (from `&self`), and the
                    // critical section excludes the RMW and load paths.
                    unsafe { core::ptr::write(p, $val) }
                });
                return;
            }
        }
        // SAFETY: `p` is valid and aligned (from `&self`) and in internal memory.
        unsafe { AtomicOps::atomic_store(p, $val, $order) }
    }};
}

// ---------------------------------------------------------------------------
// AtomicPtr

#[repr(transparent)]
pub(crate) struct AtomicPtr<T> {
    v: UnsafeCell<*mut T>,
}
// SAFETY: any data races are prevented by atomic operations or a critical section.
unsafe impl<T> Send for AtomicPtr<T> {}
// SAFETY: any data races are prevented by atomic operations or a critical section.
unsafe impl<T> Sync for AtomicPtr<T> {}
impl<T> AtomicPtr<T> {
    #[inline]
    pub(crate) const fn new(v: *mut T) -> Self {
        Self { v: UnsafeCell::new(v) }
    }
    #[inline]
    pub(crate) fn is_lock_free() -> bool {
        Self::IS_ALWAYS_LOCK_FREE
    }
    // Not lock-free: if the atomic happens to live in PSRAM, every access
    // takes a critical section. We can only give a conservative compile-time
    // answer.
    pub(crate) const IS_ALWAYS_LOCK_FREE: bool = false;

    #[inline]
    #[cfg_attr(any(debug_assertions, miri), track_caller)]
    pub(crate) fn load(&self, order: Ordering) -> *mut T {
        crate::utils::assert_load_ordering(order);
        let p: *mut *mut T = self.as_ptr();
        #[cfg(feature = "critical-section")]
        {
            if in_psram(p) {
                return critical_section::with(|_cs| {
                    // SAFETY: `p` is valid and aligned (from `&self`), and the
                    // critical section excludes the RMW and store paths.
                    unsafe { core::ptr::read(p) }
                });
            }
        }
        // SAFETY: `p` is valid and aligned (from `&self`) and in internal memory.
        unsafe { Word::load(p, order) }
    }
    #[inline]
    #[cfg_attr(any(debug_assertions, miri), track_caller)]
    pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
        crate::utils::assert_store_ordering(order);
        let p: *mut *mut T = self.as_ptr();
        #[cfg(feature = "critical-section")]
        {
            if in_psram(p) {
                critical_section::with(|_cs| {
                    // SAFETY: `p` is valid and aligned (from `&self`), and the
                    // critical section excludes the RMW and load paths.
                    unsafe { core::ptr::write(p, ptr) }
                });
                return;
            }
        }
        // SAFETY: `p` is valid and aligned (from `&self`) and in internal memory.
        unsafe { Word::store(p, ptr, order) }
    }

    #[inline]
    #[cfg_attr(miri, track_caller)]
    pub(crate) fn swap(&self, ptr: *mut T, order: Ordering) -> *mut T {
        rmw!(self, |p| update_word(p, order, |_| ptr), {
            let prev = core::ptr::read(p);
            core::ptr::write(p, ptr);
            prev
        })
    }

    #[inline]
    #[cfg_attr(any(debug_assertions, miri), track_caller)]
    pub(crate) fn compare_exchange(
        &self,
        current: *mut T,
        new: *mut T,
        success: Ordering,
        failure: Ordering,
    ) -> Result<*mut T, *mut T> {
        crate::utils::assert_compare_exchange_ordering(success, failure);
        let order = crate::utils::upgrade_success_ordering(success, failure);
        rmw!(
            self,
            |p| {
                let prev = cas(p, current, new, order);
                if prev == current { Ok(prev) } else { Err(prev) }
            },
            {
                let prev = core::ptr::read(p);
                if prev == current {
                    core::ptr::write(p, new);
                    Ok(prev)
                } else {
                    Err(prev)
                }
            }
        )
    }
    #[inline]
    #[cfg_attr(any(debug_assertions, miri), track_caller)]
    pub(crate) fn compare_exchange_weak(
        &self,
        current: *mut T,
        new: *mut T,
        success: Ordering,
        failure: Ordering,
    ) -> Result<*mut T, *mut T> {
        self.compare_exchange(current, new, success, failure)
    }

    #[inline]
    #[cfg_attr(miri, track_caller)]
    pub(crate) fn fetch_byte_add(&self, val: usize, order: Ordering) -> *mut T {
        #[cfg(portable_atomic_no_strict_provenance)]
        use crate::utils::ptr::PtrExt as _;
        rmw!(self, |p| update_word(p, order, |x| x.with_addr(x.addr().wrapping_add(val))), {
            let prev = core::ptr::read(p);
            let next = prev.with_addr(prev.addr().wrapping_add(val));
            core::ptr::write(p, next);
            prev
        })
    }
    #[inline]
    #[cfg_attr(miri, track_caller)]
    pub(crate) fn fetch_byte_sub(&self, val: usize, order: Ordering) -> *mut T {
        #[cfg(portable_atomic_no_strict_provenance)]
        use crate::utils::ptr::PtrExt as _;
        rmw!(self, |p| update_word(p, order, |x| x.with_addr(x.addr().wrapping_sub(val))), {
            let prev = core::ptr::read(p);
            let next = prev.with_addr(prev.addr().wrapping_sub(val));
            core::ptr::write(p, next);
            prev
        })
    }
    #[inline]
    #[cfg_attr(miri, track_caller)]
    pub(crate) fn fetch_or(&self, val: usize, order: Ordering) -> *mut T {
        #[cfg(portable_atomic_no_strict_provenance)]
        use crate::utils::ptr::PtrExt as _;
        rmw!(self, |p| update_word(p, order, |x| x.with_addr(x.addr() | val)), {
            let prev = core::ptr::read(p);
            let next = prev.with_addr(prev.addr() | val);
            core::ptr::write(p, next);
            prev
        })
    }
    #[inline]
    #[cfg_attr(miri, track_caller)]
    pub(crate) fn fetch_and(&self, val: usize, order: Ordering) -> *mut T {
        #[cfg(portable_atomic_no_strict_provenance)]
        use crate::utils::ptr::PtrExt as _;
        rmw!(self, |p| update_word(p, order, |x| x.with_addr(x.addr() & val)), {
            let prev = core::ptr::read(p);
            let next = prev.with_addr(prev.addr() & val);
            core::ptr::write(p, next);
            prev
        })
    }
    #[inline]
    #[cfg_attr(miri, track_caller)]
    pub(crate) fn fetch_xor(&self, val: usize, order: Ordering) -> *mut T {
        #[cfg(portable_atomic_no_strict_provenance)]
        use crate::utils::ptr::PtrExt as _;
        rmw!(self, |p| update_word(p, order, |x| x.with_addr(x.addr() ^ val)), {
            let prev = core::ptr::read(p);
            let next = prev.with_addr(prev.addr() ^ val);
            core::ptr::write(p, next);
            prev
        })
    }

    #[inline]
    pub(crate) const fn as_ptr(&self) -> *mut *mut T {
        self.v.get()
    }
}
impl_default_bit_opts!(AtomicPtr, usize);

// ---------------------------------------------------------------------------
// AtomicInt

macro_rules! atomic_int {
    ($atomic_type:ident, $int_type:ident) => {
        #[repr(transparent)]
        pub(crate) struct $atomic_type {
            v: UnsafeCell<$int_type>,
        }
        // SAFETY: any data races are prevented by atomic operations or a critical section.
        unsafe impl Sync for $atomic_type {}
        impl $atomic_type {
            #[inline]
            pub(crate) const fn new(v: $int_type) -> Self {
                Self { v: UnsafeCell::new(v) }
            }
            #[inline]
            pub(crate) fn is_lock_free() -> bool {
                Self::IS_ALWAYS_LOCK_FREE
            }
            // We cannot promise lock-freedom without knowing the address
            // at compile time; every access on PSRAM takes a critical section.
            pub(crate) const IS_ALWAYS_LOCK_FREE: bool = false;

            #[inline]
            #[cfg_attr(any(debug_assertions, miri), track_caller)]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                crate::utils::assert_load_ordering(order);
                load!(self, order)
            }
            #[inline]
            #[cfg_attr(any(debug_assertions, miri), track_caller)]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                store!(self, val, order);
            }

            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn swap(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, |p| AtomicOps::atomic_swap(p, val, order), {
                    let prev = core::ptr::read(p);
                    core::ptr::write(p, val);
                    prev
                })
            }

            #[inline]
            #[cfg_attr(any(debug_assertions, miri), track_caller)]
            pub(crate) fn compare_exchange(
                &self,
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                crate::utils::assert_compare_exchange_ordering(success, failure);
                let order = crate::utils::upgrade_success_ordering(success, failure);
                rmw!(self, |p| AtomicOps::atomic_compare_exchange(p, current, new, order), {
                    let prev = core::ptr::read(p);
                    if prev == current {
                        core::ptr::write(p, new);
                        Ok(prev)
                    } else {
                        Err(prev)
                    }
                })
            }
            #[inline]
            #[cfg_attr(any(debug_assertions, miri), track_caller)]
            pub(crate) fn compare_exchange_weak(
                &self,
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                crate::utils::assert_compare_exchange_ordering(success, failure);
                let order = crate::utils::upgrade_success_ordering(success, failure);
                rmw!(self, |p| AtomicOps::atomic_compare_exchange_weak(p, current, new, order), {
                    let prev = core::ptr::read(p);
                    if prev == current {
                        core::ptr::write(p, new);
                        Ok(prev)
                    } else {
                        Err(prev)
                    }
                })
            }

            // Arithmetic RMWs ------------------------------------------------
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_add(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, |p| AtomicOps::atomic_add(p, val, order), {
                    let prev = core::ptr::read(p);
                    core::ptr::write(p, prev.wrapping_add(val));
                    prev
                })
            }
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_sub(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, |p| AtomicOps::atomic_sub(p, val, order), {
                    let prev = core::ptr::read(p);
                    core::ptr::write(p, prev.wrapping_sub(val));
                    prev
                })
            }

            // Bitwise RMWs ---------------------------------------------------
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_and(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, |p| AtomicOps::atomic_and(p, val, order), {
                    let prev = core::ptr::read(p);
                    core::ptr::write(p, prev & val);
                    prev
                })
            }
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_nand(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, |p| AtomicOps::atomic_nand(p, val, order), {
                    let prev = core::ptr::read(p);
                    core::ptr::write(p, !(prev & val));
                    prev
                })
            }
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_or(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, |p| AtomicOps::atomic_or(p, val, order), {
                    let prev = core::ptr::read(p);
                    core::ptr::write(p, prev | val);
                    prev
                })
            }
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_xor(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, |p| AtomicOps::atomic_xor(p, val, order), {
                    let prev = core::ptr::read(p);
                    core::ptr::write(p, prev ^ val);
                    prev
                })
            }

            // fetch_max / fetch_min -----------------------------------------
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_max(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, |p| AtomicOps::atomic_update(p, order, |x| core::cmp::max(x, val)), {
                    let prev = core::ptr::read(p);
                    core::ptr::write(p, core::cmp::max(prev, val));
                    prev
                })
            }
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, |p| AtomicOps::atomic_update(p, order, |x| core::cmp::min(x, val)), {
                    let prev = core::ptr::read(p);
                    core::ptr::write(p, core::cmp::min(prev, val));
                    prev
                })
            }

            // Unary RMWs ----------------------------------------------------
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_not(&self, order: Ordering) -> $int_type {
                self.fetch_xor(!0, order)
            }
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_neg(&self, order: Ordering) -> $int_type {
                rmw!(self, |p| AtomicOps::atomic_update(p, order, $int_type::wrapping_neg), {
                    let prev = core::ptr::read(p);
                    core::ptr::write(p, prev.wrapping_neg());
                    prev
                })
            }
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn not(&self, order: Ordering) {
                self.fetch_not(order);
            }
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn neg(&self, order: Ordering) {
                self.fetch_neg(order);
            }

            #[inline]
            pub(crate) const fn as_ptr(&self) -> *mut $int_type {
                self.v.get()
            }
        }
        impl_default_no_fetch_ops!($atomic_type, $int_type);
        impl_default_bit_opts!($atomic_type, $int_type);
    };
}

atomic_int!(AtomicIsize, isize);
atomic_int!(AtomicUsize, usize);
atomic_int!(AtomicI8, i8);
atomic_int!(AtomicU8, u8);
atomic_int!(AtomicI16, i16);
atomic_int!(AtomicU16, u16);
atomic_int!(AtomicI32, i32);
atomic_int!(AtomicU32, u32);
