// Atomic operations implementation on x86.
//
// Note: On Miri and ThreadSanitizer which do not support inline assembly, we don't use
// this module and use CAS loop instead.

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::sync::atomic::Ordering;

use super::core_atomic as imp;

#[cfg(target_pointer_width = "32")]
macro_rules! ptr_modifier {
    () => {
        ":e"
    };
}
#[cfg(target_pointer_width = "64")]
macro_rules! ptr_modifier {
    () => {
        ""
    };
}

macro_rules! atomic_int {
    (uint, $int_type:ident, $atomic_type:ident, $val_reg:tt, $val_modifier:tt, $ptr_size:tt) => {
        impl imp::$atomic_type {
            #[inline]
            pub(crate) fn not(&self, _order: Ordering) {
                let dst = self.as_mut_ptr();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                //
                // https://www.felixcloutier.com/x86/not
                unsafe {
                    // atomic RMW is always SeqCst.
                    asm!(
                        concat!("lock not ", $ptr_size, " ptr [{dst", ptr_modifier!(), "}]"),
                        dst = in(reg) dst,
                        options(nostack, preserves_flags),
                    );
                }
            }

            #[inline]
            pub(crate) fn as_mut_ptr(&self) -> *mut $int_type {
                // SAFETY: Self is #[repr(C)] and internally UnsafeCell<$int_type>.
                // See also https://github.com/rust-lang/rust/pull/66705 and
                // https://github.com/rust-lang/rust/issues/66136#issuecomment-557867116.
                unsafe {
                    (*(self as *const Self as *const core::cell::UnsafeCell<$int_type>)).get()
                }
            }
        }
    };
    (int, $int_type:ident, $atomic_type:ident, $val_reg:tt, $val_modifier:tt, $ptr_size:tt) => {
        atomic_int!(uint, $int_type, $atomic_type, $val_reg, $val_modifier, $ptr_size);
        impl imp::$atomic_type {
            #[inline]
            pub(crate) fn neg(&self, _order: Ordering) {
                let dst = self.as_mut_ptr();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                //
                // https://www.felixcloutier.com/x86/neg
                unsafe {
                    // atomic RMW is always SeqCst.
                    asm!(
                        concat!("lock neg ", $ptr_size, " ptr [{dst", ptr_modifier!(), "}]"),
                        dst = in(reg) dst,
                        // Do not use `preserves_flags` because NEG modifies the CF, OF, SF, ZF, AF, and PF flag.
                        options(nostack),
                    );
                }
            }
        }
    };
}

atomic_int!(int, i8, AtomicI8, reg_byte, "", "byte");
atomic_int!(uint, u8, AtomicU8, reg_byte, "", "byte");
atomic_int!(int, i16, AtomicI16, reg, ":x", "word");
atomic_int!(uint, u16, AtomicU16, reg, ":x", "word");
atomic_int!(int, i32, AtomicI32, reg, ":e", "dword");
atomic_int!(uint, u32, AtomicU32, reg, ":e", "dword");
#[cfg(target_arch = "x86_64")]
atomic_int!(int, i64, AtomicI64, reg, "", "qword");
#[cfg(target_arch = "x86_64")]
atomic_int!(uint, u64, AtomicU64, reg, "", "qword");
#[cfg(target_pointer_width = "32")]
atomic_int!(int, isize, AtomicIsize, reg, ":e", "dword");
#[cfg(target_pointer_width = "32")]
atomic_int!(uint, usize, AtomicUsize, reg, ":e", "dword");
#[cfg(target_pointer_width = "64")]
atomic_int!(int, isize, AtomicIsize, reg, "", "qword");
#[cfg(target_pointer_width = "64")]
atomic_int!(uint, usize, AtomicUsize, reg, "", "qword");

#[cfg(target_arch = "x86")]
impl imp::AtomicI64 {
    #[inline]
    pub(crate) fn not(&self, order: Ordering) {
        self.fetch_not(order);
    }
    #[inline]
    pub(crate) fn neg(&self, order: Ordering) {
        self.fetch_neg(order);
    }
}
#[cfg(target_arch = "x86")]
impl imp::AtomicU64 {
    #[inline]
    pub(crate) fn not(&self, order: Ordering) {
        self.fetch_not(order);
    }
}
