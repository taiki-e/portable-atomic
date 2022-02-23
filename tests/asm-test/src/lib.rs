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
    // Copied from src/imp/cmpxchg16b.rs
    #[inline(always)]
    pub(crate) unsafe fn _cmpxchg16b(dst: *mut u128, old: u128, new: u128) -> (u128, bool) {
        #[derive(Clone, Copy)]
        #[repr(C)]
        struct U128 {
            /// The low-order 64 bits of a 128-bit value.
            lo: u64,
            /// The high-order 64 bits of a 128-bit value.
            hi: u64,
        }

        debug_assert!(dst as usize % 16 == 0);

        // SAFETY: the caller must uphold the safety contract for `_cmpxchg16b`.
        // Should not use `preserves_flags` because cmpxchg16b may change the ZF flag.
        unsafe {
            let r: u8;
            let mut old: U128 = core::mem::transmute(old);
            let new: U128 = core::mem::transmute(new);
            core::arch::asm!(
                // rbx is reserved by LLVM
                "xchg {b}, rbx",
                "lock cmpxchg16b xmmword ptr [rdi]",
                "sete {r}",
                "mov rbx, {b}",
                b = in(reg) new.lo,
                r = out(reg_byte) r,
                in("rcx") new.hi,
                in("rdi") dst,
                // If the value at `dst` is not the same as `old`,
                // the value at `dst` will be written to rdx:rax.
                inout("rax") old.lo,
                inout("rdx") old.hi,
                options(nostack),
            );
            (core::mem::transmute(old), r != 0)
        }
    }
}
