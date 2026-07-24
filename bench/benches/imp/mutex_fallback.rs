// SPDX-License-Identifier: Apache-2.0 OR MIT

// Fallback implementation using global locks.
//
// This implementation uses mutex for global locks.
//
// Note that we cannot use a lock per atomic type, since the in-memory representation of the atomic
// type and the value type must be the same.
//
// This module is currently only enabled on benchmark.
//
// Mutex logic is adapted from https://github.com/rust-lang/rust/blob/1.97.0/library/std/src/sys/sync/mutex/futex.rs.

use core::{
    cell::UnsafeCell,
    sync::atomic::{AtomicU32, Ordering},
};

use super::fallback::cache_padded::CachePadded;
#[cfg(portable_atomic_no_strict_provenance)]
use crate::utils::ptr::PtrExt as _;
use crate::utils::unlikely;

type State = u32;

struct Mutex {
    state: AtomicU32,
}

const UNLOCKED: State = 0;
const LOCKED: State = 1; // locked, no other threads waiting
const CONTENDED: State = 2; // locked, and other threads waiting (contended)

impl Mutex {
    #[inline]
    const fn new() -> Self {
        Self { state: AtomicU32::new(0) }
    }

    #[inline]
    fn lock(&self) -> MutexGuard<'_> {
        if self
            .state
            .compare_exchange(UNLOCKED, LOCKED, Ordering::Acquire, Ordering::Relaxed)
            .is_err()
        {
            self.lock_contended();
        }

        MutexGuard { lock: self }
    }

    #[cold]
    fn lock_contended(&self) {
        // Spin first to speed things up if the lock is released quickly.
        let mut state = self.spin();

        // If it's unlocked now, attempt to take the lock
        // without marking it as contended.
        if state == UNLOCKED {
            match self.state.compare_exchange(
                UNLOCKED,
                LOCKED,
                Ordering::Acquire,
                Ordering::Relaxed,
            ) {
                Ok(_) => return, // Locked!
                Err(s) => state = s,
            }
        }

        loop {
            // Put the lock in contended state.
            // We avoid an unnecessary write if it as already set to CONTENDED,
            // to be friendlier for the caches.
            if state != CONTENDED && self.state.swap(CONTENDED, Ordering::Acquire) == UNLOCKED {
                // We changed it from UNLOCKED to CONTENDED, so we just successfully locked it.
                return;
            }

            // Wait for the futex to change state, assuming it is still CONTENDED.
            atomic_wait::wait(&self.state, CONTENDED);

            // Spin again after waking up.
            state = self.spin();
        }
    }

    fn spin(&self) -> State {
        let mut spin = 100;
        loop {
            // We only use `load` (and not `swap` or `compare_exchange`)
            // while spinning, to be easier on the caches.
            let state = self.state.load(Ordering::Relaxed);

            // We stop spinning when the mutex is UNLOCKED,
            // but also when it's CONTENDED.
            if state != LOCKED || spin == 0 {
                return state;
            }

            #[allow(deprecated)]
            core::sync::atomic::spin_loop_hint();
            spin -= 1;
        }
    }

    #[cold]
    fn notify(&self) {
        atomic_wait::wake_one(&self.state);
    }
}

#[must_use]
struct MutexGuard<'a> {
    /// The parent lock.
    lock: &'a Mutex,
}

impl Drop for MutexGuard<'_> {
    #[inline]
    fn drop(&mut self) {
        if self.lock.state.swap(UNLOCKED, Ordering::Release) == CONTENDED {
            // We only wake up one thread. When that thread locks the mutex, it
            // will mark the mutex as CONTENDED (see lock_contended above),
            // which makes sure that any other waiting threads will also be
            // woken up eventually.
            self.lock.notify();
        }
    }
}

// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/atomic_cell.rs#L970-L1010.
#[inline]
fn lock(addr: usize) -> MutexGuard<'static> {
    // The number of locks is a prime number because we want to make sure `addr % LEN` gets
    // dispersed across all locks.
    const LEN: usize = 67;
    const L: CachePadded<Mutex> = CachePadded::new(Mutex::new());
    static LOCKS: [CachePadded<Mutex>; LEN] = [
        L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L,
        L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L,
        L, L, L, L, L, L, L,
    ];

    // If the modulus is a constant number, the compiler will use crazy math to transform this into
    // a sequence of cheap arithmetic operations rather than using the slow modulo instruction.
    let lock = &LOCKS[addr % LEN];
    lock.lock()
}

// Emit SeqCst fence to ensure SeqCst semantics when ordering is SeqCst.
#[must_use]
struct ScFenceGuard;
impl ScFenceGuard {
    #[inline]
    fn new(emit_sc_fence: bool) -> Option<Self> {
        if unlikely(emit_sc_fence) {
            crate::fence(Ordering::SeqCst);
            Some(ScFenceGuard)
        } else {
            None
        }
    }
}
impl Drop for ScFenceGuard {
    #[inline]
    fn drop(&mut self) {
        crate::fence(Ordering::SeqCst);
    }
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
                Self::IS_ALWAYS_LOCK_FREE
            }
            pub(crate) const IS_ALWAYS_LOCK_FREE: bool = false;

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                crate::utils::assert_load_ordering(order);
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get().addr());
                    self.v.get().read()
                }
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get().addr());
                    self.v.get().write(val)
                }
            }

            #[inline]
            pub(crate) fn swap(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get().addr());
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
                let _sc_fence =
                    ScFenceGuard::new(success == Ordering::SeqCst || failure == Ordering::SeqCst);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get().addr());
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
            pub(crate) fn fetch_add(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get().addr());
                    let prev = self.v.get().read();
                    self.v.get().write(prev.wrapping_add(val));
                    prev
                }
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get().addr());
                    let prev = self.v.get().read();
                    self.v.get().write(prev.wrapping_sub(val));
                    prev
                }
            }

            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get().addr());
                    let prev = self.v.get().read();
                    self.v.get().write(prev & val);
                    prev
                }
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get().addr());
                    let prev = self.v.get().read();
                    self.v.get().write(!(prev & val));
                    prev
                }
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get().addr());
                    let prev = self.v.get().read();
                    self.v.get().write(prev | val);
                    prev
                }
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get().addr());
                    let prev = self.v.get().read();
                    self.v.get().write(prev ^ val);
                    prev
                }
            }

            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get().addr());
                    let prev = self.v.get().read();
                    self.v.get().write(core::cmp::max(prev, val));
                    prev
                }
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get().addr());
                    let prev = self.v.get().read();
                    self.v.get().write(core::cmp::min(prev, val));
                    prev
                }
            }

            #[inline]
            pub(crate) fn fetch_not(&self, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get().addr());
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
            pub(crate) fn fetch_neg(&self, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock(self.v.get().addr());
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

atomic_int!(AtomicI64, i64, 8);
atomic_int!(AtomicU64, u64, 8);
atomic_int!(AtomicI128, i128, 16);
atomic_int!(AtomicU128, u128, 16);

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_int!(i64);
    test_atomic_int!(u64);
    test_atomic_int!(i128);
    test_atomic_int!(u128);

    // load/store/swap implementation is not affected by signedness, so it is
    // enough to test only unsigned types.
    stress_test!(u64);
    stress_test!(u128);
}
