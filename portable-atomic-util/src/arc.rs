// SPDX-License-Identifier: Apache-2.0 OR MIT

// The module is based on alloc::sync::Arc, licensed under "Apache-2.0 OR MIT".
//
// The code has been adjusted to work with stable Rust and to
// avoid UBs (https://github.com/rust-lang/rust/issues/119241).
//
// Source: https://github.com/rust-lang/rust/blob/5151b8c42712c473e7da56e213926b929d0212ef/library/alloc/src/sync.rs.
//
// Copyright & License of the original code:
// - https://github.com/rust-lang/rust/blob/5151b8c42712c473e7da56e213926b929d0212ef/COPYRIGHT
// - https://github.com/rust-lang/rust/blob/5151b8c42712c473e7da56e213926b929d0212ef/LICENSE-APACHE
// - https://github.com/rust-lang/rust/blob/5151b8c42712c473e7da56e213926b929d0212ef/LICENSE-MIT

#![allow(clippy::must_use_candidate)] // align to alloc::sync::Arc
#![allow(clippy::undocumented_unsafe_blocks)] // TODO

use portable_atomic::{
    self as atomic, hint,
    Ordering::{Acquire, Relaxed, Release},
};

use alloc::{alloc::handle_alloc_error, boxed::Box};
#[cfg(not(portable_atomic_no_alloc_layout_extras))]
use alloc::{
    borrow::{Cow, ToOwned},
    string::String,
    vec::Vec,
};

use core::{
    alloc::Layout,
    any::Any,
    borrow, cmp, fmt,
    hash::{Hash, Hasher},
    isize,
    marker::PhantomData,
    mem::{self, align_of_val, size_of_val},
    ops::Deref,
    pin::Pin,
    ptr::{self, NonNull},
    usize,
};
#[cfg(not(portable_atomic_no_alloc_layout_extras))]
use core::{iter::FromIterator, slice};

/// A soft limit on the amount of references that may be made to an `Arc`.
///
/// Going above this limit will abort your program (although not
/// necessarily) at _exactly_ `MAX_REFCOUNT + 1` references.
/// Trying to go above it might call a `panic` (if not actually going above it).
///
/// This is a global invariant, and also applies when using a compare-exchange loop.
///
/// See comment in `Arc::clone`.
const MAX_REFCOUNT: usize = isize::MAX as usize;

/// The error in case either counter reaches above `MAX_REFCOUNT`, and we can `panic` safely.
const INTERNAL_OVERFLOW_ERROR: &str = "Arc counter overflow";

#[cfg(not(portable_atomic_sanitize_thread))]
macro_rules! acquire {
    ($x:expr) => {
        atomic::fence(Acquire)
    };
}

// ThreadSanitizer does not support memory fences. To avoid false positive
// reports in Arc / Weak implementation use atomic loads for synchronization
// instead.
#[cfg(portable_atomic_sanitize_thread)]
macro_rules! acquire {
    ($x:expr) => {
        $x.load(Acquire)
    };
}

/// A thread-safe, strongly reference counted pointer.
///
/// This is an equivalent to [`std::sync::Arc`], but using [`portable-atomic`] for synchronization.
/// See the documentation for [`std::sync::Arc`] for more details.
///
/// [`portable-atomic`]: https://crates.io/crates/portable-atomic
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
    ptr: NonNull<ArcInner<T>>,
    phantom: PhantomData<ArcInner<T>>,
}

unsafe impl<T: ?Sized + Sync + Send> Send for Arc<T> {}
unsafe impl<T: ?Sized + Sync + Send> Sync for Arc<T> {}

#[cfg(not(portable_atomic_no_core_unwind_safe))]
impl<T: core::panic::RefUnwindSafe + ?Sized> core::panic::UnwindSafe for Arc<T> {}
#[cfg(all(portable_atomic_no_core_unwind_safe, feature = "std"))]
impl<T: std::panic::RefUnwindSafe + ?Sized> std::panic::UnwindSafe for Arc<T> {}

impl<T: ?Sized> Arc<T> {
    #[inline]
    unsafe fn from_inner(ptr: NonNull<ArcInner<T>>) -> Self {
        Self { ptr, phantom: PhantomData }
    }

    #[inline]
    unsafe fn from_ptr(ptr: *mut ArcInner<T>) -> Self {
        // SAFETY: the caller must uphold the safety contract.
        unsafe { Self::from_inner(NonNull::new_unchecked(ptr)) }
    }
}

/// A weakly reference counted pointer.
///
/// This is an equivalent to [`std::sync::Weak`], but using [`portable-atomic`] for synchronization.
/// See the documentation for [`std::sync::Weak`] for more details.
///
/// [`portable-atomic`]: https://crates.io/crates/portable-atomic
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
    // This is a `NonNull` to allow optimizing the size of this type in enums,
    // but it is not necessarily a valid pointer.
    // `Weak::new` sets this to `usize::MAX` so that it doesn’t need
    // to allocate space on the heap. That's not a value a real pointer
    // will ever have because RcBox has alignment at least 2.
    // This is only possible when `T: Sized`; unsized `T` never dangle.
    ptr: NonNull<ArcInner<T>>,
}

unsafe impl<T: ?Sized + Sync + Send> Send for Weak<T> {}
unsafe impl<T: ?Sized + Sync + Send> Sync for Weak<T> {}

impl<T: ?Sized> fmt::Debug for Weak<T> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "(Weak)")
    }
}

// This is repr(C) to future-proof against possible field-reordering, which
// would interfere with otherwise safe [into|from]_raw() of transmutable
// inner types.
#[repr(C)]
struct ArcInner<T: ?Sized> {
    strong: atomic::AtomicUsize,

    // the value usize::MAX acts as a sentinel for temporarily "locking" the
    // ability to upgrade weak pointers or downgrade strong ones; this is used
    // to avoid races in `make_mut` and `get_mut`.
    weak: atomic::AtomicUsize,

    data: T,
}

/// Calculate layout for `ArcInner<T>` using the inner value's layout
#[inline]
fn arc_inner_layout_for_value_layout(layout: Layout) -> Layout {
    // Calculate layout using the given value layout.
    // Previously, layout was calculated on the expression
    // `&*(ptr as *const ArcInner<T>)`, but this created a misaligned
    // reference (see #54908).
    pad_to_align(extend_layout(Layout::new::<ArcInner<()>>(), layout).unwrap().0)
}

unsafe impl<T: ?Sized + Sync + Send> Send for ArcInner<T> {}
unsafe impl<T: ?Sized + Sync + Send> Sync for ArcInner<T> {}

impl<T> Arc<T> {
    /// Constructs a new `Arc<T>`.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    /// ```
    #[inline]
    pub fn new(data: T) -> Self {
        // Start the weak pointer count as 1 which is the weak pointer that's
        // held by all the strong pointers (kinda), see std/rc.rs for more info
        let x: Box<_> = Box::new(ArcInner {
            strong: atomic::AtomicUsize::new(1),
            weak: atomic::AtomicUsize::new(1),
            data,
        });
        unsafe { Self::from_inner(Box::leak(x).into()) }
    }

    /// Constructs a new `Arc<T>` while giving you a `Weak<T>` to the allocation,
    /// to allow you to construct a `T` which holds a weak pointer to itself.
    ///
    /// Generally, a structure circularly referencing itself, either directly or
    /// indirectly, should not hold a strong reference to itself to prevent a memory leak.
    /// Using this function, you get access to the weak pointer during the
    /// initialization of `T`, before the `Arc<T>` is created, such that you can
    /// clone and store it inside the `T`.
    ///
    /// `new_cyclic` first allocates the managed allocation for the `Arc<T>`,
    /// then calls your closure, giving it a `Weak<T>` to this allocation,
    /// and only afterwards completes the construction of the `Arc<T>` by placing
    /// the `T` returned from your closure into the allocation.
    ///
    /// Since the new `Arc<T>` is not fully-constructed until `Arc<T>::new_cyclic`
    /// returns, calling [`upgrade`] on the weak reference inside your closure will
    /// fail and result in a `None` value.
    ///
    /// # Panics
    ///
    /// If `data_fn` panics, the panic is propagated to the caller, and the
    /// temporary [`Weak<T>`] is dropped normally.
    ///
    /// # Example
    ///
    /// ```
    /// # #![allow(dead_code)]
    /// use portable_atomic_util::{Arc, Weak};
    ///
    /// struct Gadget {
    ///     me: Weak<Gadget>,
    /// }
    ///
    /// impl Gadget {
    ///     /// Construct a reference counted Gadget.
    ///     fn new() -> Arc<Self> {
    ///         // `me` is a `Weak<Gadget>` pointing at the new allocation of the
    ///         // `Arc` we're constructing.
    ///         Arc::new_cyclic(|me| {
    ///             // Create the actual struct here.
    ///             Gadget { me: me.clone() }
    ///         })
    ///     }
    ///
    ///     /// Return a reference counted pointer to Self.
    ///     fn me(&self) -> Arc<Self> {
    ///         self.me.upgrade().unwrap()
    ///     }
    /// }
    /// ```
    /// [`upgrade`]: Weak::upgrade
    #[inline]
    pub fn new_cyclic<F>(data_fn: F) -> Self
    where
        F: FnOnce(&Weak<T>) -> T,
    {
        // Construct the inner in the "uninitialized" state with a single
        // weak reference.
        let init_ptr = Weak::new_uninit_ptr();

        let weak = Weak { ptr: init_ptr };

        // It's important we don't give up ownership of the weak pointer, or
        // else the memory might be freed by the time `data_fn` returns. If
        // we really wanted to pass ownership, we could create an additional
        // weak pointer for ourselves, but this would result in additional
        // updates to the weak reference count which might not be necessary
        // otherwise.
        let data = data_fn(&weak);

        // Now we can properly initialize the inner value and turn our weak
        // reference into a strong reference.
        let strong = unsafe {
            let inner = init_ptr.as_ptr();
            ptr::write(data_ptr::<T>(inner, &data), data);

            // The above write to the data field must be visible to any threads which
            // observe a non-zero strong count. Therefore we need at least "Release" ordering
            // in order to synchronize with the `compare_exchange_weak` in `Weak::upgrade`.
            //
            // "Acquire" ordering is not required. When considering the possible behaviors
            // of `data_fn` we only need to look at what it could do with a reference to a
            // non-upgradeable `Weak`:
            // - It can *clone* the `Weak`, increasing the weak reference count.
            // - It can drop those clones, decreasing the weak reference count (but never to zero).
            //
            // These side effects do not impact us in any way, and no other side effects are
            // possible with safe code alone.
            let prev_value = (*inner).strong.fetch_add(1, Release);
            debug_assert_eq!(prev_value, 0, "No prior strong references should exist");

            Self::from_inner(init_ptr)
        };

        // Strong references should collectively own a shared weak reference,
        // so don't run the destructor for our old weak reference.
        mem::forget(weak);
        strong
    }

