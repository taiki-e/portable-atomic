// Refs: https://developer.arm.com/documentation/ddi0406/cb/System-Level-Architecture/The-System-Level-Programmers--Model/ARM-processor-modes-and-ARM-core-registers/Program-Status-Registers--PSRs-?lang=en#CIHJBHJA
//
// Generated asm:
// - armv5te https://godbolt.org/z/6oK9Ef7bv

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
pub(crate) mod atomic {
    #[cfg(not(portable_atomic_no_asm))]
    use core::arch::asm;
    use core::{cell::UnsafeCell, sync::atomic::Ordering};

    #[repr(transparent)]
    pub(crate) struct AtomicBool {
        v: UnsafeCell<u8>,
    }

    impl AtomicBool {
        #[inline]
        pub(crate) fn load(&self, order: Ordering) -> bool {
            // SAFETY: any data races are prevented by atomic intrinsics and the raw
            // pointer passed in is valid because we got it from a reference.
            unsafe { u8::atomic_load(self.v.get(), order) != 0 }
        }

        #[inline]
        pub(crate) fn store(&self, val: bool, order: Ordering) {
            // SAFETY: any data races are prevented by atomic intrinsics and the raw
            // pointer passed in is valid because we got it from a reference.
            unsafe {
                u8::atomic_store(self.v.get(), val as u8, order);
            }
        }
    }

    #[repr(transparent)]
    pub(crate) struct AtomicPtr<T> {
        p: UnsafeCell<*mut T>,
    }

    impl<T> AtomicPtr<T> {
        #[inline]
        pub(crate) fn load(&self, order: Ordering) -> *mut T {
            // SAFETY: any data races are prevented by atomic intrinsics and the raw
            // pointer passed in is valid because we got it from a reference.
            // TODO: remove int to ptr cast
            unsafe { usize::atomic_load(self.p.get() as *mut usize, order) as *mut T }
        }

        #[inline]
        pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
            // SAFETY: any data races are prevented by atomic intrinsics and the raw
            // pointer passed in is valid because we got it from a reference.
            // TODO: remove int to ptr cast
            unsafe {
                usize::atomic_store(self.p.get() as *mut usize, ptr as usize, order);
            }
        }
    }

    macro_rules! atomic_int {
        ($int_type:ident, $atomic_type:ident, $asm_suffix:expr) => {
            #[repr(transparent)]
            pub(crate) struct $atomic_type {
                v: UnsafeCell<$int_type>,
            }

            impl $atomic_type {
                #[inline]
                pub(crate) fn load(&self, order: Ordering) -> $int_type {
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe { $int_type::atomic_load(self.v.get(), order) }
                }

                #[inline]
                pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                    // SAFETY: any data races are prevented by atomic intrinsics and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        $int_type::atomic_store(self.v.get(), val, order);
                    }
                }
            }

            impl AtomicOperations for $int_type {
                #[inline]
                unsafe fn atomic_load(src: *const Self, order: Ordering) -> Self {
                    // SAFETY: the caller must uphold the safety contract for `atomic_load`.
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
                unsafe fn atomic_store(dst: *mut Self, val: Self, _order: Ordering) {
                    // SAFETY: the caller must uphold the safety contract for `atomic_store`.
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

    atomic_int!(i8, AtomicI8, "b");
    atomic_int!(u8, AtomicU8, "b");
    atomic_int!(i16, AtomicI16, "h");
    atomic_int!(u16, AtomicU16, "h");
    atomic_int!(i32, AtomicI32, "");
    atomic_int!(u32, AtomicU32, "");
    atomic_int!(isize, AtomicIsize, "");
    atomic_int!(usize, AtomicUsize, "");

    trait AtomicOperations: Sized {
        unsafe fn atomic_load(src: *const Self, order: Ordering) -> Self;
        unsafe fn atomic_store(dst: *mut Self, val: Self, order: Ordering);
    }
}
