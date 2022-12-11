// Atomic{I,U}128 implementation for x86_64 using CMPXCHG16B (DWCAS).
//
// Refs:
// - x86 and amd64 instruction reference https://www.felixcloutier.com/x86
//
// Generated asm:
// - x86_64 (+cmpxchg16b) https://godbolt.org/z/vbz7bG156

include!("macros.rs");

#[path = "cpuid.rs"]
mod detect;

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::sync::atomic::Ordering;

#[cfg(target_pointer_width = "32")]
macro_rules! ptr_modifier {
    () => {
        ":e"
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
#[repr(C)]
struct Pair {
    lo: u64,
    hi: u64,
}

#[inline(always)]
unsafe fn __cmpxchg16b(dst: *mut u128, old: u128, new: u128) -> (u128, bool) {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must guarantee that `dst` is valid for both writes and
    // reads, 16-byte aligned (required by CMPXCHG16B), that there are no
    // concurrent non-atomic operations, and that the CPU supports CMPXCHG16B.
    //
    // If the value at `dst` (destination operand) and rdx:rax are equal, the
    // 128-bit value in rcx:rbx is stored in the `dst`, otherwise the value at
    // `dst` is loaded to rdx:rax.
    //
    // The ZF flag is set if the value at `dst` and rdx:rax are equal,
    // otherwise it is cleared. Other flags are unaffected.
    //
    // Refs: https://www.felixcloutier.com/x86/cmpxchg8b:cmpxchg16b
    unsafe {
        let r: u8;
        let old = U128 { whole: old };
        let new = U128 { whole: new };
        let (prev_lo, prev_hi);
        macro_rules! cmpxchg16b {
            ($rdi:tt) => {
                asm!(
                    // rbx is reserved by LLVM
                    "xchg {rbx_tmp}, rbx",
                    concat!("lock cmpxchg16b xmmword ptr [", $rdi, "]"),
                    "sete r8b",
                    "mov rbx, {rbx_tmp}",
                    rbx_tmp = inout(reg) new.pair.lo => _,
                    in("rdi") dst,
                    inout("rax") old.pair.lo => prev_lo,
                    inout("rdx") old.pair.hi => prev_hi,
                    in("rcx") new.pair.hi,
                    out("r8b") r,
                    // Do not use `preserves_flags` because CMPXCHG16B modifies the ZF flag.
                    options(nostack),
                )
            };
        }
        #[cfg(target_pointer_width = "32")]
        cmpxchg16b!("edi");
        #[cfg(target_pointer_width = "64")]
        cmpxchg16b!("rdi");
        (U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole, r != 0)
    }
}

#[inline]
unsafe fn cmpxchg16b(
    dst: *mut u128,
    old: u128,
    new: u128,
    success: Ordering,
    failure: Ordering,
) -> (u128, bool) {
    #[cfg_attr(
        all(
            any(all(test, portable_atomic_nightly), portable_atomic_cmpxchg16b_dynamic),
            not(any(
                target_feature = "cmpxchg16b",
                portable_atomic_target_feature = "cmpxchg16b",
            ))
        ),
        target_feature(enable = "cmpxchg16b")
    )]
    #[cfg_attr(
        any(target_feature = "cmpxchg16b", portable_atomic_target_feature = "cmpxchg16b"),
        inline
    )]
    #[cfg_attr(
        not(any(target_feature = "cmpxchg16b", portable_atomic_target_feature = "cmpxchg16b")),
        inline(never)
    )]
    unsafe fn _cmpxchg16b(
        dst: *mut u128,
        old: u128,
        new: u128,
        success: Ordering,
        failure: Ordering,
    ) -> (u128, bool) {
        // Miri and Sanitizer do not support inline assembly.
        #[cfg(any(miri, portable_atomic_sanitize_thread))]
        // SAFETY: the caller must uphold the safety contract for `_cmpxchg16b`.
        unsafe {
            let res = core::arch::x86_64::cmpxchg16b(dst, old, new, success, failure);
            (res, res == old)
        }
        #[cfg(not(any(miri, portable_atomic_sanitize_thread)))]
        // SAFETY: the caller must uphold the safety contract for `_cmpxchg16b`.
        unsafe {
            let _ = (success, failure);
            __cmpxchg16b(dst, old, new)
        }
    }

    #[deny(unreachable_patterns)]
    match () {
        #[cfg(any(target_feature = "cmpxchg16b", portable_atomic_target_feature = "cmpxchg16b"))]
        // SAFETY: the caller must guarantee that `dst` is valid for both writes and
        // reads, 16-byte aligned, that there are no concurrent non-atomic operations,
        // and cfg guarantees that CMPXCHG16B is statically available.
        () => unsafe { _cmpxchg16b(dst, old, new, success, failure) },
        #[cfg(portable_atomic_cmpxchg16b_dynamic)]
        #[cfg(not(any(
            target_feature = "cmpxchg16b",
            portable_atomic_target_feature = "cmpxchg16b"
        )))]
        () => {
            #[cold]
            unsafe fn _fallback(
                dst: *mut u128,
                old: u128,
                new: u128,
                success: Ordering,
                failure: Ordering,
            ) -> (u128, bool) {
                #[allow(clippy::cast_ptr_alignment)]
                // SAFETY: the caller must uphold the safety contract.
                unsafe {
                    match (*(dst as *const super::fallback::AtomicU128))
                        .compare_exchange(old, new, success, failure)
                    {
                        Ok(v) => (v, true),
                        Err(v) => (v, false),
                    }
                }
            }
            // SAFETY: the caller must guarantee that `dst` is valid for both writes and
            // reads, 16-byte aligned, and that there are no different kinds of concurrent accesses.
            unsafe {
                ifunc!(
                    unsafe fn(
                        dst: *mut u128, old: u128, new: u128, success: Ordering, failure: Ordering
                    ) -> (u128, bool);
                    if detect::has_cmpxchg16b() { _cmpxchg16b } else { _fallback })
            }
        }
    }
}

