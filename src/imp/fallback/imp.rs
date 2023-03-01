#![cfg_attr(
    all(
        target_arch = "x86_64",
        portable_atomic_cmpxchg16b_target_feature,
        not(portable_atomic_no_outline_atomics),
        not(target_env = "sgx"),
    ),
    allow(dead_code)
)]

use core::{cell::UnsafeCell, mem, sync::atomic::Ordering};

use super::{super::utils::CachePadded, SeqLock, SeqLockWriteGuard};

// Some 64-bit architectures have ABI with 32-bit pointer width (e.g., x86_64 X32 ABI,
// aarch64 ILP32 ABI, mips64 N32 ABI). On those targets, AtomicU64 is fast,
// so use it to reduce chunks of byte-wise atomic memcpy.
use super::{AtomicChunk, Chunk};

// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.7/crossbeam-utils/src/atomic/atomic_cell.rs#L969-L1016.
#[inline]
#[must_use]
fn lock(addr: usize) -> &'static SeqLock {
    // The number of locks is a prime number because we want to make sure `addr % LEN` gets
    // dispersed across all locks.
    //
    // crossbeam-utils 0.8.7 uses 97 here but does not use CachePadded,
    // so the actual concurrency level will be smaller.
    const LEN: usize = 67;
    #[allow(clippy::declare_interior_mutable_const)]
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
    (uint, $atomic_type:ident, $int_type:ident, $align:literal) => {
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
                // - https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.7/crossbeam-utils/src/atomic/atomic_cell.rs#L1111-L1116
                // - https://rust-lang.zulipchat.com/#narrow/stream/136281-t-lang.2Fwg-unsafe-code-guidelines/topic/avoiding.20UB.20due.20to.20races.20by.20discarding.20result.3F
                //
                // However, in our use case, the implementation that loads/stores value as
                // chunks of usize is enough fast and sound, so we use that implementation.
                //
                // See also atomic-memcpy crate, a generic implementation of this pattern:
                // https://github.com/taiki-e/atomic-memcpy
                let chunks = unsafe { self.chunks() };
                // https://godbolt.org/z/xxEx49xWh
                // match Self::LEN {
                //     2 => {
                //         dst[0] = chunks[0].load(Ordering::Relaxed);
                //         dst[1] = chunks[1].load(Ordering::Relaxed);
                //     }
                //     _ => {
                for i in 0..Self::LEN {
                    dst[i] = chunks[i].load(Ordering::Relaxed);
                }
                //     }
                // }
                // SAFETY: integers are plain old datatypes so we can always transmute to them.
                unsafe { mem::transmute::<[Chunk; Self::LEN], $int_type>(dst) }
            }

            #[inline]
            fn read(&self, _guard: &SeqLockWriteGuard<'static>) -> $int_type {
                // SAFETY:
                // - The guard guarantees that we hold the lock to write.
                // - The raw pointer is valid because we got it from a reference.
                //
                // Unlike optimistic_read/write, the atomic operation is not required,
                // because we hold the lock to write so that other threads cannot
                // perform concurrent write operations.
                //
                // Note: If the atomic load involves an atomic write (e.g.
                // 128-bit atomic load on x86_64/aarch64 that uses CAS or LL/SC
                // loop), this can still cause a data race.
                // However, according to atomic-memcpy's asm test, there seems
                // to be no tier 1 or tier 2 platform that generates such code
                // for a pointer-width relaxed load + acquire fence:
                // https://github.com/taiki-e/atomic-memcpy/tree/v0.1.3/tests/asm-test/asm
                unsafe { self.v.get().read() }
            }

            #[inline]
            fn write(&self, val: $int_type, _guard: &SeqLockWriteGuard<'static>) {
                // SAFETY: integers are plain old datatypes so we can always transmute them to arrays of integers.
                let val = unsafe { mem::transmute::<$int_type, [Chunk; Self::LEN]>(val) };
                // SAFETY:
                // - The guard guarantees that we hold the lock to write.
                // - There are no threads that perform non-atomic concurrent read or write operations.
                //
                // See optimistic_read for the reason that atomic operations are used here.
                let chunks = unsafe { self.chunks() };
                // match Self::LEN {
                //     2 => {
                //         chunks[0].store(val[0], Ordering::Relaxed);
                //         chunks[1].store(val[1], Ordering::Relaxed);
                //     }
                //     _ => {
                for i in 0..Self::LEN {
                    chunks[i].store(val[i], Ordering::Relaxed);
                }
                //     }
                // }
            }
        }

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by the lock and atomic operation.
        unsafe impl Sync for $atomic_type {}

        no_fetch_ops_impl!($atomic_type, $int_type);
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
                let lock = lock(self.v.get() as usize);

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
                // The value hasn't been changed. Drop the guard without incrementing the stamp.
                guard.abort();
                val
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                let guard = lock(self.v.get() as usize).write();
                self.write(val, &guard)
            }

            #[inline]
            pub(crate) fn swap(&self, val: $int_type, _order: Ordering) -> $int_type {
                let guard = lock(self.v.get() as usize).write();
                let result = self.read(&guard);
                self.write(val, &guard);
                result
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
                let guard = lock(self.v.get() as usize).write();
                let result = self.read(&guard);
                if result == current {
                    self.write(new, &guard);
                    Ok(result)
                } else {
                    // The value hasn't been changed. Drop the guard without incrementing the stamp.
                    guard.abort();
                    Err(result)
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
                let guard = lock(self.v.get() as usize).write();
                let result = self.read(&guard);
                self.write(result.wrapping_add(val), &guard);
                result
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, _order: Ordering) -> $int_type {
                let guard = lock(self.v.get() as usize).write();
                let result = self.read(&guard);
                self.write(result.wrapping_sub(val), &guard);
                result
            }

            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, _order: Ordering) -> $int_type {
                let guard = lock(self.v.get() as usize).write();
                let result = self.read(&guard);
                self.write(result & val, &guard);
                result
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, _order: Ordering) -> $int_type {
                let guard = lock(self.v.get() as usize).write();
                let result = self.read(&guard);
                self.write(!(result & val), &guard);
                result
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, _order: Ordering) -> $int_type {
                let guard = lock(self.v.get() as usize).write();
                let result = self.read(&guard);
                self.write(result | val, &guard);
                result
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, _order: Ordering) -> $int_type {
                let guard = lock(self.v.get() as usize).write();
                let result = self.read(&guard);
                self.write(result ^ val, &guard);
                result
            }

            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, _order: Ordering) -> $int_type {
                let guard = lock(self.v.get() as usize).write();
                let result = self.read(&guard);
                self.write(core::cmp::max(result, val), &guard);
                result
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, _order: Ordering) -> $int_type {
                let guard = lock(self.v.get() as usize).write();
                let result = self.read(&guard);
                self.write(core::cmp::min(result, val), &guard);
                result
            }

            #[inline]
            pub(crate) fn fetch_not(&self, _order: Ordering) -> $int_type {
                let guard = lock(self.v.get() as usize).write();
                let result = self.read(&guard);
                self.write(!result, &guard);
                result
            }
            #[inline]
            pub(crate) fn not(&self, order: Ordering) {
                self.fetch_not(order);
            }

            #[inline]
            pub(crate) const fn as_ptr(&self) -> *mut $int_type {
                self.v.get()
            }
        }
    };
    (int, $atomic_type:ident, $int_type:ident, $align:literal) => {
        atomic!(uint, $atomic_type, $int_type, $align);
        impl $atomic_type {
            #[inline]
            pub(crate) fn fetch_neg(&self, _order: Ordering) -> $int_type {
                let guard = lock(self.v.get() as usize).write();
                let result = self.read(&guard);
                self.write(result.wrapping_neg(), &guard);
                result
            }
            #[inline]
            pub(crate) fn neg(&self, order: Ordering) {
                self.fetch_neg(order);
            }
        }
    };
}

