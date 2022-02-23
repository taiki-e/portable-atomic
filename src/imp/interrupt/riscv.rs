// Based on asm generated for functions of interrupt module of https://github.com/rust-embedded/riscv.

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::sync::atomic::{compiler_fence, Ordering};

#[inline]
pub(super) fn is_enabled() -> bool {
    let r: usize;
    unsafe {
        asm!("csrr {0}, mstatus", out(reg) r, options(nomem, nostack, preserves_flags));
    }
    r & 0x8 != 0
}

#[inline]
pub(super) fn disable() {
    unsafe {
        // TODO(taiki-e): we can probably add preserves_flags here, because
        // the rules of preserves_flags do not include the interrupt flag.
        asm!("csrci mstatus, 0x8", options(nomem, nostack));
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
        // TODO(taiki-e): we can probably add preserves_flags here, because
        // the rules of preserves_flags do not include the interrupt flag.
        asm!("csrsi mstatus, 0x8", options(nomem, nostack));
    }
}
