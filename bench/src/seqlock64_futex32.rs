// SPDX-License-Identifier: Apache-2.0 OR MIT

// SeqLock with separated lock state and stamp.
//
// This is for platforms that cannot use 64-bit futex but can use 64-bit registers.
//
// This module is currently only enabled on benchmark.
//
// Seqlock logic is adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/seq_lock.rs.
// Lock and wait logic is adapted from https://github.com/rust-lang/rust/blob/1.97.0/library/std/src/sys/sync/mutex/futex.rs.

#[cfg(portable_atomic_unsafe_assume_privileged)]
compile_error!("internal error: unreachable");
cfg_no_fast_atomic_64!({
    compile_error!("internal error: unreachable");
});

use self as seq_lock;
#[macro_use]
#[path = "../../src/imp/fallback/seq_lock_common.rs"]
mod seq_lock_common;

use core::{
    cell::UnsafeCell,
    mem::{self, ManuallyDrop},
    ops,
    sync::atomic::Ordering,
};

use self::seq_lock_common::stamp;
use super::fallback::{
    LOCK_ACQUIRE_ORDER, LOCK_RELEASE_ORDER, ScFenceGuard,
    cache_padded::CachePadded,
    wait::{notify32_one as notify_one, wait32 as wait},
};
use crate::{imp::core_atomic::AtomicU32, utils::unlikely};

type AtomicChunk = core::sync::atomic::AtomicU64;
type Chunk = u64;

type State = u32;
pub(crate) type Stamp = u64;

pub(crate) struct SeqLock {
    /// The current state of the lock.
    lock: AtomicU32,

    /// The the current stamp.
    stamp: stamp::Stamp,
}

const UNLOCKED: State = 0;
const LOCKED: State = 1; // locked, no other threads waiting
const CONTENDED: State = 2; // locked, and other threads waiting (contended)

impl SeqLock {
    #[inline]
    pub(crate) const fn new() -> Self {
        Self { lock: AtomicU32::new(UNLOCKED), stamp: stamp::Stamp::new() }
    }

    #[inline]
    pub(crate) fn write(&self) -> SeqLockWriteGuard<'_> {
        if self
            .lock
            .compare_exchange(UNLOCKED, LOCKED, LOCK_ACQUIRE_ORDER, Ordering::Relaxed)
            .is_err()
        {
            self.write_contended();
        }
        let stamp = self.stamp.state.load(Ordering::Relaxed).wrapping_add(1);
        self.stamp.state.store(stamp, Ordering::Relaxed);
        // To synchronize with the acquire fence in `validate_read` via any modification to
        // the data at the critical section of `stamp`.
        crate::fence(Ordering::Release);

        SeqLockWriteGuard { lock: self, stamp }
    }

    #[cold]
    fn write_contended(&self) {
        // Spin first to speed things up if the lock is released quickly.
        let mut state = self.spin();

        // If it's unlocked now, attempt to take the lock
        // without marking it as contended.
        if state == UNLOCKED {
            match self.lock.compare_exchange(
                UNLOCKED,
                LOCKED,
                LOCK_ACQUIRE_ORDER,
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
            if state != CONTENDED && self.lock.swap(CONTENDED, LOCK_ACQUIRE_ORDER) == UNLOCKED {
                // We changed it from UNLOCKED to CONTENDED, so we just successfully locked it.
                return;
            }

            // Wait for the futex to change state, assuming it is still CONTENDED.
            wait(&self.lock, CONTENDED);

            // Spin again after waking up.
            state = self.spin();
        }
    }

    fn spin(&self) -> State {
        let mut spin = 100;
        loop {
            // We only use `load` (and not `swap` or `compare_exchange`)
            // while spinning, to be easier on the caches.
            let state = self.lock.load(Ordering::Relaxed);

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

    /// Release the lock with the given stamp.
    #[inline]
    unsafe fn unlock(&self, next_stamp: Stamp) {
        // Release ordering for synchronizing with `optimistic_read`.
        self.stamp.state.store(next_stamp, Ordering::Release);

        // Release ordering for synchronizing with `write`.
        if self.lock.swap(UNLOCKED, LOCK_RELEASE_ORDER) == CONTENDED {
            // We only wake up one thread. When that thread locks the mutex, it
            // will mark the mutex as CONTENDED (see lock_contended above),
            // which makes sure that any other waiting threads will also be
            // woken up eventually.
            self.notify();
        }
    }

    #[cold]
    fn notify(&self) {
        notify_one(&self.lock);
    }
}

impl ops::Deref for SeqLock {
    type Target = stamp::Stamp;

    #[inline(always)]
    fn deref(&self) -> &Self::Target {
        &self.stamp
    }
}

#[must_use]
pub(crate) struct SeqLockWriteGuard<'a> {
    /// The parent lock.
    lock: &'a SeqLock,

    /// The current stamp.
    stamp: Stamp,
}

impl SeqLockWriteGuard<'_> {
    /// Releases the lock without incrementing the stamp.
    #[inline]
    pub(crate) unsafe fn abort(self) {
        // We specifically don't want to call drop(), since that's
        // what increments the stamp.
        let this = ManuallyDrop::new(self);

        // Restore the stamp and release the lock.
        // SAFETY: the stamp is the same was the one retrieved by the previous `write`.
        // the caller must guarantee that the value hasn't been changed.
        unsafe { this.lock.unlock(this.stamp.wrapping_sub(1)) }
    }
}

