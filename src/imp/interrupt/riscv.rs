// Refs:
// - https://five-embeddev.com/riscv-isa-manual/latest/machine.html#machine-status-registers-mstatus-and-mstatush
// - https://five-embeddev.com/riscv-isa-manual/latest/supervisor.html#sstatus
//
// Generated asm:
// riscv64gc https://godbolt.org/z/757nrWfKd

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;

pub(super) use super::super::riscv as atomic;

// Status register
#[cfg(not(portable_atomic_s_mode))]
macro_rules! status {
    () => {
        "mstatus"
    };
}
#[cfg(portable_atomic_s_mode)]
macro_rules! status {
    () => {
        "sstatus"
    };
}

// MIE (Machine Interrupt Enable) bit (1 << 3)
#[cfg(not(portable_atomic_s_mode))]
const MASK: usize = 0x8;
#[cfg(not(portable_atomic_s_mode))]
macro_rules! mask {
    () => {
        "0x8"
    };
}
// SIE (Supervisor Interrupt Enable) bit (1 << 1)
#[cfg(portable_atomic_s_mode)]
const MASK: usize = 0x2;
#[cfg(portable_atomic_s_mode)]
macro_rules! mask {
    () => {
        "0x2"
    };
}

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
            concat!("csrr {0}, ", status!()),
            concat!("csrci ", status!(), ", ", mask!()),
            out(reg) r,
            options(nostack, preserves_flags),
        );
    }
    WasEnabled(r & MASK != 0)
}

/// Restores the previous interrupt state.
#[inline]
pub(super) unsafe fn restore(WasEnabled(was_enabled): WasEnabled) {
    if was_enabled {
        // SAFETY: the caller must guarantee that the state was retrieved by the previous `disable`,
        // and we've checked that interrupts were enabled before disabling interrupts.
        unsafe {
            // Do not use `nomem` and `readonly` because prevent preceding memory accesses from being reordered after interrupts are enabled.
            asm!(concat!("csrsi ", status!(), ", ", mask!()), options(nostack, preserves_flags));
        }
    }
}
