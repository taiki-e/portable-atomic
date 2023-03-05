// Wrap the standard library's atomic types in newtype.
//
// This is not a reexport, because we want to backport changes like
// https://github.com/rust-lang/rust/pull/98383 to old compilers.

use core::sync::atomic::Ordering;

#[repr(transparent)]
pub(crate) struct AtomicBool {
    inner: core::sync::atomic::AtomicBool,
}
impl AtomicBool {
    #[inline]
    pub(crate) const fn new(v: bool) -> Self {
        Self { inner: core::sync::atomic::AtomicBool::new(v) }
    }
    #[inline]
    pub(crate) fn is_lock_free() -> bool {
        Self::is_always_lock_free()
    }
    #[inline]
    pub(crate) const fn is_always_lock_free() -> bool {
        true
    }
    #[inline]
    pub(crate) fn get_mut(&mut self) -> &mut bool {
        self.inner.get_mut()
    }
    #[inline]
    pub(crate) fn into_inner(self) -> bool {
        self.inner.into_inner()
    }
    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn load(&self, order: Ordering) -> bool {
        crate::utils::assert_load_ordering(order); // for track_caller (compiler can omit double check)
        self.inner.load(order)
    }
    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn store(&self, val: bool, order: Ordering) {
        crate::utils::assert_store_ordering(order); // for track_caller (compiler can omit double check)
        self.inner.store(val, order);
    }
    const_fn! {
        const_if: #[cfg(not(portable_atomic_no_const_raw_ptr_deref))];
        #[inline]
        pub(crate) const fn as_ptr(&self) -> *mut bool {
            // SAFETY: Self is #[repr(C)] and internally UnsafeCell<u8>.
            // See also https://github.com/rust-lang/rust/pull/66705 and
            // https://github.com/rust-lang/rust/issues/66136#issuecomment-557867116.
            unsafe {
                (*(self as *const Self as *const core::cell::UnsafeCell<u8>)).get() as *mut bool
            }
        }
    }
}
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(not(portable_atomic_no_atomic_cas)))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(target_has_atomic = "ptr"))]
no_fetch_ops_impl!(AtomicBool, bool);
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(not(portable_atomic_no_atomic_cas)))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(target_has_atomic = "ptr"))]
impl AtomicBool {
    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn compare_exchange(
        &self,
        current: bool,
        new: bool,
        success: Ordering,
        failure: Ordering,
    ) -> Result<bool, bool> {
        crate::utils::assert_compare_exchange_ordering(success, failure); // for track_caller (compiler can omit double check)
        #[cfg(portable_atomic_no_stronger_failure_ordering)]
        let success = crate::utils::upgrade_success_ordering(success, failure);
        self.inner.compare_exchange(current, new, success, failure)
    }
    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn compare_exchange_weak(
        &self,
        current: bool,
        new: bool,
        success: Ordering,
        failure: Ordering,
    ) -> Result<bool, bool> {
        crate::utils::assert_compare_exchange_ordering(success, failure); // for track_caller (compiler can omit double check)
        #[cfg(portable_atomic_no_stronger_failure_ordering)]
        let success = crate::utils::upgrade_success_ordering(success, failure);
        self.inner.compare_exchange_weak(current, new, success, failure)
    }
}
impl core::ops::Deref for AtomicBool {
    type Target = core::sync::atomic::AtomicBool;
    #[inline]
    fn deref(&self) -> &Self::Target {
        &self.inner
    }
}

