// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
64-bit atomic implementation on pre-v7 Arm Linux/Android.

- pre-v6: kuser_cmpxchg64
- v6+: ldrexd/strexd
- v7+ with LPAE: ldrd/strd

QEMU_CPU=arm926      # v5te
QEMU_CPU=arm1026     # v5te
QEMU_CPU=arm11mpcore # v6
QEMU_CPU=cortex-a9   # v7 wo lpae
QEMU_CPU=cortex-a15  # v7 w lpae
# no QEMU_CPU        # v8 w lpae

Refs:
- https://github.com/torvalds/linux/blob/v6.11/Documentation/arch/arm/kernel_user_helpers.rst
- https://github.com/rust-lang/compiler-builtins/blob/compiler_builtins-v0.1.124/src/arm_linux.rs

Note: On Miri and ThreadSanitizer which do not support inline assembly, we don't use
this module and use core::sync::atomic or fallback implementation instead.
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
//#[cfg(any(test, portable_atomic_outline_atomics))] // TODO(powerpc64): currently disabled by default
#[cfg(any(
    all(
        target_os = "linux",
        any(
            target_env = "gnu",
            all(any(target_env = "musl", target_env = "ohos"), not(target_feature = "crt-static")),
            portable_atomic_outline_atomics,
        ),
    ),
    target_os = "android",
    target_os = "freebsd",
    all(target_os = "openbsd", portable_atomic_outline_atomics),
))]
#[path = "../detect/auxv.rs"]
mod detect;

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::{mem, sync::atomic::Ordering};

use crate::utils::{Pair, U64};

#[cfg(not(any(target_feature = "mclass", atomic_maybe_uninit_target_feature = "mclass")))]
macro_rules! dmb_ish {
    () => {
        "dmb ish"
    };
}
// Only a full system barrier exists in the M-class architectures.
#[cfg(any(target_feature = "mclass", atomic_maybe_uninit_target_feature = "mclass"))]
macro_rules! dmb_ish {
    () => {
        "dmb sy"
    };
}
// Armv6 does not support `dmb`, so use use special instruction equivalent to a DMB.
//
// Refs:
// - https://reviews.llvm.org/D5386
// - https://developer.arm.com/documentation/ddi0360/f/control-coprocessor-cp15/register-descriptions/c7--cache-operations-register
macro_rules! dmb_cp15 {
    () => {
        "mcr p15, #0, {zero}, c7, c10, #5"
    };
}

