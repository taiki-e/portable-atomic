// Refs:
// - https://llvm.org/docs/Atomics.html
// - https://gcc.gnu.org/wiki/Atomic/GCCMM/LIbrary

#![cfg_attr(test, allow(dead_code))] // TODO
#![allow(clippy::undocumented_unsafe_blocks)] // TODO
#![allow(clippy::transmutes_expressible_as_ptr_casts)] // for Miri

use core::{cell::UnsafeCell, ffi::c_void, mem, ptr, sync::atomic::Ordering};

use crate::utils::{assert_load_ordering, assert_store_ordering};

#[repr(C, align(16))]
struct U128(u64, u64);

extern "C" {
    fn __atomic_load_1(src: *const u8, ordering: i32) -> u8;
    fn __atomic_load_2(src: *const u16, ordering: i32) -> u16;
    fn __atomic_load_4(src: *const u32, ordering: i32) -> u32;
    fn __atomic_load_8(src: *const u64, ordering: i32) -> u64;
    fn __atomic_load_16(src: *const U128, ordering: i32) -> U128;

    fn __atomic_store_1(dst: *mut u8, val: u8, ordering: i32);
    fn __atomic_store_2(dst: *mut u16, val: u16, ordering: i32);
    fn __atomic_store_4(dst: *mut u32, val: u32, ordering: i32);
    fn __atomic_store_8(dst: *mut u64, val: u64, ordering: i32);
    fn __atomic_store_16(dst: *mut U128, val: U128, ordering: i32);

    fn __atomic_exchange_1(dst: *mut u8, val: u8, ordering: i32) -> u8;
    fn __atomic_exchange_2(dst: *mut u16, val: u16, ordering: i32) -> u16;
    fn __atomic_exchange_4(dst: *mut u32, val: u32, ordering: i32) -> u32;
    fn __atomic_exchange_8(dst: *mut u64, val: u64, ordering: i32) -> u64;
    fn __atomic_exchange_16(dst: *mut U128, val: U128, ordering: i32) -> U128;

    fn __atomic_compare_exchange_1(
        dst: *mut u8,
        expected: *mut u8,
        desired: u8,
        success_order: i32,
        failure_order: i32,
    ) -> bool;
    fn __atomic_compare_exchange_2(
        dst: *mut u16,
        expected: *mut u16,
        desired: u16,
        success_order: i32,
        failure_order: i32,
    ) -> bool;
    fn __atomic_compare_exchange_4(
        dst: *mut u32,
        expected: *mut u32,
        desired: u32,
        success_order: i32,
        failure_order: i32,
    ) -> bool;
    fn __atomic_compare_exchange_8(
        dst: *mut u64,
        expected: *mut u64,
        desired: u64,
        success_order: i32,
        failure_order: i32,
    ) -> bool;
    fn __atomic_compare_exchange_16(
        dst: *mut U128,
        expected: *mut U128,
        desired: U128,
        success_order: i32,
        failure_order: i32,
    ) -> bool;

    // TODO: __atomic_fetch_add_N
    // TODO: __atomic_fetch_sub_N
    // TODO: __atomic_fetch_and_N
    // TODO: __atomic_fetch_or_N
    // TODO: __atomic_fetch_xor_N

    fn __atomic_is_lock_free(object_size: usize, ptr: *const c_void) -> bool;
}

#[allow(non_upper_case_globals)]
fn c_ordering(order: Ordering) -> i32 {
    const memory_order_relaxed: i32 = 0;
    #[allow(dead_code)]
    const memory_order_consume: i32 = 1;
    const memory_order_acquire: i32 = 2;
    const memory_order_release: i32 = 3;
    const memory_order_acq_rel: i32 = 4;
    const memory_order_seq_cst: i32 = 5;
    match order {
        Ordering::Relaxed => memory_order_relaxed,
        Ordering::Acquire => memory_order_acquire,
        Ordering::Release => memory_order_release,
        Ordering::AcqRel => memory_order_acq_rel,
        Ordering::SeqCst => memory_order_seq_cst,
        _ => unreachable!("{:?}", order),
    }
}

const IS_ALWAYS_LOCK_FREE: bool = false;

#[repr(C, align(1))]
pub(crate) struct AtomicBool {
    v: UnsafeCell<u8>,
}

impl crate::utils::AtomicRepr for AtomicBool {
    const IS_ALWAYS_LOCK_FREE: bool = IS_ALWAYS_LOCK_FREE;
    #[inline]
    fn is_lock_free() -> bool {
        let a = Self::new(false);
        unsafe { __atomic_is_lock_free(mem::size_of::<u8>(), &a as *const _ as *const c_void) }
    }
}

// Send is implicitly implemented.
unsafe impl Sync for AtomicBool {}

