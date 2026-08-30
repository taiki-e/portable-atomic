// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
Atomic operations implementation on s390x.

This module provides atomic operations not supported by LLVM or optimizes
cases where LLVM code generation is not optimal.

See "Atomic operation overview by architecture" in atomic-maybe-uninit for a more comprehensive and
detailed description of the atomic and synchronize instructions in this architecture:
https://github.com/taiki-e/atomic-maybe-uninit/blob/HEAD/src/arch/README.md#s390x

Note: On Miri and ThreadSanitizer which do not support inline assembly, we don't use
this module and use CAS loop instead.

Refs:
- z/Architecture Principles of Operation, Fifteenth Edition (SA22-7832-14)
  https://www.ibm.com/docs/en/module_1678991624569/pdf/SA22-7832-14.pdf

See tests/asm-test/asm/portable-atomic for generated assembly.
*/

// https://github.com/llvm/llvm-project/blob/llvmorg-23.1.0/llvm/lib/Target/SystemZ/SystemZISelDAGToDAG.cpp#L1968
// Extracts and checks condition code 0.
#[inline]
pub(crate) fn extract_cc0(r: i64) -> i64 {
    const ADD: i64 = -(1 << 28);
    const MASK: i64 = 1 << 31;
    r.wrapping_add(ADD) & MASK
}
// Extracts and checks condition code 0.
#[inline]
pub(crate) fn extract_cc1(r: i64) -> i64 {
    const XOR: i64 = 1 << 28;
    const ADD: i64 = -(1 << 28);
    const MASK: i64 = 1 << 31;
    (r ^ XOR).wrapping_add(ADD) & MASK
}