#[inline]
unsafe fn atomic_load(src: *mut u64, order: Ordering) -> u64 {
    fn_alias! {
        // inline(never) is just a hint and also not strictly necessary
        // because we use ifunc helper macro, but used for clarity.
        #[inline(never)]
        unsafe fn(src: *mut u64) -> u64;
        atomic_load_lpae_relaxed = atomic_load_lpae(Ordering::Relaxed);
        atomic_load_lpae_acquire = atomic_load_lpae(Ordering::Acquire);
        atomic_load_v7_relaxed = atomic_load_v7(Ordering::Relaxed);
        atomic_load_v7_acquire = atomic_load_v7(Ordering::Acquire);
        atomic_load_v6_relaxed = atomic_load_v6(Ordering::Relaxed);
        atomic_load_v6_acquire = atomic_load_v6(Ordering::Acquire);
        atomic_load_kuser_cmpxchg64 = atomic_update_kuser_cmpxchg64(|old| old);
    }
    // SAFETY: the caller must uphold the safety contract.
    // and we've checked if LPAE/v7/v6/kuser_cmpxchg64 is available.
    unsafe {
        match order {
            Ordering::Relaxed => {
                ifunc!(unsafe fn(src: *mut u64) -> u64 {
                    let cpuinfo = detect::detect();
                    // TODO: QEMU doesn't support LPAE
                    // if cpuinfo.has_lpae() {
                    //     atomic_load_lpae_relaxed
                    // } else
                    if cpuinfo.has_v7() {
                        atomic_load_v7_relaxed
                    }  else if cpuinfo.has_v6() {
                        atomic_load_v6_relaxed
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
                    // TODO: QEMU doesn't support LPAE
                    // if cpuinfo.has_lpae() {
                    //     // Acquire and SeqCst loads are equivalent.
                    //     atomic_load_lpae_acquire
                    // } else
                    if cpuinfo.has_v7() {
                        // Acquire and SeqCst loads are equivalent.
                        atomic_load_v7_acquire
                    }  else if cpuinfo.has_v6() {
                        // Acquire and SeqCst loads are equivalent.
                        atomic_load_v6_acquire
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
unsafe fn atomic_load_lpae(src: *mut u64, order: Ordering) -> u64 {
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        let (prev_lo, prev_hi);
        macro_rules! atomic_load {
            ($acquire:expr) => {
                asm!(
                    ".arch armv7-a",
                    "ldrd r0, r1, [{src}]",
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
#[inline]
unsafe fn atomic_load_v7(src: *mut u64, order: Ordering) -> u64 {
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
#[inline]
unsafe fn atomic_load_v6(src: *mut u64, order: Ordering) -> u64 {
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        let (prev_lo, prev_hi);
        match order {
            Ordering::Relaxed => {
                asm!(
                    ".arch armv6t2",
                    "ldrexd r0, r1, [{src}]",
                    src = in(reg) src,
                    // prev pair - must be even-numbered and not R14
                    lateout("r0") prev_lo,
                    lateout("r1") prev_hi,
                    options(nostack, preserves_flags),
                );
            }
            // Acquire and SeqCst loads are equivalent.
            Ordering::Acquire | Ordering::SeqCst => {
                asm!(
                    ".arch armv6t2",
                    "ldrexd r0, r1, [{src}]",
                    dmb_cp15!(),
                    src = in(reg) src,
                    // the value in the Rd register should be zero (SBZ).
                    zero = inout(reg) 0_u32 => _,
                    // prev pair - must be even-numbered and not R14
                    lateout("r0") prev_lo,
                    lateout("r1") prev_hi,
                    options(nostack, preserves_flags),
                );
            }
            _ => unreachable!(),
        }
        U64 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

#[inline]
unsafe fn atomic_store(dst: *mut u64, val: u64, order: Ordering) {
    fn_alias! {
        // inline(never) is just a hint and also not strictly necessary
        // because we use ifunc helper macro, but used for clarity.
        #[inline(never)]
        unsafe fn(dst: *mut u64, val: u64);
        atomic_store_lpae_relaxed = atomic_store_lpae(Ordering::Relaxed);
        atomic_store_lpae_release = atomic_store_lpae(Ordering::Release);
        atomic_store_lpae_seqcst = atomic_store_lpae(Ordering::SeqCst);
        atomic_store_v7_relaxed = atomic_store_v7(Ordering::Relaxed);
        atomic_store_v7_release = atomic_store_v7(Ordering::Release);
        atomic_store_v7_seqcst = atomic_store_v7(Ordering::SeqCst);
        atomic_store_v6_relaxed = atomic_store_v6(Ordering::Relaxed);
        atomic_store_v6_release = atomic_store_v6(Ordering::Release);
        atomic_store_v6_seqcst = atomic_store_v6(Ordering::SeqCst);
    }
    #[inline(never)]
    unsafe fn atomic_store_kuser_cmpxchg64(dst: *mut u64, val: u64) {
        // SAFETY: the caller must uphold the safety contract.
        unsafe {
            atomic_update_kuser_cmpxchg64(dst, |_| val);
        }
    }
    // SAFETY: the caller must uphold the safety contract.
    // and we've checked if LPAE/v7/v6/kuser_cmpxchg64 is available.
    unsafe {
        match order {
            Ordering::Relaxed => {
                ifunc!(unsafe fn(dst: *mut u64, val: u64) {
                    let cpuinfo = detect::detect();
                    // TODO: QEMU doesn't support LPAE
                    // if cpuinfo.has_lpae() {
                    //     atomic_store_lpae_relaxed
                    // } else
                    if cpuinfo.has_v7() {
                        atomic_store_v7_relaxed
                    }  else if cpuinfo.has_v6() {
                        atomic_store_v6_relaxed
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
                    // TODO: QEMU doesn't support LPAE
                    // if cpuinfo.has_lpae() {
                    //     atomic_store_lpae_release
                    // } else
                    if cpuinfo.has_v7() {
                        atomic_store_v7_release
                    }  else if cpuinfo.has_v6() {
                        atomic_store_v6_release
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
                    // TODO: QEMU doesn't support LPAE
                    // if cpuinfo.has_lpae() {
                    //     atomic_store_lpae_seqcst
                    // } else
                    if cpuinfo.has_v7() {
                        atomic_store_v7_seqcst
                    }  else if cpuinfo.has_v6() {
                        atomic_store_v6_seqcst
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
unsafe fn atomic_store_lpae(dst: *mut u64, val: u64, order: Ordering) {
    let val = U64 { whole: val };
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        macro_rules! atomic_store {
            ($acquire:expr, $release:expr) => {
                asm!(
                    ".arch armv7-a",
                    $release, // release fence
                    "strd r2, r3, [{dst}]",
                    $acquire, // acquire fence
                    dst = in(reg) dst,
                    // val pair - must be even-numbered and not R14
                    in("r2") val.pair.lo,
                    in("r3") val.pair.hi,
                    options(nostack, preserves_flags),
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
unsafe fn atomic_store_v7(dst: *mut u64, val: u64, order: Ordering) {
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
unsafe fn atomic_store_v6(dst: *mut u64, val: u64, order: Ordering) {
    let val = U64 { whole: val };
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        macro_rules! atomic_store_release {
            ($acquire:expr) => {
                asm!(
                    ".arch armv6t2",
                    dmb_cp15!(), // release fence
                    "2:",
                        "ldrexd r4, r5, [{dst}]",
                        "strexd r4, r2, r3, [{dst}]",
                        // 0 if the store was successful, 1 if no store was performed
                        "cmp r4, #0",
                        "bne 2b",
                    $acquire, // acquire fence
                    dst = in(reg) dst,
                    // the value in the Rd register should be zero (SBZ).
                    zero = inout(reg) 0_u32 => _,
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
            Ordering::Relaxed => {
                asm!(
                    ".arch armv6t2",
                    "2:",
                        "ldrexd r4, r5, [{dst}]",
                        "strexd r4, r2, r3, [{dst}]",
                        // 0 if the store was successful, 1 if no store was performed
                        "cmp r4, #0",
                        "bne 2b",
                    dst = in(reg) dst,
                    // val pair - must be even-numbered and not R14
                    inout("r2") val.pair.lo => _,
                    inout("r3") val.pair.hi => _,
                    // tmp pair - must be even-numbered and not R14
                    out("r4") _,
                    out("r5") _,
                    // Do not use `preserves_flags` because CMP modifies the condition flags.
                    options(nostack),
                );
            }
            Ordering::Release => atomic_store_release!(""),
            Ordering::SeqCst => atomic_store_release!(dmb_cp15!()),
            _ => unreachable!(),
        }
    }
}

// https://github.com/torvalds/linux/blob/v6.11/Documentation/arch/arm/kernel_user_helpers.rst
const KUSER_HELPER_VERSION: usize = 0xFFFF0FFC;
// __kuser_helper_version >= 3 (kernel version 2.6.15+)
const KUSER_MEMORY_BARRIER: usize = 0xFFFF0FA0;
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
    v = unsafe { (KUSER_HELPER_VERSION as *const i32).read() };
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
            mem::transmute(KUSER_CMPXCHG64 as *const ());
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

macro_rules! atomic_with_ifunc {
    (
        unsafe fn $name:ident($($arg:tt)*) $(-> $ret_ty:ty)? { $($kuser_cmpxchg64_fn_body:tt)* }
        fallback = $seqcst_fallback_fn:ident
    ) => {
        #[inline]
        unsafe fn $name($($arg)*, _: Ordering) $(-> $ret_ty)? {
            unsafe fn kuser_cmpxchg64_fn($($arg)*) $(-> $ret_ty)? {
                $($kuser_cmpxchg64_fn_body)*
            }
            // SAFETY: the caller must uphold the safety contract.
            // we only calls __kuser_cmpxchg64 if it is available.
            unsafe {
                ifunc!(unsafe fn($($arg)*) $(-> $ret_ty)? {
                    if has_kuser_cmpxchg64() {
                        kuser_cmpxchg64_fn
                    } else {
                        // Use SeqCst because __kuser_cmpxchg64 is always SeqCst.
                        // https://github.com/torvalds/linux/blob/v6.11/arch/arm/kernel/entry-armv.S#L692-L699
                        fallback::$seqcst_fallback_fn
                    }
                })
            }
        }
    };
}

// TODO
atomic_with_ifunc! {
    unsafe fn atomic_swap(dst: *mut u64, val: u64) -> u64 {
        // SAFETY: the caller must uphold the safety contract.
        unsafe { atomic_update_kuser_cmpxchg64(dst, |_| val) }
    }
    fallback = atomic_swap_seqcst
}
#[inline]
unsafe fn atomic_compare_exchange(
    dst: *mut u64,
    old: u64,
    new: u64,
    _: Ordering,
    _: Ordering,
) -> Result<u64, u64> {
    unsafe fn kuser_cmpxchg64_fn(dst: *mut u64, old: u64, new: u64) -> (u64, bool) {
        // SAFETY: the caller must uphold the safety contract.
        let prev =
            unsafe { atomic_update_kuser_cmpxchg64(dst, |v| if v == old { new } else { v }) };
        (prev, prev == old)
    }
    // SAFETY: the caller must uphold the safety contract.
    // we only calls __kuser_cmpxchg64 if it is available.
    let (prev, ok) = unsafe {
        ifunc!(unsafe fn(dst: *mut u64, old: u64, new: u64) -> (u64, bool) {
            if has_kuser_cmpxchg64() {
                kuser_cmpxchg64_fn
            } else {
                // Use SeqCst because __kuser_cmpxchg64 is always SeqCst.
                // https://github.com/torvalds/linux/blob/v6.11/arch/arm/kernel/entry-armv.S#L692-L699
                fallback::atomic_compare_exchange_seqcst
            }
        })
    };
    if ok {
        Ok(prev)
    } else {
        Err(prev)
    }
}
use self::atomic_compare_exchange as atomic_compare_exchange_weak;
atomic_with_ifunc! {
    unsafe fn atomic_add(dst: *mut u64, val: u64) -> u64 {
        // SAFETY: the caller must uphold the safety contract.
        unsafe { atomic_update_kuser_cmpxchg64(dst, |x| x.wrapping_add(val)) }
    }
    fallback = atomic_add_seqcst
}
atomic_with_ifunc! {
    unsafe fn atomic_sub(dst: *mut u64, val: u64) -> u64 {
        // SAFETY: the caller must uphold the safety contract.
        unsafe { atomic_update_kuser_cmpxchg64(dst, |x| x.wrapping_sub(val)) }
    }
    fallback = atomic_sub_seqcst
}
atomic_with_ifunc! {
    unsafe fn atomic_and(dst: *mut u64, val: u64) -> u64 {
        // SAFETY: the caller must uphold the safety contract.
        unsafe { atomic_update_kuser_cmpxchg64(dst, |x| x & val) }
    }
    fallback = atomic_and_seqcst
}
atomic_with_ifunc! {
    unsafe fn atomic_nand(dst: *mut u64, val: u64) -> u64 {
        // SAFETY: the caller must uphold the safety contract.
        unsafe { atomic_update_kuser_cmpxchg64(dst, |x| !(x & val)) }
    }
    fallback = atomic_nand_seqcst
}
atomic_with_ifunc! {
    unsafe fn atomic_or(dst: *mut u64, val: u64) -> u64 {
        // SAFETY: the caller must uphold the safety contract.
        unsafe { atomic_update_kuser_cmpxchg64(dst, |x| x | val) }
    }
    fallback = atomic_or_seqcst
}
atomic_with_ifunc! {
    unsafe fn atomic_xor(dst: *mut u64, val: u64) -> u64 {
        // SAFETY: the caller must uphold the safety contract.
        unsafe { atomic_update_kuser_cmpxchg64(dst, |x| x ^ val) }
    }
    fallback = atomic_xor_seqcst
}
atomic_with_ifunc! {
    unsafe fn atomic_max(dst: *mut u64, val: u64) -> u64 {
        #[allow(clippy::cast_possible_wrap, clippy::cast_sign_loss)]
        // SAFETY: the caller must uphold the safety contract.
        unsafe {
            atomic_update_kuser_cmpxchg64(dst, |x| core::cmp::max(x as i64, val as i64) as u64)
        }
    }
    fallback = atomic_max_seqcst
}
atomic_with_ifunc! {
    unsafe fn atomic_umax(dst: *mut u64, val: u64) -> u64 {
        // SAFETY: the caller must uphold the safety contract.
        unsafe { atomic_update_kuser_cmpxchg64(dst, |x| core::cmp::max(x, val)) }
    }
    fallback = atomic_umax_seqcst
}
atomic_with_ifunc! {
    unsafe fn atomic_min(dst: *mut u64, val: u64) -> u64 {
        #[allow(clippy::cast_possible_wrap, clippy::cast_sign_loss)]
        // SAFETY: the caller must uphold the safety contract.
        unsafe {
            atomic_update_kuser_cmpxchg64(dst, |x| core::cmp::min(x as i64, val as i64) as u64)
        }
    }
    fallback = atomic_min_seqcst
}
atomic_with_ifunc! {
    unsafe fn atomic_umin(dst: *mut u64, val: u64) -> u64 {
        // SAFETY: the caller must uphold the safety contract.
        unsafe { atomic_update_kuser_cmpxchg64(dst, |x| core::cmp::min(x, val)) }
    }
    fallback = atomic_umin_seqcst
}
atomic_with_ifunc! {
    unsafe fn atomic_not(dst: *mut u64) -> u64 {
        // SAFETY: the caller must uphold the safety contract.
        unsafe { atomic_update_kuser_cmpxchg64(dst, |x| !x) }
    }
    fallback = atomic_not_seqcst
}
atomic_with_ifunc! {
    unsafe fn atomic_neg(dst: *mut u64) -> u64 {
        // SAFETY: the caller must uphold the safety contract.
        unsafe { atomic_update_kuser_cmpxchg64(dst, u64::wrapping_neg) }
    }
    fallback = atomic_neg_seqcst
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
        assert_eq!(version, unsafe { (KUSER_HELPER_VERSION as *const i32).read() });
    }

    test_atomic_int!(i64);
    test_atomic_int!(u64);

    // load/store/swap implementation is not affected by signedness, so it is
    // enough to test only unsigned types.
    stress_test!(u64);
}
