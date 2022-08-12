// Adapted from https://github.com/Rahix/avr-device.

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;

#[derive(Clone, Copy)]
pub(super) struct WasEnabled(bool);

/// Disables interrupts and returns the previous interrupt state.
#[inline]
pub(super) fn disable() -> WasEnabled {
    let sreg: u8;
    // SAFETY: reading the status register (SREG) and disabling interrupts are safe.
    // (see module-level comments of interrupt/mod.rs on the safety of using privileged instructions)
    unsafe {
        // Do not use `nomem` and `readonly` because prevent subsequent memory accesses from being reordered before interrupts are disabled.
        // Do not use `preserves_flags` because CLI modifies the I bit of the status register (SREG).
        // Refs: https://ww1.microchip.com/downloads/en/DeviceDoc/AVR-InstructionSet-Manual-DS40002198.pdf#page=58
        #[cfg(not(portable_atomic_no_asm))]
        asm!(
            "in {0}, 0x3F",
            "cli",
            out(reg) sreg,
            options(nostack),
        );
        #[cfg(portable_atomic_no_asm)]
        {
            llvm_asm!("in $0,0x3F" :"=r"(sreg) ::: "volatile");
            llvm_asm!("cli" ::: "memory" : "volatile");
        }
    }
    // I (Global Interrupt Enable) bit (1 << 7)
    WasEnabled(sreg & 0x80 != 0)
}

/// Restores the previous interrupt state.
#[inline]
pub(super) unsafe fn restore(WasEnabled(was_enabled): WasEnabled) {
    if was_enabled {
        // SAFETY: the caller must guarantee that the state was retrieved by the previous `disable`,
        // and we've checked that interrupts were enabled before disabling interrupts.
        unsafe {
            // Do not use `nomem` and `readonly` because prevent preceding memory accesses from being reordered after interrupts are enabled.
            // Do not use `preserves_flags` because SEI modifies the I bit of the status register (SREG).
            // Refs: https://ww1.microchip.com/downloads/en/DeviceDoc/AVR-InstructionSet-Manual-DS40002198.pdf#page=127
            #[cfg(not(portable_atomic_no_asm))]
            asm!("sei", options(nostack));
            #[cfg(portable_atomic_no_asm)]
            llvm_asm!("sei" ::: "memory" : "volatile");
        }
    }
}