#[cfg(not(any(
    not(any(target_pointer_width = "16", target_pointer_width = "32")),
    target_arch = "aarch64",
    target_arch = "bpf",
    target_arch = "mips64",
    target_arch = "nvptx64",
    target_arch = "powerpc64",
    target_arch = "riscv64",
    target_arch = "s390x",
    target_arch = "sparc64",
    target_arch = "wasm64",
    target_arch = "x86_64",
)))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(any(test, portable_atomic_no_atomic_64)))]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(test, not(target_has_atomic = "64")))
)]
atomic!(int, AtomicI64, i64, 8);
#[cfg(not(any(
    not(any(target_pointer_width = "16", target_pointer_width = "32")),
    target_arch = "aarch64",
    target_arch = "bpf",
    target_arch = "mips64",
    target_arch = "nvptx64",
    target_arch = "powerpc64",
    target_arch = "riscv64",
    target_arch = "s390x",
    target_arch = "sparc64",
    target_arch = "wasm64",
    target_arch = "x86_64",
)))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(any(test, portable_atomic_no_atomic_64)))]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(test, not(target_has_atomic = "64")))
)]
atomic!(uint, AtomicU64, u64, 8);

atomic!(int, AtomicI128, i128, 16);
atomic!(uint, AtomicU128, u128, 16);

#[cfg(test)]
mod tests {
    use super::*;

    #[cfg(not(any(
        not(any(target_pointer_width = "16", target_pointer_width = "32")),
        target_arch = "aarch64",
        target_arch = "bpf",
        target_arch = "mips64",
        target_arch = "nvptx64",
        target_arch = "powerpc64",
        target_arch = "riscv64",
        target_arch = "s390x",
        target_arch = "sparc64",
        target_arch = "wasm64",
        target_arch = "x86_64",
    )))]
    test_atomic_int!(i64);
    #[cfg(not(any(
        not(any(target_pointer_width = "16", target_pointer_width = "32")),
        target_arch = "aarch64",
        target_arch = "bpf",
        target_arch = "mips64",
        target_arch = "nvptx64",
        target_arch = "powerpc64",
        target_arch = "riscv64",
        target_arch = "s390x",
        target_arch = "sparc64",
        target_arch = "wasm64",
        target_arch = "x86_64",
    )))]
    test_atomic_int!(u64);
    test_atomic_int!(i128);
    test_atomic_int!(u128);
}
