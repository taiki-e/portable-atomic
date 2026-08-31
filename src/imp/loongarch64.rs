// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
Atomic operations implementation on LoongArch64.

This module provides atomic operations not supported by LLVM or optimizes
cases where LLVM code generation is not optimal.

Note: On Miri and ThreadSanitizer which do not support inline assembly, we don't use
this module and use core::sync::atomic instead.

Refs:
- LoongArch Reference Manual - Volume 1: Basic Architecture
  https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html
- atomic-maybe-uninit https://github.com/taiki-e/atomic-maybe-uninit

See tests/asm-test/asm/portable-atomic for generated assembly.
*/

#[cfg(any(target_feature = "lam-bh", portable_atomic_target_feature = "lam-bh"))]
cfg_core_atomic!({
    use core::sync::atomic::Ordering;

    use crate::imp::core_atomic::AtomicU8;

    // For AtomicBool
    impl AtomicU8 {
        // LLVM generates amor*.w after aligned pointer for fetch_add(0), instead of amadd*.b.
        #[inline]
        pub(crate) fn fetch_nop(&self, order: Ordering) -> crate::utils::RegSize {
            let dst = self.as_ptr();
            // SAFETY: any data races are prevented by atomic intrinsics and the raw
            // pointer passed in is valid because we got it from a reference.
            // cfg guarantee that the CPU supports LAM_BH.
            unsafe {
                let out: crate::utils::RegSize;
                macro_rules! add {
                    ($db:tt) => {
                        __asm!(
                            concat!("amadd", $db, ".b {out}, $zero, {dst}"), // atomic { _x = *dst; *dst += 0; out = sign_extend(_x) }
                            dst = in(reg) ptr_reg!(dst),
                            out = out(reg) out,
                            options(nostack, preserves_flags),
                        )
                    };
                }
                match order {
                    Ordering::Relaxed => add!(""),
                    // AM*_DB has SeqCst semantics.
                    _ => add!("_db"),
                }
                out
            }
        }
    }
});
