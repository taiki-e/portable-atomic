// Adapted from https://github.com/Rahix/avr-device.

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;

#[inline]
pub(super) fn is_enabled() -> bool {
    let sreg: u8;
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
    unsafe {
        #[cfg(not(portable_atomic_no_asm))]
        asm!("cli", options(nomem, nostack));
        #[cfg(portable_atomic_no_asm)]
        llvm_asm!("cli" :::: "volatile");
    }
}

#[inline]
pub(super) unsafe fn enable() {
    unsafe {
        #[cfg(not(portable_atomic_no_asm))]
        asm!("sei", options(nomem, nostack));
        #[cfg(portable_atomic_no_asm)]
        llvm_asm!("sei" :::: "volatile");
    }
}