impl AtomicBool {
    #[inline]
    #[must_use]
    pub(crate) const fn new(v: bool) -> Self {
        Self { v: UnsafeCell::new(v as u8) }
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
        assert_load_ordering(order);
        unsafe { __atomic_load_1(self.v.get(), c_ordering(order)) != 0 }
    }

    #[inline]
    pub(crate) fn store(&self, val: bool, order: Ordering) {
        assert_store_ordering(order);
        unsafe { __atomic_store_1(self.v.get(), val as u8, c_ordering(order)) }
    }

    #[inline]
    pub(crate) fn swap(&self, val: bool, order: Ordering) -> bool {
        unsafe { __atomic_exchange_1(self.v.get(), val as u8, c_ordering(order)) != 0 }
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
        let mut expected = current as u8;
        unsafe {
            let res = __atomic_compare_exchange_1(
                self.v.get(),
                &mut expected,
                new as u8,
                c_ordering(success),
                c_ordering(failure),
            );
            if res {
                Ok(expected != 0)
            } else {
                Err(expected != 0)
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
    pub(crate) fn fetch_and(&self, val: bool, order: Ordering) -> bool {
        self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| x & val)
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
    pub(crate) fn fetch_or(&self, val: bool, order: Ordering) -> bool {
        self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| x | val)
    }

    #[inline]
    pub(crate) fn fetch_xor(&self, val: bool, order: Ordering) -> bool {
        self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| x ^ val)
    }

    #[inline]
    fn fetch_update<F>(&self, set_order: Ordering, fetch_order: Ordering, mut f: F) -> bool
    where
        F: FnMut(bool) -> bool,
    {
        let mut prev = self.load(fetch_order);
        loop {
            let next = f(prev);
            match self.compare_exchange_weak(prev, next, set_order, fetch_order) {
                Ok(x) => return x,
                Err(next_prev) => prev = next_prev,
            }
        }
    }
}

#[cfg_attr(target_pointer_width = "16", repr(C, align(2)))]
#[cfg_attr(target_pointer_width = "32", repr(C, align(4)))]
#[cfg_attr(target_pointer_width = "64", repr(C, align(8)))]
pub(crate) struct AtomicPtr<T> {
    p: UnsafeCell<*mut T>,
}

impl<T> crate::utils::AtomicRepr for AtomicPtr<T> {
    const IS_ALWAYS_LOCK_FREE: bool = IS_ALWAYS_LOCK_FREE;
    #[inline]
    fn is_lock_free() -> bool {
        let a = Self::new(ptr::null_mut());
        unsafe { __atomic_is_lock_free(mem::size_of::<*mut T>(), &a as *const _ as *const c_void) }
    }
}

unsafe impl<T> Send for AtomicPtr<T> {}
unsafe impl<T> Sync for AtomicPtr<T> {}

impl<T> AtomicPtr<T> {
    #[inline]
    #[must_use]
    pub(crate) const fn new(p: *mut T) -> Self {
        Self { p: UnsafeCell::new(p) }
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
        assert_load_ordering(order);
        #[cfg(target_pointer_width = "16")]
        unsafe {
            mem::transmute(__atomic_load_2(self.p.get() as *mut u16, c_ordering(order)))
        }
        #[cfg(target_pointer_width = "32")]
        unsafe {
            mem::transmute(__atomic_load_4(self.p.get() as *mut u32, c_ordering(order)))
        }
        #[cfg(target_pointer_width = "64")]
        unsafe {
            mem::transmute(__atomic_load_8(self.p.get() as *mut u64, c_ordering(order)))
        }
    }

    #[inline]
    pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
        assert_store_ordering(order);
        #[cfg(target_pointer_width = "16")]
        unsafe {
            __atomic_store_2(self.p.get() as *mut u16, mem::transmute(ptr), c_ordering(order));
        }
        #[cfg(target_pointer_width = "32")]
        unsafe {
            __atomic_store_4(self.p.get() as *mut u32, mem::transmute(ptr), c_ordering(order));
        }
        #[cfg(target_pointer_width = "64")]
        unsafe {
            __atomic_store_8(self.p.get() as *mut u64, mem::transmute(ptr), c_ordering(order));
        }
    }

