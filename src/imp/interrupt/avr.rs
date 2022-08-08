// Adapted from https://github.com/Rahix/avr-device.

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;

#[inline]
pub(super) fn is_enabled() -> bool {
    let sreg: u8;
    // SAFETY: reading the status register (SREG) is safe.
    unsafe {
        #[cfg(not(portable_atomic_no_asm))]
        asm!("in {},0x3F", out(reg) sreg, options(nomem, nostack, preserves_flags));
        #[cfg(portable_atomic_no_asm)]
        llvm_asm!("in $0,0x3F" :"=r"(sreg) ::: "volatile");
    }
    sreg & 0x80 != 0
}

#[inline]
pub(super) fn disable() {
    // SAFETY: disabling interrupts is safe.
    unsafe {
        // Do not use `nomem` and `readonly` because prevent subsequent memory accesses from being reordered before interrupts are disabled.
        // Do not use `preserves_flags` because CLI modifies the I bit of the status register (SREG).
        // Refs: https://ww1.microchip.com/downloads/en/DeviceDoc/AVR-InstructionSet-Manual-DS40002198.pdf#page=58
        #[cfg(not(portable_atomic_no_asm))]
        asm!("cli", options(nostack));
        #[cfg(portable_atomic_no_asm)]
        llvm_asm!("cli" ::: "memory" : "volatile");
    }
}

#[inline]
pub(super) unsafe fn enable() {
    // SAFETY: the caller must guarantee that interrupts were enabled before disabling interrupts by `disable`.
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
