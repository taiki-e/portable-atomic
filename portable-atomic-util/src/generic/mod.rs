#![allow(missing_docs, clippy::undocumented_unsafe_blocks)] // TODO

mod impls;

#[cfg(doc)]
use core::sync::atomic::Ordering::{AcqRel, Acquire, Relaxed, Release, SeqCst};
use core::{
    cell::UnsafeCell,
    fmt,
    marker::PhantomData,
    mem::{self, ManuallyDrop},
    ptr,
    sync::atomic::Ordering,
};

use self::private::{
    AtomicArithmeticPriv, AtomicBitOpsPriv, AtomicMinMaxPriv, AtomicablePrimitivePriv,
};

#[cfg_attr(docsrs, doc(cfg(feature = "generic")))]
pub trait AtomicablePrimitive: AtomicablePrimitivePriv {}

#[cfg_attr(docsrs, doc(cfg(feature = "generic")))]
pub trait Atomicable: Sized {
    type Value: AtomicablePrimitive;

    fn to_val(self) -> Self::Value;

    /// # Panics
    ///
    /// If the value is not valid, this method will panic.
    ///
    /// This method will also panic if there is no safe way to create `Self`
    /// from `Self::Value`.
    fn from_val(val: Self::Value) -> Self;

    /// # Safety
    ///
    /// Behavior is undefined if any of the following conditions are violated:
    ///
    /// - The value must not be created in any other way than [`Atomicable::to_val`].
    /// - The value must not be modified by operations that are not allowed by the trait.
    /// - If the type contains lifetimes, the value must be alive and that the lifetime is [invariant][variance].
    /// - If the type is not `Copy`, the value must be unique.
    ///
    /// The implementor of this method must guarantee that conversion from a
    /// value that meets the above requirements will not result in undefined
    /// behavior.
    ///
    /// [variance]: https://doc.rust-lang.org/nomicon/subtyping.html#variance
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        Self::from_val(val)
    }

    // Ideally, this should be a constant, but it is a function because it must
    // be marked as unsafe.
    //
    // Note: conversions that may cause undefined behavior require unsafe code,
    // so at first glance it seems that the constant is fine, but users can
    // actually override them by combining them with existing Atomicable
    // implementations.
    /// Returns a token type that indicates whether `Relaxed` memory ordering is allowed.
    ///
    /// Atomic operations using [`Relaxed`] ordering are fine for plain data types,
    /// such as integers, but for types that must point to valid values, such as
    /// references, it is unsound because they may point to values that have already
    /// been replaced and dropped.
    ///
    /// # Safety
    ///
    /// The implementor of this method must guarantee that atomic operations in
    /// the [`Relaxed`] ordering will never cause undefined behavior.
    #[inline]
    unsafe fn allow_relaxed() -> AllowRelaxed {
        AllowRelaxed(false)
    }
}

/// A token type that indicates whether `Relaxed` memory ordering is allowed.
///
/// Atomic operations using [`Relaxed`] ordering are fine for plain data types,
/// such as integers, but for types that must point to valid values, such as
/// references, it is unsound because they may point to values that have already
/// been replaced and dropped.
#[cfg_attr(docsrs, doc(cfg(feature = "generic")))]
#[derive(Debug, Clone, Copy)]
#[must_use]
pub struct AllowRelaxed(bool);

impl AllowRelaxed {
    /// Creates a new `AllowRelaxed` token.
    ///
    /// # Safety
    ///
    /// If `allow` is true, the caller must guarantee that atomic operations in
    /// the [`Relaxed`] ordering will never cause undefined behavior.
    #[inline]
    pub const unsafe fn new(allow: bool) -> Self {
        AllowRelaxed(allow)
    }

    /// Returns true if `Relaxed` memory ordering is allowed.
    #[inline]
    #[must_use]
    pub fn is_allowed(self) -> bool {
        self.0
    }
}

/// # Safety
///
/// `T` must be `#[repr(C)]` or `#[repr(transparent)]` and have the same
/// in-memory representation as [`<T as Atomicable>::Value`](Atomicable::Value).
#[cfg_attr(docsrs, doc(cfg(feature = "generic")))]
pub unsafe trait Transmutable: Atomicable {}

/// # Safety
///
/// The implementer must guarantee that the resulting value of this operation will not be invalid.
#[cfg_attr(docsrs, doc(cfg(feature = "generic")))]
pub unsafe trait AtomicBitOps: Atomicable + Copy
where
    <Self as Atomicable>::Value: AtomicBitOpsPriv,
{
}

