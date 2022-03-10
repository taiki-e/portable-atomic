#[cfg(doc)]
use core::sync::atomic::Ordering::{AcqRel, Acquire, Relaxed, Release, SeqCst};
use core::{cell::UnsafeCell, fmt, sync::atomic::Ordering};

macro_rules! atomic_float {
    ($atomic_type:ident, $float_type:ident, $atomic_int_type:ident, $int_type:ident, $align:expr
    ) => {
        doc_comment! {
            concat!("A floating point type which can be safely shared between threads.

This type has the same in-memory representation as the underlying floating point type,
[`", stringify!($float_type), "`].
"
            ),
            #[cfg_attr(docsrs, doc(cfg(feature = "float")))]
            #[repr(C, align($align))]
            pub struct $atomic_type {
                v: UnsafeCell<$float_type>,
            }
        }

        static_assert_layout!($atomic_type, $float_type);

        impl Default for $atomic_type {
            #[inline]
            fn default() -> Self {
                Self::new($float_type::default())
            }
        }

        impl From<$float_type> for $atomic_type {
            #[inline]
            fn from(v: $float_type) -> Self {
                Self::new(v)
            }
        }

        impl fmt::Debug for $atomic_type {
            #[allow(clippy::missing_inline_in_public_items)] // fmt is not hot path
            fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                // std atomic types use SeqCst in Debug::fmt: https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L1378
                fmt::Debug::fmt(&self.load(Ordering::SeqCst), f)
            }
        }

        // Send is implicitly implemented.
        unsafe impl Sync for $atomic_type {}

        // UnwindSafe is implicitly implemented.
        #[cfg(not(portable_atomic_no_core_unwind_safe))]
        impl core::panic::RefUnwindSafe for $atomic_type {}
        #[cfg(all(portable_atomic_no_core_unwind_safe, feature = "std"))]
        impl std::panic::RefUnwindSafe for $atomic_type {}

        impl $atomic_type {
            /// Creates a new atomic float.
            #[inline]
            pub const fn new(v: $float_type) -> Self {
                Self { v: UnsafeCell::new(v) }
            }

            /// Returns `true` if operations on values of this type are lock-free.
            ///
            /// If the compiler or the platform doesn't support the necessary
            /// atomic instructions, global locks for every potentially
            /// concurrent atomic operation will be used.
            #[inline]
            pub fn is_lock_free() -> bool {
                crate::$atomic_int_type::is_lock_free()
            }

            /// Returns `true` if operations on values of this type are lock-free.
            ///
            /// If the compiler or the platform doesn't support the necessary
            /// atomic instructions, global locks for every potentially
            /// concurrent atomic operation will be used.
            ///
            /// **Note:** If the atomic operation relies on dynamic CPU feature detection,
            /// this type may be lock-free even if the function returns false.
            #[inline]
            pub const fn is_always_lock_free() -> bool {
                crate::$atomic_int_type::is_always_lock_free()
            }

            /// Returns a mutable reference to the underlying float.
            ///
            /// This is safe because the mutable reference guarantees that no other threads are
            /// concurrently accessing the atomic data.
            #[inline]
            pub fn get_mut(&mut self) -> &mut $float_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: This is safe because the mutable reference guarantees that no other
                // threads are concurrently accessing the atomic data.
                unsafe {
                    &mut *self.v.get()
                }
            }

            // TODO: Add from_mut once it is stable on other std atomic types.
            // https://github.com/rust-lang/rust/issues/76314

            /// Consumes the atomic and returns the contained value.
            ///
            /// This is safe because passing `self` by value guarantees that no other threads are
            /// concurrently accessing the atomic data.
            #[inline]
            pub fn into_inner(self) -> $float_type {
                self.v.into_inner()
            }

            /// Loads a value from the atomic float.
            ///
            /// `load` takes an [`Ordering`] argument which describes the memory ordering of this operation.
            /// Possible values are [`SeqCst`], [`Acquire`] and [`Relaxed`].
            ///
            /// # Panics
            ///
            /// Panics if `order` is [`Release`] or [`AcqRel`].
            #[inline]
            pub fn load(&self, order: Ordering) -> $float_type {
                $float_type::from_bits(self.as_bits().load(order))
            }

            /// Stores a value into the atomic float.
            ///
            /// `store` takes an [`Ordering`] argument which describes the memory ordering of this operation.
            ///  Possible values are [`SeqCst`], [`Release`] and [`Relaxed`].
            ///
            /// # Panics
            ///
            /// Panics if `order` is [`Acquire`] or [`AcqRel`].
            #[inline]
            pub fn store(&self, val: $float_type, order: Ordering) {
                self.as_bits().store(val.to_bits(), order)
            }

            /// Stores a value into the atomic float, returning the previous value.
            ///
            /// `swap` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn swap(&self, val: $float_type, order: Ordering) -> $float_type {
                $float_type::from_bits(self.as_bits().swap(val.to_bits(), order))
            }

            /// Stores a value into the atomic float if the current value is the same as
            /// the `current` value.
            ///
            /// The return value is a result indicating whether the new value was written and
            /// containing the previous value. On success this value is guaranteed to be equal to
            /// `current`.
            ///
            /// `compare_exchange` takes two [`Ordering`] arguments to describe the memory
            /// ordering of this operation. `success` describes the required ordering for the
            /// read-modify-write operation that takes place if the comparison with `current` succeeds.
            /// `failure` describes the required ordering for the load operation that takes place when
            /// the comparison fails. Using [`Acquire`] as success ordering makes the store part
            /// of this operation [`Relaxed`], and using [`Release`] makes the successful load
            /// [`Relaxed`]. The failure ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`]
            /// and must be equivalent to or weaker than the success ordering.
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
            pub fn compare_exchange(
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

            /// Stores a value into the atomic float if the current value is the same as
            /// the `current` value.
            /// Unlike [`compare_exchange`](Self::compare_exchange)
            /// this function is allowed to spuriously fail even
            /// when the comparison succeeds, which can result in more efficient code on some
            /// platforms. The return value is a result indicating whether the new value was
            /// written and containing the previous value.
            ///
            /// `compare_exchange_weak` takes two [`Ordering`] arguments to describe the memory
            /// ordering of this operation. `success` describes the required ordering for the
            /// read-modify-write operation that takes place if the comparison with `current` succeeds.
            /// `failure` describes the required ordering for the load operation that takes place when
            /// the comparison fails. Using [`Acquire`] as success ordering makes the store part
            /// of this operation [`Relaxed`], and using [`Release`] makes the successful load
            /// [`Relaxed`]. The failure ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`]
            /// and must be equivalent to or weaker than the success ordering.
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
            pub fn compare_exchange_weak(
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

            /// Adds to the current value, returning the previous value.
            ///
            /// This operation wraps around on overflow.
            ///
            /// `fetch_add` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_add(&self, val: $float_type, order: Ordering) -> $float_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    Some(x + val)
                })
                .unwrap()
            }

            /// Subtracts from the current value, returning the previous value.
            ///
            /// This operation wraps around on overflow.
            ///
            /// `fetch_sub` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_sub(&self, val: $float_type, order: Ordering) -> $float_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    Some(x - val)
                })
                .unwrap()
            }

            /// Fetches the value, and applies a function to it that returns an optional
            /// new value. Returns a `Result` of `Ok(previous_value)` if the function returned `Some(_)`, else
            /// `Err(previous_value)`.
            ///
            /// Note: This may call the function multiple times if the value has been changed from other threads in
            /// the meantime, as long as the function returns `Some(_)`, but the function will have been applied
            /// only once to the stored value.
            ///
            /// `fetch_update` takes two [`Ordering`] arguments to describe the memory ordering of this operation.
            /// The first describes the required ordering for when the operation finally succeeds while the second
            /// describes the required ordering for loads. These correspond to the success and failure orderings of
            /// [`compare_exchange`](Self::compare_exchange) respectively.
            ///
            /// Using [`Acquire`] as success ordering makes the store part
            /// of this operation [`Relaxed`], and using [`Release`] makes the final successful load
            /// [`Relaxed`]. The (failed) load ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`]
            /// and must be equivalent to or weaker than the success ordering.
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_update<F>(
                &self,
                set_order: Ordering,
                fetch_order: Ordering,
                mut f: F,
            ) -> Result<$float_type, $float_type>
            where
                F: FnMut($float_type) -> Option<$float_type>,
            {
                let mut prev = self.load(fetch_order);
                while let Some(next) = f(prev) {
                    match self.compare_exchange_weak(prev, next, set_order, fetch_order) {
                        x @ Ok(_) => return x,
                        Err(next_prev) => prev = next_prev,
                    }
                }
                Err(prev)
            }

            /// Maximum with the current value.
            ///
            /// Finds the maximum of the current value and the argument `val`, and
            /// sets the new value to the result.
            ///
            /// Returns the previous value.
            ///
            /// `fetch_max` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_max(&self, val: $float_type, order: Ordering) -> $float_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    Some(x.max(val))
                })
                .unwrap()
            }

            /// Minimum with the current value.
            ///
            /// Finds the minimum of the current value and the argument `val`, and
            /// sets the new value to the result.
            ///
            /// Returns the previous value.
            ///
            /// `fetch_min` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_min(&self, val: $float_type, order: Ordering) -> $float_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    Some(x.min(val))
                })
                .unwrap()
            }

            // TODO: Add as_mut_ptr once it is stable on other std atomic types.
            // https://github.com/rust-lang/rust/issues/66893

            doc_comment! {
                concat!("Raw transmutation to `", stringify!($atomic_int_type), "`.

See [`", stringify!($float_type) ,"::from_bits`] for some discussion of the
portability of this operation (there are almost no issues)."),
                #[inline]
                pub fn as_bits(&self) -> &crate::$atomic_int_type {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: $atomic_type and $atomic_int_type have the same layout,
                    // and there is no concurrent access to the value that does not go through this method.
                    unsafe {
                        &*(self as *const $atomic_type as *const crate::$atomic_int_type)
                    }
                }
            }
        }
    };
}

// cfg(any(target_has_atomic_load_store = "32", target_arch = "riscv32", portable_atomic_unsafe_assume_single_core))
#[cfg(any(not(target_pointer_width = "16"), portable_atomic_unsafe_assume_single_core))]
atomic_float!(AtomicF32, f32, AtomicU32, u32, 4);

#[cfg_attr(
    not(portable_atomic_cfg_target_has_atomic),
    cfg(any(
        all(feature = "fallback", not(portable_atomic_no_atomic_cas)),
        not(portable_atomic_no_atomic_64),
        portable_atomic_unsafe_assume_single_core
    ))
)]
// cfg(any(target_has_atomic = "ptr", target_has_atomic_load_store = "64", portable_atomic_unsafe_assume_single_core))
#[cfg_attr(
    portable_atomic_cfg_target_has_atomic,
    cfg(any(
        all(feature = "fallback", target_has_atomic = "ptr"),
        target_has_atomic = "64",
        target_pointer_width = "64",
        portable_atomic_unsafe_assume_single_core
    ))
)]
atomic_float!(AtomicF64, f64, AtomicU64, u64, 8);
