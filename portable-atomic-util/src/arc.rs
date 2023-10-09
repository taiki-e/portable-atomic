// SPDX-License-Identifier: Apache-2.0 OR MIT

//! An implementation of the standard library's `Arc` type using `portable-atomic`.

use portable_atomic::{
    AtomicUsize,
    Ordering::{Acquire, Relaxed, Release},
};

use alloc::boxed::Box;

use core::{
    borrow::Borrow,
    fmt,
    hash::Hash,
    isize,
    marker::PhantomData,
    mem,
    ops::Deref,
    pin::Pin,
    ptr::{self, NonNull},
    usize,
};

const MAX_REFCOUNT: usize = (isize::MAX as usize) - 1;

#[cfg(not(portable_atomic_sanitize_thread))]
macro_rules! acquire {
    ($x:expr) => {{
        portable_atomic::fence(Acquire);
    }};
}

#[cfg(portable_atomic_sanitize_thread)]
macro_rules! acquire {
    ($x:expr) => {{
        ($x).load(Acquire);
    }};
}

/// The inner heap allocation of an `Arc`.
#[repr(C)]
struct Shared<T: ?Sized> {
    /// The reference count of the `Arc`.
    header: Header,

    /// The value that is being reference counted.
    value: T,
}

#[repr(C)]
struct Header {
    /// The current strong reference count.
    ///
    /// As long as this is greater than zero, the `value` is initialized.
    strong: AtomicUsize,

    /// The weak reference count.
    ///
    /// This includes an intrinsic weak reference held by the strong pointers.
    /// The allocation should be deallocated when this reaches zero.
    weak: AtomicUsize,
}

impl<T: ?Sized> Shared<T> {
    /// Get the strong count.
    fn strong(&self) -> &AtomicUsize {
        &self.header.strong
    }

    /// Get the weak count.
    fn weak(&self) -> &AtomicUsize {
        &self.header.weak
    }
}

/// A thread-safe, strongly reference counted pointer.
///
/// This is an equivalent to [`std::sync::Arc`], but using [`portable-atomic`] for synchronization.
/// See the documentation for the standard library's [`Arc`] for more details.
///
/// [`std::sync::Arc`]: https://doc.rust-lang.org/std/sync/struct.Arc.html
/// [`portable-atomic`]: https://crates.io/crates/portable-atomic
/// [`Arc`]: https://doc.rust-lang.org/std/sync/struct.Arc.html
///
/// # Examples
///
/// ```
/// use portable_atomic_util::Arc;
/// use std::thread;
///
/// let five = Arc::new(5);
///
/// for _ in 0..10 {
///     let five = Arc::clone(&five);
///     thread::spawn(move || {
///         assert_eq!(*five, 5);
///     });
/// }
/// # if cfg!(miri) { std::thread::sleep(std::time::Duration::from_millis(500)); } // wait for background threads closed: https://github.com/rust-lang/miri/issues/1371
/// ```
pub struct Arc<T: ?Sized> {
    /// The inner heap allocation.
    shared: NonNull<Shared<T>>,

    _marker: PhantomData<Shared<T>>,
}

/// A weakly reference counted pointer.
///
/// This is an equivalent to [`std::sync::Weak`], but using [`portable-atomic`] for synchronization.
/// See the documentation for the standard library's [`Weak`] for more details.
///
/// [`std::sync::Weak`]: https://doc.rust-lang.org/std/sync/struct.Weak.html
/// [`portable-atomic`]: https://crates.io/crates/portable-atomic
/// [`Weak`]: https://doc.rust-lang.org/std/sync/struct.Weak.html
///
/// # Examples
///
/// ```
/// use portable_atomic_util::Arc;
/// use std::thread;
///
/// let five = Arc::new(5);
/// let weak_five = Arc::downgrade(&five);
///
/// # let t =
/// thread::spawn(move || {
///     let five = weak_five.upgrade().unwrap();
///     assert_eq!(*five, 5);
/// });
/// # t.join().unwrap(); // join thread to avoid https://github.com/rust-lang/miri/issues/1371
/// ```
pub struct Weak<T: ?Sized> {
    /// The inner heap allocation.
    shared: NonNull<Shared<T>>,
}