impl Drop for SeqLockWriteGuard<'_> {
    #[inline]
    fn drop(&mut self) {
        let next_stamp = self.stamp.wrapping_add(1);
        self.lock.stamp.handle_next_stamp(next_stamp);

        // Increment the stamp and release the lock.
        // SAFETY: handle_next_stamp ensures the state that has never been used.
        unsafe { self.lock.unlock(next_stamp) }
    }
}

// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/atomic_cell.rs#L970-L1010.
#[inline]
#[must_use]
fn lock(addr: usize) -> &'static SeqLock {
    // The number of locks is a prime number because we want to make sure `addr % LEN` gets
    // dispersed across all locks.
    const LEN: usize = 67;
    const L: CachePadded<SeqLock> = CachePadded::new(SeqLock::new());
    static LOCKS: [CachePadded<SeqLock>; LEN] = [
        L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L,
        L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L, L,
        L, L, L, L, L, L, L,
    ];

    // If the modulus is a constant number, the compiler will use crazy math to transform this into
    // a sequence of cheap arithmetic operations rather than using the slow modulo instruction.
    &LOCKS[addr % LEN]
}

macro_rules! atomic {
    ($atomic_type:ident, $int_type:ident, $align:literal) => {
        #[repr(C, align($align))]
        pub(crate) struct $atomic_type {
            v: UnsafeCell<$int_type>,
        }

        impl $atomic_type {
            const LEN: usize = mem::size_of::<$int_type>() / mem::size_of::<Chunk>();

            #[inline]
            unsafe fn chunks(&self) -> &[AtomicChunk; Self::LEN] {
                static_assert!($atomic_type::LEN > 1);
                static_assert!(mem::size_of::<$int_type>() % mem::size_of::<Chunk>() == 0);

                // SAFETY: the caller must uphold the safety contract for `chunks`.
                unsafe { &*(self.v.get() as *const $int_type as *const [AtomicChunk; Self::LEN]) }
            }

            #[inline]
            fn optimistic_read(&self) -> $int_type {
                // Using `MaybeUninit<[usize; Self::LEN]>` here doesn't change codegen: https://godbolt.org/z/86f8s733M
                let mut dst: [Chunk; Self::LEN] = [0; Self::LEN];
                // SAFETY:
                // - There are no threads that perform non-atomic concurrent write operations.
                // - There is no writer that updates the value using atomic operations of different granularity.
                //
                // If the atomic operation is not used here, it will cause a data race
                // when `write` performs concurrent write operation.
                // Such a data race is sometimes considered virtually unproblematic
                // in SeqLock implementations:
                //
                // - https://github.com/Amanieu/seqlock/issues/2
                // - https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/atomic/atomic_cell.rs#L1063-L1069
                // - https://rust-lang.zulipchat.com/#narrow/stream/136281-t-lang.2Fwg-unsafe-code-guidelines/topic/avoiding.20UB.20due.20to.20races.20by.20discarding.20result.3F
                //
                // However, in our use case, the implementation that loads/stores value as
                // chunks of usize is enough fast and sound, so we use that implementation.
                //
                // See also atomic-memcpy crate, a generic implementation of this pattern:
                // https://github.com/taiki-e/atomic-memcpy
                let chunks = unsafe { self.chunks() };
                for i in 0..Self::LEN {
                    dst[i] = chunks[i].load(Ordering::Relaxed);
                }
                // SAFETY: integers are plain old data types so we can always transmute to them.
                unsafe { mem::transmute::<[Chunk; Self::LEN], $int_type>(dst) }
            }

            #[inline]
            fn read(&self, _guard: &SeqLockWriteGuard<'static>) -> $int_type {
                #[cfg(not(all(miri, portable_atomic_old_miri)))]
                // SAFETY:
                // - The guard guarantees that we hold the lock to write.
                // - The raw pointer is valid because we got it from a reference.
                // - This could race with atomic loads in optimistic_read, but atomic and non-atomic
                //   read race are allowed in Rust atomics (core::sync::atomic, which is always lock-free).
                //   See also https://github.com/rust-lang/rust/pull/128778, which formally documented this.
                unsafe {
                    self.v.get().read()
                }
                #[cfg(all(miri, portable_atomic_old_miri))]
                {
                    // However, before the above PR was merged, Miri had been handling this conservatively,
                    // so use atomic loads on old Miri.
                    self.optimistic_read()
                }
            }

            #[inline]
            fn write(&self, val: $int_type, _guard: &SeqLockWriteGuard<'static>) {
                // SAFETY: integers are plain old data types so we can always transmute them to arrays of integers.
                let val = unsafe { mem::transmute::<$int_type, [Chunk; Self::LEN]>(val) };
                // SAFETY:
                // - The guard guarantees that we hold the lock to write.
                // - There are no threads that perform non-atomic concurrent read or write operations.
                //
                // See optimistic_read for the reason that atomic operations are used here.
                let chunks = unsafe { self.chunks() };
                for i in 0..Self::LEN {
                    chunks[i].store(val[i], Ordering::Relaxed);
                }
            }
        }

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by the lock and atomic operation.
        unsafe impl Sync for $atomic_type {}

        #[cfg(any(
            test,
            not(any(
                all(
                    target_arch = "x86_64",
                    not(all(
                        any(miri, portable_atomic_sanitize_thread),
                        portable_atomic_no_cmpxchg16b_intrinsic,
                    )),
                    any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
                    not(portable_atomic_no_outline_atomics),
                    not(any(target_env = "sgx", miri)),
                ),
                all(
                    target_arch = "powerpc64",
                    not(portable_atomic_no_asm),
                    not(portable_atomic_no_outline_atomics),
                    any(
                        all(
                            target_os = "linux",
                            any(
                                all(
                                    target_env = "gnu",
                                    any(target_endian = "little", not(target_feature = "crt-static")),
                                ),
                                all(
                                    target_env = "musl",
                                    any(not(target_feature = "crt-static"), feature = "std"),
                                ),
                                target_env = "ohos",
                                all(target_env = "uclibc", not(target_feature = "crt-static")),
                                portable_atomic_outline_atomics,
                            ),
                        ),
                        target_os = "android",
                        all(
                            target_os = "freebsd",
                            any(
                                target_endian = "little",
                                not(target_feature = "crt-static"),
                                portable_atomic_outline_atomics,
                            ),
                        ),
                        target_os = "openbsd",
                        all(
                            target_os = "aix",
                            not(portable_atomic_pre_llvm_20),
                            portable_atomic_outline_atomics, // TODO(aix): currently disabled by default
                        ),
                    ),
                    not(any(miri, portable_atomic_sanitize_thread)),
                ),
                all(
                    target_arch = "riscv64",
                    not(any(miri, portable_atomic_sanitize_thread)),
                    any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
                    not(portable_atomic_no_outline_atomics),
                    any(target_os = "linux", target_os = "android"),
                ),
            )),
        ))]
        items!({
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

                #[inline]
                pub(crate) fn not(&self, order: Ordering) {
                    self.fetch_not(order);
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
        });
        #[cfg_attr(
            any(
                all(
                    target_arch = "x86_64",
                    not(all(
                        any(miri, portable_atomic_sanitize_thread),
                        portable_atomic_no_cmpxchg16b_intrinsic,
                    )),
                    any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
                    not(portable_atomic_no_outline_atomics),
                    not(any(target_env = "sgx", miri)),
                ),
                all(
                    target_arch = "powerpc64",
                    not(portable_atomic_no_asm),
                    not(portable_atomic_no_outline_atomics),
                    any(
                        all(
                            target_os = "linux",
                            any(
                                all(
                                    target_env = "gnu",
                                    any(target_endian = "little", not(target_feature = "crt-static")),
                                ),
                                all(
                                    target_env = "musl",
                                    any(not(target_feature = "crt-static"), feature = "std"),
                                ),
                                target_env = "ohos",
                                all(target_env = "uclibc", not(target_feature = "crt-static")),
                                portable_atomic_outline_atomics,
                            ),
                        ),
                        target_os = "android",
                        all(
                            target_os = "freebsd",
                            any(
                                target_endian = "little",
                                not(target_feature = "crt-static"),
                                portable_atomic_outline_atomics,
                            ),
                        ),
                        target_os = "openbsd",
                        all(
                            target_os = "aix",
                            not(portable_atomic_pre_llvm_20),
                            portable_atomic_outline_atomics, // TODO(aix): currently disabled by default
                        ),
                    ),
                    not(any(miri, portable_atomic_sanitize_thread)),
                ),
                all(
                    target_arch = "riscv64",
                    not(any(miri, portable_atomic_sanitize_thread)),
                    any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
                    not(portable_atomic_no_outline_atomics),
                    any(target_os = "linux", target_os = "android"),
                ),
            ),
            allow(dead_code)
        )]
        impl $atomic_type {
            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                crate::utils::assert_load_ordering(order);
                let _sc_fence = ScFenceGuard::new_for_load(order == Ordering::SeqCst);
                let lock = lock(self.v.get().addr());

                // Try doing an optimistic read first.
                if let Some(stamp) = lock.optimistic_read() {
                    let val = self.optimistic_read();

                    if lock.validate_read(stamp) {
                        return val;
                    }
                }

                // Grab a regular write lock so that writers don't starve this load.
                let guard = lock.write();
                let val = self.read(&guard);
                // SAFETY: The value hasn't been changed. Drop the guard without incrementing the stamp.
                unsafe { guard.abort() }
                val
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                let guard = lock(self.v.get().addr()).write();
                self.write(val, &guard)
            }

            #[inline]
            pub(crate) fn swap(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                let guard = lock(self.v.get().addr()).write();
                let prev = self.read(&guard);
                self.write(val, &guard);
                prev
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
                let _sc_fence = ScFenceGuard::new(
                    success == Ordering::SeqCst || failure == Ordering::SeqCst
                );
                let guard = lock(self.v.get().addr()).write();
                let prev = self.read(&guard);
                if prev == current {
                    self.write(new, &guard);
                    Ok(prev)
                } else {
                    // SAFETY: The value hasn't been changed. Drop the guard without incrementing the stamp.
                    unsafe { guard.abort() }
                    Err(prev)
                }
            }

            #[inline]
            pub(crate) fn fetch_add(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                let guard = lock(self.v.get().addr()).write();
                let prev = self.read(&guard);
                self.write(prev.wrapping_add(val), &guard);
                prev
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                let guard = lock(self.v.get().addr()).write();
                let prev = self.read(&guard);
                self.write(prev.wrapping_sub(val), &guard);
                prev
            }

            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                let guard = lock(self.v.get().addr()).write();
                let prev = self.read(&guard);
                self.write(prev & val, &guard);
                prev
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                let guard = lock(self.v.get().addr()).write();
                let prev = self.read(&guard);
                self.write(!(prev & val), &guard);
                prev
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                let guard = lock(self.v.get().addr()).write();
                let prev = self.read(&guard);
                self.write(prev | val, &guard);
                prev
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                let guard = lock(self.v.get().addr()).write();
                let prev = self.read(&guard);
                self.write(prev ^ val, &guard);
                prev
            }

            #[inline]
            pub(crate) fn fetch_not(&self, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                let guard = lock(self.v.get().addr()).write();
                let prev = self.read(&guard);
                self.write(!prev, &guard);
                prev
            }

            #[inline]
            pub(crate) fn fetch_neg(&self, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                let guard = lock(self.v.get().addr()).write();
                let prev = self.read(&guard);
                self.write(prev.wrapping_neg(), &guard);
                prev
            }
        }
        impl $atomic_type {
            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                let guard = lock(self.v.get().addr()).write();
                let prev = self.read(&guard);
                self.write(core::cmp::max(prev, val), &guard);
                prev
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
                let _sc_fence = ScFenceGuard::new(order == Ordering::SeqCst);
                let guard = lock(self.v.get().addr()).write();
                let prev = self.read(&guard);
                self.write(core::cmp::min(prev, val), &guard);
                prev
            }
        }
    };
}

cfg_no_fast_atomic_64!({
    atomic!(AtomicI64, i64, 8);
    atomic!(AtomicU64, u64, 8);
});

atomic!(AtomicI128, i128, 16);
atomic!(AtomicU128, u128, 16);

#[cfg(test)]
mod tests {
    use super::*;

    cfg_no_fast_atomic_64!({
        test_atomic_int!(i64);
        test_atomic_int!(u64);
    });
    test_atomic_int!(i128);
    test_atomic_int!(u128);

    // load/store/swap implementation is not affected by signedness, so it is
    // enough to test only unsigned types.
    cfg_no_fast_atomic_64!({
        stress_test!(u64);
    });
    stress_test!(u128);
}