    #[inline]
    #[must_use]
    fn new_uninit_ptr() -> NonNull<ArcInner<T>> {
        unsafe {
            NonNull::new_unchecked(Self::allocate_for_layout(
                Layout::new::<T>(),
                |layout| Global.allocate(layout),
                |ptr| ptr as *mut _,
            ))
        }
    }

    /// Constructs a new `Pin<Arc<T>>`. If `T` does not implement `Unpin`, then
    /// `data` will be pinned in memory and unable to be moved.
    #[must_use]
    pub fn pin(data: T) -> Pin<Self> {
        unsafe { Pin::new_unchecked(Self::new(data)) }
    }
}

impl<T> Arc<T> {
    /// Returns the inner value, if the `Arc` has exactly one strong reference.
    ///
    /// Otherwise, an [`Err`] is returned with the same `Arc` that was
    /// passed in.
    ///
    /// This will succeed even if there are outstanding weak references.
    ///
    /// It is strongly recommended to use [`Arc::into_inner`] instead if you don't
    /// want to keep the `Arc` in the [`Err`] case.
    /// Immediately dropping the [`Err`] payload, like in the expression
    /// `Arc::try_unwrap(this).ok()`, can still cause the strong count to
    /// drop to zero and the inner value of the `Arc` to be dropped:
    /// For instance if two threads each execute this expression in parallel, then
    /// there is a race condition. The threads could first both check whether they
    /// have the last clone of their `Arc` via `Arc::try_unwrap`, and then
    /// both drop their `Arc` in the call to [`ok`][`Result::ok`],
    /// taking the strong count from two down to zero.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let x = Arc::new(3);
    /// assert_eq!(Arc::try_unwrap(x), Ok(3));
    ///
    /// let x = Arc::new(4);
    /// let _y = Arc::clone(&x);
    /// assert_eq!(*Arc::try_unwrap(x).unwrap_err(), 4);
    /// ```
    #[inline]
    pub fn try_unwrap(this: Self) -> Result<T, Self> {
        if this.inner().strong.compare_exchange(1, 0, Relaxed, Relaxed).is_err() {
            return Err(this);
        }

        acquire!(this.inner().strong);

        unsafe {
            let elem = ptr::read(&this.ptr.as_ref().data);

            // Make a weak pointer to clean up the implicit strong-weak reference
            let _weak = Weak { ptr: this.ptr };
            mem::forget(this);

            Ok(elem)
        }
    }

    /// Returns the inner value, if the `Arc` has exactly one strong reference.
    ///
    /// Otherwise, [`None`] is returned and the `Arc` is dropped.
    ///
    /// This will succeed even if there are outstanding weak references.
    ///
    /// If `Arc::into_inner` is called on every clone of this `Arc`,
    /// it is guaranteed that exactly one of the calls returns the inner value.
    /// This means in particular that the inner value is not dropped.
    ///
    /// The similar expression `Arc::try_unwrap(this).ok()` does not
    /// offer such a guarantee. See the last example below
    /// and the documentation of [`Arc::try_unwrap`].
    ///
    /// # Examples
    ///
    /// Minimal example demonstrating the guarantee that `Arc::into_inner` gives.
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let x = Arc::new(3);
    /// let y = Arc::clone(&x);
    ///
    /// // Two threads calling `Arc::into_inner` on both clones of an `Arc`:
    /// let x_thread = std::thread::spawn(|| Arc::into_inner(x));
    /// let y_thread = std::thread::spawn(|| Arc::into_inner(y));
    ///
    /// let x_inner_value = x_thread.join().unwrap();
    /// let y_inner_value = y_thread.join().unwrap();
    ///
    /// // One of the threads is guaranteed to receive the inner value:
    /// assert!(matches!((x_inner_value, y_inner_value), (None, Some(3)) | (Some(3), None)));
    /// // The result could also be `(None, None)` if the threads called
    /// // `Arc::try_unwrap(x).ok()` and `Arc::try_unwrap(y).ok()` instead.
    /// ```
    ///
    /// A more practical example demonstrating the need for `Arc::into_inner`:
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// // Definition of a simple singly linked list using `Arc`:
    /// #[derive(Clone)]
    /// struct LinkedList<T>(Option<Arc<Node<T>>>);
    /// struct Node<T>(T, Option<Arc<Node<T>>>);
    ///
    /// // Dropping a long `LinkedList<T>` relying on the destructor of `Arc`
    /// // can cause a stack overflow. To prevent this, we can provide a
    /// // manual `Drop` implementation that does the destruction in a loop:
    /// impl<T> Drop for LinkedList<T> {
    ///     fn drop(&mut self) {
    ///         let mut link = self.0.take();
    ///         while let Some(arc_node) = link.take() {
    ///             if let Some(Node(_value, next)) = Arc::into_inner(arc_node) {
    ///                 link = next;
    ///             }
    ///         }
    ///     }
    /// }
    ///
    /// // Implementation of `new` and `push` omitted
    /// impl<T> LinkedList<T> {
    ///     /* ... */
    /// #   fn new() -> Self {
    /// #       LinkedList(None)
    /// #   }
    /// #   fn push(&mut self, x: T) {
    /// #       self.0 = Some(Arc::new(Node(x, self.0.take())));
    /// #   }
    /// }
    ///
    /// // The following code could have still caused a stack overflow
    /// // despite the manual `Drop` impl if that `Drop` impl had used
    /// // `Arc::try_unwrap(arc).ok()` instead of `Arc::into_inner(arc)`.
    ///
    /// // Create a long list and clone it
    /// let mut x = LinkedList::new();
    /// # #[cfg(not(miri))]
    /// for i in 0..100000 {
    ///     x.push(i); // Adds i to the front of x
    /// }
    /// # #[cfg(miri)] // Miri is slow
    /// # for i in 0..100 {
    /// #     x.push(i); // Adds i to the front of x
    /// # }
    /// let y = x.clone();
    ///
    /// // Drop the clones in parallel
    /// let x_thread = std::thread::spawn(|| drop(x));
    /// let y_thread = std::thread::spawn(|| drop(y));
    /// x_thread.join().unwrap();
    /// y_thread.join().unwrap();
    /// ```
    #[inline]
    pub fn into_inner(this: Self) -> Option<T> {
        // Make sure that the ordinary `Drop` implementation isn’t called as well
        let mut this = mem::ManuallyDrop::new(this);

        // Following the implementation of `drop` and `drop_slow`
        if this.inner().strong.fetch_sub(1, Release) != 1 {
            return None;
        }

        acquire!(this.inner().strong);

        // SAFETY: This mirrors the line
        //
        //     unsafe { ptr::drop_in_place(Self::get_mut_unchecked(self)) };
        //
        // in `drop_slow`. Instead of dropping the value behind the pointer,
        // it is read and eventually returned; `ptr::read` has the same
        // safety conditions as `ptr::drop_in_place`.
        let inner = unsafe { ptr::read(Self::get_mut_unchecked(&mut this)) };

        drop(Weak { ptr: this.ptr });

        Some(inner)
    }
}

#[cfg(not(portable_atomic_no_alloc_layout_extras))]
impl<T> Arc<[T]> {
    #[inline]
    #[must_use]
    fn new_uninit_slice(len: usize) -> Arc<[mem::MaybeUninit<T>]> {
        unsafe { Arc::from_ptr(Arc::allocate_for_slice(len)) }
    }
}

#[cfg(not(portable_atomic_no_alloc_layout_extras))]
impl<T> Arc<[mem::MaybeUninit<T>]> {
    #[must_use = "`self` will be dropped if the result is not used"]
    #[inline]
    unsafe fn assume_init(self) -> Arc<[T]> {
        let md_self = mem::ManuallyDrop::new(self);
        // SAFETY: [MaybeUninit<T>] has the same layout as [T], and
        // the caller must ensure data is initialized.
        unsafe { Arc::from_ptr(md_self.ptr.as_ptr() as _) }
    }
}

impl<T: ?Sized> Arc<T> {
    /// Constructs an `Arc<T>` from a raw pointer.
    ///
    /// # Safety
    ///
    /// The raw pointer must have been previously returned by a call to
    /// [`Arc<U>::into_raw`][into_raw] where `U` must have the same size and
    /// alignment as `T`. This is trivially true if `U` is `T`.
    /// Note that if `U` is not `T` but has the same size and alignment, this is
    /// basically like transmuting references of different types. See
    /// [`mem::transmute`] for more information on what
    /// restrictions apply in this case.
    ///
    /// The user of `from_raw` has to make sure a specific value of `T` is only
    /// dropped once.
    ///
    /// This function is unsafe because improper use may lead to memory unsafety,
    /// even if the returned `Arc<T>` is never accessed.
    ///
    /// [into_raw]: Arc::into_raw
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let x = Arc::new("hello".to_owned());
    /// let x_ptr = Arc::into_raw(x);
    ///
    /// unsafe {
    ///     // Convert back to an `Arc` to prevent leak.
    ///     let x = Arc::from_raw(x_ptr);
    ///     assert_eq!(&*x, "hello");
    ///
    ///     // Further calls to `Arc::from_raw(x_ptr)` would be memory-unsafe.
    /// }
    ///
    /// // The memory was freed when `x` went out of scope above, so `x_ptr` is now dangling!
    /// ```
    #[inline]
    pub unsafe fn from_raw(ptr: *const T) -> Self {
        unsafe {
            let offset = data_offset::<T>(&*ptr);

            // Reverse the offset to find the original ArcInner.
            let arc_ptr = strict::byte_sub(ptr as *mut T, offset) as *mut ArcInner<T>;

            Self::from_ptr(arc_ptr)
        }
    }

    /// Increments the strong reference count on the `Arc<T>` associated with the
    /// provided pointer by one.
    ///
    /// # Safety
    ///
    /// The pointer must have been obtained through `Arc::into_raw`, and the
    /// associated `Arc` instance must be valid (i.e. the strong count must be at
    /// least 1) for the duration of this method.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    ///
    /// unsafe {
    ///     let ptr = Arc::into_raw(five);
    ///     Arc::increment_strong_count(ptr);
    ///
    ///     // This assertion is deterministic because we haven't shared
    ///     // the `Arc` between threads.
    ///     let five = Arc::from_raw(ptr);
    ///     assert_eq!(2, Arc::strong_count(&five));
    ///     # Arc::decrement_strong_count(ptr); // avoid memory leak
    /// }
    /// ```
    #[inline]
    pub unsafe fn increment_strong_count(ptr: *const T) {
        // Retain Arc, but don't touch refcount by wrapping in ManuallyDrop
        let arc = unsafe { mem::ManuallyDrop::new(Self::from_raw(ptr)) };
        // Now increase refcount, but don't drop new refcount either
        let _arc_clone: mem::ManuallyDrop<_> = arc.clone();
    }