// SAFETY: This value is accessible from many threads, it has to be Sync.
unsafe impl<T: ?Sized + Send + Sync> Send for Arc<T> {}
// SAFETY: This value is accessible from many threads, it has to be Sync.
unsafe impl<T: ?Sized + Send + Sync> Sync for Arc<T> {}
// SAFETY: This value is accessible from many threads, it has to be Sync.
unsafe impl<T: ?Sized + Send + Sync> Send for Weak<T> {}
// SAFETY: This value is accessible from many threads, it has to be Sync.
unsafe impl<T: ?Sized + Send + Sync> Sync for Weak<T> {}

impl<T: ?Sized> Unpin for Arc<T> {}

impl<T: ?Sized + fmt::Debug> fmt::Debug for Arc<T> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        fmt::Debug::fmt(&**self, f)
    }
}

impl<T: ?Sized> Clone for Arc<T> {
    fn clone(&self) -> Self {
        // Bump the refcount.
        let old_size = self.inner().strong().fetch_add(1, Relaxed);

        // Abort if the refcount overflowed.
        if old_size > MAX_REFCOUNT {
            abort();
        }

        // Return a new `Arc`.
        //
        // SAFETY: The refcount was incremented, so the allocation is still valid.
        unsafe { Self::from_inner(self.shared) }
    }
}

impl<T: Default> Default for Arc<T> {
    fn default() -> Self {
        Self::new(T::default())
    }
}

impl<U: ?Sized, T: ?Sized + PartialEq<U>> PartialEq<Arc<U>> for Arc<T> {
    fn eq(&self, other: &Arc<U>) -> bool {
        PartialEq::eq(&**self, &**other)
    }
}

impl<T: ?Sized + Eq> Eq for Arc<T> {}

impl<U: ?Sized, T: ?Sized + PartialOrd<U>> PartialOrd<Arc<U>> for Arc<T> {
    fn partial_cmp(&self, other: &Arc<U>) -> Option<core::cmp::Ordering> {
        PartialOrd::partial_cmp(&**self, &**other)
    }
}

impl<T: ?Sized + Ord> Ord for Arc<T> {
    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
        Ord::cmp(&**self, &**other)
    }
}

impl<T: ?Sized + Hash> Hash for Arc<T> {
    fn hash<H: core::hash::Hasher>(&self, state: &mut H) {
        (**self).hash(state);
    }
}

impl<T: ?Sized> Arc<T> {
    fn inner(&self) -> &Shared<T> {
        // SAFETY: self.shared is always a valid pointer to a `Shared<T>`.
        unsafe { self.shared.as_ref() }
    }

    unsafe fn from_inner(ptr: NonNull<Shared<T>>) -> Self {
        Self { shared: ptr, _marker: PhantomData }
    }

    unsafe fn from_ptr(ptr: *mut Shared<T>) -> Self {
        // SAFETY: Invariant is checked by the caller.
        unsafe { Self::from_inner(NonNull::new_unchecked(ptr)) }
    }

    #[allow(clippy::needless_pass_by_ref_mut)] // https://github.com/rust-lang/rust-clippy/issues/11180
    unsafe fn get_mut_unchecked(this: &mut Self) -> &mut T {
        // SAFETY: Since we have an exclusive reference, as certified by the caller, this
        // dereference is valid.
        unsafe { &mut (*this.shared.as_ptr()).value }
    }

    #[inline(never)]
    unsafe fn drop_slow(&mut self) {
        // SAFETY: The refcount is zero, so these operations are valid.
        unsafe {
            // Destroy the value itself.
            ptr::drop_in_place(Self::get_mut_unchecked(self));

            // Drop the intrinsic weak reference to deallocate.
            drop(Weak::from_inner(self.shared));
        }
    }

    fn is_unique(&self) -> bool {
        // "Lock" the weak counter so it can't be increased if we turn out to be the only
        // strong reference.
        if self.inner().weak().compare_exchange(1, usize::MAX, Acquire, Relaxed).is_ok() {
            // There are no outside weak references, so we can check the strong count.
            let strong = self.inner().strong().load(Acquire);

            // Restore the former weak count.
            self.inner().weak().store(1, Release);

            // If there is only one strong reference, we are unique.
            strong == 1
        } else {
            // There are outside weak references, so we can't be unique.
            false
        }
    }
}

