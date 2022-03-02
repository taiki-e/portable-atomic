#![cfg(all(portable_atomic_nightly, not(portable_atomic_no_asm)))]
#![no_std]
#![warn(rust_2018_idioms, single_use_lifetimes, unsafe_op_in_unsafe_fn)]
#![allow(clippy::missing_safety_doc)]
#![feature(cfg_target_has_atomic, core_intrinsics)]

pub mod atomic_u8_load {
    #[cfg(target_has_atomic_load_store = "8")]
    use core::sync::atomic::{AtomicU8, Ordering};
    #[cfg(not(target_has_atomic_load_store = "8"))]
    use portable_atomic::{AtomicU8, Ordering};
    type A<'a> = &'a AtomicU8;
    type T = u8;
    #[inline(never)]
    pub fn relaxed(a: A<'_>) -> T {
        a.load(Ordering::Relaxed)
    }
    #[inline(never)]
    pub fn acquire(a: A<'_>) -> T {
        a.load(Ordering::Acquire)
    }
    #[inline(never)]
    pub fn seq_cst(a: A<'_>) -> T {
        a.load(Ordering::SeqCst)
    }
}

pub mod atomic_u16_load {
    #[cfg(target_has_atomic_load_store = "16")]
    use core::sync::atomic::{AtomicU16, Ordering};
    #[cfg(not(target_has_atomic_load_store = "16"))]
    use portable_atomic::{AtomicU16, Ordering};
    type A<'a> = &'a AtomicU16;
    type T = u16;
    #[inline(never)]
    pub fn relaxed(a: A<'_>) -> T {
        a.load(Ordering::Relaxed)
    }
    #[inline(never)]
    pub fn acquire(a: A<'_>) -> T {
        a.load(Ordering::Acquire)
    }
    #[inline(never)]
    pub fn seq_cst(a: A<'_>) -> T {
        a.load(Ordering::SeqCst)
    }
}

#[cfg(not(target_pointer_width = "16"))]
pub mod atomic_u32_load {
    #[cfg(target_has_atomic_load_store = "32")]
    use core::sync::atomic::{AtomicU32, Ordering};
    #[cfg(not(target_has_atomic_load_store = "32"))]
    use portable_atomic::{AtomicU32, Ordering};
    type A<'a> = &'a AtomicU32;
    type T = u32;
    #[inline(never)]
    pub fn relaxed(a: A<'_>) -> T {
        a.load(Ordering::Relaxed)
    }
    #[inline(never)]
    pub fn acquire(a: A<'_>) -> T {
        a.load(Ordering::Acquire)
    }
    #[inline(never)]
    pub fn seq_cst(a: A<'_>) -> T {
        a.load(Ordering::SeqCst)
    }
}

#[cfg(target_has_atomic_load_store = "64")]
pub mod atomic_u64_load {
    use core::sync::atomic::{AtomicU64, Ordering};
    type A<'a> = &'a AtomicU64;
    type T = u64;
    #[inline(never)]
    pub fn relaxed(a: A<'_>) -> T {
        a.load(Ordering::Relaxed)
    }
    #[inline(never)]
    pub fn acquire(a: A<'_>) -> T {
        a.load(Ordering::Acquire)
    }
    #[inline(never)]
    pub fn seq_cst(a: A<'_>) -> T {
        a.load(Ordering::SeqCst)
    }
}

#[cfg(any(target_has_atomic_load_store = "128", target_feature = "cmpxchg16b"))]
pub mod atomic_u128_load_intrinsics {
    use core::intrinsics;
    type A = *mut u128;
    type T = u128;
    #[inline(never)]
    pub unsafe fn relaxed(a: A) -> T {
        unsafe { intrinsics::atomic_load_relaxed(a) }
    }
    #[inline(never)]
    pub unsafe fn acquire(a: A) -> T {
        unsafe { intrinsics::atomic_load_acq(a) }
    }
    #[inline(never)]
    pub unsafe fn seq_cst(a: A) -> T {
        unsafe { intrinsics::atomic_load(a) }
    }
}

#[cfg(target_arch = "x86_64")]
#[cfg(target_feature = "cmpxchg16b")]
pub mod atomic_u128_load_asm {
    type A = *mut u128;
    type T = u128;
    #[inline(never)]
    pub unsafe fn atomic_load(dst: A) -> T {
        unsafe { crate::cmpxchg16b::_cmpxchg16b(dst, 0, 0).0 }
    }
}

pub mod atomic_u8_store {
    #[cfg(target_has_atomic_load_store = "8")]
    use core::sync::atomic::{AtomicU8, Ordering};
    #[cfg(not(target_has_atomic_load_store = "8"))]
    use portable_atomic::{AtomicU8, Ordering};
    type A<'a> = &'a AtomicU8;
    type T = u8;
    #[inline(never)]
    pub fn relaxed(a: A<'_>, val: T) {
        a.store(val, Ordering::Relaxed)
    }
    #[inline(never)]
    pub fn release(a: A<'_>, val: T) {
        a.store(val, Ordering::Release);
    }
    #[inline(never)]
    pub fn seq_cst(a: A<'_>, val: T) {
        a.store(val, Ordering::SeqCst)
    }
}