// 128-bit atomic load by two 64-bit atomic loads.
//
// This is based on the code generated for the first load in DW RMWs by LLVM,
// but it is interesting that they generate code that does mixed-sized atomic access.
#[inline]
unsafe fn byte_wise_atomic_load(src: *mut u128) -> u128 {
    debug_assert!(src as usize % 16 == 0);

    // Miri and Sanitizer do not support inline assembly.
    #[cfg(any(miri, portable_atomic_sanitize_thread))]
    // SAFETY: the caller must uphold the safety contract for `byte_wise_atomic_load`.
    unsafe {
        atomic_load(src, Ordering::Relaxed)
    }
    #[cfg(not(any(miri, portable_atomic_sanitize_thread)))]
    // SAFETY: the caller must uphold the safety contract for `byte_wise_atomic_load`.
    unsafe {
        let (prev_lo, prev_hi);
        asm!(
            concat!("mov {prev_lo}, qword ptr [{src", ptr_modifier!(), "}]"),
            concat!("mov {prev_hi}, qword ptr [{src", ptr_modifier!(), "} + 8]"),
            src = in(reg) src,
            prev_lo = out(reg) prev_lo,
            prev_hi = out(reg) prev_hi,
            options(nostack, preserves_flags, readonly),
        );
        U128 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

// VMOVDQA is atomic on Intel and AMD CPUs with AVX.
// See https://gcc.gnu.org/bugzilla//show_bug.cgi?id=104688 for details.
//
// Refs: https://www.felixcloutier.com/x86/movdqa:vmovdqa32:vmovdqa64
//
// Do not use vector registers on targets such as x86_64-unknown-none unless SSE is explicitly enabled.
// https://doc.rust-lang.org/nightly/rustc/platform-support/x86_64-unknown-none.html
#[cfg(target_feature = "sse")]
#[target_feature(enable = "avx")]
#[inline]
unsafe fn _atomic_load_vmovdqa(src: *mut u128, _order: Ordering) -> u128 {
    debug_assert!(src as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `_atomic_load_vmovdqa`.
    unsafe {
        let out: core::arch::x86_64::__m128;
        asm!(
            concat!("vmovdqa {out}, xmmword ptr [{src", ptr_modifier!(), "}]"),
            src = in(reg) src,
            out = out(xmm_reg) out,
            options(nostack, preserves_flags),
        );
        core::mem::transmute(out)
    }
}
#[cfg(target_feature = "sse")]
#[target_feature(enable = "avx")]
#[inline]
unsafe fn _atomic_store_vmovdqa(dst: *mut u128, val: u128, order: Ordering) {
    debug_assert!(dst as usize % 16 == 0);

    // SAFETY: the caller must uphold the safety contract for `_atomic_store_vmovdqa`.
    unsafe {
        let val: core::arch::x86_64::__m128 = core::mem::transmute(val);
        match order {
            Ordering::Relaxed | Ordering::Release => {
                asm!(
                    concat!("vmovdqa xmmword ptr [{dst", ptr_modifier!(), "}], {val}"),
                    dst = in(reg) dst,
                    val = in(xmm_reg) val,
                    options(nostack, preserves_flags),
                );
            }
            Ordering::SeqCst => {
                asm!(
                    concat!("vmovdqa xmmword ptr [{dst", ptr_modifier!(), "}], {val}"),
                    "mfence",
                    dst = in(reg) dst,
                    val = in(xmm_reg) val,
                    options(nostack, preserves_flags),
                );
            }
            // If the function is not inlined, the compiler fails to remove panic: https://godbolt.org/z/M5s3fj46o
            _ => unreachable_unchecked!("{:?}", order),
        }
    }
}

#[inline]
unsafe fn atomic_load(src: *mut u128, order: Ordering) -> u128 {
    #[inline]
    unsafe fn _atomic_load_cmpxchg16b(src: *mut u128, order: Ordering) -> u128 {
        let fail_order = crate::utils::strongest_failure_ordering(order);
        // SAFETY: the caller must uphold the safety contract for `_atomic_load_cmpxchg16b`.
        unsafe { cmpxchg16b(src, 0, 0, order, fail_order).0 }
    }

    #[deny(unreachable_patterns)]
    match () {
        // Do not use vector registers on targets such as x86_64-unknown-none unless SSE is explicitly enabled.
        // https://doc.rust-lang.org/nightly/rustc/platform-support/x86_64-unknown-none.html
        // Miri and Sanitizer do not support inline assembly.
        #[cfg(any(
            not(feature = "outline-atomics"),
            not(target_feature = "sse"),
            miri,
            portable_atomic_sanitize_thread
        ))]
        // SAFETY: the caller must uphold the safety contract for `atomic_load`.
        () => unsafe { _atomic_load_cmpxchg16b(src, order) },
        #[cfg(not(any(
            not(feature = "outline-atomics"),
            not(target_feature = "sse"),
            miri,
            portable_atomic_sanitize_thread
        )))]
        // SAFETY: the caller must uphold the safety contract for `atomic_load`.
        () => unsafe {
            ifunc!(unsafe fn(src: *mut u128, order: Ordering) -> u128;
            {
                // Check CMPXCHG16B anyway to prevent mixing atomic and non-atomic access.
                let cpuid = detect::cpuid();
                if cpuid.has_cmpxchg16b() && cpuid.has_vmovdqa_atomic() {
                    _atomic_load_vmovdqa
                } else {
                    _atomic_load_cmpxchg16b
                }
            })
        },
    }
}

