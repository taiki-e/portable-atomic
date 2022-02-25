// Fallback implementation using global locks.
//
// This implementation uses spinlock for global locks.
//
// This module is currently only enabled on test and benchmark.

use core::{
    cell::UnsafeCell,
    sync::atomic::{AtomicUsize, Ordering},
};

use crate::utils::{
    assert_compare_exchange_ordering, assert_load_ordering, assert_store_ordering, Backoff,
    CachePadded,
};

struct Spinlock {
    state: AtomicUsize,
}

impl Spinlock {
    const fn new() -> Self {
        Self { state: AtomicUsize::new(0) }
    }

    #[inline]
    fn lock(&'static self) -> SpinlockGuard {
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
struct SpinlockGuard {
    /// The parent lock.
    lock: &'static Spinlock,
}

impl Drop for SpinlockGuard {
    #[inline]
    fn drop(&mut self) {
        self.lock.state.store(0, Ordering::Release);
    }
}

// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.7/crossbeam-utils/src/atomic/atomic_cell.rs#L969-L1016.
#[inline]
fn lock(addr: usize) -> SpinlockGuard {
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
    ($atomic_type:ident, $int_type:ident, $align:expr) => {
        #[repr(C, align($align))]
        pub(crate) struct $atomic_type {
            v: UnsafeCell<$int_type>,
        }

        impl crate::utils::AtomicRepr for $atomic_type {
            const IS_ALWAYS_LOCK_FREE: bool = false;
            #[inline]
            fn is_lock_free() -> bool {
                false
            }
        }

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by the lock.
        unsafe impl Sync for $atomic_type {}

        impl $atomic_type {
            #[inline]
            pub(crate) const fn new(v: $int_type) -> Self {
                Self { v: UnsafeCell::new(v) }
            }

            #[inline]
            pub(crate) fn get_mut(&mut self) -> &mut $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: This is safe because the mutable reference guarantees that no other
                // threads are concurrently accessing the atomic data.
                unsafe {
                    &mut *self.v.get()
                }
            }

            #[inline]
            pub(crate) fn into_inner(self) -> $int_type {
                self.v.into_inner()
            }

            #[inline]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                assert_load_ordering(order);
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    self.v.get().read()
                }
            }

            #[inline]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                assert_store_ordering(order);
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    self.v.get().write(val)
                }
            }

            #[inline]
            pub(crate) fn swap(&self, val: $int_type, _order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    self.v.get().replace(val)
                }
            }

            #[inline]
            pub(crate) fn compare_exchange(
                &self,
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                assert_compare_exchange_ordering(success, failure);
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
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

            #[inline]
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
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let result = self.v.get().read();
                    self.v.get().write(result.wrapping_add(val));
                    result
                }
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, _order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let result = self.v.get().read();
                    self.v.get().write(result.wrapping_sub(val));
                    result
                }
            }

            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, _order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let result = self.v.get().read();
                    self.v.get().write(result & val);
                    result
                }
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, _order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let result = self.v.get().read();
                    self.v.get().write(!(result & val));
                    result
                }
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, _order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let result = self.v.get().read();
                    self.v.get().write(result | val);
                    result
                }
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, _order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let result = self.v.get().read();
                    self.v.get().write(result ^ val);
                    result
                }
            }

            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, _order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let result = self.v.get().read();
                    self.v.get().write(core::cmp::max(result, val));
                    result
                }
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, _order: Ordering) -> $int_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get() as usize);
                    let result = self.v.get().read();
                    self.v.get().write(core::cmp::min(result, val));
                    result
                }
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

    test_atomic_int!(test_atomic_i8, AtomicI8, i8);
    test_atomic_int!(test_atomic_u8, AtomicU8, u8);
    test_atomic_int!(test_atomic_i16, AtomicI16, i16);
    test_atomic_int!(test_atomic_u16, AtomicU16, u16);
    test_atomic_int!(test_atomic_i32, AtomicI32, i32);
    test_atomic_int!(test_atomic_u32, AtomicU32, u32);
    test_atomic_int!(test_atomic_i64, AtomicI64, i64);
    test_atomic_int!(test_atomic_u64, AtomicU64, u64);
    test_atomic_int!(test_atomic_i128, AtomicI128, i128);
    test_atomic_int!(test_atomic_u128, AtomicU128, u128);
}