    /// Decrements the strong reference count on the `Arc<T>` associated with the
    /// provided pointer by one.
    ///
    /// # Safety
    ///
    /// The pointer must have been obtained through `Arc::into_raw`, and the
    /// associated `Arc` instance must be valid (i.e. the strong count must be at
    /// least 1) when invoking this method. This method can be used to release the final
    /// `Arc` and backing storage, but **should not** be called after the final `Arc` has been
    /// released.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    ///
    /// unsafe {
    ///     let ptr = Arc::into_raw(five);
    ///     Arc::increment_strong_count(ptr);
    ///
    ///     // Those assertions are deterministic because we haven't shared
    ///     // the `Arc` between threads.
    ///     let five = Arc::from_raw(ptr);
    ///     assert_eq!(2, Arc::strong_count(&five));
    ///     Arc::decrement_strong_count(ptr);
    ///     assert_eq!(1, Arc::strong_count(&five));
    /// }
    /// ```
    #[inline]
    pub unsafe fn decrement_strong_count(ptr: *const T) {
        // SAFETY: the caller must uphold the safety contract.
        unsafe { drop(Self::from_raw(ptr)) }
    }
}

impl<T: ?Sized> Arc<T> {
    /// Consumes the `Arc`, returning the wrapped pointer.
    ///
    /// To avoid a memory leak the pointer must be converted back to an `Arc` using
    /// [`Arc::from_raw`].
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let x = Arc::new("hello".to_owned());
    /// let x_ptr = Arc::into_raw(x);
    /// assert_eq!(unsafe { &*x_ptr }, "hello");
    /// # unsafe { drop(Arc::from_raw(x_ptr)) } // avoid memory leak
    /// ```
    #[must_use = "losing the pointer will leak memory"]
    pub fn into_raw(this: Self) -> *const T {
        let ptr = Self::as_ptr(&this);
        mem::forget(this);
        ptr
    }

    /// Provides a raw pointer to the data.
    ///
    /// The counts are not affected in any way and the `Arc` is not consumed. The pointer is valid for
    /// as long as there are strong counts in the `Arc`.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let x = Arc::new("hello".to_owned());
    /// let y = Arc::clone(&x);
    /// let x_ptr = Arc::as_ptr(&x);
    /// assert_eq!(x_ptr, Arc::as_ptr(&y));
    /// assert_eq!(unsafe { &*x_ptr }, "hello");
    /// ```
    #[must_use]
    pub fn as_ptr(this: &Self) -> *const T {
        let ptr: *mut ArcInner<T> = this.ptr.as_ptr();

        unsafe { data_ptr::<T>(ptr, &**this) }
    }

    /// Creates a new [`Weak`] pointer to this allocation.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    ///
    /// let weak_five = Arc::downgrade(&five);
    /// ```
    #[must_use = "this returns a new `Weak` pointer, \
                  without modifying the original `Arc`"]
    #[allow(clippy::missing_panics_doc)]
    pub fn downgrade(this: &Self) -> Weak<T> {
        // This Relaxed is OK because we're checking the value in the CAS
        // below.
        let mut cur = this.inner().weak.load(Relaxed);

        loop {
            // check if the weak counter is currently "locked"; if so, spin.
            if cur == usize::MAX {
                hint::spin_loop();
                cur = this.inner().weak.load(Relaxed);
                continue;
            }

            // We can't allow the refcount to increase much past `MAX_REFCOUNT`.
            assert!(cur <= MAX_REFCOUNT, "{}", INTERNAL_OVERFLOW_ERROR);

            // NOTE: this code currently ignores the possibility of overflow
            // into usize::MAX; in general both Rc and Arc need to be adjusted
            // to deal with overflow.

            // Unlike with Clone(), we need this to be an Acquire read to
            // synchronize with the write coming from `is_unique`, so that the
            // events prior to that write happen before this read.
            match this.inner().weak.compare_exchange_weak(cur, cur + 1, Acquire, Relaxed) {
                Ok(_) => {
                    // Make sure we do not create a dangling Weak
                    debug_assert!(!is_dangling(this.ptr.as_ptr()));
                    return Weak { ptr: this.ptr };
                }
                Err(old) => cur = old,
            }
        }
    }

    /// Gets the number of [`Weak`] pointers to this allocation.
    ///
    /// # Safety
    ///
    /// This method by itself is safe, but using it correctly requires extra care.
    /// Another thread can change the weak count at any time,
    /// including potentially between calling this method and acting on the result.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    /// let _weak_five = Arc::downgrade(&five);
    ///
    /// // This assertion is deterministic because we haven't shared
    /// // the `Arc` or `Weak` between threads.
    /// assert_eq!(1, Arc::weak_count(&five));
    /// ```
    #[inline]
    #[must_use]
    pub fn weak_count(this: &Self) -> usize {
        let cnt = this.inner().weak.load(Relaxed);
        // If the weak count is currently locked, the value of the
        // count was 0 just before taking the lock.
        if cnt == usize::MAX {
            0
        } else {
            cnt - 1
        }
    }

    /// Gets the number of strong (`Arc`) pointers to this allocation.
    ///
    /// # Safety
    ///
    /// This method by itself is safe, but using it correctly requires extra care.
    /// Another thread can change the strong count at any time,
    /// including potentially between calling this method and acting on the result.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    /// let _also_five = Arc::clone(&five);
    ///
    /// // This assertion is deterministic because we haven't shared
    /// // the `Arc` between threads.
    /// assert_eq!(2, Arc::strong_count(&five));
    /// ```
    #[inline]
    #[must_use]
    pub fn strong_count(this: &Self) -> usize {
        this.inner().strong.load(Relaxed)
    }

    #[inline]
    fn inner(&self) -> &ArcInner<T> {
        // This unsafety is ok because while this arc is alive we're guaranteed
        // that the inner pointer is valid. Furthermore, we know that the
        // `ArcInner` structure itself is `Sync` because the inner data is
        // `Sync` as well, so we're ok loaning out an immutable pointer to these
        // contents.
        unsafe { self.ptr.as_ref() }
    }

    // Non-inlined part of `drop`.
    #[inline(never)]
    unsafe fn drop_slow(&mut self) {
        // Destroy the data at this time, even though we must not free the box
        // allocation itself (there might still be weak pointers lying around).
        unsafe { ptr::drop_in_place(Self::get_mut_unchecked(self)) };

        // Drop the weak ref collectively held by all strong references
        // Take a reference to `self.alloc` instead of cloning because 1. it'll
        // last long enough, and 2. you should be able to drop `Arc`s with
        // unclonable allocators
        drop(Weak { ptr: self.ptr });
    }

    /// Returns `true` if the two `Arc`s point to the same allocation in a vein similar to
    /// [`ptr::eq`]. This function ignores the metadata of  `dyn Trait` pointers.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    /// let same_five = Arc::clone(&five);
    /// let other_five = Arc::new(5);
    ///
    /// assert!(Arc::ptr_eq(&five, &same_five));
    /// assert!(!Arc::ptr_eq(&five, &other_five));
    /// ```
    ///
    /// [`ptr::eq`]: core::ptr::eq "ptr::eq"
    #[inline]
    #[must_use]
    pub fn ptr_eq(this: &Self, other: &Self) -> bool {
        ptr::eq(this.ptr.as_ptr() as *const (), other.ptr.as_ptr() as *const ())
    }
}

impl<T: ?Sized> Arc<T> {
    /// Allocates an `ArcInner<T>` with sufficient space for
    /// a possibly-unsized inner value where the value has the layout provided.
    ///
    /// The function `mem_to_arc_inner` is called with the data pointer
    /// and must return back a (potentially fat)-pointer for the `ArcInner<T>`.
    unsafe fn allocate_for_layout(
        value_layout: Layout,
        allocate: impl FnOnce(Layout) -> Option<NonNull<u8>>,
        mem_to_arc_inner: impl FnOnce(*mut u8) -> *mut ArcInner<T>,
    ) -> *mut ArcInner<T> {
        let layout = arc_inner_layout_for_value_layout(value_layout);

        let ptr = allocate(layout).unwrap_or_else(|| handle_alloc_error(layout));

        unsafe { Self::initialize_arc_inner(ptr, layout, mem_to_arc_inner) }
    }

    unsafe fn initialize_arc_inner(
        ptr: NonNull<u8>,
        _layout: Layout,
        mem_to_arc_inner: impl FnOnce(*mut u8) -> *mut ArcInner<T>,
    ) -> *mut ArcInner<T> {
        let inner: *mut ArcInner<T> = mem_to_arc_inner(ptr.as_ptr());
        // debug_assert_eq!(unsafe { Layout::for_value_raw(inner) }, layout); // for_value_raw is unstable

        // SAFETY: mem_to_arc_inner return a valid pointer to uninitialized ArcInner<T>.
        // ArcInner<T> is repr(C), and strong and weak are the first and second fields and
        // are the same type, so `inner as *mut atomic::AtomicUsize` is strong and
        // `(inner as *mut atomic::AtomicUsize).add(1)` is weak.
        unsafe {
            let strong = inner as *mut atomic::AtomicUsize;
            strong.write(atomic::AtomicUsize::new(1));
            let weak = strong.add(1);
            weak.write(atomic::AtomicUsize::new(1));
        }

        inner
    }
}

impl<T: ?Sized> Arc<T> {
    /// Allocates an `ArcInner<T>` with sufficient space for an unsized inner value.
    #[inline]
    unsafe fn allocate_for_ptr(ptr: *const T) -> *mut ArcInner<T> {
        // Allocate for the `ArcInner<T>` using the given value.
        unsafe {
            Self::allocate_for_layout(
                Layout::for_value(&*ptr),
                |layout| Global.allocate(layout),
                |mem| strict::with_metadata_of(mem, ptr as *mut ArcInner<T>),
            )
        }
    }

    fn from_box(src: Box<T>) -> Arc<T> {
        unsafe {
            let value_size = size_of_val(&*src);
            let ptr = Self::allocate_for_ptr(&*src);

            // Copy value as bytes
            ptr::copy_nonoverlapping(
                &*src as *const T as *const u8,
                data_ptr::<T>(ptr, &*src) as *mut u8,
                value_size,
            );

            // Free the allocation without dropping its contents
            let box_ptr = Box::into_raw(src);
            let src = Box::from_raw(box_ptr as *mut mem::ManuallyDrop<T>);
            drop(src);

            Self::from_ptr(ptr)
        }
    }
}

#[cfg(not(portable_atomic_no_alloc_layout_extras))]
impl<T> Arc<[T]> {
    /// Allocates an `ArcInner<[T]>` with the given length.
    unsafe fn allocate_for_slice(len: usize) -> *mut ArcInner<[T]> {
        unsafe {
            Self::allocate_for_layout(
                Layout::array::<T>(len).unwrap(),
                |layout| Global.allocate(layout),
                |mem| ptr::slice_from_raw_parts_mut(mem.cast::<T>(), len) as *mut ArcInner<[T]>,
            )
        }
    }

