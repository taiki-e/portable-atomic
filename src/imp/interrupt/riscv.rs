// Based on asm generated for functions of interrupt module of https://github.com/rust-embedded/riscv.

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;

pub(super) use super::super::riscv as atomic;

#[derive(Clone, Copy)]
pub(super) struct WasEnabled(bool);

/// Disables interrupts and returns the previous interrupt state.
#[inline]
pub(super) fn disable() -> WasEnabled {
    let r: usize;
    // SAFETY: reading mstatus and disabling interrupts is safe.
    // (see module-level comments of interrupt/mod.rs on the safety of using privileged instructions)
    unsafe {
        // Do not use `nomem` and `readonly` because prevent subsequent memory accesses from being reordered before interrupts are disabled.
        asm!(
            "csrr {0}, mstatus",
            "csrci mstatus, 0x8",
            out(reg) r,
            options(nostack, preserves_flags),
        );
    }
    // MIE (Machine Interrupt Enable) bit (1 << 3)
    WasEnabled(r & 0x8 != 0)
}

/// Restores the previous interrupt state.
#[inline]
pub(super) unsafe fn restore(WasEnabled(was_enabled): WasEnabled) {
    if was_enabled {
        // SAFETY: the caller must guarantee that the state was retrieved by the previous `disable`,
        // and we've checked that interrupts were enabled before disabling interrupts.
        unsafe {
            // Do not use `nomem` and `readonly` because prevent preceding memory accesses from being reordered after interrupts are enabled.
            asm!("csrsi mstatus, 0x8", options(nostack, preserves_flags));
        }
    }
}
