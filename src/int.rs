#[cfg(doc)]
use core::sync::atomic::Ordering::{AcqRel, Acquire, Relaxed, Release, SeqCst};
use core::{fmt, marker::PhantomData, sync::atomic::Ordering};

use crate::{imp, utils::NoRefUnwindSafe};

macro_rules! atomic_int {
    ($(#[$attrs:meta])* $atomic_type:ident, $int_type:ident, $align:expr) => {
        doc_comment! {
            concat!("An integer type which can be safely shared between threads.

This type has the same in-memory representation as the underlying integer type,
[`", stringify!($int_type), "`].

If the compiler or the platform supports atomic loads and stores of [`", stringify!($int_type),
"`], this type is a wrapper for the standard library's `", stringify!($atomic_type),
"`, otherwise synchronizes using global locks.
You can call [`", stringify!($atomic_type), "::is_lock_free()`] to check whether
atomic instructions or locks will be used.
"
            ),
            $(#[$attrs])*
            // We can use #[repr(transparent)] here, but #[repr(C, align(N))]
            // will show clearer docs.
            #[repr(C, align($align))]
            pub struct $atomic_type {
                inner: imp::$atomic_type,
                // Prevent RefUnwindSafe from being propagated from the std atomic type.
                _marker: PhantomData<NoRefUnwindSafe>,
            }
        }

        static_assert_layout!($atomic_type, $int_type);

        impl Default for $atomic_type {
            #[inline]
            fn default() -> Self {
                Self::new($int_type::default())
            }
        }

        impl From<$int_type> for $atomic_type {
            #[inline]
            fn from(v: $int_type) -> Self {
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

        // UnwindSafe is implicitly implemented.
        #[cfg(not(portable_atomic_no_core_unwind_safe))]
        impl core::panic::RefUnwindSafe for $atomic_type {}
        #[cfg(all(portable_atomic_no_core_unwind_safe, feature = "std"))]
        impl std::panic::RefUnwindSafe for $atomic_type {}

        impl $atomic_type {
            /// Creates a new atomic integer.
            #[inline]
            pub const fn new(v: $int_type) -> Self {
                Self { inner: imp::$atomic_type::new(v), _marker: PhantomData }
            }

            /// Returns `true` if operations on values of this type are lock-free.
            ///
            /// If the compiler or the platform doesn't support the necessary
            /// atomic instructions, global locks for every potentially
            /// concurrent atomic operation will be used.
            #[inline]
            pub fn is_lock_free() -> bool {
                <imp::$atomic_type as crate::utils::AtomicRepr>::is_lock_free()
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
                <imp::$atomic_type as crate::utils::AtomicRepr>::IS_ALWAYS_LOCK_FREE
            }

            /// Returns a mutable reference to the underlying integer.
            ///
            /// This is safe because the mutable reference guarantees that no other threads are
            /// concurrently accessing the atomic data.
            #[inline]
            pub fn get_mut(&mut self) -> &mut $int_type {
                self.inner.get_mut()
            }

            // TODO: Add from_mut once it is stable on other std atomic types.
            // https://github.com/rust-lang/rust/issues/76314

            /// Consumes the atomic and returns the contained value.
            ///
            /// This is safe because passing `self` by value guarantees that no other threads are
            /// concurrently accessing the atomic data.
            #[inline]
            pub fn into_inner(self) -> $int_type {
                self.inner.into_inner()
            }

            /// Loads a value from the atomic integer.
            ///
            /// `load` takes an [`Ordering`] argument which describes the memory ordering of this operation.
            /// Possible values are [`SeqCst`], [`Acquire`] and [`Relaxed`].
            ///
            /// # Panics
            ///
            /// Panics if `order` is [`Release`] or [`AcqRel`].
            #[inline]
            pub fn load(&self, order: Ordering) -> $int_type {
                self.inner.load(order)
            }

            /// Stores a value into the atomic integer.
            ///
            /// `store` takes an [`Ordering`] argument which describes the memory ordering of this operation.
            ///  Possible values are [`SeqCst`], [`Release`] and [`Relaxed`].
            ///
            /// # Panics
            ///
            /// Panics if `order` is [`Acquire`] or [`AcqRel`].
            #[inline]
            pub fn store(&self, val: $int_type, order: Ordering) {
                self.inner.store(val, order)
            }

            /// Stores a value into the atomic integer, returning the previous value.
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
            pub fn swap(&self, val: $int_type, order: Ordering) -> $int_type {
                self.inner.swap(val, order)
            }

            /// Stores a value into the atomic integer if the current value is the same as
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
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                self.inner.compare_exchange(current, new, success, failure)
            }

            /// Stores a value into the atomic integer if the current value is the same as
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
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                self.inner.compare_exchange_weak(current, new, success, failure)
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
            pub fn fetch_add(&self, val: $int_type, order: Ordering) -> $int_type {
                self.inner.fetch_add(val, order)
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
            pub fn fetch_sub(&self, val: $int_type, order: Ordering) -> $int_type {
                self.inner.fetch_sub(val, order)
            }

            /// Bitwise "and" with the current value.
            ///
            /// Performs a bitwise "and" operation on the current value and the argument `val`, and
            /// sets the new value to the result.
            ///
            /// Returns the previous value.
            ///
            /// `fetch_and` takes an [`Ordering`] argument which describes the memory ordering
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
            pub fn fetch_and(&self, val: $int_type, order: Ordering) -> $int_type {
                self.inner.fetch_and(val, order)
            }

            /// Bitwise "nand" with the current value.
            ///
            /// Performs a bitwise "nand" operation on the current value and the argument `val`, and
            /// sets the new value to the result.
            ///
            /// Returns the previous value.
            ///
            /// `fetch_nand` takes an [`Ordering`] argument which describes the memory ordering
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
            pub fn fetch_nand(&self, val: $int_type, order: Ordering) -> $int_type {
                self.inner.fetch_nand(val, order)
            }

            /// Bitwise "or" with the current value.
            ///
            /// Performs a bitwise "or" operation on the current value and the argument `val`, and
            /// sets the new value to the result.
            ///
            /// Returns the previous value.
            ///
            /// `fetch_or` takes an [`Ordering`] argument which describes the memory ordering
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
            pub fn fetch_or(&self, val: $int_type, order: Ordering) -> $int_type {
                self.inner.fetch_or(val, order)
            }

            /// Bitwise "xor" with the current value.
            ///
            /// Performs a bitwise "xor" operation on the current value and the argument `val`, and
            /// sets the new value to the result.
            ///
            /// Returns the previous value.
            ///
            /// `fetch_xor` takes an [`Ordering`] argument which describes the memory ordering
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
            pub fn fetch_xor(&self, val: $int_type, order: Ordering) -> $int_type {
                self.inner.fetch_xor(val, order)
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
            ) -> Result<$int_type, $int_type>
            where
                F: FnMut($int_type) -> Option<$int_type>,
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
            pub fn fetch_max(&self, val: $int_type, order: Ordering) -> $int_type {
                #[cfg(not(portable_atomic_no_atomic_min_max))]
                {
                    #[cfg(any(
                        armv5te,
                        all(target_arch = "mips", target_endian = "little"),
                        all(target_arch = "mips64", target_endian = "little"),
                        target_arch = "powerpc",
                        target_arch = "powerpc64",
                    ))]
                    {
                        // HACK: the following operations are currently broken (at least on qemu):
                        // - armv5te's `Atomic{I,U}{8,16}::fetch_{max,min}`
                        // - mipsel's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - mips64el's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - powerpc's `AtomicI{8,16}::fetch_{max,min}`
                        // - powerpc64's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - powerpc64le's `AtomicU{8,16}::fetch_{max,min}` (release mode + fat LTO)
                        if core::mem::size_of::<$int_type>() <= 2 {
                            return self
                                .fetch_update(
                                    order,
                                    crate::utils::strongest_failure_ordering(order),
                                    |x| Some(core::cmp::max(x, val)),
                                )
                                .unwrap();
                        }
                    }
                    self.inner.fetch_max(val, order)
                }
                #[cfg(portable_atomic_no_atomic_min_max)]
                {
                    self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                        Some(core::cmp::max(x, val))
                    })
                    .unwrap()
                }
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
            pub fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
                #[cfg(not(portable_atomic_no_atomic_min_max))]
                {
                    #[cfg(any(
                        armv5te,
                        all(target_arch = "mips", target_endian = "little"),
                        all(target_arch = "mips64", target_endian = "little"),
                        target_arch = "powerpc",
                        target_arch = "powerpc64",
                    ))]
                    {
                        // HACK: the following operations are currently broken (at least on qemu):
                        // - armv5te's `Atomic{I,U}{8,16}::fetch_{max,min}`
                        // - mipsel's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - mips64el's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - powerpc's `AtomicI{8,16}::fetch_{max,min}`
                        // - powerpc64's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - powerpc64le's `AtomicU{8,16}::fetch_{max,min}` (release mode + fat LTO)
                        if core::mem::size_of::<$int_type>() <= 2 {
                            return self
                                .fetch_update(
                                    order,
                                    crate::utils::strongest_failure_ordering(order),
                                    |x| Some(core::cmp::min(x, val)),
                                )
                                .unwrap();
                        }
                    }
                    self.inner.fetch_min(val, order)
                }
                #[cfg(portable_atomic_no_atomic_min_max)]
                {
                    self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                        Some(core::cmp::min(x, val))
                    })
                    .unwrap()
                }
            }

            // TODO: Add as_mut_ptr once it is stable on other std atomic types.
            // https://github.com/rust-lang/rust/issues/66893
        }
    };
}