#[inline]
unsafe fn atomic_store(dst: *mut u128, val: u128, order: Ordering) {
    #[inline]
    unsafe fn _atomic_store_cmpxchg16b(dst: *mut u128, val: u128, order: Ordering) {
        // SAFETY: the caller must uphold the safety contract for `_atomic_store_cmpxchg16b`.
        unsafe {
            atomic_swap(dst, val, order);
        }
    }

    #[deny(unreachable_patterns)]
    match () {
        // Do not use vector registers on targets such as x86_64-unknown-none unless SSE is explicitly enabled.
        // https://doc.rust-lang.org/nightly/rustc/platform-support/x86_64-unknown-none.html
        // Miri and Sanitizer do not support inline assembly.
        #[cfg(any(
            not(feature = "outline-atomics"),
            not(target_feature = "sse"),
            miri,
            portable_atomic_sanitize_thread
        ))]
        // SAFETY: the caller must uphold the safety contract for `atomic_store`.
        () => unsafe { _atomic_store_cmpxchg16b(dst, val, order) },
        #[cfg(not(any(
            not(feature = "outline-atomics"),
            not(target_feature = "sse"),
            miri,
            portable_atomic_sanitize_thread
        )))]
        // SAFETY: the caller must uphold the safety contract for `atomic_store`.
        () => unsafe {
            ifunc!(unsafe fn(dst: *mut u128, val: u128, order: Ordering);
            {
                // Check CMPXCHG16B anyway to prevent mixing atomic and non-atomic access.
                let cpuid = detect::cpuid();
                if cpuid.has_cmpxchg16b() && cpuid.has_vmovdqa_atomic() {
                    _atomic_store_vmovdqa
                } else {
                    _atomic_store_cmpxchg16b
                }
            });
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
    // SAFETY: the caller must uphold the safety contract for `atomic_compare_exchange`.
    let (res, ok) = unsafe { cmpxchg16b(dst, old, new, success, failure) };
    if ok {
        Ok(res)
    } else {
        Err(res)
    }
}

