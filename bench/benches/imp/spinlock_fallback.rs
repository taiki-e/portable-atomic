// SPDX-License-Identifier: Apache-2.0 OR MIT

// Fallback implementation using global locks.
//
// This implementation uses spinlock for global locks.
//
// Note that we cannot use a lock per atomic type, since the in-memory representation of the atomic
// type and the value type must be the same.
//
// This module is currently only enabled on benchmark.

use core::{
    cell::UnsafeCell,
    sync::atomic::{AtomicUsize, Ordering},
};

use super::fallback::utils::{Backoff, CachePadded};

struct Spinlock {
    state: AtomicUsize,
}

impl Spinlock {
    #[inline]
    const fn new() -> Self {
        Self { state: AtomicUsize::new(0) }
    }

    #[inline]
    fn lock(&self) -> SpinlockGuard<'_> {
        let mut backoff = Backoff::new();
        loop {
            if self.state.compare_exchange_weak(0, 1, Ordering::Acquire, Ordering::Relaxed).is_ok()
            {
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
        L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L,
        L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L,
        L, L, L, L, L, L, L,
    ];

    // If the modulus is a constant number, the compiler will use crazy math to transform this into
    // a sequence of cheap arithmetic operations rather than using the slow modulo instruction.
    let lock = &LOCKS[addr % LEN];
    lock.lock()
}

macro_rules! atomic_int {
    ($atomic_type:ident, $int_type:ident, $align:literal) => {
        #[repr(C, align($align))]
        pub(crate) struct $atomic_type {
            v: UnsafeCell<$int_type>,
        }

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by the lock.
        unsafe impl Sync for $atomic_type {}

        impl_default_no_fetch_ops!($atomic_type, $int_type);
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
                false
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
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
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
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    self.v.get().write(val)
                }
            }

            #[inline]
            pub(crate) fn swap(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let prev = self.v.get().read();
                    self.v.get().write(val);
                    prev
                }
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
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
                    let prev = self.v.get().read();
                    if prev == current {
                        self.v.get().write(new);
                        Ok(prev)
                    } else {
                        Err(prev)
                    }
                }
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
                self.compare_exchange(current, new, success, failure)
            }

            #[inline]
            pub(crate) fn fetch_add(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let prev = self.v.get().read();
                    self.v.get().write(prev.wrapping_add(val));
                    prev
                }
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let prev = self.v.get().read();
                    self.v.get().write(prev.wrapping_sub(val));
                    prev
                }
            }

            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let prev = self.v.get().read();
                    self.v.get().write(prev & val);
                    prev
                }
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let prev = self.v.get().read();
                    self.v.get().write(!(prev & val));
                    prev
                }
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let prev = self.v.get().read();
                    self.v.get().write(prev | val);
                    prev
                }
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let prev = self.v.get().read();
                    self.v.get().write(prev ^ val);
                    prev
                }
            }

            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let prev = self.v.get().read();
                    self.v.get().write(core::cmp::max(prev, val));
                    prev
                }
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let prev = self.v.get().read();
                    self.v.get().write(core::cmp::min(prev, val));
                    prev
                }
            }

            #[inline]
            pub(crate) fn fetch_not(&self, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let prev = self.v.get().read();
                    self.v.get().write(!prev);
                    prev
                }
            }
            #[inline]
            pub(crate) fn not(&self, order: Ordering) {
                self.fetch_not(order);
            }

            #[inline]
            pub(crate) fn fetch_neg(&self, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let prev = self.v.get().read();
                    self.v.get().write(prev.wrapping_neg());
                    prev
                }
            }
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

atomic_int!(AtomicI8, i8, 1);
atomic_int!(AtomicU8, u8, 1);
atomic_int!(AtomicI16, i16, 2);
atomic_int!(AtomicU16, u16, 2);
atomic_int!(AtomicI32, i32, 4);
atomic_int!(AtomicU32, u32, 4);
atomic_int!(AtomicI64, i64, 8);
atomic_int!(AtomicU64, u64, 8);
atomic_int!(AtomicI128, i128, 16);
atomic_int!(AtomicU128, u128, 16);

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

    // load/store/swap implementation is not affected by signedness, so it is
    // enough to test only unsigned types.
    stress_test!(u64);
    stress_test!(u128);
}