    /// Constructs an `Arc<[T]>` from an iterator known to be of a certain size.
    ///
    /// Behavior is undefined should the size be wrong.
    unsafe fn from_iter_exact(iter: impl Iterator<Item = T>, len: usize) -> Self {
        // Panic guard while cloning T elements.
        // In the event of a panic, elements that have been written
        // into the new ArcInner will be dropped, then the memory freed.
        struct Guard<T> {
            ptr: *mut ArcInner<[mem::MaybeUninit<T>]>,
            elems: *mut T,
            n_elems: usize,
        }

        impl<T> Drop for Guard<T> {
            fn drop(&mut self) {
                unsafe {
                    let slice = slice::from_raw_parts_mut(self.elems, self.n_elems);
                    ptr::drop_in_place(slice);

                    drop(Box::from_raw(self.ptr));
                }
            }
        }

        unsafe {
            let ptr: *mut ArcInner<[mem::MaybeUninit<T>]> = Arc::allocate_for_slice(len);

            // Pointer to first element
            let elems = (*ptr).data.as_mut_ptr() as *mut T;

            let mut guard = Guard { ptr, elems, n_elems: 0 };

            for (i, item) in iter.enumerate() {
                ptr::write(elems.add(i), item);
                guard.n_elems += 1;
            }

            // All clear. Forget the guard so it doesn't free the new ArcInner.
            mem::forget(guard);

            Arc::from_ptr(ptr).assume_init()
        }
    }
}

impl<T: ?Sized> Clone for Arc<T> {
    /// Makes a clone of the `Arc` pointer.
    ///
    /// This creates another pointer to the same allocation, increasing the
    /// strong reference count.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    ///
    /// let _ = Arc::clone(&five);
    /// ```
    #[inline]
    fn clone(&self) -> Self {
        // Using a relaxed ordering is alright here, as knowledge of the
        // original reference prevents other threads from erroneously deleting
        // the object.
        //
        // As explained in the [Boost documentation][1], Increasing the
        // reference counter can always be done with memory_order_relaxed: New
        // references to an object can only be formed from an existing
        // reference, and passing an existing reference from one thread to
        // another must already provide any required synchronization.
        //
        // [1]: (www.boost.org/doc/libs/1_55_0/doc/html/atomic/usage_examples.html)
        let old_size = self.inner().strong.fetch_add(1, Relaxed);

        // However we need to guard against massive refcounts in case someone is `mem::forget`ing
        // Arcs. If we don't do this the count can overflow and users will use-after free. This
        // branch will never be taken in any realistic program. We abort because such a program is
        // incredibly degenerate, and we don't care to support it.
        //
        // This check is not 100% water-proof: we error when the refcount grows beyond `isize::MAX`.
        // But we do that check *after* having done the increment, so there is a chance here that
        // the worst already happened and we actually do overflow the `usize` counter. However, that
        // requires the counter to grow from `isize::MAX` to `usize::MAX` between the increment
        // above and the `abort` below, which seems exceedingly unlikely.
        //
        // This is a global invariant, and also applies when using a compare-exchange loop to increment
        // counters in other methods.
        // Otherwise, the counter could be brought to an almost-overflow using a compare-exchange loop,
        // and then overflow using a few `fetch_add`s.
        if old_size > MAX_REFCOUNT {
            abort();
        }

        unsafe { Self::from_inner(self.ptr) }
    }
}

impl<T: ?Sized> Deref for Arc<T> {
    type Target = T;

    #[inline]
    fn deref(&self) -> &Self::Target {
        &self.inner().data
    }
}

impl<T: Clone> Arc<T> {
    /// Makes a mutable reference into the given `Arc`.
    ///
    /// If there are other `Arc` pointers to the same allocation, then `make_mut` will
    /// [`clone`] the inner value to a new allocation to ensure unique ownership.  This is also
    /// referred to as clone-on-write.
    ///
    /// However, if there are no other `Arc` pointers to this allocation, but some [`Weak`]
    /// pointers, then the [`Weak`] pointers will be dissociated and the inner value will not
    /// be cloned.
    ///
    /// See also [`get_mut`], which will fail rather than cloning the inner value
    /// or dissociating [`Weak`] pointers.
    ///
    /// [`clone`]: Clone::clone
    /// [`get_mut`]: Arc::get_mut
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let mut data = Arc::new(5);
    ///
    /// *Arc::make_mut(&mut data) += 1; // Won't clone anything
    /// let mut other_data = Arc::clone(&data); // Won't clone inner data
    /// *Arc::make_mut(&mut data) += 1; // Clones inner data
    /// *Arc::make_mut(&mut data) += 1; // Won't clone anything
    /// *Arc::make_mut(&mut other_data) *= 2; // Won't clone anything
    ///
    /// // Now `data` and `other_data` point to different allocations.
    /// assert_eq!(*data, 8);
    /// assert_eq!(*other_data, 12);
    /// ```
    ///
    /// [`Weak`] pointers will be dissociated:
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let mut data = Arc::new(75);
    /// let weak = Arc::downgrade(&data);
    ///
    /// assert!(75 == *data);
    /// assert!(75 == *weak.upgrade().unwrap());
    ///
    /// *Arc::make_mut(&mut data) += 1;
    ///
    /// assert!(76 == *data);
    /// assert!(weak.upgrade().is_none());
    /// ```
    #[inline]
    pub fn make_mut(this: &mut Self) -> &mut T {
        // Note that we hold both a strong reference and a weak reference.
        // Thus, releasing our strong reference only will not, by itself, cause
        // the memory to be deallocated.
        //
        // Use Acquire to ensure that we see any writes to `weak` that happen
        // before release writes (i.e., decrements) to `strong`. Since we hold a
        // weak count, there's no chance the ArcInner itself could be
        // deallocated.
        if this.inner().strong.compare_exchange(1, 0, Acquire, Relaxed).is_err() {
            // Another strong pointer exists, so we must clone.
            // Pre-allocate memory to allow writing the cloned value directly.
            let arc = Self::new_uninit_ptr();
            unsafe {
                let data = data_ptr::<T>(arc.as_ptr(), &**this);
                data.write((**this).clone());
                *this = Self::from_inner(arc);
            }
        } else if this.inner().weak.load(Relaxed) != 1 {
            // Relaxed suffices in the above because this is fundamentally an
            // optimization: we are always racing with weak pointers being
            // dropped. Worst case, we end up allocated a new Arc unnecessarily.

            // We removed the last strong ref, but there are additional weak
            // refs remaining. We'll move the contents to a new Arc, and
            // invalidate the other weak refs.

            // Note that it is not possible for the read of `weak` to yield
            // usize::MAX (i.e., locked), since the weak count can only be
            // locked by a thread with a strong reference.

            // Materialize our own implicit weak pointer, so that it can clean
            // up the ArcInner as needed.
            let _weak = Weak { ptr: this.ptr };

            // Can just steal the data, all that's left are `Weak`s
            let arc = Self::new_uninit_ptr();
            unsafe {
                let data = data_ptr::<T>(arc.as_ptr(), &**this);
                data.copy_from_nonoverlapping(&**this, 1);
                ptr::write(this, Self::from_inner(arc));
            }
        } else {
            // We were the sole reference of either kind; bump back up the
            // strong ref count.
            this.inner().strong.store(1, Release);
        }

        // As with `get_mut()`, the unsafety is ok because our reference was
        // either unique to begin with, or became one upon cloning the contents.
        unsafe { Self::get_mut_unchecked(this) }
    }

    /// If we have the only reference to `T` then unwrap it. Otherwise, clone `T` and return the
    /// clone.
    ///
    /// Assuming `arc_t` is of type `Arc<T>`, this function is functionally equivalent to
    /// `(*arc_t).clone()`, but will avoid cloning the inner value where possible.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    /// use std::ptr;
    ///
    /// let inner = String::from("test");
    /// let ptr = inner.as_ptr();
    ///
    /// let arc = Arc::new(inner);
    /// let inner = Arc::unwrap_or_clone(arc);
    /// // The inner value was not cloned
    /// assert!(ptr::eq(ptr, inner.as_ptr()));
    ///
    /// let arc = Arc::new(inner);
    /// let arc2 = arc.clone();
    /// let inner = Arc::unwrap_or_clone(arc);
    /// // Because there were 2 references, we had to clone the inner value.
    /// assert!(!ptr::eq(ptr, inner.as_ptr()));
    /// // `arc2` is the last reference, so when we unwrap it we get back
    /// // the original `String`.
    /// let inner = Arc::unwrap_or_clone(arc2);
    /// assert!(ptr::eq(ptr, inner.as_ptr()));
    /// ```
    #[inline]
    pub fn unwrap_or_clone(this: Self) -> T {
        Self::try_unwrap(this).unwrap_or_else(|arc| (*arc).clone())
    }
}

impl<T: ?Sized> Arc<T> {
    /// Returns a mutable reference into the given `Arc`, if there are
    /// no other `Arc` or [`Weak`] pointers to the same allocation.
    ///
    /// Returns [`None`] otherwise, because it is not safe to
    /// mutate a shared value.
    ///
    /// See also [`make_mut`][make_mut], which will [`clone`][clone]
    /// the inner value when there are other `Arc` pointers.
    ///
    /// [make_mut]: Arc::make_mut
    /// [clone]: Clone::clone
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let mut x = Arc::new(3);
    /// *Arc::get_mut(&mut x).unwrap() = 4;
    /// assert_eq!(*x, 4);
    ///
    /// let _y = Arc::clone(&x);
    /// assert!(Arc::get_mut(&mut x).is_none());
    /// ```
    #[inline]
    pub fn get_mut(this: &mut Self) -> Option<&mut T> {
        if this.is_unique() {
            // This unsafety is ok because we're guaranteed that the pointer
            // returned is the *only* pointer that will ever be returned to T. Our
            // reference count is guaranteed to be 1 at this point, and we required
            // the Arc itself to be `mut`, so we're returning the only possible
            // reference to the inner data.
            unsafe { Some(Self::get_mut_unchecked(this)) }
        } else {
            None
        }
    }

    #[inline]
    unsafe fn get_mut_unchecked(this: &mut Self) -> &mut T {
        // We are careful to *not* create a reference covering the "count" fields, as
        // this would alias with concurrent access to the reference counts (e.g. by `Weak`).
        unsafe { &mut (*this.ptr.as_ptr()).data }
    }