impl<T> Arc<T> {
    /// Create a new [`Arc`].
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    /// ```
    pub fn new(item: T) -> Arc<T> {
        let shared = Box::into_raw(Box::new(Shared {
            header: Header { strong: AtomicUsize::new(1), weak: AtomicUsize::new(1) },
            value: item,
        }));

        // SAFETY: The newly created allocation is valid.
        unsafe { Self::from_ptr(shared) }
    }

    /// Create a new [`Arc`] whose pointer is pinned to the heap.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::pin(5);
    /// ```
    pub fn pin(item: T) -> Pin<Arc<T>> {
        // SAFETY: The inner object is now pinned to the heap.
        unsafe { Pin::new_unchecked(Self::new(item)) }
    }

    /// Unwrap and try to get the inner value.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    /// assert_eq!(Arc::try_unwrap(five).unwrap(), 5);
    ///
    /// let five = Arc::new(5);
    /// let five2 = Arc::clone(&five);
    /// assert!(Arc::try_unwrap(five).is_err());
    /// ```
    pub fn try_unwrap(this: Self) -> Result<T, Self> {
        // Try to decrement the strong count.
        if this.inner().strong().compare_exchange(1, 0, Relaxed, Relaxed).is_err() {
            return Err(this);
        }

        // Otherwise, we can safely unwrap the value.
        acquire!(this.inner().strong());

        // SAFETY: These operations are valid since we hold the only reference.
        unsafe {
            let element = ptr::read(&this.inner().value);

            // Create a new weak pointer to deallocate.
            let _weak = Weak::from_inner(this.shared);
            mem::forget(this);

            Ok(element)
        }
    }
}

impl<T: ?Sized> Arc<T> {
    /// Consume this `Arc` and get the raw pointer to the inner value.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    /// let five_ptr = Arc::into_raw(five);
    ///
    /// // We should now free the pointer.
    /// // SAFETY: The pointer is valid.
    /// unsafe { Arc::from_raw(five_ptr) };
    /// ```
    #[must_use]
    pub fn into_raw(self) -> *const T {
        // SAFETY: The refcount is incremented, so the allocation is still valid.
        let ptr = self.as_ptr();
        mem::forget(self);
        ptr
    }

    /// Get the raw pointer representing this `Arc<T>`.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    /// let five_ptr = Arc::as_ptr(&five);
    /// ```
    #[must_use]
    pub fn as_ptr(&self) -> *const T {
        // Get the raw pointer.
        let ptr = self.shared.as_ptr() as *mut u8;

        // Add the size of the header so that it points to the value.
        let new_ptr = strict::map_addr(ptr, |addr| addr + mem::size_of::<Header>());

        // Cast the pointer to the correct type.
        strict::with_metadata_of(new_ptr, self.shared.as_ptr() as *mut T)
    }

    /// Convert a raw pointer previously created by `into_raw` into a new `Arc`.
    ///
    /// # Safety
    ///
    /// This function can only be called with a pointer that was previously returned by `into_raw`.
    ///
    /// # Example
    ///
    /// ```rust
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    /// let five_ptr = Arc::into_raw(five);
    ///
    /// // SAFETY: The pointer is valid.
    /// let five = unsafe { Arc::from_raw(five_ptr) };
    /// assert_eq!(*five, 5);
    /// ```
    #[must_use]
    pub unsafe fn from_raw(ptr: *const T) -> Self {
        // SAFETY: The caller must ensure that the pointer is valid.
        unsafe {
            // Get the raw pointer.
            let raw_ptr = ptr as *mut u8;

            // Subtract the size of the header so that it points to the Shared allocation.
            let new_ptr = strict::map_addr(raw_ptr, |addr| addr - mem::size_of::<Header>());

            // Cast the pointer to the correct type.
            let shared = strict::with_metadata_of(new_ptr, ptr as *mut Shared<T>);

            Self::from_ptr(shared)
        }
    }

