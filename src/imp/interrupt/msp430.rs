// Adapted from https://github.com/rust-embedded/msp430.

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;

#[inline]
pub(super) fn is_enabled() -> bool {
    let r: u16;
    unsafe {
        #[cfg(not(portable_atomic_no_asm))]
        asm!("mov R2, {0}", out(reg) r, options(nomem, nostack, preserves_flags));
        #[cfg(portable_atomic_no_asm)]
        llvm_asm!("mov R2, $0" : "=r"(r) ::: "volatile");
    }
    r & (1 << 3) != 0
}

#[inline]
pub(super) fn disable() {
    unsafe {
        // Do not use `nomem` because prevent subsequent memory accesses from being reordered before interrupts are disabled.
        #[cfg(not(portable_atomic_no_asm))]
        asm!("dint {{ nop", options(nostack));
        #[cfg(portable_atomic_no_asm)]
        llvm_asm!("dint { nop" ::: "memory" : "volatile");
    }
}

#[inline]
pub(super) unsafe fn enable() {
    unsafe {
        // Do not use `nomem` because prevent preceding memory accesses from being reordered after interrupts are enabled.
        #[cfg(not(portable_atomic_no_asm))]
        asm!("nop {{ eint {{ nop", options(nostack));
        #[cfg(portable_atomic_no_asm)]
        llvm_asm!("nop { eint { nop" ::: "memory" : "volatile");
    }
}