    /// Determine whether this is the unique reference (including weak refs) to
    /// the underlying data.
    ///
    /// Note that this requires locking the weak ref count.
    fn is_unique(&mut self) -> bool {
        // lock the weak pointer count if we appear to be the sole weak pointer
        // holder.
        //
        // The acquire label here ensures a happens-before relationship with any
        // writes to `strong` (in particular in `Weak::upgrade`) prior to decrements
        // of the `weak` count (via `Weak::drop`, which uses release). If the upgraded
        // weak ref was never dropped, the CAS here will fail so we do not care to synchronize.
        if self.inner().weak.compare_exchange(1, usize::MAX, Acquire, Relaxed).is_ok() {
            // This needs to be an `Acquire` to synchronize with the decrement of the `strong`
            // counter in `drop` -- the only access that happens when any but the last reference
            // is being dropped.
            let unique = self.inner().strong.load(Acquire) == 1;

            // The release write here synchronizes with a read in `downgrade`,
            // effectively preventing the above read of `strong` from happening
            // after the write.
            self.inner().weak.store(1, Release); // release the lock
            unique
        } else {
            false
        }
    }
}

impl<T: ?Sized> Drop for Arc<T> {
    /// Drops the `Arc`.
    ///
    /// This will decrement the strong reference count. If the strong reference
    /// count reaches zero then the only other references (if any) are
    /// [`Weak`], so we `drop` the inner value.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// struct Foo;
    ///
    /// impl Drop for Foo {
    ///     fn drop(&mut self) {
    ///         println!("dropped!");
    ///     }
    /// }
    ///
    /// let foo = Arc::new(Foo);
    /// let foo2 = Arc::clone(&foo);
    ///
    /// drop(foo); // Doesn't print anything
    /// drop(foo2); // Prints "dropped!"
    /// ```
    #[inline]
    fn drop(&mut self) {
        // Because `fetch_sub` is already atomic, we do not need to synchronize
        // with other threads unless we are going to delete the object. This
        // same logic applies to the below `fetch_sub` to the `weak` count.
        if self.inner().strong.fetch_sub(1, Release) != 1 {
            return;
        }

        // This fence is needed to prevent reordering of use of the data and
        // deletion of the data. Because it is marked `Release`, the decreasing
        // of the reference count synchronizes with this `Acquire` fence. This
        // means that use of the data happens before decreasing the reference
        // count, which happens before this fence, which happens before the
        // deletion of the data.
        //
        // As explained in the [Boost documentation][1],
        //
        // > It is important to enforce any possible access to the object in one
        // > thread (through an existing reference) to *happen before* deleting
        // > the object in a different thread. This is achieved by a "release"
        // > operation after dropping a reference (any access to the object
        // > through this reference must obviously happened before), and an
        // > "acquire" operation before deleting the object.
        //
        // In particular, while the contents of an Arc are usually immutable, it's
        // possible to have interior writes to something like a Mutex<T>. Since a
        // Mutex is not acquired when it is deleted, we can't rely on its
        // synchronization logic to make writes in thread A visible to a destructor
        // running in thread B.
        //
        // Also note that the Acquire fence here could probably be replaced with an
        // Acquire load, which could improve performance in highly-contended
        // situations. See [2].
        //
        // [1]: (www.boost.org/doc/libs/1_55_0/doc/html/atomic/usage_examples.html)
        // [2]: (https://github.com/rust-lang/rust/pull/41714)
        acquire!(self.inner().strong);

        unsafe {
            self.drop_slow();
        }
    }
}

impl Arc<dyn Any + Send + Sync> {
    /// Attempt to downcast the `Arc<dyn Any + Send + Sync>` to a concrete type.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    /// use std::any::Any;
    ///
    /// fn print_if_string(value: Arc<dyn Any + Send + Sync>) {
    ///     if let Ok(string) = value.downcast::<String>() {
    ///         println!("String ({}): {}", string.len(), string);
    ///     }
    /// }
    ///
    /// let my_string = "Hello World".to_string();
    // TODO: CoerceUnsized is needed to cast Arc<String> -> Arc<dyn Any + Send + Sync> directly.
    // /// print_if_string(Arc::new(my_string));
    // /// print_if_string(Arc::new(0i8));
    /// print_if_string(Arc::from(Box::new(my_string) as Box<dyn Any + Send + Sync>));
    /// print_if_string(Arc::from(Box::new(0i8) as Box<dyn Any + Send + Sync>));
    /// ```
    #[inline]
    pub fn downcast<T>(self) -> Result<Arc<T>, Self>
    where
        T: Any + Send + Sync,
    {
        if (*self).is::<T>() {
            unsafe {
                let ptr = self.ptr.cast::<ArcInner<T>>();
                mem::forget(self);
                Ok(Arc::from_inner(ptr))
            }
        } else {
            Err(self)
        }
    }
}

impl<T> Weak<T> {
    /// Constructs a new `Weak<T>`, without allocating any memory.
    /// Calling [`upgrade`] on the return value always gives [`None`].
    ///
    /// [`upgrade`]: Weak::upgrade
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Weak;
    ///
    /// let empty: Weak<i64> = Weak::new();
    /// assert!(empty.upgrade().is_none());
    /// ```
    #[inline]
    #[must_use]
    pub const fn new() -> Weak<T> {
        Weak { ptr: unsafe { NonNull::new_unchecked(strict::invalid::<ArcInner<T>>(usize::MAX)) } }
    }

    #[inline]
    #[must_use]
    fn new_uninit_ptr() -> NonNull<ArcInner<T>> {
        unsafe {
            NonNull::new_unchecked(Self::allocate_for_layout(
                Layout::new::<T>(),
                |layout| Global.allocate(layout),
                |ptr| ptr as *mut _,
            ))
        }
    }
}

/// Helper type to allow accessing the reference counts without
/// making any assertions about the data field.
struct WeakInner<'a> {
    weak: &'a atomic::AtomicUsize,
    strong: &'a atomic::AtomicUsize,
}

// TODO: See Weak::from_raw
impl<T /*: ?Sized */> Weak<T> {
    /// Converts a raw pointer previously created by [`into_raw`] back into `Weak<T>`.
    ///
    /// This can be used to safely get a strong reference (by calling [`upgrade`]
    /// later) or to deallocate the weak count by dropping the `Weak<T>`.
    ///
    /// It takes ownership of one weak reference (with the exception of pointers created by [`new`],
    /// as these don't own anything; the method still works on them).
    ///
    /// # Safety
    ///
    /// The pointer must have originated from the [`into_raw`] and must still own its potential
    /// weak reference.
    ///
    /// It is allowed for the strong count to be 0 at the time of calling this. Nevertheless, this
    /// takes ownership of one weak reference currently represented as a raw pointer (the weak
    /// count is not modified by this operation) and therefore it must be paired with a previous
    /// call to [`into_raw`].
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::{Arc, Weak};
    ///
    /// let strong = Arc::new("hello".to_owned());
    ///
    /// let raw_1 = Arc::downgrade(&strong).into_raw();
    /// let raw_2 = Arc::downgrade(&strong).into_raw();
    ///
    /// assert_eq!(2, Arc::weak_count(&strong));
    ///
    /// assert_eq!("hello", &*unsafe { Weak::from_raw(raw_1) }.upgrade().unwrap());
    /// assert_eq!(1, Arc::weak_count(&strong));
    ///
    /// drop(strong);
    ///
    /// // Decrement the last weak count.
    /// assert!(unsafe { Weak::from_raw(raw_2) }.upgrade().is_none());
    /// ```
    ///
    /// [`new`]: Weak::new
    /// [`into_raw`]: Weak::into_raw
    /// [`upgrade`]: Weak::upgrade
    #[inline]
    pub unsafe fn from_raw(ptr: *const T) -> Self {
        // See Weak::as_ptr for context on how the input pointer is derived.

        let ptr = if is_dangling(ptr as *mut T) {
            // This is a dangling Weak.
            ptr as *mut ArcInner<T>
        } else {
            // Otherwise, we're guaranteed the pointer came from a non-dangling Weak.

            // TODO: data_offset calls align_of_val which needs to create a reference
            // to data but we cannot create a reference to data here since data in Weak
            // can be dropped concurrently from another thread. Therefore, we can
            // only support sized types that can avoid references to data
            // unless align_of_val_raw is stabilized.
            // // SAFETY: data_offset is safe to call, as ptr references a real (potentially dropped) T.
            // let offset = unsafe { data_offset::<T>(ptr) };
            let offset = data_offset_align(mem::align_of::<T>());

            // Thus, we reverse the offset to get the whole RcBox.
            // SAFETY: the pointer originated from a Weak, so this offset is safe.
            unsafe { strict::byte_sub(ptr as *mut T, offset) as *mut ArcInner<T> }
        };

        // SAFETY: we now have recovered the original Weak pointer, so can create the Weak.
        Weak { ptr: unsafe { NonNull::new_unchecked(ptr) } }
    }
}

// TODO: See Weak::from_raw
impl<T /*: ?Sized */> Weak<T> {
    /// Returns a raw pointer to the object `T` pointed to by this `Weak<T>`.
    ///
    /// The pointer is valid only if there are some strong references. The pointer may be dangling,
    /// unaligned or even [`null`] otherwise.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    /// use std::ptr;
    ///
    /// let strong = Arc::new("hello".to_owned());
    /// let weak = Arc::downgrade(&strong);
    /// // Both point to the same object
    /// assert!(ptr::eq(&*strong, weak.as_ptr()));
    /// // The strong here keeps it alive, so we can still access the object.
    /// assert_eq!("hello", unsafe { &*weak.as_ptr() });
    ///
    /// drop(strong);
    /// // But not any more. We can do weak.as_ptr(), but accessing the pointer would lead to
    /// // undefined behavior.
    /// // assert_eq!("hello", unsafe { &*weak.as_ptr() });
    /// ```
    ///
    /// [`null`]: core::ptr::null "ptr::null"
    #[must_use]
    pub fn as_ptr(&self) -> *const T {
        let ptr: *mut ArcInner<T> = self.ptr.as_ptr();

        if is_dangling(ptr) {
            // If the pointer is dangling, we return the sentinel directly. This cannot be
            // a valid payload address, as the payload is at least as aligned as ArcInner (usize).
            ptr as *const T
        } else {
            // TODO: See Weak::from_raw
            // // SAFETY: if is_dangling returns false, then the pointer is dereferenceable.
            // // The payload may be dropped at this point, and we have to maintain provenance,
            // // so use raw pointer manipulation.
            // unsafe { data_ptr::<T>(ptr, &(*ptr).data) }
            unsafe {
                let offset = data_offset_align(mem::align_of::<T>());
                strict::byte_add(ptr, offset) as *const T
            }
        }
    }

