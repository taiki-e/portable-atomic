// Fallback implementation using global locks on pre-v6 ARM.
//
// This implementation uses spinlock for global locks.
//
// Note that we cannot use a lock per atomic type, since the in-memory representation of the atomic
// type and the value type must be the same.

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::{cell::UnsafeCell, sync::atomic::Ordering};

#[repr(C, align(4))]
struct Spinlock {
    state: UnsafeCell<u32>,
}

// SAFETY: any data races are prevented by atomic intrinsics.
unsafe impl Sync for Spinlock {}

#[inline]
#[instruction_set(arm::a32)] // SWP is not supported in the Thumb instruction set.
unsafe fn swp(dst: *mut u32, val: u32) -> u32 {
    // SAFETY: the caller must uphold the safety contract for `swp`.
    //
    // Refs:
    // - https://developer.arm.com/documentation/dht0008/a/swp-and-swpb/legacy-synchronization-instructions/swp-and-swpb
    // - https://developer.arm.com/documentation/dui0473/m/arm-and-thumb-instructions/swp-and-swpb
    unsafe {
        let out;
        asm!(
            "swp {out}, {val}, [{dst}]",
            dst = in(reg) dst,
            val = in(reg) val,
            out = lateout(reg) out,
            options(nostack),
        );
        out
    }
}

impl Spinlock {
    const fn new() -> Self {
        Self { state: UnsafeCell::new(0) }
    }

    #[inline]
    fn lock(&'static self) -> SpinlockGuard {
        loop {
            // SAFETY: any data races are prevented by atomic intrinsics and the raw
            // pointer passed in is valid because we got it from a reference.
            if unsafe { swp(self.state.get(), 1) } == 0 {
                return SpinlockGuard { lock: self };
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
        // SAFETY: any data races are prevented by atomic intrinsics and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            swp(self.lock.state.get(), 0);
        }
    }
}

#[inline]
fn lock() -> SpinlockGuard {
    static LOCK: Spinlock = Spinlock::new();
    LOCK.lock()
}

#[repr(C, align(1))]
pub(crate) struct AtomicBool {
    v: UnsafeCell<u8>,
}

// Send is implicitly implemented.
// SAFETY: any data races are prevented by the lock.
unsafe impl Sync for AtomicBool {}

impl AtomicBool {
    #[inline]
    pub(crate) const fn new(v: bool) -> Self {
        Self { v: UnsafeCell::new(v as u8) }
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
    pub(crate) fn get_mut(&mut self) -> &mut bool {
        // SAFETY: the mutable reference guarantees unique ownership.
        unsafe { &mut *(self.v.get() as *mut bool) }
    }

    #[inline]
    pub(crate) fn into_inner(self) -> bool {
        self.v.into_inner() != 0
    }

    #[inline]
    pub(crate) fn load(&self, order: Ordering) -> bool {
        crate::utils::assert_load_ordering(order);
        // SAFETY: any data races are prevented by the lock and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            let _guard = lock();
            self.v.get().read() != 0
        }
    }

    #[inline]
    pub(crate) fn store(&self, val: bool, order: Ordering) {
        crate::utils::assert_store_ordering(order);
        // SAFETY: any data races are prevented by the lock and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            let _guard = lock();
            self.v.get().write(val as u8);
        }
    }

    #[inline]
    pub(crate) fn swap(&self, val: bool, _order: Ordering) -> bool {
        // SAFETY: any data races are prevented by the lock and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            let _guard = lock();
            self.v.get().replace(val as u8) != 0
        }
    }

    #[inline]
    pub(crate) fn compare_exchange(
        &self,
        current: bool,
        new: bool,
        success: Ordering,
        failure: Ordering,
    ) -> Result<bool, bool> {
        crate::utils::assert_compare_exchange_ordering(success, failure);
        // SAFETY: any data races are prevented by the lock and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            let _guard = lock();
            let result = self.v.get().read();
            if result == current as u8 {
                self.v.get().write(new as u8);
                Ok(result != 0)
            } else {
                Err(result != 0)
            }
        }
    }

    #[inline]
    pub(crate) fn compare_exchange_weak(
        &self,
        current: bool,
        new: bool,
        success: Ordering,
        failure: Ordering,
    ) -> Result<bool, bool> {
        self.compare_exchange(current, new, success, failure)
    }

    #[inline]
    pub(crate) fn fetch_and(&self, val: bool, _order: Ordering) -> bool {
        // SAFETY: any data races are prevented by the lock and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            let _guard = lock();
            let result = self.v.get().read();
            self.v.get().write(result & val as u8);
            result != 0
        }
    }

    #[inline]
    pub(crate) fn fetch_nand(&self, val: bool, order: Ordering) -> bool {
        if val {
            // !(x & true) == !x
            // We must invert the bool.
            self.fetch_xor(true, order)
        } else {
            // !(x & false) == true
            // We must set the bool to true.
            self.swap(true, order)
        }
    }

    #[inline]
    pub(crate) fn fetch_or(&self, val: bool, _order: Ordering) -> bool {
        // SAFETY: any data races are prevented by the lock and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            let _guard = lock();
            let result = self.v.get().read();
            self.v.get().write(result | val as u8);
            result != 0
        }
    }

    #[inline]
    pub(crate) fn fetch_xor(&self, val: bool, _order: Ordering) -> bool {
        // SAFETY: any data races are prevented by the lock and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            let _guard = lock();
            let result = self.v.get().read();
            self.v.get().write(result ^ val as u8);
            result != 0
        }
    }
}