    /// Get a [`Weak`] reference from this `Arc`.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    /// let weak_five = Arc::downgrade(&five);
    ///
    /// assert!(weak_five.upgrade().is_some());
    /// ```
    #[allow(clippy::missing_panics_doc)]
    #[must_use]
    pub fn downgrade(this: &Self) -> Weak<T> {
        let mut cur = this.inner().weak().load(Relaxed);

        loop {
            // The weak counter may be "locked", so spin and reload if it is.
            if cur == usize::MAX {
                portable_atomic::hint::spin_loop();
                cur = this.inner().weak().load(Relaxed);
                continue;
            }

            // If the weak counter is greater than the maximum, panic.
            // Panic instead of abort is okay because we didn't increment the weak counter yet.
            assert!(cur <= MAX_REFCOUNT, "Arc counter overflow");

            // Try to increment the weak counter.
            match this.inner().weak().compare_exchange_weak(cur, cur + 1, Acquire, Relaxed) {
                Ok(_) => {
                    // SAFETY: Now that the weak counter is incremented, the allocation for a weak pointer is valid.
                    return unsafe { Weak::from_inner(this.shared) };
                }
                Err(x) => cur = x,
            }
        }
    }

    /// Get the number of weak pointers to this allocation.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    /// let weak_five = Arc::downgrade(&five);
    ///
    /// assert_eq!(Arc::weak_count(&five), 1);
    /// ```
    #[must_use]
    pub fn weak_count(this: &Self) -> usize {
        match this.inner().weak().load(Acquire) {
            usize::MAX => 0,
            cnt => cnt - 1,
        }
    }

    /// Get the number of strong pointers to this allocation.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    /// let five2 = Arc::clone(&five);
    ///
    /// assert_eq!(Arc::strong_count(&five), 2);
    /// ```
    #[must_use]
    pub fn strong_count(this: &Self) -> usize {
        this.inner().strong().load(Acquire)
    }

    /// Increment the strong count of the `Arc` pointed to by `ptr` by one.
    ///
    /// # Safety
    ///
    /// The pointer must be a pointer previously returned by `Arc::into_raw`.
    ///
    /// # Example
    ///
    /// ```rust
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    /// let five_ptr = Arc::into_raw(five);
    ///
    /// // SAFETY: The pointer is valid.
    /// unsafe { Arc::increment_strong_count(five_ptr) };
    ///
    /// // SAFETY: The pointer is valid.
    /// let five2 = unsafe { Arc::from_raw(five_ptr) };
    /// assert_eq!(*five2, 5);
    ///
    /// // SAFETY: Since the refcount is incremented, we can get another.
    /// let five3 = unsafe { Arc::from_raw(five_ptr) };
    /// assert_eq!(*five3, 5);
    /// ```
    pub unsafe fn increment_strong_count(ptr: *const T) {
        // Retain Arc, but don't touch refcount by wrapping in ManuallyDrop
        //
        // SAFETY: The caller must ensure that the pointer is valid.
        let arc = unsafe { mem::ManuallyDrop::new(Arc::<T>::from_raw(ptr)) };

        // Now increase refcount, but don't drop new refcount either
        let _arc_clone: mem::ManuallyDrop<_> = arc.clone();
    }

    /// Decrement the strong count of the `Arc` pointed to by `ptr` by one.
    ///
    /// # Safety
    ///
    /// The pointer must be a pointer previously returned by `Arc::into_raw`.
    ///
    /// # Example
    ///
    /// ```rust
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    /// let five2 = Arc::clone(&five);
    ///
    /// let five_ptr = Arc::into_raw(five);
    ///
    /// // SAFETY: The pointer is valid.
    /// unsafe { Arc::decrement_strong_count(five_ptr) };
    /// ```
    pub unsafe fn decrement_strong_count(ptr: *const T) {
        // SAFETY: The caller must ensure that the pointer is valid.
        unsafe { mem::drop(Arc::from_raw(ptr)) };
    }

    /// Tell if two `Arc`s point to the same allocation.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    /// let five2 = Arc::clone(&five);
    ///
    /// assert!(Arc::ptr_eq(&five, &five2));
    /// ```
    #[must_use]
    pub fn ptr_eq(this: &Self, other: &Self) -> bool {
        this.shared == other.shared
    }

    /// Get a mutable pointer to the inner value if there are no other strong references.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let mut five = Arc::new(5);
    /// assert!(Arc::get_mut(&mut five).is_some());
    ///
    /// let five2 = Arc::clone(&five);
    /// assert!(Arc::get_mut(&mut five).is_none());
    /// ```
    #[must_use]
    pub fn get_mut(this: &mut Self) -> Option<&mut T> {
        if this.is_unique() {
            // SAFETY: The pointer is unique.
            unsafe { Some(Self::get_mut_unchecked(this)) }
        } else {
            None
        }
    }
}