    /// Consumes the `Weak<T>` and turns it into a raw pointer.
    ///
    /// This converts the weak pointer into a raw pointer, while still preserving the ownership of
    /// one weak reference (the weak count is not modified by this operation). It can be turned
    /// back into the `Weak<T>` with [`from_raw`].
    ///
    /// The same restrictions of accessing the target of the pointer as with
    /// [`as_ptr`] apply.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::{Arc, Weak};
    ///
    /// let strong = Arc::new("hello".to_owned());
    /// let weak = Arc::downgrade(&strong);
    /// let raw = weak.into_raw();
    ///
    /// assert_eq!(1, Arc::weak_count(&strong));
    /// assert_eq!("hello", unsafe { &*raw });
    ///
    /// drop(unsafe { Weak::from_raw(raw) });
    /// assert_eq!(0, Arc::weak_count(&strong));
    /// ```
    ///
    /// [`from_raw`]: Weak::from_raw
    /// [`as_ptr`]: Weak::as_ptr
    #[must_use = "`self` will be dropped if the result is not used"]
    pub fn into_raw(self) -> *const T {
        let result = self.as_ptr();
        mem::forget(self);
        result
    }
}

impl<T: ?Sized> Weak<T> {
    /// Attempts to upgrade the `Weak` pointer to an [`Arc`], delaying
    /// dropping of the inner value if successful.
    ///
    /// Returns [`None`] if the inner value has since been dropped.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    ///
    /// let weak_five = Arc::downgrade(&five);
    ///
    /// let strong_five: Option<Arc<_>> = weak_five.upgrade();
    /// assert!(strong_five.is_some());
    ///
    /// // Destroy all strong pointers.
    /// drop(strong_five);
    /// drop(five);
    ///
    /// assert!(weak_five.upgrade().is_none());
    /// ```
    #[must_use = "this returns a new `Arc`, \
                  without modifying the original weak pointer"]
    pub fn upgrade(&self) -> Option<Arc<T>> {
        #[inline]
        fn checked_increment(n: usize) -> Option<usize> {
            // Any write of 0 we can observe leaves the field in permanently zero state.
            if n == 0 {
                return None;
            }
            // See comments in `Arc::clone` for why we do this (for `mem::forget`).
            assert!(n <= MAX_REFCOUNT, "{}", INTERNAL_OVERFLOW_ERROR);
            Some(n + 1)
        }

        // We use a CAS loop to increment the strong count instead of a
        // fetch_add as this function should never take the reference count
        // from zero to one.
        //
        // Relaxed is fine for the failure case because we don't have any expectations about the new state.
        // Acquire is necessary for the success case to synchronize with `Arc::new_cyclic`, when the inner
        // value can be initialized after `Weak` references have already been created. In that case, we
        // expect to observe the fully initialized value.
        if self.inner()?.strong.fetch_update(Acquire, Relaxed, checked_increment).is_ok() {
            // SAFETY: pointer is not null, verified in checked_increment
            unsafe { Some(Arc::from_inner(self.ptr)) }
        } else {
            None
        }
    }

    /// Gets the number of strong (`Arc`) pointers pointing to this allocation.
    ///
    /// If `self` was created using [`Weak::new`], this will return 0.
    #[must_use]
    pub fn strong_count(&self) -> usize {
        if let Some(inner) = self.inner() {
            inner.strong.load(Relaxed)
        } else {
            0
        }
    }

    /// Gets an approximation of the number of `Weak` pointers pointing to this
    /// allocation.
    ///
    /// If `self` was created using [`Weak::new`], or if there are no remaining
    /// strong pointers, this will return 0.
    ///
    /// # Accuracy
    ///
    /// Due to implementation details, the returned value can be off by 1 in
    /// either direction when other threads are manipulating any `Arc`s or
    /// `Weak`s pointing to the same allocation.
    #[must_use]
    pub fn weak_count(&self) -> usize {
        if let Some(inner) = self.inner() {
            let weak = inner.weak.load(Acquire);
            let strong = inner.strong.load(Relaxed);
            if strong == 0 {
                0
            } else {
                // Since we observed that there was at least one strong pointer
                // after reading the weak count, we know that the implicit weak
                // reference (present whenever any strong references are alive)
                // was still around when we observed the weak count, and can
                // therefore safely subtract it.
                weak - 1
            }
        } else {
            0
        }
    }

    /// Returns `None` when the pointer is dangling and there is no allocated `ArcInner`,
    /// (i.e., when this `Weak` was created by `Weak::new`).
    #[inline]
    fn inner(&self) -> Option<WeakInner<'_>> {
        let ptr = self.ptr.as_ptr();
        if is_dangling(ptr) {
            None
        } else {
            // SAFETY: non-dangling Weak is a valid pointer.
            // We are careful to *not* create a reference covering the "data" field, as
            // the field may be mutated concurrently (for example, if the last `Arc`
            // is dropped, the data field will be dropped in-place).
            Some(unsafe { WeakInner { strong: &(*ptr).strong, weak: &(*ptr).weak } })
        }
    }

    /// Returns `true` if the two `Weak`s point to the same allocation similar to [`ptr::eq`], or if
    /// both don't point to any allocation (because they were created with `Weak::new()`). However,
    /// this function ignores the metadata of  `dyn Trait` pointers.
    ///
    /// # Notes
    ///
    /// Since this compares pointers it means that `Weak::new()` will equal each
    /// other, even though they don't point to any allocation.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let first_rc = Arc::new(5);
    /// let first = Arc::downgrade(&first_rc);
    /// let second = Arc::downgrade(&first_rc);
    ///
    /// assert!(first.ptr_eq(&second));
    ///
    /// let third_rc = Arc::new(5);
    /// let third = Arc::downgrade(&third_rc);
    ///
    /// assert!(!first.ptr_eq(&third));
    /// ```
    ///
    /// Comparing `Weak::new`.
    ///
    /// ```
    /// use portable_atomic_util::{Arc, Weak};
    ///
    /// let first = Weak::new();
    /// let second = Weak::new();
    /// assert!(first.ptr_eq(&second));
    ///
    /// let third_rc = Arc::new(());
    /// let third = Arc::downgrade(&third_rc);
    /// assert!(!first.ptr_eq(&third));
    /// ```
    ///
    /// [`ptr::eq`]: core::ptr::eq "ptr::eq"
    #[inline]
    #[must_use]
    pub fn ptr_eq(&self, other: &Self) -> bool {
        ptr::eq(self.ptr.as_ptr() as *const (), other.ptr.as_ptr() as *const ())
    }
}

impl<T: ?Sized> Weak<T> {
    /// Allocates an `ArcInner<T>` with sufficient space for
    /// a possibly-unsized inner value where the value has the layout provided.
    ///
    /// The function `mem_to_arc_inner` is called with the data pointer
    /// and must return back a (potentially fat)-pointer for the `ArcInner<T>`.
    unsafe fn allocate_for_layout(
        value_layout: Layout,
        allocate: impl FnOnce(Layout) -> Option<NonNull<u8>>,
        mem_to_arc_inner: impl FnOnce(*mut u8) -> *mut ArcInner<T>,
    ) -> *mut ArcInner<T> {
        let layout = arc_inner_layout_for_value_layout(value_layout);

        let ptr = allocate(layout).unwrap_or_else(|| handle_alloc_error(layout));

        unsafe { Self::initialize_arc_inner(ptr, layout, mem_to_arc_inner) }
    }

    unsafe fn initialize_arc_inner(
        ptr: NonNull<u8>,
        _layout: Layout,
        mem_to_arc_inner: impl FnOnce(*mut u8) -> *mut ArcInner<T>,
    ) -> *mut ArcInner<T> {
        let inner: *mut ArcInner<T> = mem_to_arc_inner(ptr.as_ptr());
        // debug_assert_eq!(unsafe { Layout::for_value_raw(inner) }, layout); // for_value_raw is unstable

        // SAFETY: mem_to_arc_inner return a valid pointer to uninitialized ArcInner<T>.
        // ArcInner<T> is repr(C), and strong and weak are the first and second fields and
        // are the same type, so `inner as *mut atomic::AtomicUsize` is strong and
        // `(inner as *mut atomic::AtomicUsize).add(1)` is weak.
        unsafe {
            let strong = inner as *mut atomic::AtomicUsize;
            strong.write(atomic::AtomicUsize::new(0));
            let weak = strong.add(1);
            weak.write(atomic::AtomicUsize::new(1));
        }

        inner
    }
}

impl<T: ?Sized> Clone for Weak<T> {
    /// Makes a clone of the `Weak` pointer that points to the same allocation.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::{Arc, Weak};
    ///
    /// let weak_five = Arc::downgrade(&Arc::new(5));
    ///
    /// let _ = Weak::clone(&weak_five);
    /// ```
    #[inline]
    fn clone(&self) -> Self {
        let inner = if let Some(inner) = self.inner() {
            inner
        } else {
            return Self { ptr: self.ptr };
        };
        // See comments in Arc::clone() for why this is relaxed. This can use a
        // fetch_add (ignoring the lock) because the weak count is only locked
        // where are *no other* weak pointers in existence. (So we can't be
        // running this code in that case).
        let old_size = inner.weak.fetch_add(1, Relaxed);

        // See comments in Arc::clone() for why we do this (for mem::forget).
        if old_size > MAX_REFCOUNT {
            abort();
        }

        Self { ptr: self.ptr }
    }
}

impl<T> Default for Weak<T> {
    /// Constructs a new `Weak<T>`, without allocating memory.
    /// Calling [`upgrade`] on the return value always
    /// gives [`None`].
    ///
    /// [`upgrade`]: Weak::upgrade
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Weak;
    ///
    /// let empty: Weak<i64> = Default::default();
    /// assert!(empty.upgrade().is_none());
    /// ```
    fn default() -> Self {
        Self::new()
    }
}

impl<T: ?Sized> Drop for Weak<T> {
    /// Drops the `Weak` pointer.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::{Arc, Weak};
    ///
    /// struct Foo;
    ///
    /// impl Drop for Foo {
    ///     fn drop(&mut self) {
    ///         println!("dropped!");
    ///     }
    /// }
    ///
    /// let foo = Arc::new(Foo);
    /// let weak_foo = Arc::downgrade(&foo);
    /// let other_weak_foo = Weak::clone(&weak_foo);
    ///
    /// drop(weak_foo); // Doesn't print anything
    /// drop(foo); // Prints "dropped!"
    ///
    /// assert!(other_weak_foo.upgrade().is_none());
    /// ```
    fn drop(&mut self) {
        // If we find out that we were the last weak pointer, then its time to
        // deallocate the data entirely. See the discussion in Arc::drop() about
        // the memory orderings
        //
        // It's not necessary to check for the locked state here, because the
        // weak count can only be locked if there was precisely one weak ref,
        // meaning that drop could only subsequently run ON that remaining weak
        // ref, which can only happen after the lock is released.
        let inner = if let Some(inner) = self.inner() { inner } else { return };

        if inner.weak.fetch_sub(1, Release) == 1 {
            acquire!(inner.weak);
            // Free the allocation without dropping T
            let ptr = self.ptr.as_ptr() as *mut ArcInner<mem::ManuallyDrop<T>>;
            drop(unsafe { Box::from_raw(ptr) });
        }
    }
}