#[repr(transparent)]
pub(crate) struct AtomicPtr<T> {
    inner: core::sync::atomic::AtomicPtr<T>,
}
impl<T> AtomicPtr<T> {
    #[inline]
    pub(crate) const fn new(v: *mut T) -> Self {
        Self { inner: core::sync::atomic::AtomicPtr::new(v) }
    }
    #[inline]
    pub(crate) fn is_lock_free() -> bool {
        Self::is_always_lock_free()
    }
    #[inline]
    pub(crate) const fn is_always_lock_free() -> bool {
        true
    }
    #[inline]
    pub(crate) fn get_mut(&mut self) -> &mut *mut T {
        self.inner.get_mut()
    }
    #[inline]
    pub(crate) fn into_inner(self) -> *mut T {
        self.inner.into_inner()
    }
    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn load(&self, order: Ordering) -> *mut T {
        crate::utils::assert_load_ordering(order); // for track_caller (compiler can omit double check)
        self.inner.load(order)
    }
    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
        crate::utils::assert_store_ordering(order); // for track_caller (compiler can omit double check)
        self.inner.store(ptr, order);
    }
    const_fn! {
        const_if: #[cfg(not(portable_atomic_no_const_raw_ptr_deref))];
        #[inline]
        pub(crate) const fn as_ptr(&self) -> *mut *mut T {
            // SAFETY: Self is #[repr(C)] and internally UnsafeCell<*mut T>.
            // See also https://github.com/rust-lang/rust/pull/66705 and
            // https://github.com/rust-lang/rust/issues/66136#issuecomment-557867116.
            unsafe { (*(self as *const Self as *const core::cell::UnsafeCell<*mut T>)).get() }
        }
    }
}
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(not(portable_atomic_no_atomic_cas)))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(target_has_atomic = "ptr"))]
impl<T> AtomicPtr<T> {
    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn compare_exchange(
        &self,
        current: *mut T,
        new: *mut T,
        success: Ordering,
        failure: Ordering,
    ) -> Result<*mut T, *mut T> {
        crate::utils::assert_compare_exchange_ordering(success, failure); // for track_caller (compiler can omit double check)
        #[cfg(portable_atomic_no_stronger_failure_ordering)]
        let success = crate::utils::upgrade_success_ordering(success, failure);
        self.inner.compare_exchange(current, new, success, failure)
    }
    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub(crate) fn compare_exchange_weak(
        &self,
        current: *mut T,
        new: *mut T,
        success: Ordering,
        failure: Ordering,
    ) -> Result<*mut T, *mut T> {
        crate::utils::assert_compare_exchange_ordering(success, failure); // for track_caller (compiler can omit double check)
        #[cfg(portable_atomic_no_stronger_failure_ordering)]
        let success = crate::utils::upgrade_success_ordering(success, failure);
        self.inner.compare_exchange_weak(current, new, success, failure)
    }
}
impl<T> core::ops::Deref for AtomicPtr<T> {
    type Target = core::sync::atomic::AtomicPtr<T>;
    #[inline]
    fn deref(&self) -> &Self::Target {
        &self.inner
    }
}

