// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
64-bit atomic implementation on riscv32 using amocas.d (DWCAS).

Note: On Miri and ThreadSanitizer which do not support inline assembly, we don't use
this module and use fallback implementation instead.

Refs:
- RISC-V Instruction Set Manual
  https://github.com/riscv/riscv-isa-manual/tree/riscv-isa-release-8b9dc50-2024-08-30
  "Zacas" Extension for Atomic Compare-and-Swap (CAS) Instructions
  https://github.com/riscv/riscv-isa-manual/blob/riscv-isa-release-8b9dc50-2024-08-30/src/zacas.adoc
- RISC-V Atomics ABI Specification
  https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/draft-20240829-13bfa9f54634cb60d86b9b333e109f077805b4b3/riscv-atomic.adoc

Generated asm:
- riscv32 (+experimental-zacas) https://godbolt.org/z/d3f6EsG3f
*/

// TODO: merge duplicated code with atomic128/riscv64.rs

include!("macros.rs");

// TODO
// #[cfg(not(any(target_feature = "experimental-zacas", portable_atomic_target_feature = "experimental-zacas")))]
// #[path = "../fallback/outline_atomics.rs"]
// mod fallback;

// On musl with static linking, it seems that libc is not always available.
// See detect/auxv.rs for more.
#[cfg(test)] // TODO
#[cfg(not(portable_atomic_no_outline_atomics))]
#[cfg(any(test, portable_atomic_outline_atomics))] // TODO(riscv): currently disabled by default
#[cfg(any(
    test,
    not(any(
        target_feature = "experimental-zacas",
        portable_atomic_target_feature = "experimental-zacas"
    ))
))]
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
))]
#[path = "../detect/riscv_linux.rs"]
mod detect;

use core::{arch::asm, sync::atomic::Ordering};

use crate::utils::{Pair, U64};

// https://github.com/riscv-non-isa/riscv-asm-manual/blob/ad0de8c004e29c9a7ac33cfd054f4d4f9392f2fb/src/asm-manual.adoc#arch
#[cfg(any(
    target_feature = "experimental-zacas",
    portable_atomic_target_feature = "experimental-zacas"
))]
macro_rules! start_zacas {
    () => {
        // zacas available, no-op
        ""
    };
}
#[cfg(any(
    target_feature = "experimental-zacas",
    portable_atomic_target_feature = "experimental-zacas"
))]
macro_rules! end_zacas {
    () => {
        // zacas available, no-op
        ""
    };
}
#[cfg(not(any(
    target_feature = "experimental-zacas",
    portable_atomic_target_feature = "experimental-zacas"
)))]
macro_rules! start_zacas {
    () => {
        ".option push\n.option arch, +experimental-zacas"
    };
}
#[cfg(not(any(
    target_feature = "experimental-zacas",
    portable_atomic_target_feature = "experimental-zacas"
)))]
macro_rules! end_zacas {
    () => {
        ".option pop"
    };
}

macro_rules! atomic_rmw_amocas_order {
    ($op:ident, $order:ident) => {
        atomic_rmw_amocas_order!($op, $order, failure = $order)
    };
    ($op:ident, $order:ident, failure = $failure:ident) => {
        match $order {
            Ordering::Relaxed => $op!("", ""),
            Ordering::Acquire => $op!("", ".aq"),
            Ordering::Release => $op!("", ".rl"),
            Ordering::AcqRel => $op!("", ".aqrl"),
            Ordering::SeqCst if $failure == Ordering::SeqCst => $op!("fence rw,rw", ".aqrl"),
            Ordering::SeqCst => $op!("", ".aqrl"),
            _ => unreachable!(),
        }
    };
}