impl<T: ?Sized + PartialEq> PartialEq for Arc<T> {
    /// Equality for two `Arc`s.
    ///
    /// Two `Arc`s are equal if their inner values are equal, even if they are
    /// stored in different allocation.
    ///
    /// If `T` also implements `Eq` (implying reflexivity of equality),
    /// two `Arc`s that point to the same allocation are always equal.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    ///
    /// assert!(five == Arc::new(5));
    /// ```
    #[inline]
    fn eq(&self, other: &Self) -> bool {
        **self == **other
    }

    /// Inequality for two `Arc`s.
    ///
    /// Two `Arc`s are not equal if their inner values are not equal.
    ///
    /// If `T` also implements `Eq` (implying reflexivity of equality),
    /// two `Arc`s that point to the same value are always equal.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    ///
    /// assert!(five != Arc::new(6));
    /// ```
    #[allow(clippy::partialeq_ne_impl)]
    #[inline]
    fn ne(&self, other: &Self) -> bool {
        **self != **other
    }
}

impl<T: ?Sized + PartialOrd> PartialOrd for Arc<T> {
    /// Partial comparison for two `Arc`s.
    ///
    /// The two are compared by calling `partial_cmp()` on their inner values.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    /// use std::cmp::Ordering;
    ///
    /// let five = Arc::new(5);
    ///
    /// assert_eq!(Some(Ordering::Less), five.partial_cmp(&Arc::new(6)));
    /// ```
    fn partial_cmp(&self, other: &Self) -> Option<cmp::Ordering> {
        (**self).partial_cmp(&**other)
    }

    /// Less-than comparison for two `Arc`s.
    ///
    /// The two are compared by calling `<` on their inner values.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    ///
    /// assert!(five < Arc::new(6));
    /// ```
    fn lt(&self, other: &Self) -> bool {
        *(*self) < *(*other)
    }

    /// 'Less than or equal to' comparison for two `Arc`s.
    ///
    /// The two are compared by calling `<=` on their inner values.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    ///
    /// assert!(five <= Arc::new(5));
    /// ```
    fn le(&self, other: &Self) -> bool {
        *(*self) <= *(*other)
    }

    /// Greater-than comparison for two `Arc`s.
    ///
    /// The two are compared by calling `>` on their inner values.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    ///
    /// assert!(five > Arc::new(4));
    /// ```
    fn gt(&self, other: &Self) -> bool {
        *(*self) > *(*other)
    }

    /// 'Greater than or equal to' comparison for two `Arc`s.
    ///
    /// The two are compared by calling `>=` on their inner values.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let five = Arc::new(5);
    ///
    /// assert!(five >= Arc::new(5));
    /// ```
    fn ge(&self, other: &Self) -> bool {
        *(*self) >= *(*other)
    }
}
impl<T: ?Sized + Ord> Ord for Arc<T> {
    /// Comparison for two `Arc`s.
    ///
    /// The two are compared by calling `cmp()` on their inner values.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    /// use std::cmp::Ordering;
    ///
    /// let five = Arc::new(5);
    ///
    /// assert_eq!(Ordering::Less, five.cmp(&Arc::new(6)));
    /// ```
    fn cmp(&self, other: &Self) -> cmp::Ordering {
        (**self).cmp(&**other)
    }
}
impl<T: ?Sized + Eq> Eq for Arc<T> {}

impl<T: ?Sized + fmt::Display> fmt::Display for Arc<T> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        fmt::Display::fmt(&**self, f)
    }
}

impl<T: ?Sized + fmt::Debug> fmt::Debug for Arc<T> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        fmt::Debug::fmt(&**self, f)
    }
}

impl<T: ?Sized> fmt::Pointer for Arc<T> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        fmt::Pointer::fmt(&(&**self as *const T), f)
    }
}

impl<T: Default> Default for Arc<T> {
    /// Creates a new `Arc<T>`, with the `Default` value for `T`.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    ///
    /// let x: Arc<i32> = Default::default();
    /// assert_eq!(*x, 0);
    /// ```
    fn default() -> Self {
        Self::new(Default::default())
    }
}

impl<T: ?Sized + Hash> Hash for Arc<T> {
    fn hash<H: Hasher>(&self, state: &mut H) {
        (**self).hash(state);
    }
}

impl<T> From<T> for Arc<T> {
    /// Converts a `T` into an `Arc<T>`
    ///
    /// The conversion moves the value into a
    /// newly allocated `Arc`. It is equivalent to
    /// calling `Arc::new(t)`.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    /// let x = 5;
    /// let arc = Arc::new(5);
    ///
    /// assert_eq!(Arc::from(x), arc);
    /// ```
    fn from(t: T) -> Self {
        Self::new(t)
    }
}

// This just outputs the input as is, but helps avoid syntax checks by old rustc that rejects const generics.
#[cfg(not(portable_atomic_no_min_const_generics))]
macro_rules! items {
    ($($tt:tt)*) => {
        $($tt)*
    };
}

// TODO: CoerceUnsized is needed to cast Arc<[T; N]> -> Arc<[T]>
// #[cfg(not(portable_atomic_no_min_const_generics))]
// items! {
// impl<T, const N: usize> From<[T; N]> for Arc<[T]> {
//     /// Converts a [`[T; N]`](prim@array) into an `Arc<[T]>`.
//     ///
//     /// The conversion moves the array into a newly allocated `Arc`.
//     ///
//     /// # Example
//     ///
//     /// ```
//     /// use portable_atomic_util::Arc;
//     /// let original: [i32; 3] = [1, 2, 3];
//     /// let shared: Arc<[i32]> = Arc::from(original);
//     /// assert_eq!(&[1, 2, 3], &shared[..]);
//     /// ```
//     #[inline]
//     fn from(v: [T; N]) -> Self {
//         Arc::<[T; N]>::from(v)
//     }
// }
// }

#[cfg(not(portable_atomic_no_alloc_layout_extras))]
impl<T: Clone> From<&[T]> for Arc<[T]> {
    /// Allocate a reference-counted slice and fill it by cloning `v`'s items.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    /// let original: &[i32] = &[1, 2, 3];
    /// let shared: Arc<[i32]> = Arc::from(original);
    /// assert_eq!(&[1, 2, 3], &shared[..]);
    /// ```
    #[inline]
    fn from(v: &[T]) -> Self {
        unsafe { Self::from_iter_exact(v.iter().cloned(), v.len()) }
    }
}

#[cfg(not(portable_atomic_no_alloc_layout_extras))]
impl From<&str> for Arc<str> {
    /// Allocate a reference-counted `str` and copy `v` into it.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    /// let shared: Arc<str> = Arc::from("eggplant");
    /// assert_eq!("eggplant", &shared[..]);
    /// ```
    #[inline]
    fn from(v: &str) -> Self {
        let arc = Arc::<[u8]>::from(v.as_bytes());
        // SAFETY: `str` has the same layout as `[u8]`.
        // https://doc.rust-lang.org/nightly/reference/type-layout.html#str-layout
        unsafe { Self::from_raw(Arc::into_raw(arc) as *const str) }
    }
}

#[cfg(not(portable_atomic_no_alloc_layout_extras))]
impl From<String> for Arc<str> {
    /// Allocate a reference-counted `str` and copy `v` into it.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    /// let unique: String = "eggplant".to_owned();
    /// let shared: Arc<str> = Arc::from(unique);
    /// assert_eq!("eggplant", &shared[..]);
    /// ```
    #[inline]
    fn from(v: String) -> Self {
        Self::from(&v[..])
    }
}

impl<T: ?Sized> From<Box<T>> for Arc<T> {
    /// Move a boxed object to a new, reference-counted allocation.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    /// let unique: Box<str> = Box::from("eggplant");
    /// let shared: Arc<str> = Arc::from(unique);
    /// assert_eq!("eggplant", &shared[..]);
    /// ```
    #[inline]
    fn from(v: Box<T>) -> Self {
        Self::from_box(v)
    }
}

#[cfg(not(portable_atomic_no_alloc_layout_extras))]
impl<T> From<Vec<T>> for Arc<[T]> {
    /// Allocate a reference-counted slice and move `v`'s items into it.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    /// let unique: Vec<i32> = vec![1, 2, 3];
    /// let shared: Arc<[i32]> = Arc::from(unique);
    /// assert_eq!(&[1, 2, 3], &shared[..]);
    /// ```
    #[inline]
    fn from(v: Vec<T>) -> Self {
        unsafe {
            let len = v.len();
            let cap = v.capacity();
            let vec_ptr = mem::ManuallyDrop::new(v).as_mut_ptr();

            let mut arc = Self::new_uninit_slice(len);
            let data = Arc::get_mut_unchecked(&mut arc);
            ptr::copy_nonoverlapping(vec_ptr, data.as_mut_ptr() as *mut T, len);

            // Create a `Vec<T>` with length 0, to deallocate the buffer
            // without dropping its contents or the allocator
            let _ = Vec::from_raw_parts(vec_ptr, 0, cap);

            arc.assume_init()
        }
    }
}

#[cfg(not(portable_atomic_no_alloc_layout_extras))]
impl<'a, B> From<Cow<'a, B>> for Arc<B>
where
    B: ToOwned + ?Sized,
    Arc<B>: From<&'a B> + From<B::Owned>,
{
    /// Create an atomically reference-counted pointer from
    /// a clone-on-write pointer by copying its content.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    /// use std::borrow::Cow;
    /// let cow: Cow<'_, str> = Cow::Borrowed("eggplant");
    /// let shared: Arc<str> = Arc::from(cow);
    /// assert_eq!("eggplant", &shared[..]);
    /// ```
    #[inline]
    fn from(cow: Cow<'a, B>) -> Self {
        match cow {
            Cow::Borrowed(s) => Self::from(s),
            Cow::Owned(s) => Self::from(s),
        }
    }
}

#[cfg(not(portable_atomic_no_alloc_layout_extras))]
impl From<Arc<str>> for Arc<[u8]> {
    /// Converts an atomically reference-counted string slice into a byte slice.
    ///
    /// # Example
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    /// let string: Arc<str> = Arc::from("eggplant");
    /// let bytes: Arc<[u8]> = Arc::from(string);
    /// assert_eq!("eggplant".as_bytes(), bytes.as_ref());
    /// ```
    #[inline]
    fn from(rc: Arc<str>) -> Self {
        // SAFETY: `str` has the same layout as `[u8]`.
        // https://doc.rust-lang.org/nightly/reference/type-layout.html#str-layout
        unsafe { Self::from_raw(Arc::into_raw(rc) as *const [u8]) }
    }
}

