// AtomicU{32,64} based AtomicF{32,64} implementation.

#![cfg(any(not(target_pointer_width = "16"), feature = "fallback"))] // See lib.rs's AtomicU32 definition

use core::sync::atomic::Ordering;

macro_rules! atomic_float {
    (
        $atomic_type:ident, $float_type:ident, $atomic_int_type:ident, $int_type:ident, $align:expr
    ) => {
        #[repr(C, align($align))]
        pub(crate) struct $atomic_type {
            v: core::cell::UnsafeCell<$float_type>,
        }

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by atomic operations.
        unsafe impl Sync for $atomic_type {}

        impl $atomic_type {
            #[inline]
            pub(crate) const fn new(v: $float_type) -> Self {
                Self { v: core::cell::UnsafeCell::new(v) }
            }

            #[inline]
            pub(crate) fn is_lock_free() -> bool {
                crate::$atomic_int_type::is_lock_free()
            }
            #[inline]
            pub(crate) const fn is_always_lock_free() -> bool {
                crate::$atomic_int_type::is_always_lock_free()
            }

            #[inline]
            pub(crate) fn get_mut(&mut self) -> &mut $float_type {
                // SAFETY: the mutable reference guarantees unique ownership.
                // (UnsafeCell::get_mut requires Rust 1.50)
                unsafe { &mut *self.v.get() }
            }

            #[inline]
            pub(crate) fn into_inner(self) -> $float_type {
                self.v.into_inner()
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn load(&self, order: Ordering) -> $float_type {
                $float_type::from_bits(self.as_bits().load(order))
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $float_type, order: Ordering) {
                self.as_bits().store(val.to_bits(), order)
            }

            #[inline]
            pub(crate) fn as_bits(&self) -> &crate::$atomic_int_type {
                // SAFETY: $atomic_type and $atomic_int_type have the same layout,
                // and there is no concurrent access to the value that does not go through this method.
                unsafe { &*(self as *const $atomic_type as *const crate::$atomic_int_type) }
            }
        }

        #[cfg_attr(
            portable_atomic_no_cfg_target_has_atomic,
            cfg(any(
                not(portable_atomic_no_atomic_cas),
                portable_atomic_unsafe_assume_single_core,
                target_arch = "avr",
                target_arch = "msp430"
            ))
        )]
        #[cfg_attr(
            not(portable_atomic_no_cfg_target_has_atomic),
            cfg(any(
                target_has_atomic = "ptr",
                portable_atomic_unsafe_assume_single_core,
                target_arch = "avr",
                target_arch = "msp430"
            ))
        )]
        impl $atomic_type {
            #[inline]
            pub(crate) fn swap(&self, val: $float_type, order: Ordering) -> $float_type {
                $float_type::from_bits(self.as_bits().swap(val.to_bits(), order))
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn compare_exchange(
                &self,
                current: $float_type,
                new: $float_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$float_type, $float_type> {
                match self.as_bits().compare_exchange(
                    current.to_bits(),
                    new.to_bits(),
                    success,
                    failure,
                ) {
                    Ok(v) => Ok($float_type::from_bits(v)),
                    Err(v) => Err($float_type::from_bits(v)),
                }
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn compare_exchange_weak(
                &self,
                current: $float_type,
                new: $float_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$float_type, $float_type> {
                match self.as_bits().compare_exchange_weak(
                    current.to_bits(),
                    new.to_bits(),
                    success,
                    failure,
                ) {
                    Ok(v) => Ok($float_type::from_bits(v)),
                    Err(v) => Err($float_type::from_bits(v)),
                }
            }

            #[inline]
            pub(crate) fn fetch_add(&self, val: $float_type, order: Ordering) -> $float_type {
                self.fetch_update_(order, crate::utils::strongest_failure_ordering(order), |x| {
                    x + val
                })
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $float_type, order: Ordering) -> $float_type {
                self.fetch_update_(order, crate::utils::strongest_failure_ordering(order), |x| {
                    x - val
                })
            }

            #[inline]
            fn fetch_update_<F>(
                &self,
                set_order: Ordering,
                fetch_order: Ordering,
                mut f: F,
            ) -> $float_type
            where
                F: FnMut($float_type) -> $float_type,
            {
                let mut prev = self.load(fetch_order);
                loop {
                    let next = f(prev);
                    match self.compare_exchange_weak(prev, next, set_order, fetch_order) {
                        Ok(x) => return x,
                        Err(next_prev) => prev = next_prev,
                    }
                }
            }

            #[inline]
            pub(crate) fn fetch_max(&self, val: $float_type, order: Ordering) -> $float_type {
                self.fetch_update_(order, crate::utils::strongest_failure_ordering(order), |x| {
                    x.max(val)
                })
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $float_type, order: Ordering) -> $float_type {
                self.fetch_update_(order, crate::utils::strongest_failure_ordering(order), |x| {
                    x.min(val)
                })
            }

            #[inline]
            pub(crate) fn fetch_abs(&self, order: Ordering) -> $float_type {
                const ABS_MASK: $int_type = !0 / 2;
                $float_type::from_bits(self.as_bits().fetch_and(ABS_MASK, order))
            }
        }
    };
}

atomic_float!(AtomicF32, f32, AtomicU32, u32, 4);

#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(any(
        all(
            feature = "fallback",
            any(
                not(portable_atomic_no_atomic_cas),
                portable_atomic_unsafe_assume_single_core,
                target_arch = "avr",
                target_arch = "msp430"
            )
        ),
        not(portable_atomic_no_atomic_64),
        not(any(target_pointer_width = "16", target_pointer_width = "32")),
    ))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(
        all(
            feature = "fallback",
            any(
                target_has_atomic = "ptr",
                portable_atomic_unsafe_assume_single_core,
                target_arch = "avr",
                target_arch = "msp430"
            )
        ),
        target_has_atomic = "64",
        not(any(target_pointer_width = "16", target_pointer_width = "32")),
    ))
)]
atomic_float!(AtomicF64, f64, AtomicU64, u64, 8);