impl<T: Clone> Arc<T> {
    /// Try to get the inner value or clone it.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    /// let five2 = Arc::clone(&five);
    ///
    /// assert_eq!(Arc::unwrap_or_clone(five), 5);
    /// ```
    #[must_use]
    pub fn unwrap_or_clone(this: Self) -> T {
        Self::try_unwrap(this).unwrap_or_else(|this| (*this).clone())
    }
}

impl<T: ?Sized> Deref for Arc<T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        &self.inner().value
    }
}

impl<T: ?Sized> AsRef<T> for Arc<T> {
    fn as_ref(&self) -> &T {
        &self.inner().value
    }
}

impl<T: ?Sized> Borrow<T> for Arc<T> {
    fn borrow(&self) -> &T {
        &self.inner().value
    }
}

impl<T: ?Sized> Drop for Arc<T> {
    fn drop(&mut self) {
        // Decrement the strong refcount.
        if self.inner().strong().fetch_sub(1, Release) != 1 {
            return;
        }

        // Ensure we're synchronized with other threads.
        acquire!(self.inner().strong());

        // Drop the value and deallocate.
        //
        // SAFETY: Since the strong count is zero, we have exclusive access to the inner value.
        unsafe { self.drop_slow() }
    }
}

impl<T: ?Sized> fmt::Debug for Weak<T> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str("Weak")
    }
}

impl<T: ?Sized> Clone for Weak<T> {
    fn clone(&self) -> Self {
        // Get the inner header.
        let header = match self.inner() {
            Some(header) => header,
            None => {
                // SAFETY: We can duplicate the dangling pointer as we please.
                return unsafe { Self::from_inner(self.shared) };
            }
        };

        // Bump the weak refcount.
        let old_size = header.weak.fetch_add(1, Relaxed);

        // Abort if the refcount overflowed.
        if old_size > MAX_REFCOUNT {
            abort();
        }

        // Return a new `Weak`.
        //
        // SAFETY: self.shared is guaranteed to be valid now that the refcount is raised.
        unsafe { Self::from_inner(self.shared) }
    }
}

impl<T: ?Sized> Weak<T> {
    fn inner(&self) -> Option<&Header> {
        let ptr = self.shared.as_ptr();
        if is_dangling(ptr) {
            // We are dangling.
            None
        } else {
            // SAFETY: We know ptr is a valid pointer.
            unsafe {
                // Make sure we never take a reference to the `value` itself.
                //
                // SAFETY: Due to repr(C), Header will always come first. We take a reference
                // to that.
                let ptr = ptr as *mut Header;
                Some(&*ptr)
            }
        }
    }

    unsafe fn from_inner(ptr: NonNull<Shared<T>>) -> Self {
        Self { shared: ptr }
    }

    /// Try to upgrade this `Weak` pointer to a strong pointer.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    ///
    /// let weak = Arc::downgrade(&five);
    /// assert!(weak.upgrade().is_some());
    /// ```
    #[allow(clippy::missing_panics_doc)]
    #[must_use]
    pub fn upgrade(&self) -> Option<Arc<T>> {
        let header = self.inner()?;
        let mut strong = header.strong.load(Relaxed);

        loop {
            // If the strong count is zero, the allocation has been dropped.
            if strong == 0 {
                return None;
            }

            // If the strong count is greater than the maximum, panic.
            // Panic instead of abort is okay because we didn't increment the strong counter yet.
            assert!(strong <= MAX_REFCOUNT, "Arc counter overflow");

            // Try to increment the strong count.
            match header.strong.compare_exchange_weak(strong, strong + 1, Acquire, Relaxed) {
                Ok(_) => {
                    // SAFETY: Now that the strong counter is incremented, the allocation for an Arc is valid.
                    return unsafe { Some(Arc::from_inner(self.shared)) };
                }
                Err(x) => strong = x,
            }
        }
    }

