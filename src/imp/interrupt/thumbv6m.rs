// Adapted from https://github.com/rust-embedded/cortex-m.

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::sync::atomic::{compiler_fence, Ordering};

#[inline]
pub(super) fn is_enabled() -> bool {
    let r: u32;
    unsafe {
        asm!("mrs {}, PRIMASK", out(reg) r, options(nomem, nostack, preserves_flags));
    }
    r & (1 << 0) == 0
}

#[inline]
pub(super) fn disable() {
    unsafe {
        asm!("cpsid i", options(nomem, nostack, preserves_flags));
    }

    // Ensure no subsequent memory accesses are reordered to before interrupts are disabled.
    // https://github.com/rust-embedded/cortex-m/pull/264
    compiler_fence(Ordering::SeqCst);
}

#[inline]
pub(super) unsafe fn enable() {
    // Ensure no preceding memory accesses are reordered to after interrupts are enabled.
    // https://github.com/rust-embedded/cortex-m/pull/264
    compiler_fence(Ordering::SeqCst);

    unsafe {
        asm!("cpsie i", options(nomem, nostack, preserves_flags));
    }
}
