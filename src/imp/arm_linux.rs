// 64-bit atomic implementation using kuser_cmpxchg64 on pre-v6 ARM Linux/Android
//
// Refs:
// - https://www.kernel.org/doc/Documentation/arm/kernel_user_helpers.txt
// - https://github.com/rust-lang/compiler-builtins/blob/0.1.88/src/arm_linux.rs
//
// Note: On Miri and ThreadSanitizer which do not support inline assembly, we don't use
// this module and use fallback implementation instead.

// TODO: Since Rust 1.64, the Linux kernel requirement for Rust when using std is 3.2+, so it should
// be possible to omit the dynamic kernel version check if the std feature is enabled on Rust 1.64+.
// https://blog.rust-lang.org/2022/08/01/Increasing-glibc-kernel-requirements.html

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::{mem, sync::atomic::Ordering};

/// A 64-bit value represented as a pair of 32-bit values.
// This type is #[repr(C)], both fields have the same in-memory representation
// and are plain old datatypes, so access to the fields is always safe.
#[derive(Clone, Copy)]
#[repr(C)]
union U64 {
    whole: u64,
    pair: Pair,
}

#[derive(Clone, Copy)]
#[repr(C)]
struct Pair {
    lo: u32,
    hi: u32,
}

// https://www.kernel.org/doc/Documentation/arm/kernel_user_helpers.txt
const KUSER_HELPER_VERSION: usize = 0xFFFF0FFC;
// kuser_helper_version >= 5 (kernel version 3.1+)
const KUSER_CMPXCHG64: usize = 0xFFFF0F60;
#[inline]
fn kuser_helper_version() -> i32 {
    // SAFETY: KUSER_HELPER_VERSION is always available on ARM Linux/Android.
    unsafe { (KUSER_HELPER_VERSION as *const i32).read() }
}
#[inline]
unsafe fn kuser_cmpxchg64(old_val: *const u64, new_val: *const u64, ptr: *mut u64) -> bool {
    unsafe fn __kuser_cmpxchg64(old_val: *const u64, new_val: *const u64, ptr: *mut u64) -> bool {
        // SAFETY: the caller must uphold the safety contract.
        unsafe {
            let f: extern "C" fn(*const u64, *const u64, *mut u64) -> u32 =
                mem::transmute(KUSER_CMPXCHG64 as *const ());
            f(old_val, new_val, ptr) == 0
        }
    }
    #[cold]
    unsafe fn _fallback(old_val: *const u64, new_val: *const u64, ptr: *mut u64) -> bool {
        // SAFETY: the caller must uphold the safety contract.
        unsafe {
            // Use SeqCst because __kuser_cmpxchg64 is SeqCst.
            // https://github.com/torvalds/linux/blob/v6.1/arch/arm/kernel/entry-armv.S#L918-L925
            (*(ptr as *const super::fallback::AtomicU64))
                .compare_exchange(*old_val, *new_val, Ordering::SeqCst, Ordering::SeqCst)
                .is_ok()
        }
    }
    // SAFETY: we only calls __kuser_cmpxchg64 if it is available.
    unsafe {
        ifunc!(unsafe fn(old_val: *const u64, new_val: *const u64, ptr: *mut u64) -> bool {
            if kuser_helper_version() >= 5 {
                __kuser_cmpxchg64
            } else {
                _fallback
            }
        })
    }
}

// 64-bit atomic load by two 32-bit atomic loads.
#[inline]
unsafe fn byte_wise_atomic_load(src: *const u64) -> u64 {
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        let (prev_lo, prev_hi);
        asm!(
            "ldr {prev_lo}, [{src}]",
            "ldr {prev_hi}, [{src}, #4]",
            src = in(reg) src,
            prev_lo = out(reg) prev_lo,
            prev_hi = out(reg) prev_hi,
            options(nostack, preserves_flags, readonly),
        );
        U64 { pair: Pair { lo: prev_lo, hi: prev_hi } }.whole
    }
}

#[inline(always)]
unsafe fn atomic_update<F>(dst: *mut u64, mut f: F) -> u64
where
    F: FnMut(u64) -> u64,
{
    debug_assert!(dst as usize % 8 == 0);

    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        loop {
            // This is not single-copy atomic reads, but this is ok because subsequent
            // CAS will check for consistency.
            //
            // byte_wise_atomic_load works the same way as seqlock's byte-wise atomic memcpy,
            // so it works well even when atomic_compare_exchange_weak calls global lock-based fallback.
            //
            // Note that the C++20 memory model does not allow mixed-sized atomic access,
            // so we must use inline assembly to implement byte_wise_atomic_load.
            // (i.e., byte-wise atomic based on the standard library's atomic types
            // cannot be used here). Since fallback's byte-wise atomic memcpy is per
            // 32-bit on ARM, it's okay to use it together with this.
            let old = byte_wise_atomic_load(dst);
            let next = f(old);
            if kuser_cmpxchg64(&old, &next, dst) {
                return old;
            }
        }
    }
}