use atomic_compare_exchange as atomic_compare_exchange_weak;

#[inline]
unsafe fn atomic_update<F>(dst: *mut u128, order: Ordering, mut f: F) -> u128
where
    F: FnMut(u128) -> u128,
{
    let failure = crate::utils::strongest_failure_ordering(order);
    // SAFETY: the caller must uphold the safety contract for `atomic_update`.
    unsafe {
        // This is based on the code generated for the first load in DW RMWs by LLVM,
        // but it is interesting that they generate code that does mixed-sized atomic access.
        //
        // This is not single-copy atomic reads, but this is ok because subsequent
        // CAS will check for consistency.
        //
        // byte_wise_atomic_load works the same way as seqlock's byte-wise atomic memcpy,
        // so it works well even when CAS calls global lock-based fallback.
        //
        // Note that the C++20 memory model does not allow mixed-sized atomic access,
        // so we must use inline assembly to implement this. (i.e., byte-wise atomic
        // based on standard library's atomic types cannot be used here).
        // Since fallback's byte-wise atomic memcpy is per 64-bit on x86_64,
        // it's okay to use it together with this.
        let mut old = byte_wise_atomic_load(dst);
        loop {
            let next = f(old);
            match atomic_compare_exchange_weak(dst, old, next, order, failure) {
                Ok(x) => return x,
                Err(x) => old = x,
            }
        }
    }
}

#[inline]
unsafe fn atomic_swap(dst: *mut u128, val: u128, order: Ordering) -> u128 {
    // SAFETY: the caller must uphold the safety contract for `atomic_swap`.
    unsafe { atomic_update(dst, order, |_| val) }
}

#[inline]
fn is_lock_free() -> bool {
    detect::has_cmpxchg16b()
}
#[inline]
const fn is_always_lock_free() -> bool {
    cfg!(any(target_feature = "cmpxchg16b", portable_atomic_target_feature = "cmpxchg16b",))
}

atomic128!(AtomicI128, i128);
atomic128!(AtomicU128, u128);