#[repr(C, align(4))]
pub(crate) struct AtomicPtr<T> {
    p: UnsafeCell<*mut T>,
}

// SAFETY: any data races are prevented by the lock.
unsafe impl<T> Send for AtomicPtr<T> {}
// SAFETY: any data races are prevented by the lock.
unsafe impl<T> Sync for AtomicPtr<T> {}

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
        false
    }

    #[inline]
    pub(crate) fn get_mut(&mut self) -> &mut *mut T {
        self.p.get_mut()
    }

    #[inline]
    pub(crate) fn into_inner(self) -> *mut T {
        self.p.into_inner()
    }

    #[inline]
    pub(crate) fn load(&self, order: Ordering) -> *mut T {
        crate::utils::assert_load_ordering(order);
        // SAFETY: any data races are prevented by the lock and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            let _guard = lock();
            self.p.get().read()
        }
    }

    #[inline]
    pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
        crate::utils::assert_store_ordering(order);
        // SAFETY: any data races are prevented by the lock and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            let _guard = lock();
            self.p.get().write(ptr);
        }
    }

    #[inline]
    pub(crate) fn swap(&self, ptr: *mut T, _order: Ordering) -> *mut T {
        // SAFETY: any data races are prevented by the lock and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            let _guard = lock();
            self.p.get().replace(ptr)
        }
    }

    #[inline]
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
            let _guard = lock();
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
    pub(crate) fn compare_exchange_weak(
        &self,
        current: *mut T,
        new: *mut T,
        success: Ordering,
        failure: Ordering,
    ) -> Result<*mut T, *mut T> {
        self.compare_exchange(current, new, success, failure)
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
                // SAFETY: This is safe because the mutable reference guarantees that no other
                // threads are concurrently accessing the atomic data.
                unsafe { &mut *self.v.get() }
            }

            #[inline]
            pub(crate) fn into_inner(self) -> $int_type {
                self.v.into_inner()
            }

            #[inline]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                crate::utils::assert_load_ordering(order);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock();
                    self.v.get().read()
                }
            }

            #[inline]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock();
                    self.v.get().write(val)
                }
            }

            #[inline]
            pub(crate) fn swap(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock();
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
                crate::utils::assert_compare_exchange_ordering(success, failure);
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock();
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
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock();
                    let result = self.v.get().read();
                    self.v.get().write(result.wrapping_add(val));
                    result
                }
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock();
                    let result = self.v.get().read();
                    self.v.get().write(result.wrapping_sub(val));
                    result
                }
            }

            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock();
                    let result = self.v.get().read();
                    self.v.get().write(result & val);
                    result
                }
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock();
                    let result = self.v.get().read();
                    self.v.get().write(!(result & val));
                    result
                }
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock();
                    let result = self.v.get().read();
                    self.v.get().write(result | val);
                    result
                }
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock();
                    let result = self.v.get().read();
                    self.v.get().write(result ^ val);
                    result
                }
            }

            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock();
                    let result = self.v.get().read();
                    self.v.get().write(core::cmp::max(result, val));
                    result
                }
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, _order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by the lock and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let _guard = lock();
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
#[cfg(feature = "fallback")]
atomic_int!(AtomicI64, i64, 8);
#[cfg(feature = "fallback")]
atomic_int!(AtomicU64, u64, 8);
#[cfg(feature = "fallback")]
atomic_int!(AtomicI128, i128, 16);
#[cfg(feature = "fallback")]
atomic_int!(AtomicU128, u128, 16);

atomic_int!(AtomicIsize, isize, 4);
atomic_int!(AtomicUsize, usize, 4);

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_bool!();
    test_atomic_ptr!();
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
    test_atomic_int!(isize);
    test_atomic_int!(usize);
}
