// Adapted from https://github.com/rust-embedded/msp430.

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;

#[derive(Clone, Copy)]
pub(super) struct WasEnabled(bool);

/// Disables interrupts and returns the previous interrupt state.
#[inline]
pub(super) fn disable() -> WasEnabled {
    let r: u16;
    // SAFETY: reading the status register and disabling interrupts are safe.
    // (see module-level comments of interrupt/mod.rs on the safety of using privileged instructions)
    unsafe {
        #[cfg(not(portable_atomic_no_asm))]
        asm!("mov R2, {0}", out(reg) r, options(nomem, nostack, preserves_flags));
        #[cfg(portable_atomic_no_asm)]
        llvm_asm!("mov R2, $0" : "=r"(r) ::: "volatile");
        // Do not use `nomem` and `readonly` because prevent subsequent memory accesses from being reordered before interrupts are disabled.
        // Do not use `preserves_flags` because DINT modifies the GIE (global interrupt enable) bit of the status register.
        // Refs: http://mspgcc.sourceforge.net/manual/x951.html
        #[cfg(not(portable_atomic_no_asm))]
        asm!("dint {{ nop", options(nostack));
        #[cfg(portable_atomic_no_asm)]
        llvm_asm!("dint { nop" ::: "memory" : "volatile");
    }
    WasEnabled(r & (1 << 3) != 0)
}

/// Restores the previous interrupt state.
#[inline]
pub(super) unsafe fn restore(was_enabled: WasEnabled) {
    if was_enabled.0 {
        // SAFETY: the caller must guarantee that the state was retrieved by the previous `disable`,
        // and we've checked that interrupts were enabled before disabling interrupts.
        unsafe {
            // Do not use `nomem` and `readonly` because prevent preceding memory accesses from being reordered after interrupts are enabled.
            // Do not use `preserves_flags` because EINT modifies the GIE (global interrupt enable) bit of the status register.
            // Refs: http://mspgcc.sourceforge.net/manual/x951.html
            #[cfg(not(portable_atomic_no_asm))]
            asm!("nop {{ eint {{ nop", options(nostack));
            #[cfg(portable_atomic_no_asm)]
            llvm_asm!("nop { eint { nop" ::: "memory" : "volatile");
        }
    }
}
