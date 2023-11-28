// Atomic implementation on BPF.

#[allow(unused_macros)] // utils.rs is also used by mod.rs
#[path = "utils.rs"]
mod utils;

#[cfg(not(feature = "fallback"))]
pub(crate) use super::core_atomic::{AtomicI64, AtomicIsize, AtomicPtr, AtomicU64, AtomicUsize};
#[cfg(feature = "fallback")]
pub(crate) use fallback::{
    AtomicI128, AtomicI64, AtomicIsize, AtomicPtr, AtomicU128, AtomicU64, AtomicUsize,
};
pub(crate) use fallback::{AtomicI16, AtomicI32, AtomicI8, AtomicU16, AtomicU32, AtomicU8};

mod fallback {
    // Fallback implementation using global locks on BPF.
    //
    // This implementation uses spinlock for global locks.
    //
    // Note that we cannot use a lock per atomic type, since the in-memory representation of the atomic
    // type and the value type must be the same.

    use core::{
        cell::UnsafeCell,
        intrinsics,
        sync::atomic::{self, Ordering},
    };

    use super::utils::{Backoff, CachePadded};

    const IS_ALWAYS_LOCK_FREE: bool = false;

    #[inline]
    unsafe fn atomic_swap(dst: *mut u64, val: u64, order: Ordering) -> u64 {
        // SAFETY: the caller must uphold the safety contract for `atomic_swap`.
        unsafe {
            match order {
                Ordering::Acquire => intrinsics::atomic_xchg_acquire(dst, val),
                Ordering::Release => intrinsics::atomic_xchg_release(dst, val),
                Ordering::AcqRel => intrinsics::atomic_xchg_acqrel(dst, val),
                Ordering::Relaxed => intrinsics::atomic_xchg_relaxed(dst, val),
                Ordering::SeqCst => intrinsics::atomic_xchg_seqcst(dst, val),
                _ => unreachable!("{:?}", order),
            }
        }
    }
    #[inline]
    fn swap(a: &atomic::AtomicU64, val: u64, order: Ordering) -> u64 {
        // SAFETY: atomic::AtomicU64 is #[repr(C)] and internally UnsafeCell<$int_type>.
        // See also https://github.com/rust-lang/rust/pull/66705 and
        // https://github.com/rust-lang/rust/issues/66136#issuecomment-557867116.
        let dst = unsafe {
            (*(a as *const atomic::AtomicU64 as *const core::cell::UnsafeCell<u64>)).get()
        };
        // SAFETY: any data races are prevented by atomic intrinsics and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe { atomic_swap(dst, val, order) }
    }

    struct Spinlock {
        state: atomic::AtomicU64,
    }

    impl Spinlock {
        #[inline]
        const fn new() -> Self {
            Self { state: atomic::AtomicU64::new(0) }
        }