#[cfg(not(portable_atomic_no_reg_addr))]
cfg_core_atomic!({
    #[allow(unused_imports)]
    use core::sync::atomic::Ordering;

    #[allow(unused_imports)]
    use super::core_atomic::AtomicU8;

    #[cfg(all(
        not(all(not(portable_atomic_llvm_17_or_later), not(miri))), // Avoid method conflicts.
        any(
            target_feature = "interlocked-access1",
            portable_atomic_target_feature = "interlocked-access1",
        )
    ))]
    items!({
        use super::core_atomic::{AtomicI8, AtomicI16, AtomicU16};
        use crate::utils::ZeroExtend;

        macro_rules! rll {
            ($val:expr, $shift:expr, $offset:expr) => {{
                let val: u32 = $val;
                let shift: u32 = $shift;
                let out;
                // SAFETY: Calling RLL is safe.
                unsafe {
                    __asm!(
                        concat!("rll {out}, {val}, ", stringify!($offset), "({shift})"), // out = val.rotate_left((offset + shift) & 31)
                        out = lateout(reg) out,
                        val = in(reg) val,
                        shift = in(reg_addr) shift,
                        options(pure, nomem, nostack, preserves_flags),
                    );
                }
                out
            }};
        }

        macro_rules! atomic_rmw_la {
            ($op:tt, $dst:ident, $val:ident) => {{
                let val: u32 = $val;
                let out;
                // SAFETY: cfg guarantee that the CPU supports Interlocked-Access Facility 1.
                // The caller of this macro must guarantee the validity of the pointer.
                // LA{N,O,X} has SeqCst semantics.
                __asm!(
                    concat!("la", $op, " {out}, {val}, 0({dst})"), // atomic { _x = *dst; *dst = op(_x, val); out = _x }
                    dst = in(reg_addr) ptr_reg!($dst),
                    val = in(reg) val,
                    out = lateout(reg) out,
                    // Do not use `preserves_flags` because LA{N,O,X} modifies the condition code.
                    options(nostack),
                );
                out
            }};
        }

        macro_rules! atomic_sub_word {
            ($atomic_type:ident, $value_type:ty, $size:literal) => {
                impl $atomic_type {
                    #[inline]
                    pub(crate) fn fetch_and(
                        &self,
                        val: $value_type,
                        _order: Ordering,
                    ) -> $value_type {
                        let dst = self.as_ptr();
                        let (dst, shift, mask) = crate::utils::create_sub_word_mask_values(dst);
                        let shift_c = shift.wrapping_neg();
                        let val = ZeroExtend::zero_extend(val) | !mask;
                        let val = rll!(val, shift_c, 32 - $size * 8);
                        // SAFETY: any data races are prevented by atomic intrinsics and the raw
                        // pointer passed in is valid because we got it from a reference.
                        let out: u32 = unsafe { atomic_rmw_la!("n", dst, val) };
                        rll!(out, shift, $size * 8)
                    }
                    #[inline]
                    pub(crate) fn fetch_or(
                        &self,
                        val: $value_type,
                        _order: Ordering,
                    ) -> $value_type {
                        let dst = self.as_ptr();
                        let (dst, shift, _mask) = crate::utils::create_sub_word_mask_values(dst);
                        let shift_c = shift.wrapping_neg();
                        let val = rll!(ZeroExtend::zero_extend(val), shift_c, 32 - $size * 8);
                        // SAFETY: any data races are prevented by atomic intrinsics and the raw
                        // pointer passed in is valid because we got it from a reference.
                        let out: u32 = unsafe { atomic_rmw_la!("o", dst, val) };
                        rll!(out, shift, $size * 8)
                    }
                    #[inline]
                    pub(crate) fn fetch_xor(
                        &self,
                        val: $value_type,
                        _order: Ordering,
                    ) -> $value_type {
                        let dst = self.as_ptr();
                        let (dst, shift, _mask) = crate::utils::create_sub_word_mask_values(dst);
                        let shift_c = shift.wrapping_neg();
                        let val = rll!(ZeroExtend::zero_extend(val), shift_c, 32 - $size * 8);
                        // SAFETY: any data races are prevented by atomic intrinsics and the raw
                        // pointer passed in is valid because we got it from a reference.
                        let out: u32 = unsafe { atomic_rmw_la!("x", dst, val) };
                        rll!(out, shift, $size * 8)
                    }
                }
            };
        }

        atomic_sub_word!(AtomicI8, i8, 1);
        atomic_sub_word!(AtomicU8, u8, 1);
        atomic_sub_word!(AtomicI16, i16, 2);
        atomic_sub_word!(AtomicU16, u16, 2);
    });

    #[cfg(any(
        target_feature = "interlocked-access2",
        portable_atomic_target_feature = "interlocked-access2",
    ))]
    items!({
        macro_rules! atomic_rmw_i {
            ($op:tt, $dst:ident, $imm:tt) => {
                // SAFETY: cfg guarantee that the CPU supports Interlocked-Access Facility 2.
                // The caller of this macro must guarantee the validity of the pointer.
                // {N,O,X}I has SeqCst semantics.
                __asm!(
                    concat!($op, "i 0({dst}), ", $imm, ""), // atomic { _x = *dst; *dst = op(_x, imm) }
                    dst = in(reg_addr) ptr_reg!($dst),
                    // Do not use `preserves_flags` because {N,O,X}I modifies the condition code.
                    options(nostack),
                )
            };
        }
        macro_rules! atomic_rmw_i_ipm {
            ($op:tt, $dst:ident, $imm:tt) => {{
                let r;
                // SAFETY: cfg guarantee that the CPU supports Interlocked-Access Facility 2.
                // The caller of this macro must guarantee the validity of the pointer.
                // {N,O,X}I has SeqCst semantics.
                __asm!(
                    concat!($op, "i 0({dst}), ", $imm, ""), // atomic { _x = *dst; *dst = op(_x, imm) }
                    "ipm {dst}",                            // dst[32..=39] = [0, cc, pm]
                    // Reuse dst instead of using lateout to work around Valgrind false positive.
                    dst = inout(reg_addr) ptr_reg!($dst) => r,
                    // Do not use `preserves_flags` because {N,O,X}I modifies the condition code.
                    options(nostack),
                );
                r
            }};
        }
        // For AtomicBool
        impl AtomicU8 {
            #[inline]
            pub(crate) fn fetch_xor_bool(&self, val: bool) -> bool {
                let dst = self.as_ptr();
                if val {
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    let r = unsafe { atomic_rmw_i_ipm!("x", dst, "1") };
                    extract_cc0(r) != 0
                } else {
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    let r = unsafe { atomic_rmw_i_ipm!("x", dst, "0") };
                    extract_cc1(r) != 0
                }
            }
            #[inline]
            pub(crate) fn and_bool(&self, val: bool) {
                let dst = self.as_ptr();
                if val {
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe { atomic_rmw_i!("n", dst, "1") }
                } else {
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe { atomic_rmw_i!("n", dst, "0") }
                }
            }
            #[inline]
            pub(crate) fn or_bool(&self, val: bool) {
                let dst = self.as_ptr();
                if val {
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe { atomic_rmw_i!("o", dst, "1") }
                } else {
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe { atomic_rmw_i!("o", dst, "0") }
                }
            }
            #[inline]
            pub(crate) fn xor_bool(&self, val: bool) {
                let dst = self.as_ptr();
                if val {
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe { atomic_rmw_i!("x", dst, "1") }
                } else {
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe { atomic_rmw_i!("x", dst, "0") }
                }
            }
        }
    });
});

