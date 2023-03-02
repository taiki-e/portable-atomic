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
    ($atomic_type:ident, $int_type:ident, $ptr_size:tt) => {
        impl imp::$atomic_type {
            #[inline]
            pub(crate) fn not(&self, _order: Ordering) {
                let dst = self.as_ptr();
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
            pub(crate) fn neg(&self, _order: Ordering) {
                let dst = self.as_ptr();
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

atomic_int!(AtomicI8, i8, "byte");
atomic_int!(AtomicU8, u8, "byte");
atomic_int!(AtomicI16, i16, "word");
atomic_int!(AtomicU16, u16, "word");
atomic_int!(AtomicI32, i32, "dword");
atomic_int!(AtomicU32, u32, "dword");
#[cfg(target_arch = "x86_64")]
atomic_int!(AtomicI64, i64, "qword");
#[cfg(target_arch = "x86_64")]
atomic_int!(AtomicU64, u64, "qword");
#[cfg(target_pointer_width = "32")]
atomic_int!(AtomicIsize, isize, "dword");
#[cfg(target_pointer_width = "32")]
atomic_int!(AtomicUsize, usize, "dword");
#[cfg(target_pointer_width = "64")]
atomic_int!(AtomicIsize, isize, "qword");
#[cfg(target_pointer_width = "64")]
atomic_int!(AtomicUsize, usize, "qword");

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
    #[inline]
    pub(crate) fn neg(&self, order: Ordering) {
        self.fetch_neg(order);
    }
}