#[inline]
unsafe fn atomic_load(src: *mut u64, order: Ordering) -> u64 {
    debug_assert!(src as usize % 8 == 0);

    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        let (out_lo, out_hi);
        macro_rules! load {
            ($fence:tt, $asm_order:tt) => {
                asm!(
                    start_zacas!(),
                    $fence,
                    concat!("amocas.d", $asm_order, " a2, a2, 0({src})"),
                    end_zacas!(),
                    src = in(reg) ptr_reg!(src),
                    inout("a2") 0_u32 => out_lo,
                    inout("a3") 0_u32 => out_hi,
                    options(nostack, preserves_flags),
                )
            };
        }
        atomic_rmw_amocas_order!(load, order);
        U64 { pair: Pair { lo: out_lo, hi: out_hi } }.whole
    }
}

#[inline]
unsafe fn atomic_store(dst: *mut u64, val: u64, order: Ordering) {
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        atomic_swap(dst, val, order);
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
    debug_assert!(dst as usize % 8 == 0);
    let order = crate::utils::upgrade_success_ordering(success, failure);

    // SAFETY: the caller must uphold the safety contract.
    let prev = unsafe {
        let old = U64 { whole: old };
        let new = U64 { whole: new };
        let (prev_lo, prev_hi);
        macro_rules! cmpxchg {
            ($fence:tt, $asm_order:tt) => {
                asm!(
                    start_zacas!(),
                    $fence,
                    concat!("amocas.d", $asm_order, " a4, a2, 0({dst})"),
                    end_zacas!(),
                    dst = in(reg) ptr_reg!(dst),
                    // must be allocated to even/odd register pair
                    inout("a4") old.pair.lo => prev_lo,
                    inout("a5") old.pair.hi => prev_hi,
                    // must be allocated to even/odd register pair
                    in("a2") new.pair.lo,
                    in("a3") new.pair.hi,
                    options(nostack, preserves_flags),
                )
            };
        }
        atomic_rmw_amocas_order!(cmpxchg, order, failure = failure);
        U64 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    };
    if prev == old {
        Ok(prev)
    } else {
        Err(prev)
    }
}

// amocas is always strong.
use atomic_compare_exchange as atomic_compare_exchange_weak;

// 64-bit atomic load by two 32-bit atomic loads. (see arm_linux.rs for more)
#[inline]
unsafe fn byte_wise_atomic_load(src: *const u64) -> u64 {
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        let (out_lo, out_hi);
        asm!(
            "lw {out_lo}, ({src})",
            "lw {out_hi}, 4({src})",
            src = in(reg) ptr_reg!(src),
            out_lo = out(reg) out_lo,
            out_hi = out(reg) out_hi,
            options(pure, nostack, preserves_flags, readonly),
        );
        U64 { pair: Pair { lo: out_lo, hi: out_hi } }.whole
    }
}

#[inline(always)]
unsafe fn atomic_update<F>(dst: *mut u64, order: Ordering, mut f: F) -> u64
where
    F: FnMut(u64) -> u64,
{
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        let mut prev = byte_wise_atomic_load(dst);
        loop {
            let next = f(prev);
            match atomic_compare_exchange_weak(dst, prev, next, order, Ordering::Relaxed) {
                Ok(x) => return x,
                Err(x) => prev = x,
            }
        }
    }
}

atomic_rmw_by_atomic_update!();

#[inline]
fn is_lock_free() -> bool {
    #[cfg(any(
        target_feature = "experimental-zacas",
        portable_atomic_target_feature = "experimental-zacas"
    ))]
    {
        // zacas is available at compile-time.
        true
    }
    #[cfg(not(any(
        target_feature = "experimental-zacas",
        portable_atomic_target_feature = "experimental-zacas"
    )))]
    {
        detect::detect().has_zacas()
    }
}
const IS_ALWAYS_LOCK_FREE: bool = cfg!(any(
    target_feature = "experimental-zacas",
    portable_atomic_target_feature = "experimental-zacas"
));

atomic64!(AtomicI64, i64, atomic_max, atomic_min);
atomic64!(AtomicU64, u64, atomic_umax, atomic_umin);

#[allow(clippy::undocumented_unsafe_blocks, clippy::wildcard_imports)]
#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_int!(i64);
    test_atomic_int!(u64);

    // load/store/swap implementation is not affected by signedness, so it is
    // enough to test only unsigned types.
    stress_test!(u64);
}