#[cfg(not(all(not(portable_atomic_llvm_17_or_later), not(miri))))] // Avoid method conflicts.
#[cfg(any(
    target_feature = "interlocked-access1",
    portable_atomic_target_feature = "interlocked-access1",
))]
#[cfg(test)]
mod tests {
    use super::*;

    // TODO: move to tests/helper.rs
    macro_rules! test_atomic_sub_word {
        ($int_type:ident) => {
            paste::paste! {
                #[allow(
                    clippy::alloc_instead_of_core,
                    clippy::std_instead_of_alloc,
                    clippy::std_instead_of_core,
                    clippy::undocumented_unsafe_blocks
                )]
                mod [<test_atomic_ $int_type _amo>] {
                    use super::*;
                    test_atomic_sub_word!([<Atomic $int_type:camel>], $int_type);
                }
            }
        };
        ($atomic_type:ty, $int_type:ident) => {
            use crate::tests::helper::{self, *};
            ::quickcheck::quickcheck! {
                fn quickcheck_fetch_and(x: $int_type, y: $int_type) -> bool {
                    let mut rng = fastrand::Rng::new();
                    for &order in &helper::SWAP_ORDERINGS {
                        for base in [0, !0] {
                            let mut arr = Align16([
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                            ]);
                            let a_idx = rng.usize(3..=6);
                            arr.0[a_idx] = <$atomic_type>::new(x);
                            let a = &arr.0[a_idx];
                            assert_eq!(a.fetch_and(y, order), x);
                            assert_eq!(a.load(Ordering::Relaxed), x & y);
                            for i in 0..a_idx {
                                assert_eq!(arr.0[i].load(Ordering::Relaxed), base, "invalid value written");
                            }
                            for i in a_idx + 1..arr.0.len() {
                                assert_eq!(arr.0[i].load(Ordering::Relaxed), base, "invalid value written");
                            }
                            arr.0[a_idx] = <$atomic_type>::new(y);
                            let a = &arr.0[a_idx];
                            assert_eq!(a.fetch_and(x, order), y);
                            assert_eq!(a.load(Ordering::Relaxed), y & x);
                            for i in 0..a_idx {
                                assert_eq!(arr.0[i].load(Ordering::Relaxed), base, "invalid value written");
                            }
                            for i in a_idx + 1..arr.0.len() {
                                assert_eq!(arr.0[i].load(Ordering::Relaxed), base, "invalid value written");
                            }
                        }
                    }
                    true
                }
                fn quickcheck_fetch_or(x: $int_type, y: $int_type) -> bool {
                    let mut rng = fastrand::Rng::new();
                    for &order in &helper::SWAP_ORDERINGS {
                        for base in [0, !0] {
                            let mut arr = Align16([
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                            ]);
                            let a_idx = rng.usize(3..=6);
                            arr.0[a_idx] = <$atomic_type>::new(x);
                            let a = &arr.0[a_idx];
                            assert_eq!(a.fetch_or(y, order), x);
                            assert_eq!(a.load(Ordering::Relaxed), x | y);
                            for i in 0..a_idx {
                                assert_eq!(arr.0[i].load(Ordering::Relaxed), base, "invalid value written");
                            }
                            for i in a_idx + 1..arr.0.len() {
                                assert_eq!(arr.0[i].load(Ordering::Relaxed), base, "invalid value written");
                            }
                            arr.0[a_idx] = <$atomic_type>::new(y);
                            let a = &arr.0[a_idx];
                            assert_eq!(a.fetch_or(x, order), y);
                            assert_eq!(a.load(Ordering::Relaxed), y | x);
                            for i in 0..a_idx {
                                assert_eq!(arr.0[i].load(Ordering::Relaxed), base, "invalid value written");
                            }
                            for i in a_idx + 1..arr.0.len() {
                                assert_eq!(arr.0[i].load(Ordering::Relaxed), base, "invalid value written");
                            }
                        }
                    }
                    true
                }
                fn quickcheck_fetch_xor(x: $int_type, y: $int_type) -> bool {
                    let mut rng = fastrand::Rng::new();
                    for &order in &helper::SWAP_ORDERINGS {
                        for base in [0, !0] {
                            let mut arr = Align16([
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                            ]);
                            let a_idx = rng.usize(3..=6);
                            arr.0[a_idx] = <$atomic_type>::new(x);
                            let a = &arr.0[a_idx];
                            assert_eq!(a.fetch_xor(y, order), x);
                            assert_eq!(a.load(Ordering::Relaxed), x ^ y);
                            for i in 0..a_idx {
                                assert_eq!(arr.0[i].load(Ordering::Relaxed), base, "invalid value written");
                            }
                            for i in a_idx + 1..arr.0.len() {
                                assert_eq!(arr.0[i].load(Ordering::Relaxed), base, "invalid value written");
                            }
                            arr.0[a_idx] = <$atomic_type>::new(y);
                            let a = &arr.0[a_idx];
                            assert_eq!(a.fetch_xor(x, order), y);
                            assert_eq!(a.load(Ordering::Relaxed), y ^ x);
                            for i in 0..a_idx {
                                assert_eq!(arr.0[i].load(Ordering::Relaxed), base, "invalid value written");
                            }
                            for i in a_idx + 1..arr.0.len() {
                                assert_eq!(arr.0[i].load(Ordering::Relaxed), base, "invalid value written");
                            }
                        }
                    }
                    true
                }
                fn quickcheck_fetch_not(x: $int_type) -> bool {
                    let mut rng = fastrand::Rng::new();
                    for &order in &helper::SWAP_ORDERINGS {
                        for base in [0, !0] {
                            let mut arr = Align16([
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                                <$atomic_type>::new(base),
                            ]);
                            let a_idx = rng.usize(3..=6);
                            arr.0[a_idx] = <$atomic_type>::new(x);
                            let a = &arr.0[a_idx];
                            assert_eq!(a.fetch_not(order), x);
                            assert_eq!(a.load(Ordering::Relaxed), !x);
                            assert_eq!(a.fetch_not(order), !x);
                            assert_eq!(a.load(Ordering::Relaxed), x);
                            for i in 0..a_idx {
                                assert_eq!(arr.0[i].load(Ordering::Relaxed), base, "invalid value written");
                            }
                            for i in a_idx + 1..arr.0.len() {
                                assert_eq!(arr.0[i].load(Ordering::Relaxed), base, "invalid value written");
                            }
                        }
                    }
                    true
                }
            }
        };
    }
    test_atomic_sub_word!(i8);
    test_atomic_sub_word!(u8);
    test_atomic_sub_word!(i16);
    test_atomic_sub_word!(u16);
}