/// # Safety
///
/// The implementer must guarantee that the resulting value of this operation will not be invalid.
#[cfg_attr(docsrs, doc(cfg(feature = "generic")))]
pub unsafe trait AtomicArithmetic: Atomicable + Copy
where
    <Self as Atomicable>::Value: AtomicArithmeticPriv,
{
}

#[cfg_attr(docsrs, doc(cfg(feature = "generic")))]
pub trait AtomicMinMax: Atomicable + Copy
where
    <Self as Atomicable>::Value: AtomicMinMaxPriv,
{
}

/// A generic atomic type.
#[cfg_attr(docsrs, doc(cfg(feature = "generic")))]
#[repr(transparent)]
pub struct Atomic<T: Atomicable> {
    repr: <<T as Atomicable>::Value as AtomicablePrimitivePriv>::Atomic,
    // make T invariant and propagate auto traits from T
    _marker: PhantomData<UnsafeCell<T>>,
}

impl<T: Atomicable + Default> Default for Atomic<T> {
    #[inline]
    fn default() -> Self {
        Self::new(T::default())
    }
}

impl<T: Atomicable> From<T> for Atomic<T> {
    #[inline]
    fn from(v: T) -> Self {
        Self::new(v)
    }
}

impl<T: Atomicable + Copy + fmt::Debug> fmt::Debug for Atomic<T> {
    #[allow(clippy::missing_inline_in_public_items)] // fmt is not hot path
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        // std atomic types use SeqCst in Debug::fmt: https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L1378
        fmt::Debug::fmt(&self.load(Ordering::SeqCst), f)
    }
}

// Send is implicitly implemented.
unsafe impl<T: Atomicable + Send> Sync for Atomic<T> {}

// UnwindSafe is implicitly implemented.
#[cfg(not(portable_atomic_no_core_unwind_safe))]
impl<T: Atomicable> core::panic::RefUnwindSafe for Atomic<T> {}
#[cfg(all(portable_atomic_no_core_unwind_safe, feature = "std"))]
impl<T: Atomicable> std::panic::RefUnwindSafe for Atomic<T> {}

impl<T: Atomicable> Atomic<T> {
    /// Creates a new atomic value.
    #[inline]
    #[must_use]
    pub fn new(v: T) -> Self {
        Self { repr: <T::Value as AtomicablePrimitivePriv>::new(v.to_val()), _marker: PhantomData }
    }

    /// Creates a new atomic value.
    #[cfg(not(portable_atomic_no_const_fn_trait_bound))]
    #[inline]
    #[must_use]
    pub const fn const_new(v: T) -> Self
    where
        T: Transmutable,
    {
        // HACK: This is equivalent to transmute_copy by value, but available in const fn.
        #[repr(C)]
        union ConstHack<T, U> {
            t: ManuallyDrop<T>,
            u: ManuallyDrop<U>,
        }
        // SAFETY:
        // - `T: Transmutable` guarantees that the in-memory representations of
        //   `T` and `T::Value` are the same.
        // - `T::Value` implements `AtomicablePrimitivePriv` that guarantees
        //   that the in-memory representations of `T::Value` and
        //   `<T::Value as AtomicablePrimitivePriv>::Atomic` are the same.
        // Based on the above, `T` and `<T::Value as AtomicablePrimitivePriv>::Atomic`
        // have the same in-memory representation, so they can be safely transmuted.
        unsafe {
            Self {
                repr: ManuallyDrop::into_inner(
                    ConstHack::<T, <T::Value as AtomicablePrimitivePriv>::Atomic> {
                        t: ManuallyDrop::new(v),
                    }
                    .u,
                ),
                _marker: PhantomData,
            }
        }
    }

    /// Returns `true` if operations on values of this type are lock-free.
    ///
    /// If the compiler or the platform doesn't support the necessary
    /// atomic instructions, global locks for every potentially
    /// concurrent atomic operation will be used.
    #[inline]
    #[must_use]
    pub fn is_lock_free() -> bool {
        <T::Value as AtomicablePrimitivePriv>::is_lock_free()
    }

    /// Returns `true` if operations on values of this type are lock-free.
    ///
    /// If the compiler or the platform doesn't support the necessary
    /// atomic instructions, global locks for every potentially
    /// concurrent atomic operation will be used.
    ///
    /// **Note:** If the atomic operation relies on dynamic CPU feature detection,
    /// this type may be lock-free even if the function returns false.
    #[cfg(not(portable_atomic_no_const_fn_trait_bound))]
    #[inline]
    #[must_use]
    pub const fn is_always_lock_free() -> bool {
        <T::Value as AtomicablePrimitivePriv>::IS_ALWAYS_LOCK_FREE
    }

