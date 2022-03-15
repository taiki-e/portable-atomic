#[cfg(doc)]
use core::sync::atomic::Ordering::{AcqRel, Acquire, Relaxed, Release, SeqCst};
use core::{fmt, marker::PhantomData, ptr, sync::atomic::Ordering};

use crate::{imp, utils::NoRefUnwindSafe};

/// A boolean type which can be safely shared between threads.
///
/// This type has the same in-memory representation as a [`bool`].
///
/// If the compiler or the platform supports atomic loads and stores of `u8`,
/// this type is a wrapper for the standard library's
/// [`AtomicBool`](core::sync::atomic::AtomicBool).
// We can use #[repr(transparent)] here, but #[repr(C, align(N))]
// will show clearer docs.
#[repr(C, align(1))]
pub struct AtomicBool {
    inner: imp::AtomicBool,
    // Prevent RefUnwindSafe from being propagated from the std atomic type.
    _marker: PhantomData<NoRefUnwindSafe>,
}

static_assert_layout!(AtomicBool, bool);

impl Default for AtomicBool {
    /// Creates an `AtomicBool` initialized to `false`.
    #[inline]
    fn default() -> Self {
        Self::new(false)
    }
}

impl From<bool> for AtomicBool {
    /// Converts a `bool` into an `AtomicBool`.
    #[inline]
    fn from(b: bool) -> Self {
        Self::new(b)
    }
}

impl fmt::Debug for AtomicBool {
    #[allow(clippy::missing_inline_in_public_items)] // fmt is not hot path
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        // std atomic types use SeqCst in Debug::fmt: https://github.com/rust-lang/rust/blob/1.59.0/library/core/src/sync/atomic.rs#L1378
        fmt::Debug::fmt(&self.load(Ordering::SeqCst), f)
    }
}

// UnwindSafe is implicitly implemented.
#[cfg(not(portable_atomic_no_core_unwind_safe))]
impl core::panic::RefUnwindSafe for AtomicBool {}
#[cfg(all(portable_atomic_no_core_unwind_safe, feature = "std"))]
impl std::panic::RefUnwindSafe for AtomicBool {}

serde_impls!(AtomicBool);

impl AtomicBool {
    /// Creates a new `AtomicBool`.
    #[inline]
    #[must_use]
    pub const fn new(v: bool) -> Self {
        Self { inner: imp::AtomicBool::new(v), _marker: PhantomData }
    }

    /// Returns `true` if operations on values of this type are lock-free.
    ///
    /// If the compiler or the platform doesn't support the necessary
    /// atomic instructions, global locks for every potentially
    /// concurrent atomic operation will be used.
    #[inline]
    pub fn is_lock_free() -> bool {
        <imp::AtomicBool as crate::utils::AtomicRepr>::is_lock_free()
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
        <imp::AtomicBool as crate::utils::AtomicRepr>::IS_ALWAYS_LOCK_FREE
    }

    /// Returns a mutable reference to the underlying [`bool`].
    ///
    /// This is safe because the mutable reference guarantees that no other threads are
    /// concurrently accessing the atomic data.
    #[inline]
    pub fn get_mut(&mut self) -> &mut bool {
        self.inner.get_mut()
    }

    // TODO: Add from_mut once it is stable on other std atomic types.
    // https://github.com/rust-lang/rust/issues/76314

    /// Consumes the atomic and returns the contained value.
    ///
    /// This is safe because passing `self` by value guarantees that no other threads are
    /// concurrently accessing the atomic data.
    #[inline]
    pub fn into_inner(self) -> bool {
        self.inner.into_inner()
    }

    /// Loads a value from the bool.
    ///
    /// `load` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. Possible values are [`SeqCst`], [`Acquire`] and [`Relaxed`].
    ///
    /// # Panics
    ///
    /// Panics if `order` is [`Release`] or [`AcqRel`].
    #[inline]
    pub fn load(&self, order: Ordering) -> bool {
        self.inner.load(order)
    }

    /// Stores a value into the bool.
    ///
    /// `store` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. Possible values are [`SeqCst`], [`Release`] and [`Relaxed`].
    ///
    /// # Panics
    ///
    /// Panics if `order` is [`Acquire`] or [`AcqRel`].
    #[inline]
    pub fn store(&self, val: bool, order: Ordering) {
        self.inner.store(val, order);
    }