#[cfg(target_pointer_width = "16")]
atomic_int!(AtomicIsize, isize, 2);
#[cfg(target_pointer_width = "16")]
atomic_int!(AtomicUsize, usize, 2);
#[cfg(target_pointer_width = "32")]
atomic_int!(AtomicIsize, isize, 4);
#[cfg(target_pointer_width = "32")]
atomic_int!(AtomicUsize, usize, 4);
#[cfg(target_pointer_width = "64")]
atomic_int!(AtomicIsize, isize, 8);
#[cfg(target_pointer_width = "64")]
atomic_int!(AtomicUsize, usize, 8);
#[cfg(target_pointer_width = "128")]
atomic_int!(AtomicIsize, isize, 16);
#[cfg(target_pointer_width = "128")]
atomic_int!(AtomicUsize, usize, 16);

atomic_int!(AtomicI8, i8, 1);
atomic_int!(AtomicU8, u8, 1);
atomic_int!(AtomicI16, i16, 2);
atomic_int!(AtomicU16, u16, 2);

// cfg(any(target_has_atomic_load_store = "32", target_arch = "riscv32", portable_atomic_unsafe_assume_single_core))
#[cfg(any(not(target_pointer_width = "16"), portable_atomic_unsafe_assume_single_core))]
atomic_int!(AtomicI32, i32, 4);
#[cfg(any(not(target_pointer_width = "16"), portable_atomic_unsafe_assume_single_core))]
atomic_int!(AtomicU32, u32, 4);

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
atomic_int!(AtomicI64, i64, 8);
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
atomic_int!(AtomicU64, u64, 8);

#[cfg(feature = "i128")]
#[cfg_attr(
    not(portable_atomic_cfg_target_has_atomic),
    cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
)]
#[cfg_attr(
    portable_atomic_cfg_target_has_atomic,
    cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
)]
atomic_int!(
    #[cfg_attr(docsrs, doc(cfg(any(feature = "i128", feature = "i128-dynamic"))))]
    AtomicI128,
    i128,
    16
);
#[cfg(feature = "i128")]
#[cfg_attr(
    not(portable_atomic_cfg_target_has_atomic),
    cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
)]
#[cfg_attr(
    portable_atomic_cfg_target_has_atomic,
    cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
)]
atomic_int!(
    #[cfg_attr(docsrs, doc(cfg(any(feature = "i128", feature = "i128-dynamic"))))]
    AtomicU128,
    u128,
    16
);
