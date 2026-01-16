//! Implementations for Xtensa CPUs that have atomic CAS, but also have an address range where it is not working properly.
//!
//! For these CPUs rustc may, but should not provide atomic access unconditionally. portable-atomic generates code which selects
//! the appropriate implementation based on the address of the atomic variable.

use core::{arch::asm, cell::UnsafeCell, ops::Range, sync::atomic::Ordering};

#[cfg(portable_atomic_target_cpu = "esp32")]
const EXTERNAL_DATA_BUS_ADDRESS_RANGE: Range<usize> = 0x3F80_0000..0x3FC0_0000;

#[cfg(portable_atomic_target_cpu = "esp32s3")]
const EXTERNAL_DATA_BUS_ADDRESS_RANGE: Range<usize> = 0x3C00_0000..0x3E00_0000;

macro_rules! dispatch_impl {
    ($self:expr, $atomic:expr, $fallback:expr) => {
        {
            let addr = $self as *const _ as usize;
            if addr >= EXTERNAL_DATA_BUS_ADDRESS_RANGE.start && addr < EXTERNAL_DATA_BUS_ADDRESS_RANGE.end {
                return $fallback;
            } else {
                return $atomic;
            }
        }
    };
}

items!({
    macro_rules! atomic {
        (base, $([$($generics:tt)*])? $atomic_type:ident, $value_type:ty, $int_type:ty, $size:tt) => {
            #[repr(transparent)]
            pub(crate) struct $atomic_type $(<$($generics)*>)? {
                v: crate::imp::interrupt::$atomic_type $(<$($generics)*>)?,
            }

            impl_default_bit_opts!($atomic_type, $int_type);

            // Send is implicitly implemented for atomic integers, but not for atomic pointers.
            // SAFETY: any data races are prevented by atomic operations.
            unsafe impl $(<$($generics)*>)? Send for $atomic_type $(<$($generics)*>)? {}
            // SAFETY: any data races are prevented by atomic operations.
            unsafe impl $(<$($generics)*>)? Sync for $atomic_type $(<$($generics)*>)? {}

            impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
                #[inline]
                pub(crate) const fn new(v: $value_type) -> Self {
                    Self { v: crate::imp::interrupt::$atomic_type::new(v) }
                }

                #[inline]
                pub(crate) const fn as_ptr(&self) -> *mut $value_type {
                    self.v.as_ptr()
                }

                #[inline]
                pub(crate) fn is_lock_free() -> bool {
                    <crate::imp::interrupt::$atomic_type$(<$($generics)*>)?>::is_lock_free()
                }
                pub(crate) const IS_ALWAYS_LOCK_FREE: bool = <crate::imp::interrupt::$atomic_type$(<$($generics)*>)?>::IS_ALWAYS_LOCK_FREE;

                #[inline]
                pub(crate) fn swap(&self, _val: $value_type, _order: Ordering) -> $value_type {
                    dispatch_impl!(self,
                        loop {},
                        self.v.swap(_val, _order)
                    )
                }

                #[inline]
                pub(crate) fn compare_exchange(
                    &self,
                    _current: $value_type,
                    _new: $value_type,
                    _success: Ordering,
                    _failure: Ordering,
                ) -> Result<$value_type, $value_type> {
                    dispatch_impl!(self,
                        loop {},
                        self.v.compare_exchange(_current, _new, _success, _failure)
                    )
                }

                #[inline]
                pub(crate) fn compare_exchange_weak(
                    &self,
                    _current: $value_type,
                    _new: $value_type,
                    _success: Ordering,
                    _failure: Ordering,
                ) -> Result<$value_type, $value_type> {
                    dispatch_impl!(self,
                        loop {},
                        self.v.compare_exchange_weak(_current, _new, _success, _failure)
                    )
                }
            }
        };
        (load_store, $([$($generics:tt)*])? $atomic_type:ident, $value_type:ty, $int_type:ty, $size:tt) => {
            atomic!(base, $([$($generics)*])? $atomic_type, $value_type, $int_type, $size);
            impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
                #[inline]
                #[cfg_attr(
                    all(debug_assertions, not(portable_atomic_no_track_caller)),
                    track_caller
                )]
                pub(crate) fn load(&self, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                #[cfg_attr(
                    all(debug_assertions, not(portable_atomic_no_track_caller)),
                    track_caller
                )]
                pub(crate) fn store(&self, _val: $value_type, _order: Ordering) {
                    loop {}
                }
            }
        };
        (boolean, $([$($generics:tt)*])? $atomic_type:ident, $value_type:ty, $int_type:ty, $size:tt) => {
            atomic!(load_store, $([$($generics)*])? $atomic_type, $value_type, $int_type, $size);
            impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
                #[inline]
                pub(crate) fn add(&self, _val: $value_type, _order: Ordering) {
                    loop {}
                }

                #[inline]
                pub(crate) fn sub(&self, _val: $value_type, _order: Ordering) {
                    loop {}
                }

                #[inline]
                pub(crate) fn and(&self, _val: $value_type, _order: Ordering) {
                    loop {}
                }

                #[inline]
                pub(crate) fn or(&self, _val: $value_type, _order: Ordering) {
                    loop {}
                }

                #[inline]
                pub(crate) fn xor(&self, _val: $value_type, _order: Ordering) {
                    loop {}
                }

                #[inline]
                pub(crate) fn not(&self, _order: Ordering) {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_not(&self, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_or(&self, _val: $int_type, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_nor(&self, _val: $int_type, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_and(&self, _val: $int_type, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_nand(&self, _val: $int_type, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_xor(&self, _val: $int_type, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_min(&self, _val: $int_type, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_max(&self, _val: $int_type, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_neg(&self, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn neg(&self, _order: Ordering) {
                    loop {}
                }
            }
        };
        (ptr, $([$($generics:tt)*])? $atomic_type:ident, $value_type:ty, $int_type:ty, $size:tt) => {
            atomic!(boolean, $([$($generics)*])? $atomic_type, $value_type, $int_type, $size);
            impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
                #[inline]
                pub(crate) fn fetch_byte_sub(&self, _val: usize, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_byte_add(&self, _val: usize, _order: Ordering) -> $value_type {
                    loop {}
                }
            }
        };
        ($([$($generics:tt)*])? $atomic_type:ident, $value_type:ty, $int_type:ty, $size:tt) => {
            atomic!(boolean, $([$($generics)*])? $atomic_type, $value_type, $int_type, $size);
            impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
                #[inline]
                pub(crate) fn fetch_sub(&self, _val: $value_type, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_add(&self, _val: $value_type, _order: Ordering) -> $value_type {
                    loop {}
                }
            }
        };
    }

    atomic!(AtomicI8, i8, i8, "b");
    atomic!(AtomicU8, u8, u8, "b");
    atomic!(AtomicI16, i16, i16, "h");
    atomic!(AtomicU16, u16, u16, "h");
    atomic!(AtomicI32, i32, i32, "w");
    atomic!(AtomicU32, u32, u32, "w");
    atomic!(AtomicIsize, isize, isize, "w");
    atomic!(AtomicUsize, usize, usize, "w");
    atomic!(ptr, [T] AtomicPtr, *mut T, usize, "w");
});

#[cfg(feature = "fallback")]
items!({
    pub(crate) use crate::imp::interrupt::{AtomicI64, AtomicU64};
});