    /// Stores a value into the bool, returning the previous value.
    ///
    /// `swap` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    #[cfg_attr(
        not(portable_atomic_cfg_target_has_atomic),
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        portable_atomic_cfg_target_has_atomic,
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    pub fn swap(&self, val: bool, order: Ordering) -> bool {
        self.inner.swap(val, order)
    }

    /// Stores a value into the [`bool`] if the current value is the same as the `current` value.
    ///
    /// The return value is a result indicating whether the new value was written and containing
    /// the previous value. On success this value is guaranteed to be equal to `current`.
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
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        portable_atomic_cfg_target_has_atomic,
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
    pub fn compare_exchange(
        &self,
        current: bool,
        new: bool,
        success: Ordering,
        failure: Ordering,
    ) -> Result<bool, bool> {
        self.inner.compare_exchange(current, new, success, failure)
    }

    /// Stores a value into the [`bool`] if the current value is the same as the `current` value.
    ///
    /// Unlike [`AtomicBool::compare_exchange`], this function is allowed to spuriously fail even when the
    /// comparison succeeds, which can result in more efficient code on some platforms. The
    /// return value is a result indicating whether the new value was written and containing the
    /// previous value.
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
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        portable_atomic_cfg_target_has_atomic,
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
    pub fn compare_exchange_weak(
        &self,
        current: bool,
        new: bool,
        success: Ordering,
        failure: Ordering,
    ) -> Result<bool, bool> {
        self.inner.compare_exchange_weak(current, new, success, failure)
    }

    /// Logical "and" with a boolean value.
    ///
    /// Performs a logical "and" operation on the current value and the argument `val`, and sets
    /// the new value to the result.
    ///
    /// Returns the previous value.
    ///
    /// `fetch_and` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    #[cfg_attr(
        not(portable_atomic_cfg_target_has_atomic),
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        portable_atomic_cfg_target_has_atomic,
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    pub fn fetch_and(&self, val: bool, order: Ordering) -> bool {
        self.inner.fetch_and(val, order)
    }

    /// Logical "nand" with a boolean value.
    ///
    /// Performs a logical "nand" operation on the current value and the argument `val`, and sets
    /// the new value to the result.
    ///
    /// Returns the previous value.
    ///
    /// `fetch_nand` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    #[cfg_attr(
        not(portable_atomic_cfg_target_has_atomic),
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        portable_atomic_cfg_target_has_atomic,
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    pub fn fetch_nand(&self, val: bool, order: Ordering) -> bool {
        self.inner.fetch_nand(val, order)
    }

    /// Logical "or" with a boolean value.
    ///
    /// Performs a logical "or" operation on the current value and the argument `val`, and sets the
    /// new value to the result.
    ///
    /// Returns the previous value.
    ///
    /// `fetch_or` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    #[cfg_attr(
        not(portable_atomic_cfg_target_has_atomic),
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        portable_atomic_cfg_target_has_atomic,
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    pub fn fetch_or(&self, val: bool, order: Ordering) -> bool {
        self.inner.fetch_or(val, order)
    }

    /// Logical "xor" with a boolean value.
    ///
    /// Performs a logical "xor" operation on the current value and the argument `val`, and sets
    /// the new value to the result.
    ///
    /// Returns the previous value.
    ///
    /// `fetch_xor` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    #[cfg_attr(
        not(portable_atomic_cfg_target_has_atomic),
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        portable_atomic_cfg_target_has_atomic,
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    pub fn fetch_xor(&self, val: bool, order: Ordering) -> bool {
        self.inner.fetch_xor(val, order)
    }

    // TODO: Add as_mut_ptr once it is stable on other std atomic types.
    // https://github.com/rust-lang/rust/issues/66893

