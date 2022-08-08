// Adapted from https://github.com/rust-embedded/cortex-m.

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;

#[inline]
pub(super) fn is_enabled() -> bool {
    let r: u32;
    // SAFETY: reading the priority mask register is safe.
    unsafe {
        asm!("mrs {}, PRIMASK", out(reg) r, options(nomem, nostack, preserves_flags));
    }
    r & (1 << 0) == 0
}

#[inline]
pub(super) fn disable() {
    // SAFETY: disabling interrupts is safe.
    unsafe {
        // Do not use `nomem` and `readonly` because prevent subsequent memory accesses from being reordered before interrupts are disabled.
        asm!("cpsid i", options(nostack, preserves_flags));
    }
}

#[inline]
pub(super) unsafe fn enable() {
    // SAFETY: the caller must guarantee that interrupts were enabled before disabling interrupts by `disable`.
    unsafe {
        // Do not use `nomem` and `readonly` because prevent preceding memory accesses from being reordered after interrupts are enabled.
        asm!("cpsie i", options(nostack, preserves_flags));
    }
}