    #[inline]
    pub(crate) fn swap(&self, ptr: *mut T, order: Ordering) -> *mut T {
        #[cfg(target_pointer_width = "16")]
        unsafe {
            mem::transmute(__atomic_exchange_2(
                self.p.get() as *mut u16,
                mem::transmute(ptr),
                c_ordering(order),
            ))
        }
        #[cfg(target_pointer_width = "32")]
        unsafe {
            mem::transmute(__atomic_exchange_4(
                self.p.get() as *mut u32,
                mem::transmute(ptr),
                c_ordering(order),
            ))
        }
        #[cfg(target_pointer_width = "64")]
        unsafe {
            mem::transmute(__atomic_exchange_8(
                self.p.get() as *mut u64,
                mem::transmute(ptr),
                c_ordering(order),
            ))
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
        unsafe {
            let mut expected: usize = mem::transmute(current);
            #[cfg(target_pointer_width = "16")]
            let res = __atomic_compare_exchange_2(
                self.p.get() as *mut u16,
                &mut expected as *mut _ as *mut u16,
                mem::transmute(new),
                c_ordering(success),
                c_ordering(failure),
            );
            #[cfg(target_pointer_width = "32")]
            let res = __atomic_compare_exchange_4(
                self.p.get() as *mut u32,
                &mut expected as *mut _ as *mut u32,
                mem::transmute(new),
                c_ordering(success),
                c_ordering(failure),
            );
            #[cfg(target_pointer_width = "64")]
            let res = __atomic_compare_exchange_8(
                self.p.get() as *mut u64,
                &mut expected as *mut _ as *mut u64,
                mem::transmute(new),
                c_ordering(success),
                c_ordering(failure),
            );
            if res {
                Ok(mem::transmute(expected))
            } else {
                Err(mem::transmute(expected))
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
    (
        $atomic_type:ident,
        $int_type:ident,
        $align:expr,
        $atomic_load:ident,
        $atomic_store:ident,
        $atomic_exchange:ident,
        $atomic_compare_exchange:ident,
    ) => {
        #[repr(C, align($align))]
        pub(crate) struct $atomic_type {
            v: UnsafeCell<$int_type>,
        }

        impl crate::utils::AtomicRepr for $atomic_type {
            const IS_ALWAYS_LOCK_FREE: bool = IS_ALWAYS_LOCK_FREE;
            #[inline]
            fn is_lock_free() -> bool {
                let a = Self::new(0);
                unsafe {
                    __atomic_is_lock_free(
                        mem::size_of::<$int_type>(),
                        &a as *const _ as *const c_void,
                    )
                }
            }
        }

        // Send is implicitly implemented.
        unsafe impl Sync for $atomic_type {}

        impl $atomic_type {
            #[inline]
            #[must_use]
            pub(crate) const fn new(v: $int_type) -> Self {
                Self { v: UnsafeCell::new(v) }
            }

            #[inline]
            pub(crate) fn get_mut(&mut self) -> &mut $int_type {
                self.v.get_mut()
            }

            #[inline]
            pub(crate) fn into_inner(self) -> $int_type {
                self.v.into_inner()
            }

            #[inline]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                assert_load_ordering(order);
                unsafe { mem::transmute($atomic_load(self.v.get() as *mut _, c_ordering(order))) }
            }

            #[inline]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                assert_store_ordering(order);
                unsafe {
                    $atomic_store(self.v.get() as *mut _, mem::transmute(val), c_ordering(order))
                }
            }

            #[inline]
            pub(crate) fn swap(&self, val: $int_type, order: Ordering) -> $int_type {
                unsafe {
                    mem::transmute($atomic_exchange(
                        self.v.get() as *mut _,
                        mem::transmute(val),
                        c_ordering(order),
                    ))
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
                let mut expected = current;
                unsafe {
                    let res = $atomic_compare_exchange(
                        self.v.get() as *mut _,
                        &mut expected as *mut _ as *mut _,
                        mem::transmute(new),
                        c_ordering(success),
                        c_ordering(failure),
                    );
                    if res {
                        Ok(expected as $int_type)
                    } else {
                        Err(expected as $int_type)
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
            pub(crate) fn fetch_add(&self, val: $int_type, order: Ordering) -> $int_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    x.wrapping_add(val)
                })
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, order: Ordering) -> $int_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    x.wrapping_sub(val)
                })
            }

            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, order: Ordering) -> $int_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    x & val
                })
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, order: Ordering) -> $int_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    !(x & val)
                })
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, order: Ordering) -> $int_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    x | val
                })
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, order: Ordering) -> $int_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    x ^ val
                })
            }

            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, order: Ordering) -> $int_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    core::cmp::max(x, val)
                })
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    core::cmp::min(x, val)
                })
            }

            #[inline]
            fn fetch_update<F>(
                &self,
                set_order: Ordering,
                fetch_order: Ordering,
                mut f: F,
            ) -> $int_type
            where
                F: FnMut($int_type) -> $int_type,
            {
                let mut prev = self.load(fetch_order);
                loop {
                    let next = f(prev);
                    match self.compare_exchange_weak(prev, next, set_order, fetch_order) {
                        Ok(x) => return x,
                        Err(next_prev) => prev = next_prev,
                    }
                }
            }
        }
    };
}