        #[inline]
        fn lock(&self) -> SpinlockGuard<'_> {
            let mut backoff = Backoff::new();
            loop {
                if swap(&self.state, 1, Ordering::Acquire) == 0 {
                    return SpinlockGuard { lock: self };
                }

                while self.state.load(Ordering::Relaxed) == 1 {
                    backoff.snooze();
                }
            }
        }
    }

    #[must_use]
    struct SpinlockGuard<'a> {
        /// The parent lock.
        lock: &'a Spinlock,
    }

    impl Drop for SpinlockGuard<'_> {
        #[inline]
        fn drop(&mut self) {
            self.lock.state.store(0, Ordering::Release);
        }
    }

    // Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.7/crossbeam-utils/src/atomic/atomic_cell.rs#L969-L1016.
    #[inline]
    fn lock(addr: usize) -> SpinlockGuard<'static> {
        // The number of locks is a prime number because we want to make sure `addr % LEN` gets
        // dispersed across all locks.
        const LEN: usize = 67;
        #[allow(clippy::declare_interior_mutable_const)]
        const L: CachePadded<Spinlock> = CachePadded::new(Spinlock::new());
        static LOCKS: [CachePadded<Spinlock>; LEN] = [
            L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L,
            L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L,
            L, L, L, L, L, L, L, L, L,
        ];

        // If the modulus is a constant number, the compiler will use crazy math to transform this into
        // a sequence of cheap arithmetic operations rather than using the slow modulo instruction.
        let lock = &LOCKS[addr % LEN];
        lock.lock()
    }

    #[cfg(feature = "fallback")]
    #[cfg_attr(target_pointer_width = "16", repr(C, align(2)))]
    #[cfg_attr(target_pointer_width = "32", repr(C, align(4)))]
    #[cfg_attr(target_pointer_width = "64", repr(C, align(8)))]
    #[cfg_attr(target_pointer_width = "128", repr(C, align(16)))]
    pub(crate) struct AtomicPtr<T> {
        p: UnsafeCell<*mut T>,
    }

    #[cfg(feature = "fallback")]
    // SAFETY: any data races are prevented by the lock.
    unsafe impl<T> Send for AtomicPtr<T> {}
    #[cfg(feature = "fallback")]
    // SAFETY: any data races are prevented by the lock.
    unsafe impl<T> Sync for AtomicPtr<T> {}

    #[cfg(feature = "fallback")]
    impl<T> AtomicPtr<T> {
        #[inline]
        pub(crate) const fn new(p: *mut T) -> Self {
            Self { p: UnsafeCell::new(p) }
        }

        #[inline]
        pub(crate) fn is_lock_free() -> bool {
            Self::is_always_lock_free()
        }
        #[inline]
        pub(crate) const fn is_always_lock_free() -> bool {
            IS_ALWAYS_LOCK_FREE
        }

        #[inline]
        pub(crate) fn get_mut(&mut self) -> &mut *mut T {
            // SAFETY: the mutable reference guarantees unique ownership.
            // (UnsafeCell::get_mut requires Rust 1.50)
            unsafe { &mut *self.p.get() }
        }

        #[inline]
        pub(crate) fn into_inner(self) -> *mut T {
            self.p.into_inner()
        }

        #[inline]
        #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
        pub(crate) fn load(&self, order: Ordering) -> *mut T {
            crate::utils::assert_load_ordering(order);
            // SAFETY: any data races are prevented by the lock and the raw
            // pointer passed in is valid because we got it from a reference.
            unsafe {
                let _guard = lock(self.p.get() as usize);
                self.p.get().read()
            }
        }

        #[inline]
        #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
        pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
            crate::utils::assert_store_ordering(order);
            // SAFETY: any data races are prevented by the lock and the raw
            // pointer passed in is valid because we got it from a reference.
            unsafe {
                let _guard = lock(self.p.get() as usize);
                self.p.get().write(ptr);
            }
        }

        #[inline]
        pub(crate) fn swap(&self, ptr: *mut T, _order: Ordering) -> *mut T {
            // SAFETY: any data races are prevented by the lock and the raw
            // pointer passed in is valid because we got it from a reference.
            unsafe {
                let _guard = lock(self.p.get() as usize);
                self.p.get().replace(ptr)
            }
        }

        #[inline]
        #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
        pub(crate) fn compare_exchange(
            &self,
            current: *mut T,
            new: *mut T,
            success: Ordering,
            failure: Ordering,
        ) -> Result<*mut T, *mut T> {
            crate::utils::assert_compare_exchange_ordering(success, failure);
            // SAFETY: any data races are prevented by the lock and the raw
            // pointer passed in is valid because we got it from a reference.
            unsafe {
                let _guard = lock(self.p.get() as usize);
                let result = self.p.get().read();
                if result == current {
                    self.p.get().write(new);
                    Ok(result)
                } else {
                    Err(result)
                }
            }
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
            self.compare_exchange(current, new, success, failure)
        }

        #[inline]
        pub(crate) const fn as_ptr(&self) -> *mut *mut T {
            self.p.get()
        }
    }

    macro_rules! atomic_int {
        ($atomic_type:ident, $int_type:ident, $align:expr) => {
            #[repr(C, align($align))]
            pub(crate) struct $atomic_type {
                v: UnsafeCell<$int_type>,
            }

            // Send is implicitly implemented.
            // SAFETY: any data races are prevented by the lock.
            unsafe impl Sync for $atomic_type {}

            #[cfg(feature = "fallback")]
            impl_default_no_fetch_ops!($atomic_type, $int_type);
            #[cfg(feature = "fallback")]
            impl_default_bit_opts!($atomic_type, $int_type);
            impl $atomic_type {
                #[inline]
                pub(crate) const fn new(v: $int_type) -> Self {
                    Self { v: UnsafeCell::new(v) }
                }

                #[inline]
                pub(crate) fn is_lock_free() -> bool {
                    Self::is_always_lock_free()
                }
                #[inline]
                pub(crate) const fn is_always_lock_free() -> bool {
                    IS_ALWAYS_LOCK_FREE
                }

                #[inline]
                pub(crate) fn get_mut(&mut self) -> &mut $int_type {
                    // SAFETY: the mutable reference guarantees unique ownership.
                    // (UnsafeCell::get_mut requires Rust 1.50)
                    unsafe { &mut *self.v.get() }
                }

                #[inline]
                pub(crate) fn into_inner(self) -> $int_type {
                    self.v.into_inner()
                }

                #[inline]
                #[cfg_attr(
                    all(debug_assertions, not(portable_atomic_no_track_caller)),
                    track_caller
                )]
                pub(crate) fn load(&self, order: Ordering) -> $int_type {
                    crate::utils::assert_load_ordering(order);
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        let _guard = lock(self.v.get() as usize);
                        self.v.get().read()
                    }
                }

                #[inline]
                #[cfg_attr(
                    all(debug_assertions, not(portable_atomic_no_track_caller)),
                    track_caller
                )]
                pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                    crate::utils::assert_store_ordering(order);
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        let _guard = lock(self.v.get() as usize);
                        self.v.get().write(val)
                    }
                }

                #[cfg(feature = "fallback")]
                #[inline]
                pub(crate) fn swap(&self, val: $int_type, _order: Ordering) -> $int_type {
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        let _guard = lock(self.v.get() as usize);
                        self.v.get().replace(val)
                    }
                }

                #[cfg(feature = "fallback")]
                #[inline]
                #[cfg_attr(
                    all(debug_assertions, not(portable_atomic_no_track_caller)),
                    track_caller
                )]
                pub(crate) fn compare_exchange(
                    &self,
                    current: $int_type,
                    new: $int_type,
                    success: Ordering,
                    failure: Ordering,
                ) -> Result<$int_type, $int_type> {
                    crate::utils::assert_compare_exchange_ordering(success, failure);
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        let _guard = lock(self.v.get() as usize);
                        let result = self.v.get().read();
                        if result == current {
                            self.v.get().write(new);
                            Ok(result)
                        } else {
                            Err(result)
                        }
                    }
                }

                #[cfg(feature = "fallback")]
                #[inline]
                #[cfg_attr(
                    all(debug_assertions, not(portable_atomic_no_track_caller)),
                    track_caller
                )]
                pub(crate) fn compare_exchange_weak(
                    &self,
                    current: $int_type,
                    new: $int_type,
                    success: Ordering,
                    failure: Ordering,
                ) -> Result<$int_type, $int_type> {
                    self.compare_exchange(current, new, success, failure)
                }

                #[cfg(feature = "fallback")]
                #[inline]
                pub(crate) fn fetch_add(&self, val: $int_type, _order: Ordering) -> $int_type {
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        let _guard = lock(self.v.get() as usize);
                        let result = self.v.get().read();
                        self.v.get().write(result.wrapping_add(val));
                        result
                    }
                }

                #[cfg(feature = "fallback")]
                #[inline]
                pub(crate) fn fetch_sub(&self, val: $int_type, _order: Ordering) -> $int_type {
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        let _guard = lock(self.v.get() as usize);
                        let result = self.v.get().read();
                        self.v.get().write(result.wrapping_sub(val));
                        result
                    }
                }

                #[cfg(feature = "fallback")]
                #[inline]
                pub(crate) fn fetch_and(&self, val: $int_type, _order: Ordering) -> $int_type {
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        let _guard = lock(self.v.get() as usize);
                        let result = self.v.get().read();
                        self.v.get().write(result & val);
                        result
                    }
                }

                #[cfg(feature = "fallback")]
                #[inline]
                pub(crate) fn fetch_nand(&self, val: $int_type, _order: Ordering) -> $int_type {
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        let _guard = lock(self.v.get() as usize);
                        let result = self.v.get().read();
                        self.v.get().write(!(result & val));
                        result
                    }
                }

                #[cfg(feature = "fallback")]
                #[inline]
                pub(crate) fn fetch_or(&self, val: $int_type, _order: Ordering) -> $int_type {
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        let _guard = lock(self.v.get() as usize);
                        let result = self.v.get().read();
                        self.v.get().write(result | val);
                        result
                    }
                }

                #[cfg(feature = "fallback")]
                #[inline]
                pub(crate) fn fetch_xor(&self, val: $int_type, _order: Ordering) -> $int_type {
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        let _guard = lock(self.v.get() as usize);
                        let result = self.v.get().read();
                        self.v.get().write(result ^ val);
                        result
                    }
                }

                #[cfg(feature = "fallback")]
                #[inline]
                pub(crate) fn fetch_max(&self, val: $int_type, _order: Ordering) -> $int_type {
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        let _guard = lock(self.v.get() as usize);
                        let result = self.v.get().read();
                        self.v.get().write(core::cmp::max(result, val));
                        result
                    }
                }

                #[cfg(feature = "fallback")]
                #[inline]
                pub(crate) fn fetch_min(&self, val: $int_type, _order: Ordering) -> $int_type {
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        let _guard = lock(self.v.get() as usize);
                        let result = self.v.get().read();
                        self.v.get().write(core::cmp::min(result, val));
                        result
                    }
                }

                #[cfg(feature = "fallback")]
                #[inline]
                pub(crate) fn fetch_not(&self, _order: Ordering) -> $int_type {
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        let _guard = lock(self.v.get() as usize);
                        let result = self.v.get().read();
                        self.v.get().write(!result);
                        result
                    }
                }
                #[cfg(feature = "fallback")]
                #[inline]
                pub(crate) fn not(&self, order: Ordering) {
                    self.fetch_not(order);
                }

                #[cfg(feature = "fallback")]
                #[inline]
                pub(crate) fn fetch_neg(&self, _order: Ordering) -> $int_type {
                    // SAFETY: any data races are prevented by the lock and the raw
                    // pointer passed in is valid because we got it from a reference.
                    unsafe {
                        let _guard = lock(self.v.get() as usize);
                        let result = self.v.get().read();
                        self.v.get().write(result.wrapping_neg());
                        result
                    }
                }
                #[cfg(feature = "fallback")]
                #[inline]
                pub(crate) fn neg(&self, order: Ordering) {
                    self.fetch_neg(order);
                }

                #[inline]
                pub(crate) const fn as_ptr(&self) -> *mut $int_type {
                    self.v.get()
                }
            }
        };
    }

    #[cfg(feature = "fallback")]
    #[cfg(target_pointer_width = "64")]
    atomic_int!(AtomicIsize, isize, 8);
    #[cfg(feature = "fallback")]
    #[cfg(target_pointer_width = "64")]
    atomic_int!(AtomicUsize, usize, 8);
    atomic_int!(AtomicI8, i8, 1);
    atomic_int!(AtomicU8, u8, 1);
    atomic_int!(AtomicI16, i16, 2);
    atomic_int!(AtomicU16, u16, 2);
    atomic_int!(AtomicI32, i32, 4);
    atomic_int!(AtomicU32, u32, 4);
    #[cfg(feature = "fallback")]
    atomic_int!(AtomicI64, i64, 8);
    #[cfg(feature = "fallback")]
    atomic_int!(AtomicU64, u64, 8);
    #[cfg(feature = "fallback")]
    atomic_int!(AtomicI128, i128, 16);
    #[cfg(feature = "fallback")]
    atomic_int!(AtomicU128, u128, 16);
}

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_int!(i8);
    test_atomic_int!(u8);
    test_atomic_int!(i16);
    test_atomic_int!(u16);
    test_atomic_int!(i32);
    test_atomic_int!(u32);
    test_atomic_int!(i64);
    test_atomic_int!(u64);
    test_atomic_int!(i128);
    test_atomic_int!(u128);
}
