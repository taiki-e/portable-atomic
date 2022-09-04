// Adapted from https://github.com/rust-embedded/cortex-m.

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;

pub(super) use core::sync::atomic;

#[derive(Clone, Copy)]
pub(super) struct WasEnabled(bool);

/// Disables interrupts and returns the previous interrupt state.
#[inline]
pub(super) fn disable() -> WasEnabled {
    let r: u32;
    // SAFETY: reading the priority mask register and disabling interrupts are safe.
    // (see module-level comments of interrupt/mod.rs on the safety of using privileged instructions)
    unsafe {
        // Do not use `nomem` and `readonly` because prevent subsequent memory accesses from being reordered before interrupts are disabled.
        asm!(
            "mrs {0}, PRIMASK",
            "cpsid i",
            out(reg) r,
            options(nostack, preserves_flags),
        );
    }
    WasEnabled(r & 0x1 == 0)
}

/// Restores the previous interrupt state.
#[inline]
pub(super) unsafe fn restore(WasEnabled(was_enabled): WasEnabled) {
    if was_enabled {
        // SAFETY: the caller must guarantee that the state was retrieved by the previous `disable`,
        // and we've checked that interrupts were enabled before disabling interrupts.
        unsafe {
            // Do not use `nomem` and `readonly` because prevent preceding memory accesses from being reordered after interrupts are enabled.
            asm!("cpsie i", options(nostack, preserves_flags));
        }
    }
}