pub mod atomic_u16_store {
    #[cfg(target_has_atomic_load_store = "16")]
    use core::sync::atomic::{AtomicU16, Ordering};
    #[cfg(not(target_has_atomic_load_store = "16"))]
    use portable_atomic::{AtomicU16, Ordering};
    type A<'a> = &'a AtomicU16;
    type T = u16;
    #[inline(never)]
    pub fn relaxed(a: A<'_>, val: T) {
        a.store(val, Ordering::Relaxed)
    }
    #[inline(never)]
    pub fn release(a: A<'_>, val: T) {
        a.store(val, Ordering::Release)
    }
    #[inline(never)]
    pub fn seq_cst(a: A<'_>, val: T) {
        a.store(val, Ordering::SeqCst)
    }
}

#[cfg(not(target_pointer_width = "16"))]
pub mod atomic_u32_store {
    #[cfg(target_has_atomic_load_store = "32")]
    use core::sync::atomic::{AtomicU32, Ordering};
    #[cfg(not(target_has_atomic_load_store = "32"))]
    use portable_atomic::{AtomicU32, Ordering};
    type A<'a> = &'a AtomicU32;
    type T = u32;
    #[inline(never)]
    pub fn relaxed(a: A<'_>, val: T) {
        a.store(val, Ordering::Relaxed)
    }
    #[inline(never)]
    pub fn release(a: A<'_>, val: T) {
        a.store(val, Ordering::Release)
    }
    #[inline(never)]
    pub fn seq_cst(a: A<'_>, val: T) {
        a.store(val, Ordering::SeqCst)
    }
}

#[cfg(target_has_atomic_load_store = "64")]
pub mod atomic_u64_store {
    use core::sync::atomic::{AtomicU64, Ordering};
    type A<'a> = &'a AtomicU64;
    type T = u64;
    #[inline(never)]
    pub fn relaxed(a: A<'_>, val: T) {
        a.store(val, Ordering::Relaxed)
    }
    #[inline(never)]
    pub fn release(a: A<'_>, val: T) {
        a.store(val, Ordering::Release)
    }
    #[inline(never)]
    pub fn seq_cst(a: A<'_>, val: T) {
        a.store(val, Ordering::SeqCst)
    }
}

#[cfg(target_arch = "x86_64")]
#[cfg(target_feature = "cmpxchg16b")]
pub mod atomic_u128_store_asm {
    type A = *mut u128;
    type T = u128;
    #[inline(never)]
    pub unsafe fn atomic_store(dst: A, val: T) {
        let mut old = val;
        let new = val;
        loop {
            // SAFETY: the caller must uphold the safety contract for `atomic_store`.
            let (x, ok) = unsafe { crate::cmpxchg16b::_cmpxchg16b(dst, old, new) };
            if ok {
                return;
            }
            old = x;
        }
    }
}

#[cfg(any(target_has_atomic_load_store = "128", target_feature = "cmpxchg16b"))]
pub mod atomic_u128_store_intrinsics {
    use core::intrinsics;
    type A = *mut u128;
    type T = u128;
    #[inline(never)]
    pub unsafe fn relaxed(a: A, val: T) {
        unsafe { intrinsics::atomic_store_relaxed(a, val) }
    }
    #[inline(never)]
    pub unsafe fn release(a: A, val: T) {
        unsafe { intrinsics::atomic_store_rel(a, val) }
    }
    #[inline(never)]
    pub unsafe fn seq_cst(a: A, val: T) {
        unsafe { intrinsics::atomic_store(a, val) }
    }
}

#[cfg(target_arch = "x86_64")]
#[cfg(target_feature = "cmpxchg16b")]
mod cmpxchg16b {
    use core::arch::asm;

    // Copied from src/imp/cmpxchg16b.rs
    #[inline(always)]
    pub(crate) unsafe fn _cmpxchg16b(dst: *mut u128, old: u128, new: u128) -> (u128, bool) {
        /// A 128-bit value represented as a pair of 64-bit values.
        // This type is #[repr(C)], both fields have the same in-memory representation
        // and are plain old datatypes, so access to the fields is always safe.
        #[derive(Clone, Copy)]
        #[repr(C)]
        union U128 {
            u128: u128,
            pair: [u64; 2],
        }

        debug_assert!(dst as usize % 16 == 0);

        // SAFETY: the caller must guarantee that `dst` is valid for both writes and
        // reads, 16-byte aligned (required by cmpxchg16b), that there are no
        // concurrent non-atomic operations, and that the CPU supports cmpxchg16b.
        //
        // If the value at `dst` (destination operand) and rdx:rax are equal, the
        // 128-bit value in rcx:rbx is stored in the `dst`, otherwise the value at
        // `dst` is loaded to rdx:rax.
        //
        // The ZF flag is set if the value at `dst` and rdx:rax are equal,
        // otherwise it is cleared. Other flags are unaffected.
        unsafe {
            let r: u8;
            let old: U128 = U128 { u128: old };
            let new: U128 = U128 { u128: new };
            let (prev_lo, prev_hi);
            asm!(
                // rbx is reserved by LLVM
                "xchg {rbx_tmp}, rbx",
                "lock cmpxchg16b xmmword ptr [rdi]",
                "sete r8b",
                "mov rbx, {rbx_tmp}",
                rbx_tmp = inout(reg) new.pair[0] => _,
                in("rdi") dst,
                inlateout("rax") old.pair[0] => prev_lo,
                inlateout("rdx") old.pair[1] => prev_hi,
                in("rcx") new.pair[1],
                lateout("r8b") r,
                // Should not use `preserves_flags` because cmpxchg16b modifies the ZF flag.
                options(nostack),
            );
            (U128 { pair: [prev_lo, prev_hi] }.u128, r != 0)
        }
    }
}