    /// Fetches the value, and applies a function to it that returns an optional
    /// new value. Returns a `Result` of `Ok(previous_value)` if the function
    /// returned `Some(_)`, else `Err(previous_value)`.
    ///
    /// Note: This may call the function multiple times if the value has been
    /// changed from other threads in the meantime, as long as the function
    /// returns `Some(_)`, but the function will have been applied only once to
    /// the stored value.
    ///
    /// `fetch_update` takes two [`Ordering`] arguments to describe the memory
    /// ordering of this operation. The first describes the required ordering for
    /// when the operation finally succeeds while the second describes the
    /// required ordering for loads. These correspond to the success and failure
    /// orderings of [`AtomicBool::compare_exchange`] respectively.
    ///
    /// Using [`Acquire`] as success ordering makes the store part of this
    /// operation [`Relaxed`], and using [`Release`] makes the final successful
    /// load [`Relaxed`]. The (failed) load ordering can only be [`SeqCst`],
    /// [`Acquire`] or [`Relaxed`] and must be equivalent to or weaker than the
    /// success ordering.
    #[cfg_attr(
        not(portable_atomic_cfg_target_has_atomic),
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
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
    ) -> Result<bool, bool>
    where
        F: FnMut(bool) -> Option<bool>,
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
}

/// A raw pointer type which can be safely shared between threads.
///
/// This type has the same in-memory representation as a `*mut T`.
///
/// If the compiler or the platform supports atomic loads and stores of pointers,
/// this type is a wrapper for the standard library's
/// [`AtomicPtr`](core::sync::atomic::AtomicPtr).
// We can use #[repr(transparent)] here, but #[repr(C, align(N))]
// will show clearer docs.
#[cfg_attr(target_pointer_width = "16", repr(C, align(2)))]
#[cfg_attr(target_pointer_width = "32", repr(C, align(4)))]
#[cfg_attr(target_pointer_width = "64", repr(C, align(8)))]
#[cfg_attr(target_pointer_width = "128", repr(C, align(16)))]
pub struct AtomicPtr<T> {
    inner: imp::AtomicPtr<T>,
    // Prevent RefUnwindSafe from being propagated from the std atomic type.
    _marker: PhantomData<NoRefUnwindSafe>,
}

static_assert_layout!(AtomicPtr<()>, *mut ());

impl<T> Default for AtomicPtr<T> {
    /// Creates a null `AtomicPtr<T>`.
    #[inline]
    fn default() -> Self {
        Self::new(ptr::null_mut())
    }
}

impl<T> From<*mut T> for AtomicPtr<T> {
    #[inline]
    fn from(p: *mut T) -> Self {
        Self::new(p)
    }
}

impl<T> fmt::Debug for AtomicPtr<T> {
    #[allow(clippy::missing_inline_in_public_items)] // fmt is not hot path
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        // std atomic types use SeqCst in Debug::fmt: https://github.com/rust-lang/rust/blob/1.59.0/library/core/src/sync/atomic.rs#L1378
        fmt::Debug::fmt(&self.load(Ordering::SeqCst), f)
    }
}

impl<T> fmt::Pointer for AtomicPtr<T> {
    #[allow(clippy::missing_inline_in_public_items)] // fmt is not hot path
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        // std atomic types use SeqCst in Debug::fmt: https://github.com/rust-lang/rust/blob/1.59.0/library/core/src/sync/atomic.rs#L1378
        fmt::Pointer::fmt(&self.load(Ordering::SeqCst), f)
    }
}

// UnwindSafe is implicitly implemented.
#[cfg(not(portable_atomic_no_core_unwind_safe))]
impl<T> core::panic::RefUnwindSafe for AtomicPtr<T> {}
#[cfg(all(portable_atomic_no_core_unwind_safe, feature = "std"))]
impl<T> std::panic::RefUnwindSafe for AtomicPtr<T> {}

impl<T> AtomicPtr<T> {
    /// Creates a new `AtomicPtr`.
    #[inline]
    pub const fn new(p: *mut T) -> Self {
        Self { inner: imp::AtomicPtr::new(p), _marker: PhantomData }
    }

    /// Returns `true` if operations on values of this type are lock-free.
    ///
    /// If the compiler or the platform doesn't support the necessary
    /// atomic instructions, global locks for every potentially
    /// concurrent atomic operation will be used.
    #[inline]
    pub fn is_lock_free() -> bool {
        <imp::AtomicPtr<T> as crate::utils::AtomicRepr>::is_lock_free()
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
        <imp::AtomicPtr<T> as crate::utils::AtomicRepr>::IS_ALWAYS_LOCK_FREE
    }