    /// Returns a mutable reference to the underlying value.
    ///
    /// This is safe because the mutable reference guarantees that no other threads are
    /// concurrently accessing the atomic data.
    #[inline]
    pub fn get_mut(&mut self) -> &mut T
    where
        T: Transmutable,
    {
        debug_assert!(mem::align_of::<Self>() >= mem::align_of::<T>());
        // SAFETY: `T: Transmutable` guarantees that `T` is `#[repr(C)]`
        // or `#[repr(transparent)]` and has the same in-memory representation
        // as `T::Value`.
        //
        // Our (and the standard library's) atomic types have the same alignment
        // as size, so we don't need to check the alignment when converting a
        // reference to atomic type *to* a reference to T.
        unsafe {
            &mut *(<T::Value as AtomicablePrimitivePriv>::get_mut(&mut self.repr) as *mut T::Value
                as *mut T)
        }
    }

    /// Consumes the atomic and returns the contained value.
    ///
    /// This is safe because passing `self` by value guarantees that no other threads are
    /// concurrently accessing the atomic data.
    #[inline]
    pub fn into_inner(self) -> T {
        let this = ManuallyDrop::new(self);
        unsafe {
            T::from_val_unchecked(<T::Value as AtomicablePrimitivePriv>::into_inner(ptr::read(
                &this.repr,
            )))
        }
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
    pub fn store(&self, val: T, order: Ordering) {
        assert_store_ordering(order);
        if mem::needs_drop::<T>() {
            drop(self.swap(val, order));
        } else {
            <T::Value as AtomicablePrimitivePriv>::store(
                &self.repr,
                val.to_val(),
                store_ordering(order, unsafe { T::allow_relaxed() }),
            );
        }
    }

    /// Stores a value into the atomic integer, returning the previous value.
    ///
    /// `swap` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    #[inline]
    pub fn swap(&self, val: T, order: Ordering) -> T {
        unsafe {
            T::from_val_unchecked(<T::Value as AtomicablePrimitivePriv>::swap(
                &self.repr,
                val.to_val(),
                swap_ordering(order, T::allow_relaxed()),
            ))
        }
    }
}

impl<T: Atomicable + Copy> Atomic<T> {
    /// Loads a value from the atomic integer.
    ///
    /// `load` takes an [`Ordering`] argument which describes the memory ordering of this operation.
    /// Possible values are [`SeqCst`], [`Acquire`] and [`Relaxed`].
    ///
    /// # Panics
    ///
    /// Panics if `order` is [`Release`] or [`AcqRel`].
    #[inline]
    pub fn load(&self, order: Ordering) -> T {
        assert_load_ordering(order);
        unsafe {
            T::from_val_unchecked(<T::Value as AtomicablePrimitivePriv>::load(
                &self.repr,
                load_ordering(order, T::allow_relaxed()),
            ))
        }
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
    #[inline]
    #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
    pub fn compare_exchange(
        &self,
        current: T,
        new: T,
        success: Ordering,
        failure: Ordering,
    ) -> Result<T, T> {
        assert_compare_exchange_ordering(success, failure);
        match <T::Value as AtomicablePrimitivePriv>::compare_exchange(
            &self.repr,
            current.to_val(),
            new.to_val(),
            swap_ordering(success, unsafe { T::allow_relaxed() }),
            load_ordering(failure, unsafe { T::allow_relaxed() }),
        ) {
            Ok(v) => Ok(unsafe { T::from_val_unchecked(v) }),
            Err(v) => Err(unsafe { T::from_val_unchecked(v) }),
        }
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
    #[inline]
    #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
    pub fn compare_exchange_weak(
        &self,
        current: T,
        new: T,
        success: Ordering,
        failure: Ordering,
    ) -> Result<T, T> {
        assert_compare_exchange_ordering(success, failure);
        match <T::Value as AtomicablePrimitivePriv>::compare_exchange_weak(
            &self.repr,
            current.to_val(),
            new.to_val(),
            swap_ordering(success, unsafe { T::allow_relaxed() }),
            load_ordering(failure, unsafe { T::allow_relaxed() }),
        ) {
            Ok(v) => Ok(unsafe { T::from_val_unchecked(v) }),
            Err(v) => Err(unsafe { T::from_val_unchecked(v) }),
        }
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
    #[inline]
    pub fn fetch_update<F>(
        &self,
        set_order: Ordering,
        fetch_order: Ordering,
        mut f: F,
    ) -> Result<T, T>
    where
        F: FnMut(T) -> Option<T>,
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

impl<T: Atomicable + AtomicArithmetic> Atomic<T>
where
    T::Value: AtomicArithmeticPriv,
{
    /// Adds to the current value, returning the previous value.
    ///
    /// This operation wraps around on overflow.
    ///
    /// `fetch_add` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    #[inline]
    pub fn fetch_add(&self, val: T, order: Ordering) -> T {
        unsafe {
            T::from_val_unchecked(<T::Value as AtomicArithmeticPriv>::fetch_add(
                &self.repr,
                val.to_val(),
                swap_ordering(order, T::allow_relaxed()),
            ))
        }
    }

    /// Subtracts from the current value, returning the previous value.
    ///
    /// This operation wraps around on overflow.
    ///
    /// `fetch_sub` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    #[inline]
    pub fn fetch_sub(&self, val: T, order: Ordering) -> T {
        unsafe {
            T::from_val_unchecked(<T::Value as AtomicArithmeticPriv>::fetch_sub(
                &self.repr,
                val.to_val(),
                swap_ordering(order, T::allow_relaxed()),
            ))
        }
    }
}

impl<T: Atomicable + AtomicBitOps> Atomic<T>
where
    T::Value: AtomicBitOpsPriv,
{
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
    #[inline]
    pub fn fetch_and(&self, val: T, order: Ordering) -> T {
        unsafe {
            T::from_val_unchecked(<T::Value as AtomicBitOpsPriv>::fetch_and(
                &self.repr,
                val.to_val(),
                swap_ordering(order, T::allow_relaxed()),
            ))
        }
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
    #[inline]
    pub fn fetch_nand(&self, val: T, order: Ordering) -> T {
        unsafe {
            T::from_val_unchecked(<T::Value as AtomicBitOpsPriv>::fetch_nand(
                &self.repr,
                val.to_val(),
                swap_ordering(order, T::allow_relaxed()),
            ))
        }
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
    #[inline]
    pub fn fetch_or(&self, val: T, order: Ordering) -> T {
        unsafe {
            T::from_val_unchecked(<T::Value as AtomicBitOpsPriv>::fetch_or(
                &self.repr,
                val.to_val(),
                swap_ordering(order, T::allow_relaxed()),
            ))
        }
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
    #[inline]
    pub fn fetch_xor(&self, val: T, order: Ordering) -> T {
        unsafe {
            T::from_val_unchecked(<T::Value as AtomicBitOpsPriv>::fetch_xor(
                &self.repr,
                val.to_val(),
                swap_ordering(order, T::allow_relaxed()),
            ))
        }
    }
}

impl<T: Atomicable + AtomicMinMax> Atomic<T>
where
    T::Value: AtomicMinMaxPriv,
{
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
    #[inline]
    pub fn fetch_max(&self, val: T, order: Ordering) -> T {
        unsafe {
            T::from_val_unchecked(<T::Value as AtomicMinMaxPriv>::fetch_max(
                &self.repr,
                val.to_val(),
                swap_ordering(order, T::allow_relaxed()),
            ))
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
    #[inline]
    pub fn fetch_min(&self, val: T, order: Ordering) -> T {
        unsafe {
            T::from_val_unchecked(<T::Value as AtomicMinMaxPriv>::fetch_min(
                &self.repr,
                val.to_val(),
                swap_ordering(order, T::allow_relaxed()),
            ))
        }
    }
}

impl<T: Atomicable> Drop for Atomic<T> {
    #[inline]
    fn drop(&mut self) {
        if mem::needs_drop::<T>() {
            unsafe {
                drop(T::from_val_unchecked(ptr::read(
                    <T::Value as AtomicablePrimitivePriv>::get_mut(&mut self.repr),
                )));
            }
        }
    }
}

// https://github.com/rust-lang/rust/blob/7b68106ffb71f853ea32f0e0dc0785d9d647cbbf/library/core/src/sync/atomic.rs#L2624
#[inline]
#[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
pub(crate) fn assert_load_ordering(order: Ordering) {
    match order {
        Ordering::Acquire | Ordering::Relaxed | Ordering::SeqCst => {}
        Ordering::Release => panic!("there is no such thing as a release load"),
        Ordering::AcqRel => panic!("there is no such thing as an acquire-release load"),
        _ => unreachable!("{:?}", order),
    }
}

// https://github.com/rust-lang/rust/blob/7b68106ffb71f853ea32f0e0dc0785d9d647cbbf/library/core/src/sync/atomic.rs#L2610
#[inline]
#[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
pub(crate) fn assert_store_ordering(order: Ordering) {
    match order {
        Ordering::Release | Ordering::Relaxed | Ordering::SeqCst => {}
        Ordering::Acquire => panic!("there is no such thing as an acquire store"),
        Ordering::AcqRel => panic!("there is no such thing as an acquire-release store"),
        _ => unreachable!("{:?}", order),
    }
}

// https://github.com/rust-lang/rust/pull/98383
// https://github.com/rust-lang/rust/blob/7b68106ffb71f853ea32f0e0dc0785d9d647cbbf/library/core/src/sync/atomic.rs#L2686
#[inline]
#[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
pub(crate) fn assert_compare_exchange_ordering(success: Ordering, failure: Ordering) {
    match success {
        Ordering::AcqRel
        | Ordering::Acquire
        | Ordering::Relaxed
        | Ordering::Release
        | Ordering::SeqCst => {}
        _ => unreachable!("{:?}, {:?}", success, failure),
    }
    match failure {
        Ordering::Acquire | Ordering::Relaxed | Ordering::SeqCst => {}
        Ordering::Release => panic!("there is no such thing as a release failure ordering"),
        Ordering::AcqRel => panic!("there is no such thing as an acquire-release failure ordering"),
        _ => unreachable!("{:?}, {:?}", success, failure),
    }
}

#[inline]
fn load_ordering(order: Ordering, allow_relaxed: AllowRelaxed) -> Ordering {
    if allow_relaxed.0 {
        order
    } else {
        match order {
            Ordering::Acquire | Ordering::Relaxed => Ordering::Acquire,
            Ordering::SeqCst => Ordering::SeqCst,
            _ => unreachable!("{:?}", order),
        }
    }
}
#[inline]
fn store_ordering(order: Ordering, allow_relaxed: AllowRelaxed) -> Ordering {
    if allow_relaxed.0 {
        order
    } else {
        match order {
            Ordering::Release | Ordering::Relaxed => Ordering::Release,
            Ordering::SeqCst => Ordering::SeqCst,
            _ => unreachable!("{:?}", order),
        }
    }
}
#[inline]
fn swap_ordering(order: Ordering, allow_relaxed: AllowRelaxed) -> Ordering {
    if allow_relaxed.0 {
        order
    } else {
        match order {
            Ordering::Relaxed | Ordering::Acquire | Ordering::Release | Ordering::AcqRel => {
                Ordering::AcqRel
            }
            Ordering::SeqCst => Ordering::SeqCst,
            _ => unreachable!("{:?}", order),
        }
    }
}

mod private {
    use core::sync::atomic::Ordering;

    /// # Safety
    ///
    /// The in-memory representations of `Self` and `Self::Atomic` must be the same.
    pub trait AtomicablePrimitivePriv: Copy {
        type Atomic: Sized + Send + Sync;
        const IS_ALWAYS_LOCK_FREE: bool;
        fn default() -> Self;
        fn new(v: Self) -> Self::Atomic;
        fn is_lock_free() -> bool;
        fn get_mut(a: &mut Self::Atomic) -> &mut Self;
        fn into_inner(a: Self::Atomic) -> Self;
        fn load(a: &Self::Atomic, order: Ordering) -> Self;
        fn store(a: &Self::Atomic, val: Self, order: Ordering);
        fn swap(a: &Self::Atomic, val: Self, order: Ordering) -> Self;
        fn compare_exchange(
            a: &Self::Atomic,
            current: Self,
            new: Self,
            success: Ordering,
            failure: Ordering,
        ) -> Result<Self, Self>;
        fn compare_exchange_weak(
            a: &Self::Atomic,
            current: Self,
            new: Self,
            success: Ordering,
            failure: Ordering,
        ) -> Result<Self, Self>;
    }

    pub trait AtomicBitOpsPriv: AtomicablePrimitivePriv {
        fn fetch_and(a: &Self::Atomic, val: Self, order: Ordering) -> Self;
        fn fetch_nand(a: &Self::Atomic, val: Self, order: Ordering) -> Self;
        fn fetch_or(a: &Self::Atomic, val: Self, order: Ordering) -> Self;
        fn fetch_xor(a: &Self::Atomic, val: Self, order: Ordering) -> Self;
    }

    pub trait AtomicArithmeticPriv: AtomicablePrimitivePriv {
        fn fetch_add(a: &Self::Atomic, val: Self, order: Ordering) -> Self;
        fn fetch_sub(a: &Self::Atomic, val: Self, order: Ordering) -> Self;
    }

    pub trait AtomicMinMaxPriv: AtomicablePrimitivePriv {
        fn fetch_max(a: &Self::Atomic, val: Self, order: Ordering) -> Self;
        fn fetch_min(a: &Self::Atomic, val: Self, order: Ordering) -> Self;
    }
}
