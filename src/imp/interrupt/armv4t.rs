// Refs: https://developer.arm.com/documentation/ddi0406/cb/System-Level-Architecture/The-System-Level-Programmers--Model/ARM-processor-modes-and-ARM-core-registers/Program-Status-Registers--PSRs-?lang=en#CIHJBHJA

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;

#[derive(Clone, Copy)]
pub(super) struct State(u32);

/// Disables interrupts and returns the previous interrupt state.
#[inline]
#[instruction_set(arm::a32)]
pub(super) fn disable() -> State {
    let cpsr: u32;
    // SAFETY: reading CPSR and disabling interrupts are safe.
    // (see module-level comments of interrupt/mod.rs on the safety of using privileged instructions)
    unsafe {
        // Do not use `nomem` and `readonly` because prevent subsequent memory accesses from being reordered before interrupts are disabled.
        asm!(
            "mrs {0}, cpsr",
            // We disable only IRQs. See also https://github.com/taiki-e/portable-atomic/pull/28#issuecomment-1214146912.
            "orr {1}, {0}, 0x80", // I (IRQ mask) bit (1 << 7)
            "msr cpsr_c, {1}",
            out(reg) cpsr,
            out(reg) _,
            options(nostack, preserves_flags),
        );
    }
    State(cpsr)
}

/// Restores the previous interrupt state.
#[inline]
#[instruction_set(arm::a32)]
pub(super) unsafe fn restore(State(prev): State) {
    // SAFETY: the caller must guarantee that the state was retrieved by the previous `disable`,
    unsafe {
        // Do not use `nomem` and `readonly` because prevent preceding memory accesses from being reordered after interrupts are enabled.
        asm!("msr cpsr_c, {0}", in(reg) prev, options(nostack));
    }
}