#[allow(clippy::undocumented_unsafe_blocks, clippy::wildcard_imports)]
#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_int!(i128);
    test_atomic_int!(u128);

    #[test]
    #[cfg_attr(miri, ignore)] // Miri doesn't support inline assembly
    fn test() {
        assert!(std::is_x86_feature_detected!("cmpxchg16b"));
        assert!(AtomicI128::is_lock_free());
        assert!(AtomicU128::is_lock_free());
    }

    #[cfg(any(target_feature = "cmpxchg16b", portable_atomic_target_feature = "cmpxchg16b"))]
    mod quickcheck {
        use core::cell::UnsafeCell;

        use super::super::*;
        use crate::tests::helper::Align16;

        ::quickcheck::quickcheck! {
            #[cfg_attr(miri, ignore)] // Miri doesn't support inline assembly
            #[cfg_attr(portable_atomic_sanitize_thread, ignore)] // TSan doesn't know the semantics of the asm synchronization instructions.
            fn test(x: u128, y: u128, z: u128) -> bool {
                assert!(std::is_x86_feature_detected!("cmpxchg16b"));
                unsafe {
                    let a = Align16(UnsafeCell::new(x));
                    let (res, ok) = __cmpxchg16b(a.get(), y, z);
                    if x == y {
                        assert!(ok);
                        assert_eq!(res, x);
                        assert_eq!(*a.get(), z);
                    } else {
                        assert!(!ok);
                        assert_eq!(res, x);
                        assert_eq!(*a.get(), x);
                    }

                    #[cfg(portable_atomic_nightly)]
                    let b = Align16(UnsafeCell::new(x));
                    #[cfg(portable_atomic_nightly)]
                    assert_eq!(
                        res,
                        core::arch::x86_64::cmpxchg16b(
                            b.get(),
                            y,
                            z,
                            Ordering::SeqCst,
                            Ordering::SeqCst,
                        ),
                    );
                    #[cfg(portable_atomic_nightly)]
                    assert_eq!(*a.get(), *b.get());
                }
                true
            }
        }
    }
}

#[allow(clippy::undocumented_unsafe_blocks, clippy::wildcard_imports)]
#[cfg(test)]
mod tests_no_cmpxchg16b {
    use super::*;

    #[inline(never)]
    unsafe fn cmpxchg16b(
        dst: *mut u128,
        old: u128,
        new: u128,
        success: Ordering,
        failure: Ordering,
    ) -> (u128, bool) {
        #[allow(clippy::cast_ptr_alignment)]
        unsafe {
            match (*(dst as *const super::super::fallback::AtomicU128))
                .compare_exchange(old, new, success, failure)
            {
                Ok(v) => (v, true),
                Err(v) => (v, false),
            }
        }
    }
    #[inline]
    unsafe fn byte_wise_atomic_load(src: *mut u128) -> u128 {
        debug_assert!(src as usize % 16 == 0);

        // Miri and Sanitizer do not support inline assembly.
        #[cfg(any(miri, portable_atomic_sanitize_thread))]
        unsafe {
            atomic_load(src, Ordering::Relaxed)
        }
        #[cfg(not(any(miri, portable_atomic_sanitize_thread)))]
        unsafe {
            super::byte_wise_atomic_load(src)
        }
    }

    #[inline(never)]
    unsafe fn atomic_load(src: *mut u128, order: Ordering) -> u128 {
        let fail_order = crate::utils::strongest_failure_ordering(order);
        unsafe { cmpxchg16b(src, 0, 0, order, fail_order).0 }
    }

    #[inline(never)]
    unsafe fn atomic_store(dst: *mut u128, val: u128, order: Ordering) {
        unsafe {
            atomic_swap(dst, val, order);
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
        let (res, ok) = unsafe { cmpxchg16b(dst, old, new, success, failure) };
        if ok {
            Ok(res)
        } else {
            Err(res)
        }
    }

    use atomic_compare_exchange as atomic_compare_exchange_weak;

    #[inline]
    unsafe fn atomic_update<F>(dst: *mut u128, order: Ordering, mut f: F) -> u128
    where
        F: FnMut(u128) -> u128,
    {
        let failure = crate::utils::strongest_failure_ordering(order);
        unsafe {
            let mut old = byte_wise_atomic_load(dst);
            loop {
                let next = f(old);
                match atomic_compare_exchange_weak(dst, old, next, order, failure) {
                    Ok(x) => return x,
                    Err(x) => old = x,
                }
            }
        }
    }

    #[inline]
    unsafe fn atomic_swap(dst: *mut u128, val: u128, order: Ordering) -> u128 {
        unsafe { atomic_update(dst, order, |_| val) }
    }

    #[inline]
    const fn is_always_lock_free() -> bool {
        false
    }
    use is_always_lock_free as is_lock_free;

    atomic128!(AtomicI128, i128);
    atomic128!(AtomicU128, u128);

    test_atomic_int!(i128);
    test_atomic_int!(u128);
}
