// Adapted from https://github.com/Rahix/avr-device.

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::sync::atomic::{compiler_fence, Ordering};

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

    // Ensure no subsequent memory accesses are reordered to before interrupts are disabled.
    // https://github.com/rust-embedded/cortex-m/pull/264
    compiler_fence(Ordering::SeqCst);
}

#[inline]
pub(super) unsafe fn enable() {
    // Ensure no preceding memory accesses are reordered to after interrupts are enabled.
    // https://github.com/rust-embedded/cortex-m/pull/264
    compiler_fence(Ordering::SeqCst);

    unsafe {
        #[cfg(not(portable_atomic_no_asm))]
        asm!("sei", options(nomem, nostack));
        #[cfg(portable_atomic_no_asm)]
        llvm_asm!("sei" :::: "volatile");
    }
}