#[inline]
unsafe fn atomic_load(src: *mut u64) -> u64 {
    // SAFETY: the caller must uphold the safety contract.
    unsafe { atomic_update(src, |old| old) }
}
#[inline]
unsafe fn atomic_store(dst: *mut u64, val: u64) {
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        atomic_swap(dst, val);
    }
}
#[inline]
unsafe fn atomic_swap(dst: *mut u64, val: u64) -> u64 {
    // SAFETY: the caller must uphold the safety contract.
    unsafe { atomic_update(dst, |_| val) }
}
#[inline]
unsafe fn atomic_compare_exchange(dst: *mut u64, old: u64, new: u64) -> Result<u64, u64> {
    // SAFETY: the caller must uphold the safety contract.
    let res = unsafe { atomic_update(dst, |v| if v == old { new } else { v }) };
    if res == old {
        Ok(res)
    } else {
        Err(res)
    }
}

macro_rules! atomic64 {
    ($atomic_type:ident, $int_type:ident) => {
        #[repr(C, align(8))]
        pub(crate) struct $atomic_type {
            v: core::cell::UnsafeCell<$int_type>,
        }

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by the kernel user helper or the lock.
        unsafe impl Sync for $atomic_type {}

        no_fetch_ops_impl!($atomic_type, $int_type);
        bit_opts_fetch_impl!($atomic_type, $int_type);
        impl $atomic_type {
            #[inline]
            pub(crate) const fn new(v: $int_type) -> Self {
                Self { v: core::cell::UnsafeCell::new(v) }
            }

            #[inline]
            pub(crate) fn is_lock_free() -> bool {
                kuser_helper_version() >= 5
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
                // SAFETY: any data races are prevented by the kernel user helper or the lock
                // and the raw pointer passed in is valid because we got it from a reference.
                unsafe { atomic_load(self.v.get().cast::<u64>()) as $int_type }
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                // SAFETY: any data races are prevented by the kernel user helper or the lock
                // and the raw pointer passed in is valid because we got it from a reference.
                unsafe { atomic_store(self.v.get().cast::<u64>(), val as u64) }
            }

            #[inline]
            pub(crate) fn swap(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the kernel user helper or the lock
                // and the raw pointer passed in is valid because we got it from a reference.
                unsafe { atomic_swap(self.v.get().cast::<u64>(), val as u64) as $int_type }
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
                // SAFETY: any data races are prevented by the kernel user helper or the lock
                // and the raw pointer passed in is valid because we got it from a reference.
                unsafe {
                    match atomic_compare_exchange(
                        self.v.get().cast::<u64>(),
                        current as u64,
                        new as u64,
                    ) {
                        Ok(v) => Ok(v as $int_type),
                        Err(v) => Err(v as $int_type),
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
                // SAFETY: any data races are prevented by the kernel user helper or the lock
                // and the raw pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_update(self.v.get().cast::<u64>(), |x| x.wrapping_add(val as u64))
                        as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the kernel user helper or the lock
                // and the raw pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_update(self.v.get().cast::<u64>(), |x| x.wrapping_sub(val as u64))
                        as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the kernel user helper or the lock
                // and the raw pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_update(self.v.get().cast::<u64>(), |x| x & val as u64) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the kernel user helper or the lock
                // and the raw pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_update(self.v.get().cast::<u64>(), |x| !(x & val as u64)) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the kernel user helper or the lock
                // and the raw pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_update(self.v.get().cast::<u64>(), |x| x | val as u64) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the kernel user helper or the lock
                // and the raw pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_update(self.v.get().cast::<u64>(), |x| x ^ val as u64) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the kernel user helper or the lock
                // and the raw pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_update(self.v.get().cast::<u64>(), |x| {
                        core::cmp::max(x as $int_type, val) as u64
                    }) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the kernel user helper or the lock
                // and the raw pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_update(self.v.get().cast::<u64>(), |x| {
                        core::cmp::min(x as $int_type, val) as u64
                    }) as $int_type
                }
            }

            #[inline]
            pub(crate) fn fetch_not(&self, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the kernel user helper or the lock
                // and the raw pointer passed in is valid because we got it from a reference.
                unsafe {
                    atomic_update(self.v.get().cast::<u64>(), |x| !(x as $int_type) as u64)
                        as $int_type
                }
            }
            #[inline]
            pub(crate) fn not(&self, order: Ordering) {
                self.fetch_not(order);
            }

            #[inline]
            pub(crate) fn fetch_neg(&self, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the kernel user helper or the lock
                // and the raw pointer passed in is valid because we got it from a reference.
                unsafe { atomic_update(self.v.get().cast::<u64>(), u64::wrapping_neg) as $int_type }
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

atomic64!(AtomicI64, i64);
atomic64!(AtomicU64, u64);

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn kuser_helper_version() {
        let version = super::kuser_helper_version();
        assert!(version >= 5, "{:?}", version);
    }

    test_atomic_int!(i64);
    test_atomic_int!(u64);
}
