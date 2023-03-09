// Refs: https://developer.arm.com/documentation/ddi0406/cb/System-Level-Architecture/The-System-Level-Programmers--Model/ARM-processor-modes-and-ARM-core-registers/Program-Status-Registers--PSRs-?lang=en#CIHJBHJA
//
// Generated asm:
// - armv5te https://godbolt.org/z/4z8ahWd4T

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;

#[cfg(not(portable_atomic_disable_fiq))]
macro_rules! if_disable_fiq {
    ($tt:tt) => {
        ""
    };
}
#[cfg(portable_atomic_disable_fiq)]
macro_rules! if_disable_fiq {
    ($tt:tt) => {
        $tt
    };
}

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
            "mrs {prev}, cpsr",
            "orr {new}, {prev}, 0x80", // I (IRQ mask) bit (1 << 7)
            // We disable only IRQs by default. See also https://github.com/taiki-e/portable-atomic/pull/28#issuecomment-1214146912.
            if_disable_fiq!("orr {new}, {new}, 0x40"), // F (FIQ mask) bit (1 << 6)
            "msr cpsr_c, {new}",
            prev = out(reg) cpsr,
            new = out(reg) _,
            options(nostack, preserves_flags),
        );
    }
    State(cpsr)
}

/// Restores the previous interrupt state.
#[inline]
#[instruction_set(arm::a32)]
pub(super) unsafe fn restore(State(cpsr): State) {
    // SAFETY: the caller must guarantee that the state was retrieved by the previous `disable`,
    unsafe {
        // This clobbers the entire CPSR. See msp430.rs to safety on this.
        //
        // Do not use `nomem` and `readonly` because prevent preceding memory accesses from being reordered after interrupts are enabled.
        asm!("msr cpsr_c, {0}", in(reg) cpsr, options(nostack));
    }
}

// On pre-v6 ARM, we cannot use core::sync::atomic here because they call the
// `__sync_*` builtins for non-relaxed load/store (because pre-v6 ARM doesn't
// have Data Memory Barrier).
//
// Generated asm:
// - armv5te https://godbolt.org/z/W7343aob8
pub(crate) mod atomic {
    #[cfg(not(portable_atomic_no_asm))]
    use core::arch::asm;
    use core::{cell::UnsafeCell, sync::atomic::Ordering};

    #[repr(transparent)]
    pub(crate) struct AtomicBool {
        #[allow(dead_code)]
        v: UnsafeCell<u8>,
    }

    impl AtomicBool {
        #[inline]
        pub(crate) fn load(&self, order: Ordering) -> bool {
            self.as_atomic_u8().load(order) != 0
        }

        #[inline]
        pub(crate) fn store(&self, val: bool, order: Ordering) {
            self.as_atomic_u8().store(val as u8, order);
        }

        #[inline]
        fn as_atomic_u8(&self) -> &AtomicU8 {
            // SAFETY: AtomicBool and AtomicU8 have the same layout,
            unsafe { &*(self as *const AtomicBool).cast::<AtomicU8>() }
        }
    }

    #[repr(transparent)]
    pub(crate) struct AtomicPtr<T> {
        #[allow(dead_code)]
        p: UnsafeCell<*mut T>,
    }

    impl<T> AtomicPtr<T> {
        #[inline]
        pub(crate) fn load(&self, order: Ordering) -> *mut T {
            // TODO: remove int to ptr cast
            self.as_atomic_usize().load(order) as *mut T
        }

        #[inline]
        pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
            // TODO: remove int to ptr cast
            self.as_atomic_usize().store(ptr as usize, order);
        }

        #[inline]
        fn as_atomic_usize(&self) -> &AtomicUsize {
            // SAFETY: AtomicPtr and AtomicUsize have the same layout,
            unsafe { &*(self as *const AtomicPtr<T>).cast::<AtomicUsize>() }
        }
    }

    macro_rules! atomic_int {
        ($atomic_type:ident, $int_type:ident, $asm_suffix:tt) => {
            #[repr(transparent)]
            pub(crate) struct $atomic_type {
                v: UnsafeCell<$int_type>,
            }

            impl $atomic_type {
                #[inline]
                pub(crate) fn load(&self, order: Ordering) -> $int_type {
                    let src = self.v.get();
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        let out;
                        match order {
                            Ordering::Relaxed => {
                                asm!(
                                    concat!("ldr", $asm_suffix, " {out}, [{src}]"),
                                    src = in(reg) src,
                                    out = lateout(reg) out,
                                    options(nostack, preserves_flags, readonly),
                                );
                            }
                            Ordering::Acquire | Ordering::SeqCst => {
                                // inline asm without nomem/readonly implies compiler fence.
                                // And compiler fence is fine because the user explicitly declares that
                                // the system is single-core by using an unsafe cfg.
                                asm!(
                                    concat!("ldr", $asm_suffix, " {out}, [{src}]"),
                                    src = in(reg) src,
                                    out = lateout(reg) out,
                                    options(nostack, preserves_flags),
                                );
                            }
                            _ => unreachable!("{:?}", order),
                        }
                        out
                    }
                }

                #[inline]
                pub(crate) fn store(&self, val: $int_type, _order: Ordering) {
                    let dst = self.v.get();
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        // inline asm without nomem/readonly implies compiler fence.
                        // And compiler fence is fine because the user explicitly declares that
                        // the system is single-core by using an unsafe cfg.
                        asm!(
                            concat!("str", $asm_suffix, " {val}, [{dst}]"),
                            dst = in(reg) dst,
                            val = in(reg) val,
                            options(nostack, preserves_flags),
                        );
                    }
                }
            }
        };
    }

    atomic_int!(AtomicI8, i8, "b");
    atomic_int!(AtomicU8, u8, "b");
    atomic_int!(AtomicI16, i16, "h");
    atomic_int!(AtomicU16, u16, "h");
    atomic_int!(AtomicI32, i32, "");
    atomic_int!(AtomicU32, u32, "");
    atomic_int!(AtomicIsize, isize, "");
    atomic_int!(AtomicUsize, usize, "");
}