#[cfg(target_pointer_width = "16")]
atomic_int!(
    AtomicIsize,
    isize,
    2,
    __atomic_load_2,
    __atomic_store_2,
    __atomic_exchange_2,
    __atomic_compare_exchange_2,
);
#[cfg(target_pointer_width = "16")]
atomic_int!(
    AtomicUsize,
    usize,
    2,
    __atomic_load_2,
    __atomic_store_2,
    __atomic_exchange_2,
    __atomic_compare_exchange_2,
);
#[cfg(target_pointer_width = "32")]
atomic_int!(
    AtomicIsize,
    isize,
    4,
    __atomic_load_4,
    __atomic_store_4,
    __atomic_exchange_4,
    __atomic_compare_exchange_4,
);
#[cfg(target_pointer_width = "32")]
atomic_int!(
    AtomicUsize,
    usize,
    4,
    __atomic_load_4,
    __atomic_store_4,
    __atomic_exchange_4,
    __atomic_compare_exchange_4,
);
#[cfg(target_pointer_width = "64")]
atomic_int!(
    AtomicIsize,
    isize,
    8,
    __atomic_load_8,
    __atomic_store_8,
    __atomic_exchange_8,
    __atomic_compare_exchange_8,
);
#[cfg(target_pointer_width = "64")]
atomic_int!(
    AtomicUsize,
    usize,
    8,
    __atomic_load_8,
    __atomic_store_8,
    __atomic_exchange_8,
    __atomic_compare_exchange_8,
);

atomic_int!(
    AtomicI8,
    i8,
    1,
    __atomic_load_1,
    __atomic_store_1,
    __atomic_exchange_1,
    __atomic_compare_exchange_1,
);
atomic_int!(
    AtomicU8,
    u8,
    1,
    __atomic_load_1,
    __atomic_store_1,
    __atomic_exchange_1,
    __atomic_compare_exchange_1,
);
atomic_int!(
    AtomicI16,
    i16,
    2,
    __atomic_load_2,
    __atomic_store_2,
    __atomic_exchange_2,
    __atomic_compare_exchange_2,
);
atomic_int!(
    AtomicU16,
    u16,
    2,
    __atomic_load_2,
    __atomic_store_2,
    __atomic_exchange_2,
    __atomic_compare_exchange_2,
);

#[cfg(not(target_pointer_width = "16"))]
atomic_int!(
    AtomicI32,
    i32,
    4,
    __atomic_load_4,
    __atomic_store_4,
    __atomic_exchange_4,
    __atomic_compare_exchange_4,
);
#[cfg(not(target_pointer_width = "16"))]
atomic_int!(
    AtomicU32,
    u32,
    4,
    __atomic_load_4,
    __atomic_store_4,
    __atomic_exchange_4,
    __atomic_compare_exchange_4,
);

#[cfg(target_pointer_width = "64")]
atomic_int!(
    AtomicI64,
    i64,
    8,
    __atomic_load_8,
    __atomic_store_8,
    __atomic_exchange_8,
    __atomic_compare_exchange_8,
);
#[cfg(target_pointer_width = "64")]
atomic_int!(
    AtomicU64,
    u64,
    8,
    __atomic_load_8,
    __atomic_store_8,
    __atomic_exchange_8,
    __atomic_compare_exchange_8,
);

#[cfg(target_arch = "aarch64")]
atomic_int!(
    AtomicI128,
    i128,
    16,
    __atomic_load_16,
    __atomic_store_16,
    __atomic_exchange_16,
    __atomic_compare_exchange_16,
);
#[cfg(target_arch = "aarch64")]
atomic_int!(
    AtomicU128,
    u128,
    16,
    __atomic_load_16,
    __atomic_store_16,
    __atomic_exchange_16,
    __atomic_compare_exchange_16,
);

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_bool_single_thread!();
    test_atomic_ptr_single_thread!();
    test_atomic_int_single_thread!(i8);
    test_atomic_int_single_thread!(u8);
    test_atomic_int_single_thread!(i16);
    test_atomic_int_single_thread!(u16);
    test_atomic_int_single_thread!(i32);
    test_atomic_int_single_thread!(u32);
    #[cfg(target_pointer_width = "64")]
    test_atomic_int_single_thread!(i64);
    #[cfg(target_pointer_width = "64")]
    test_atomic_int_single_thread!(u64);
    #[cfg(target_arch = "aarch64")]
    test_atomic_int_single_thread!(i128);
    #[cfg(target_arch = "aarch64")]
    test_atomic_int_single_thread!(u128);
    test_atomic_int_single_thread!(isize);
    test_atomic_int_single_thread!(usize);
}