    /// Get the number of strong pointers to this allocation.
    #[must_use]
    pub fn strong_count(&self) -> usize {
        self.inner().map_or(0, |header| header.strong.load(Acquire))
    }

    /// Get the number of weak pointers to this allocation.
    #[must_use]
    pub fn weak_count(&self) -> usize {
        self.inner().map_or(0, |header| {
            let weak = header.weak.load(Acquire);
            let strong = header.strong.load(Acquire);

            if strong == 0 {
                0
            } else {
                weak - 1
            }
        })
    }
}

impl<T> Weak<T> {
    /// Create a new dangling `Weak` pointer.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Weak;
    ///
    /// let weak = Weak::<i32>::new();
    /// ```
    #[must_use]
    pub fn new() -> Self {
        Self {
            // SAFETY: usize::MAX != 0, so this is always valid
            shared: unsafe { NonNull::new_unchecked(strict::invalid(usize::MAX)) },
        }
    }
}

impl<T> Default for Weak<T> {
    fn default() -> Self {
        Self::new()
    }
}

impl<T: ?Sized> Drop for Weak<T> {
    fn drop(&mut self) {
        // Try to get access to the inner shared pointer.
        if let Some(inner) = self.inner() {
            if inner.weak.fetch_sub(1, Release) == 1 {
                acquire!(inner.weak);

                // Deallocate the memory.
                let ptr = self.shared.as_ptr() as *mut Shared<mem::ManuallyDrop<T>>;
                // SAFETY: We know that the weak count is 0, so we can deallocate.
                // Using ManuallyDrop here prevents T from being dropped twice.
                mem::drop(unsafe { Box::from_raw(ptr) });
            }
        }
    }
}

fn abort() -> ! {
    struct Abort;

    impl Drop for Abort {
        fn drop(&mut self) {
            panic!();
        }
    }

    let _abort = Abort;

    panic!("abort")
}

fn is_dangling<T: ?Sized>(ptr: *mut T) -> bool {
    ptr as *mut () as usize == usize::MAX
}

/// Emulate strict provenance.
///
/// Once strict_provenance is stable, migrate to the standard library's APIs.
#[allow(
    clippy::cast_possible_wrap,
    clippy::transmutes_expressible_as_ptr_casts,
    clippy::useless_transmute
)]
mod strict {
    /// Create a new, invalid pointer from an address.
    #[inline]
    #[must_use]
    pub(super) const fn invalid<T>(addr: usize) -> *mut T {
        // SAFETY: Every integer is a valid pointer as long as it is not dereferenced.
        #[cfg(miri)]
        unsafe {
            core::mem::transmute(addr)
        }
        // const transmute requires Rust 1.56.
        #[cfg(not(miri))]
        {
            addr as *mut T
        }
    }

    /// Create a new pointer with the metadata of `other`.
    #[inline]
    #[must_use]
    pub(super) fn with_metadata_of<T, U: ?Sized>(this: *mut T, mut other: *mut U) -> *mut U {
        let target = &mut other as *mut *mut U as *mut *mut u8;

        // SAFETY: In case of a thin pointer, this operations is identical
        // to a simple assignment. In case of a fat pointer, with the current
        // fat pointer layout implementation, the first field of such a
        // pointer is always the data pointer, which is likewise assigned.
        unsafe { *target = this as *mut u8 };
        other
    }

    /// Replace the address portion of this pointer with a new address.
    #[inline]
    #[must_use]
    pub(super) fn with_addr<T>(ptr: *mut T, addr: usize) -> *mut T {
        // FIXME(strict_provenance_magic): I am magic and should be a compiler intrinsic.
        //
        // In the mean-time, this operation is defined to be "as if" it was
        // a wrapping_offset, so we can emulate it as such. This should properly
        // restore pointer provenance even under today's compiler.
        let self_addr = ptr as usize as isize;
        let dest_addr = addr as isize;
        let offset = dest_addr.wrapping_sub(self_addr);

        // This is the canonical desugaring of this operation.
        (ptr as *mut u8).wrapping_offset(offset) as *mut T
    }

    /// Run an operation of some kind on a pointer.
    #[inline]
    #[must_use]
    pub(super) fn map_addr<T>(ptr: *mut T, f: impl FnOnce(usize) -> usize) -> *mut T {
        with_addr(ptr, f(ptr as usize))
    }
}