    /// Returns a mutable reference to the underlying pointer.
    ///
    /// This is safe because the mutable reference guarantees that no other threads are
    /// concurrently accessing the atomic data.
    #[inline]
    pub fn get_mut(&mut self) -> &mut *mut T {
        self.inner.get_mut()
    }

    // TODO: Add from_mut once it is stable on other std atomic types.
    // https://github.com/rust-lang/rust/issues/76314

    /// Consumes the atomic and returns the contained value.
    ///
    /// This is safe because passing `self` by value guarantees that no other threads are
    /// concurrently accessing the atomic data.
    #[inline]
    pub fn into_inner(self) -> *mut T {
        self.inner.into_inner()
    }

    /// Loads a value from the pointer.
    ///
    /// `load` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. Possible values are [`SeqCst`], [`Acquire`] and [`Relaxed`].
    ///
    /// # Panics
    ///
    /// Panics if `order` is [`Release`] or [`AcqRel`].
    #[inline]
    pub fn load(&self, order: Ordering) -> *mut T {
        self.inner.load(order)
    }

    /// Stores a value into the pointer.
    ///
    /// `store` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. Possible values are [`SeqCst`], [`Release`] and [`Relaxed`].
    ///
    /// # Panics
    ///
    /// Panics if `order` is [`Acquire`] or [`AcqRel`].
    #[inline]
    pub fn store(&self, ptr: *mut T, order: Ordering) {
        self.inner.store(ptr, order);
    }

    /// Stores a value into the pointer, returning the previous value.
    ///
    /// `swap` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    #[cfg_attr(
        not(portable_atomic_cfg_target_has_atomic),
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        portable_atomic_cfg_target_has_atomic,
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    pub fn swap(&self, ptr: *mut T, order: Ordering) -> *mut T {
        self.inner.swap(ptr, order)
    }

    /// Stores a value into the pointer if the current value is the same as the `current` value.
    ///
    /// The return value is a result indicating whether the new value was written and containing
    /// the previous value. On success this value is guaranteed to be equal to `current`.
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
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        portable_atomic_cfg_target_has_atomic,
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
    pub fn compare_exchange(
        &self,
        current: *mut T,
        new: *mut T,
        success: Ordering,
        failure: Ordering,
    ) -> Result<*mut T, *mut T> {
        self.inner.compare_exchange(current, new, success, failure)
    }

    /// Stores a value into the pointer if the current value is the same as the `current` value.
    ///
    /// Unlike [`AtomicPtr::compare_exchange`], this function is allowed to spuriously fail even when the
    /// comparison succeeds, which can result in more efficient code on some platforms. The
    /// return value is a result indicating whether the new value was written and containing the
    /// previous value.
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
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        portable_atomic_cfg_target_has_atomic,
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
    pub fn compare_exchange_weak(
        &self,
        current: *mut T,
        new: *mut T,
        success: Ordering,
        failure: Ordering,
    ) -> Result<*mut T, *mut T> {
        self.inner.compare_exchange_weak(current, new, success, failure)
    }

    /// Fetches the value, and applies a function to it that returns an optional
    /// new value. Returns a `Result` of `Ok(previous_value)` if the function
    /// returned `Some(_)`, else `Err(previous_value)`.
    ///
    /// Note: This may call the function multiple times if the value has been
    /// changed from other threads in the meantime, as long as the function
    /// returns `Some(_)`, but the function will have been applied only once to
    /// the stored value.
    ///
    /// `fetch_update` takes two [`Ordering`] arguments to describe the memory
    /// ordering of this operation. The first describes the required ordering for
    /// when the operation finally succeeds while the second describes the
    /// required ordering for loads. These correspond to the success and failure
    /// orderings of [`AtomicPtr::compare_exchange`] respectively.
    ///
    /// Using [`Acquire`] as success ordering makes the store part of this
    /// operation [`Relaxed`], and using [`Release`] makes the final successful
    /// load [`Relaxed`]. The (failed) load ordering can only be [`SeqCst`],
    /// [`Acquire`] or [`Relaxed`] and must be equivalent to or weaker than the
    /// success ordering.
    #[cfg_attr(
        not(portable_atomic_cfg_target_has_atomic),
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
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
    ) -> Result<*mut T, *mut T>
    where
        F: FnMut(*mut T) -> Option<*mut T>,
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
}
