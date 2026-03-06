//! Implementations for Xtensa CPUs that have atomic CAS, but also have an address range where it is not working properly.
//!
//! For these CPUs rustc may, but should not provide atomic access unconditionally. portable-atomic generates code which selects
//! the appropriate implementation based on the address of the atomic variable.
use core::{ops::Range, sync::atomic::Ordering};

// https://documentation.espressif.com/esp32_technical_reference_manual_en.pdf, Table 3.3-4. External Memory Address Mapping
#[cfg(portable_atomic_target_cpu = "esp32")]
const EXTERNAL_DATA_BUS_ADDRESS_RANGE: Range<usize> = 0x3F80_0000..0x3FC0_0000;

// https://documentation.espressif.com/esp32-s3_technical_reference_manual_en.pdf, Table 4.3-2. External Memory Address Mapping
#[cfg(portable_atomic_target_cpu = "esp32s3")]
const EXTERNAL_DATA_BUS_ADDRESS_RANGE: Range<usize> = 0x3C00_0000..0x3E00_0000;

macro_rules! dispatch_impl {
    ($self:expr, $([$($generics:tt)*])? $atomic_type:ident, self.v.$($fallback:tt)*) => {
        {
            let addr = $self.as_ptr() as usize;
            if addr >= EXTERNAL_DATA_BUS_ADDRESS_RANGE.start && addr < EXTERNAL_DATA_BUS_ADDRESS_RANGE.end {
                return $self.v.$($fallback)*;
            } else {
                let atomic = unsafe { ::core::mem::transmute::<&Self, &crate::imp::core_atomic::$atomic_type $(<$($generics)*>)?>($self) };
                return atomic.$($fallback)*;
            }
        }
    };
}

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
            pub(crate) fn swap(&self, val: $value_type, order: Ordering) -> $value_type {
                dispatch_impl!(self, $([$($generics)*])? $atomic_type,
                    self.v.swap(val, order)
                )
            }

            #[inline]
            pub(crate) fn compare_exchange(
                &self,
                current: $value_type,
                new: $value_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$value_type, $value_type> {
                dispatch_impl!(self, $([$($generics)*])? $atomic_type,
                    self.v.compare_exchange(current, new, success, failure)
                )
            }

            #[inline]
            pub(crate) fn compare_exchange_weak(
                &self,
                current: $value_type,
                new: $value_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$value_type, $value_type> {
                dispatch_impl!(self, $([$($generics)*])? $atomic_type,
                    self.v.compare_exchange_weak(current, new, success, failure)
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
            pub(crate) fn load(&self, order: Ordering) -> $value_type {
                dispatch_impl!(self, $([$($generics)*])? $atomic_type,
                    self.v.load(order)
                )
            }

            #[inline]
            #[cfg_attr(
                all(debug_assertions, not(portable_atomic_no_track_caller)),
                track_caller
            )]
            pub(crate) fn store(&self, val: $value_type, order: Ordering) {
                dispatch_impl!(self, $([$($generics)*])? $atomic_type,
                    self.v.store(val, order)
                )
            }
        }
    };
    (boolean_fetch, $([$($generics:tt)*])? $atomic_type:ident, $value_type:ty, $int_type:ty, $size:tt) => {
        atomic!(load_store, $([$($generics)*])? $atomic_type, $value_type, $int_type, $size);
        impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, order: Ordering) -> $value_type {
                dispatch_impl!(self, $([$($generics)*])? $atomic_type,
                    self.v.fetch_and(val, order)
                )
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, order: Ordering) -> $value_type {
                dispatch_impl!(self, $([$($generics)*])? $atomic_type,
                    self.v.fetch_or(val, order)
                )
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, order: Ordering) -> $value_type {
                dispatch_impl!(self, $([$($generics)*])? $atomic_type,
                    self.v.fetch_xor(val, order)
                )
            }
        }
    };
    (boolean, $([$($generics:tt)*])? $atomic_type:ident, $value_type:ty, $int_type:ty, $size:tt) => {
        atomic!(boolean_fetch, $([$($generics)*])? $atomic_type, $value_type, $int_type, $size);
        impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
            #[inline]
            pub(crate) fn and(&self, val: $int_type, order: Ordering) {
                self.fetch_and(val, order);
            }

            #[inline]
            pub(crate) fn or(&self, val: $int_type, order: Ordering) {
                self.fetch_or(val, order);
            }

            #[inline]
            pub(crate) fn xor(&self, val: $int_type, order: Ordering) {
                self.fetch_xor(val, order);
            }

            #[inline]
            pub(crate) fn not(&self, order: Ordering) {
                self.fetch_not(order);
            }

            #[inline]
            pub(crate) fn neg(&self, order: Ordering) {
                self.fetch_neg(order);
            }

            #[inline]
            pub(crate) fn fetch_not(&self, order: Ordering) -> $value_type {
                dispatch_impl!(self, $([$($generics)*])? $atomic_type,
                    self.v.fetch_not(order)
                )
            }

            #[inline]
            pub(crate) fn fetch_neg(&self, order: Ordering) -> $value_type {
                dispatch_impl!(self, $([$($generics)*])? $atomic_type,
                    self.v.fetch_neg(order)
                )
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, order: Ordering) -> $value_type {
                dispatch_impl!(self, $([$($generics)*])? $atomic_type,
                    self.v.fetch_nand(val, order)
                )
            }
        }
    };
    ($([$($generics:tt)*])? $atomic_type:ident, $value_type:ty, $int_type:ty, $size:tt) => {
        atomic!(boolean, $([$($generics)*])? $atomic_type, $value_type, $int_type, $size);
        impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
            #[inline]
            pub(crate) fn add(&self, val: $value_type, order: Ordering) {
                self.fetch_add(val, order);
            }

            #[inline]
            pub(crate) fn sub(&self, val: $value_type, order: Ordering) {
                self.fetch_sub(val, order);
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $value_type, order: Ordering) -> $value_type {
                dispatch_impl!(self, $([$($generics)*])? $atomic_type,
                    self.v.fetch_sub(val, order)
                )
            }

            #[inline]
            pub(crate) fn fetch_add(&self, val: $value_type, order: Ordering) -> $value_type {
                dispatch_impl!(self, $([$($generics)*])? $atomic_type,
                    self.v.fetch_add(val, order)
                )
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, order: Ordering) -> $value_type {
                dispatch_impl!(self, $([$($generics)*])? $atomic_type,
                    self.v.fetch_min(val, order)
                )
            }

            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, order: Ordering) -> $value_type {
                dispatch_impl!(self, $([$($generics)*])? $atomic_type,
                    self.v.fetch_max(val, order)
                )
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
atomic!(boolean_fetch, [T] AtomicPtr, *mut T, usize, "w");

impl <T> AtomicPtr<T> {
    #[inline]
    pub(crate) fn fetch_byte_sub(&self, val: usize, order: Ordering) -> *mut T {
        dispatch_impl!(self, [T] AtomicPtr,
            self.v.fetch_byte_sub(val, order)
        )
    }

    #[inline]
    pub(crate) fn fetch_byte_add(&self, val: usize, order: Ordering) -> *mut T {
        dispatch_impl!(self, [T] AtomicPtr,
            self.v.fetch_byte_add(val, order)
        )
    }
}

#[cfg(feature = "fallback")]
pub(crate) use crate::imp::interrupt::{AtomicI64, AtomicU64};