#[cfg(not(portable_atomic_no_min_const_generics))]
items! {
impl<T, const N: usize> core::convert::TryFrom<Arc<[T]>> for Arc<[T; N]> {
    type Error = Arc<[T]>;

    fn try_from(boxed_slice: Arc<[T]>) -> Result<Self, Self::Error> {
        if boxed_slice.len() == N {
            Ok(unsafe { Self::from_raw(Arc::into_raw(boxed_slice) as *mut [T; N]) })
        } else {
            Err(boxed_slice)
        }
    }
}
}

#[cfg(not(portable_atomic_no_alloc_layout_extras))]
impl<T> FromIterator<T> for Arc<[T]> {
    /// Takes each element in the `Iterator` and collects it into an `Arc<[T]>`.
    ///
    /// # Performance characteristics
    ///
    /// ## The general case
    ///
    /// In the general case, collecting into `Arc<[T]>` is done by first
    /// collecting into a `Vec<T>`. That is, when writing the following:
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    /// let evens: Arc<[u8]> = (0..10).filter(|&x| x % 2 == 0).collect();
    /// # assert_eq!(&*evens, &[0, 2, 4, 6, 8]);
    /// ```
    ///
    /// this behaves as if we wrote:
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    /// let evens: Arc<[u8]> = (0..10).filter(|&x| x % 2 == 0)
    ///     .collect::<Vec<_>>() // The first set of allocations happens here.
    ///     .into(); // A second allocation for `Arc<[T]>` happens here.
    /// # assert_eq!(&*evens, &[0, 2, 4, 6, 8]);
    /// ```
    ///
    /// This will allocate as many times as needed for constructing the `Vec<T>`
    /// and then it will allocate once for turning the `Vec<T>` into the `Arc<[T]>`.
    ///
    /// ## Iterators of known length
    ///
    /// When your `Iterator` implements `TrustedLen` and is of an exact size,
    /// a single allocation will be made for the `Arc<[T]>`. For example:
    ///
    /// ```
    /// use portable_atomic_util::Arc;
    /// let evens: Arc<[u8]> = (0..10).collect(); // Just a single allocation happens here.
    /// # assert_eq!(&*evens, &*(0..10).collect::<Vec<_>>());
    /// ```
    fn from_iter<I: IntoIterator<Item = T>>(iter: I) -> Self {
        iter.into_iter().collect::<Vec<T>>().into()
    }
}

impl<T: ?Sized> borrow::Borrow<T> for Arc<T> {
    fn borrow(&self) -> &T {
        self
    }
}

impl<T: ?Sized> AsRef<T> for Arc<T> {
    fn as_ref(&self) -> &T {
        self
    }
}

impl<T: ?Sized> Unpin for Arc<T> {}

/// Get the pointer to data within the given an `ArcInner`.
///
/// # Safety
///
/// `arc` must uphold the safety requirements for `.byte_add(data_offset)`.
/// This is automatically satisfied if it is a pointer to a valid `ArcInner``.
unsafe fn data_ptr<T: ?Sized>(arc: *mut ArcInner<T>, data: &T) -> *mut T {
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        let offset = data_offset::<T>(data);
        strict::byte_add(arc, offset) as *mut T
    }
}

/// Get the offset within an `ArcInner` for the payload behind a pointer.
fn data_offset<T: ?Sized>(ptr: &T) -> usize {
    // Align the unsized value to the end of the ArcInner.
    // Because RcBox is repr(C), it will always be the last field in memory.
    data_offset_align(align_of_val::<T>(ptr))
}

#[inline]
fn data_offset_align(align: usize) -> usize {
    let layout = Layout::new::<ArcInner<()>>();
    layout.size() + padding_needed_for(layout, align)
}

#[cfg(feature = "std")]
impl<T: std::error::Error + ?Sized> std::error::Error for Arc<T> {
    #[allow(deprecated)]
    fn description(&self) -> &str {
        std::error::Error::description(&**self)
    }
    #[allow(deprecated)]
    fn cause(&self) -> Option<&dyn std::error::Error> {
        std::error::Error::cause(&**self)
    }
    fn source(&self) -> Option<&(dyn std::error::Error + 'static)> {
        std::error::Error::source(&**self)
    }
}

// TODO: Other trait implementations that are stable but we currently don't provide:
// - alloc::ffi
//   - https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html#impl-From%3C%26CStr%3E-for-Arc%3CCStr%3E
//   - https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html#impl-From%3CCString%3E-for-Arc%3CCStr%3E
//   - Currently, we cannot implement these since CStr layout is not stable.
// - alloc::task
//   - https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html#impl-From%3CArc%3CW%3E%3E-for-RawWaker
//   - https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html#impl-From%3CArc%3CW%3E%3E-for-Waker
//   - https://doc.rust-lang.org/nightly/alloc/task/trait.Wake.html
// - std::os
//   - https://doc.rust-lang.org/nightly/std/sync/struct.Arc.html#impl-AsFd-for-Arc%3CT%3E
//   - https://doc.rust-lang.org/nightly/std/sync/struct.Arc.html#impl-AsHandle-for-Arc%3CT%3E
//   - https://doc.rust-lang.org/nightly/std/sync/struct.Arc.html#impl-AsRawFd-for-Arc%3CT%3E
//   - https://doc.rust-lang.org/nightly/std/sync/struct.Arc.html#impl-AsSocket-for-Arc%3CT%3E
// - std::ffi
//   - https://doc.rust-lang.org/nightly/std/sync/struct.Arc.html#impl-From%3C%26OsStr%3E-for-Arc%3COsStr%3E
//   - https://doc.rust-lang.org/nightly/std/sync/struct.Arc.html#impl-From%3COsString%3E-for-Arc%3COsStr%3E
//   - Currently, we cannot implement these since OsStr layout is not stable.
// - std::path
//   - https://doc.rust-lang.org/nightly/std/sync/struct.Arc.html#impl-From%3C%26Path%3E-for-Arc%3CPath%3E
//   - https://doc.rust-lang.org/nightly/std/sync/struct.Arc.html#impl-From%3CPathBuf%3E-for-Arc%3CPath%3E
//   - Currently, we cannot implement these since Path layout is not stable.
// - std::fs
//   - https://doc.rust-lang.org/nightly/std/sync/struct.Arc.html#impl-Read-for-Arc%3CFile%3E
//   - https://doc.rust-lang.org/nightly/std/sync/struct.Arc.html#impl-Seek-for-Arc%3CFile%3E
//   - https://doc.rust-lang.org/nightly/std/sync/struct.Arc.html#impl-Write-for-Arc%3CFile%3E

// Based on unstable Layout::padding_needed_for.
#[must_use]
#[inline]
fn padding_needed_for(layout: Layout, align: usize) -> usize {
    let len = layout.size();

    // Rounded up value is:
    //   len_rounded_up = (len + align - 1) & !(align - 1);
    // and then we return the padding difference: `len_rounded_up - len`.
    //
    // We use modular arithmetic throughout:
    //
    // 1. align is guaranteed to be > 0, so align - 1 is always
    //    valid.
    //
    // 2. `len + align - 1` can overflow by at most `align - 1`,
    //    so the &-mask with `!(align - 1)` will ensure that in the
    //    case of overflow, `len_rounded_up` will itself be 0.
    //    Thus the returned padding, when added to `len`, yields 0,
    //    which trivially satisfies the alignment `align`.
    //
    // (Of course, attempts to allocate blocks of memory whose
    // size and padding overflow in the above manner should cause
    // the allocator to yield an error anyway.)

    let len_rounded_up = len.wrapping_add(align).wrapping_sub(1) & !align.wrapping_sub(1);
    len_rounded_up.wrapping_sub(len)
}

// Based on Layout::pad_to_align stabilized in Rust 1.44.
#[must_use]
#[inline]
fn pad_to_align(layout: Layout) -> Layout {
    let pad = padding_needed_for(layout, layout.align());
    // This cannot overflow. Quoting from the invariant of Layout:
    // > `size`, when rounded up to the nearest multiple of `align`,
    // > must not overflow isize (i.e., the rounded value must be
    // > less than or equal to `isize::MAX`)
    let new_size = layout.size() + pad;

    // SAFETY: padded size is guaranteed to not exceed `isize::MAX`.
    unsafe { Layout::from_size_align_unchecked(new_size, layout.align()) }
}

// Based on Layout::extend stabilized in Rust 1.44.
#[inline]
fn extend_layout(layout: Layout, next: Layout) -> Option<(Layout, usize)> {
    let new_align = cmp::max(layout.align(), next.align());
    let pad = padding_needed_for(layout, next.align());

    let offset = layout.size().checked_add(pad)?;
    let new_size = offset.checked_add(next.size())?;

    // The safe constructor is called here to enforce the isize size limit.
    let layout = Layout::from_size_align(new_size, new_align).ok()?;
    Some((layout, offset))
}

#[cfg(feature = "std")]
use std::process::abort;
#[cfg(not(feature = "std"))]
#[cold]
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

// Based on unstable alloc::alloc::Global.
//
// Note: unlike alloc::alloc::Global that returns NonNull<[u8]>,
// this returns NonNull<u8>.
#[derive(Copy, Clone, Default, Debug)]
struct Global;
#[allow(clippy::trivially_copy_pass_by_ref, clippy::unused_self)]
impl Global {
    #[inline]
    fn allocate(&self, layout: Layout) -> Option<NonNull<u8>> {
        // Layout::dangling is unstable
        #[must_use]
        #[inline]
        fn dangling(layout: Layout) -> NonNull<u8> {
            // SAFETY: align is guaranteed to be non-zero
            unsafe { NonNull::new_unchecked(strict::invalid::<u8>(layout.align())) }
        }

        match layout.size() {
            0 => Some(dangling(layout)),
            // SAFETY: `layout` is non-zero in size,
            _size => unsafe {
                let raw_ptr = alloc::alloc::alloc(layout);
                NonNull::new(raw_ptr)
            },
        }
    }
}

/// Emulate strict provenance.
///
/// Once strict_provenance is stable, migrate to the standard library's APIs.
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

    // Based on <pointer>::byte_add stabilized in Rust 1.75.
    #[inline]
    #[must_use]
    pub(super) unsafe fn byte_add<T: ?Sized>(ptr: *mut T, count: usize) -> *mut T {
        // SAFETY: the caller must uphold the safety contract for `add`.
        unsafe { with_metadata_of((ptr as *mut u8).add(count), ptr) }
    }

    // Based on <pointer>::byte_sub stabilized in Rust 1.75.
    #[inline]
    #[must_use]
    pub(super) unsafe fn byte_sub<T: ?Sized>(ptr: *mut T, count: usize) -> *mut T {
        // SAFETY: the caller must uphold the safety contract for `sub`.
        unsafe { with_metadata_of((ptr as *mut u8).sub(count), ptr) }
    }
}