macro_rules! atomic_int {
    ($atomic_type:ident, $int_type:ident) => {
        #[repr(transparent)]
        pub(crate) struct $atomic_type {
            inner: core::sync::atomic::$atomic_type,
        }
        #[cfg_attr(
            portable_atomic_no_cfg_target_has_atomic,
            cfg(not(portable_atomic_no_atomic_cas))
        )]
        #[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(target_has_atomic = "ptr"))]
        no_fetch_ops_impl!($atomic_type, $int_type);
        #[cfg(not(all(
            not(any(miri, portable_atomic_sanitize_thread)),
            any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
            any(target_arch = "x86", target_arch = "x86_64"),
        )))]
        #[cfg_attr(
            portable_atomic_no_cfg_target_has_atomic,
            cfg(not(portable_atomic_no_atomic_cas))
        )]
        #[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(target_has_atomic = "ptr"))]
        bit_opts_fetch_impl!($atomic_type, $int_type);
        impl $atomic_type {
            #[inline]
            pub(crate) const fn new(v: $int_type) -> Self {
                Self { inner: core::sync::atomic::$atomic_type::new(v) }
            }
            #[inline]
            pub(crate) fn is_lock_free() -> bool {
                Self::is_always_lock_free()
            }
            #[inline]
            pub(crate) const fn is_always_lock_free() -> bool {
                true
            }
            #[inline]
            pub(crate) fn get_mut(&mut self) -> &mut $int_type {
                self.inner.get_mut()
            }
            #[inline]
            pub(crate) fn into_inner(self) -> $int_type {
                self.inner.into_inner()
            }
            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                crate::utils::assert_load_ordering(order); // for track_caller (compiler can omit double check)
                self.inner.load(order)
            }
            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order); // for track_caller (compiler can omit double check)
                self.inner.store(val, order);
            }
            const_fn! {
                const_if: #[cfg(not(portable_atomic_no_const_raw_ptr_deref))];
                #[inline]
                pub(crate) const fn as_ptr(&self) -> *mut $int_type {
                    // SAFETY: Self is #[repr(C)] and internally UnsafeCell<$int_type>.
                    // See also https://github.com/rust-lang/rust/pull/66705 and
                    // https://github.com/rust-lang/rust/issues/66136#issuecomment-557867116.
                    unsafe {
                        (*(self as *const Self as *const core::cell::UnsafeCell<$int_type>)).get()
                    }
                }
            }
        }
        #[cfg_attr(
            portable_atomic_no_cfg_target_has_atomic,
            cfg(not(portable_atomic_no_atomic_cas))
        )]
        #[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(target_has_atomic = "ptr"))]
        impl $atomic_type {
            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn compare_exchange(
                &self,
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                crate::utils::assert_compare_exchange_ordering(success, failure); // for track_caller (compiler can omit double check)
                #[cfg(portable_atomic_no_stronger_failure_ordering)]
                let success = crate::utils::upgrade_success_ordering(success, failure);
                self.inner.compare_exchange(current, new, success, failure)
            }
            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn compare_exchange_weak(
                &self,
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                crate::utils::assert_compare_exchange_ordering(success, failure); // for track_caller (compiler can omit double check)
                #[cfg(portable_atomic_no_stronger_failure_ordering)]
                let success = crate::utils::upgrade_success_ordering(success, failure);
                self.inner.compare_exchange_weak(current, new, success, failure)
            }
            #[allow(dead_code)]
            #[inline]
            fn fetch_update_<F>(&self, order: Ordering, mut f: F) -> $int_type
            where
                F: FnMut($int_type) -> $int_type,
            {
                // This is a private function and all instances of `f` only operate on the value
                // loaded, so there is no need to synchronize the first load/failed CAS.
                let mut prev = self.load(Ordering::Relaxed);
                loop {
                    let next = f(prev);
                    match self.compare_exchange_weak(prev, next, order, Ordering::Relaxed) {
                        Ok(x) => return x,
                        Err(next_prev) => prev = next_prev,
                    }
                }
            }
            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, order: Ordering) -> $int_type {
                #[cfg(not(portable_atomic_no_atomic_min_max))]
                {
                    #[cfg(any(
                        all(
                            target_arch = "aarch64",
                            any(target_feature = "lse", portable_atomic_target_feature = "lse"),
                        ),
                        all(
                            target_arch = "arm",
                            not(any(
                                target_feature = "v6",
                                portable_atomic_target_feature = "v6",
                            )),
                        ),
                        target_arch = "mips",
                        target_arch = "mips64",
                        target_arch = "powerpc",
                        target_arch = "powerpc64",
                    ))]
                    {
                        // HACK: the following operations are currently broken (at least on qemu):
                        // - aarch64's `AtomicI{8,16}::fetch_{max,min}` (release mode + lse)
                        // - armv5te's `Atomic{I,U}{8,16}::fetch_{max,min}`
                        // - mips's `AtomicI8::fetch_{max,min}` (release mode)
                        // - mipsel's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - mips64's `AtomicI8::fetch_{max,min}` (release mode)
                        // - mips64el's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - powerpc's `AtomicI{8,16}::fetch_{max,min}`
                        // - powerpc64's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - powerpc64le's `AtomicU{8,16}::fetch_{max,min}` (release mode + fat LTO)
                        // See also https://github.com/taiki-e/portable-atomic/issues/2
                        if core::mem::size_of::<$int_type>() <= 2 {
                            return self.fetch_update_(order, |x| core::cmp::max(x, val));
                        }
                    }
                    self.inner.fetch_max(val, order)
                }
                #[cfg(portable_atomic_no_atomic_min_max)]
                {
                    self.fetch_update_(order, |x| core::cmp::max(x, val))
                }
            }
            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
                #[cfg(not(portable_atomic_no_atomic_min_max))]
                {
                    #[cfg(any(
                        all(
                            target_arch = "aarch64",
                            any(target_feature = "lse", portable_atomic_target_feature = "lse"),
                        ),
                        all(
                            target_arch = "arm",
                            not(any(
                                target_feature = "v6",
                                portable_atomic_target_feature = "v6",
                            )),
                        ),
                        target_arch = "mips",
                        target_arch = "mips64",
                        target_arch = "powerpc",
                        target_arch = "powerpc64",
                    ))]
                    {
                        // HACK: the following operations are currently broken (at least on qemu):
                        // - aarch64's `AtomicI{8,16}::fetch_{max,min}` (release mode + lse)
                        // - armv5te's `Atomic{I,U}{8,16}::fetch_{max,min}`
                        // - mips's `AtomicI8::fetch_{max,min}` (release mode)
                        // - mipsel's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - mips64's `AtomicI8::fetch_{max,min}` (release mode)
                        // - mips64el's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - powerpc's `AtomicI{8,16}::fetch_{max,min}`
                        // - powerpc64's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - powerpc64le's `AtomicU{8,16}::fetch_{max,min}` (release mode + fat LTO)
                        // See also https://github.com/taiki-e/portable-atomic/issues/2
                        if core::mem::size_of::<$int_type>() <= 2 {
                            return self.fetch_update_(order, |x| core::cmp::min(x, val));
                        }
                    }
                    self.inner.fetch_min(val, order)
                }
                #[cfg(portable_atomic_no_atomic_min_max)]
                {
                    self.fetch_update_(order, |x| core::cmp::min(x, val))
                }
            }
            #[inline]
            pub(crate) fn fetch_not(&self, order: Ordering) -> $int_type {
                const NOT_MASK: $int_type = (0 as $int_type).wrapping_sub(1);
                self.fetch_xor(NOT_MASK, order)
            }
            #[cfg(not(all(
                not(any(miri, portable_atomic_sanitize_thread)),
                any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
                any(target_arch = "x86", target_arch = "x86_64"),
            )))]
            #[inline]
            pub(crate) fn not(&self, order: Ordering) {
                self.fetch_not(order);
            }
            #[inline]
            pub(crate) fn fetch_neg(&self, order: Ordering) -> $int_type {
                self.fetch_update_(order, $int_type::wrapping_neg)
            }
            #[cfg(not(all(
                not(any(miri, portable_atomic_sanitize_thread)),
                any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
                any(target_arch = "x86", target_arch = "x86_64"),
            )))]
            #[inline]
            pub(crate) fn neg(&self, order: Ordering) {
                self.fetch_neg(order);
            }
        }
        impl core::ops::Deref for $atomic_type {
            type Target = core::sync::atomic::$atomic_type;
            #[inline]
            fn deref(&self) -> &Self::Target {
                &self.inner
            }
        }
    };
}

atomic_int!(AtomicIsize, isize);
atomic_int!(AtomicUsize, usize);
atomic_int!(AtomicI8, i8);
atomic_int!(AtomicU8, u8);
atomic_int!(AtomicI16, i16);
atomic_int!(AtomicU16, u16);
#[cfg(not(target_pointer_width = "16"))] // cfg(target_has_atomic_load_store = "32")
atomic_int!(AtomicI32, i32);
#[cfg(not(target_pointer_width = "16"))] // cfg(target_has_atomic_load_store = "32")
atomic_int!(AtomicU32, u32);
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(not(portable_atomic_no_atomic_64)))]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(
        target_has_atomic = "64",
        not(any(target_pointer_width = "16", target_pointer_width = "32")),
    )) // cfg(target_has_atomic_load_store = "64")
)]
atomic_int!(AtomicI64, i64);
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(not(portable_atomic_no_atomic_64)))]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(
        target_has_atomic = "64",
        not(any(target_pointer_width = "16", target_pointer_width = "32")),
    )) // cfg(target_has_atomic_load_store = "64")
)]
atomic_int!(AtomicU64, u64);
