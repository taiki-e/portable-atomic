// Adapted from https://github.com/rust-embedded/cortex-m.
//
// Generated asm:
// - armv6-m https://godbolt.org/z/oMjd4h3Tr

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;

pub(super) use core::sync::atomic;

#[derive(Clone, Copy)]
pub(super) struct State(u32);

/// Disables interrupts and returns the previous interrupt state.
#[inline]
pub(super) fn disable() -> State {
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
    State(r)
}

/// Restores the previous interrupt state.
#[inline]
pub(super) unsafe fn restore(State(r): State) {
    if r & 0x1 == 0 {
        // SAFETY: the caller must guarantee that the state was retrieved by the previous `disable`,
        // and we've checked that interrupts were enabled before disabling interrupts.
        unsafe {
            // Do not use `nomem` and `readonly` because prevent preceding memory accesses from being reordered after interrupts are enabled.
            asm!("cpsie i", options(nostack, preserves_flags));
        }
    }
}
