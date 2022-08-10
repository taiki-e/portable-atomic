// Refs:
// - https://llvm.org/docs/Atomics.html
// - https://gcc.gnu.org/wiki/Atomic/GCCMM/LIbrary

use core::{cell::UnsafeCell, mem, ptr, sync::atomic::Ordering};

#[allow(non_upper_case_globals, non_camel_case_types)]
mod ffi {
    pub(super) use core::ffi::c_void;

    // core::ffi::c_* requires Rust 1.54: https://github.com/rust-lang/rust/issues/94501
    // https://github.com/rust-lang/rust/blob/6d3f1beae1720055e5a30f4dbe7a9e7fb810c65e/library/core/src/ffi/mod.rs#L159-L173
    #[cfg(any(target_arch = "avr", target_arch = "msp430"))]
    pub(super) type c_int = i16;
    #[cfg(not(any(target_arch = "avr", target_arch = "msp430")))]
    pub(super) type c_int = i32;
}
use ffi::{c_int, c_void};

// FFI-safe 128-bit value.
#[allow(dead_code)]
#[derive(Clone, Copy)]
#[repr(C, align(16))]
struct U128(u64, u64);

// Refs: https://gcc.gnu.org/wiki/Atomic/GCCMM/LIbrary
const MEMORY_ORDER_RELAXED: c_int = 0;
// const MEMORY_ORDER_CONSUME: c_int = 1;
const MEMORY_ORDER_ACQUIRE: c_int = 2;
const MEMORY_ORDER_RELEASE: c_int = 3;
const MEMORY_ORDER_ACQ_REL: c_int = 4;
const MEMORY_ORDER_SEQ_CST: c_int = 5;

#[inline]
fn c_ordering(order: Ordering) -> c_int {
    match order {
        Ordering::Relaxed => MEMORY_ORDER_RELAXED,
        Ordering::Acquire => MEMORY_ORDER_ACQUIRE,
        Ordering::Release => MEMORY_ORDER_RELEASE,
        Ordering::AcqRel => MEMORY_ORDER_ACQ_REL,
        Ordering::SeqCst => MEMORY_ORDER_SEQ_CST,
        _ => unreachable!("{:?}", order),
    }
}

extern "C" {
    fn __atomic_load_1(src: *mut u8, ordering: c_int) -> u8;
    fn __atomic_load_2(src: *mut u16, ordering: c_int) -> u16;
    fn __atomic_load_4(src: *mut u32, ordering: c_int) -> u32;
    fn __atomic_load_8(src: *mut u64, ordering: c_int) -> u64;
    fn __atomic_load_16(src: *mut U128, ordering: c_int) -> U128;

    fn __atomic_store_1(dst: *mut u8, val: u8, ordering: c_int);
    fn __atomic_store_2(dst: *mut u16, val: u16, ordering: c_int);
    fn __atomic_store_4(dst: *mut u32, val: u32, ordering: c_int);
    fn __atomic_store_8(dst: *mut u64, val: u64, ordering: c_int);
    fn __atomic_store_16(dst: *mut U128, val: U128, ordering: c_int);

    fn __atomic_exchange_1(dst: *mut u8, val: u8, ordering: c_int) -> u8;
    fn __atomic_exchange_2(dst: *mut u16, val: u16, ordering: c_int) -> u16;
    fn __atomic_exchange_4(dst: *mut u32, val: u32, ordering: c_int) -> u32;
    fn __atomic_exchange_8(dst: *mut u64, val: u64, ordering: c_int) -> u64;
    fn __atomic_exchange_16(dst: *mut U128, val: U128, ordering: c_int) -> U128;

    fn __atomic_compare_exchange_1(
        dst: *mut u8,
        expected: *mut u8,
        desired: u8,
        success_order: c_int,
        failure_order: c_int,
    ) -> bool;
    fn __atomic_compare_exchange_2(
        dst: *mut u16,
        expected: *mut u16,
        desired: u16,
        success_order: c_int,
        failure_order: c_int,
    ) -> bool;
    fn __atomic_compare_exchange_4(
        dst: *mut u32,
        expected: *mut u32,
        desired: u32,
        success_order: c_int,
        failure_order: c_int,
    ) -> bool;
    fn __atomic_compare_exchange_8(
        dst: *mut u64,
        expected: *mut u64,
        desired: u64,
        success_order: c_int,
        failure_order: c_int,
    ) -> bool;
    fn __atomic_compare_exchange_16(
        dst: *mut U128,
        expected: *mut U128,
        desired: U128,
        success_order: c_int,
        failure_order: c_int,
    ) -> bool;

    fn __atomic_fetch_add_1(dst: *mut u8, val: u8, ordering: c_int) -> u8;
    fn __atomic_fetch_add_2(dst: *mut u16, val: u16, ordering: c_int) -> u16;
    fn __atomic_fetch_add_4(dst: *mut u32, val: u32, ordering: c_int) -> u32;
    fn __atomic_fetch_add_8(dst: *mut u64, val: u64, ordering: c_int) -> u64;
    fn __atomic_fetch_add_16(dst: *mut U128, val: U128, ordering: c_int) -> U128;

    fn __atomic_fetch_sub_1(dst: *mut u8, val: u8, ordering: c_int) -> u8;
    fn __atomic_fetch_sub_2(dst: *mut u16, val: u16, ordering: c_int) -> u16;
    fn __atomic_fetch_sub_4(dst: *mut u32, val: u32, ordering: c_int) -> u32;
    fn __atomic_fetch_sub_8(dst: *mut u64, val: u64, ordering: c_int) -> u64;
    fn __atomic_fetch_sub_16(dst: *mut U128, val: U128, ordering: c_int) -> U128;

    fn __atomic_fetch_and_1(dst: *mut u8, val: u8, ordering: c_int) -> u8;
    fn __atomic_fetch_and_2(dst: *mut u16, val: u16, ordering: c_int) -> u16;
    fn __atomic_fetch_and_4(dst: *mut u32, val: u32, ordering: c_int) -> u32;
    fn __atomic_fetch_and_8(dst: *mut u64, val: u64, ordering: c_int) -> u64;
    fn __atomic_fetch_and_16(dst: *mut U128, val: U128, ordering: c_int) -> U128;

    fn __atomic_fetch_or_1(dst: *mut u8, val: u8, ordering: c_int) -> u8;
    fn __atomic_fetch_or_2(dst: *mut u16, val: u16, ordering: c_int) -> u16;
    fn __atomic_fetch_or_4(dst: *mut u32, val: u32, ordering: c_int) -> u32;
    fn __atomic_fetch_or_8(dst: *mut u64, val: u64, ordering: c_int) -> u64;
    fn __atomic_fetch_or_16(dst: *mut U128, val: U128, ordering: c_int) -> U128;

    fn __atomic_fetch_xor_1(dst: *mut u8, val: u8, ordering: c_int) -> u8;
    fn __atomic_fetch_xor_2(dst: *mut u16, val: u16, ordering: c_int) -> u16;
    fn __atomic_fetch_xor_4(dst: *mut u32, val: u32, ordering: c_int) -> u32;
    fn __atomic_fetch_xor_8(dst: *mut u64, val: u64, ordering: c_int) -> u64;
    fn __atomic_fetch_xor_16(dst: *mut U128, val: U128, ordering: c_int) -> U128;

    fn __atomic_is_lock_free(object_size: usize, ptr: *const c_void) -> bool;
}

#[repr(C, align(1))]
pub(crate) struct AtomicBool {
    v: UnsafeCell<u8>,
}

// Send is implicitly implemented.
// SAFETY: any data races are prevented by atomic builtins.
unsafe impl Sync for AtomicBool {}

impl AtomicBool {
    #[inline]
    pub(crate) const fn new(v: bool) -> Self {
        Self { v: UnsafeCell::new(v as u8) }
    }

    #[inline]
    pub(crate) fn is_lock_free() -> bool {
        // SAFETY: calling __atomic_is_lock_free is safe.
        // Pass null ptr to retrieve the lock-free property  for a properly aligned object.
        unsafe { __atomic_is_lock_free(mem::size_of::<Self>(), ptr::null()) }
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
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe { __atomic_load_1(self.v.get(), c_ordering(order)) != 0 }
    }

    #[inline]
    pub(crate) fn store(&self, val: bool, order: Ordering) {
        crate::utils::assert_store_ordering(order);
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe { __atomic_store_1(self.v.get(), val as u8, c_ordering(order)) }
    }

    #[inline]
    pub(crate) fn swap(&self, val: bool, order: Ordering) -> bool {
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
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
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            let success = crate::utils::upgrade_success_ordering(success, failure); // stronger failure ordering requires c++17
            let mut expected = current as u8;
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
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe { __atomic_fetch_and_1(self.v.get(), val as u8, c_ordering(order)) != 0 }
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
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe { __atomic_fetch_or_1(self.v.get(), val as u8, c_ordering(order)) != 0 }
    }

    #[inline]
    pub(crate) fn fetch_xor(&self, val: bool, order: Ordering) -> bool {
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe { __atomic_fetch_xor_1(self.v.get(), val as u8, c_ordering(order)) != 0 }
    }
}

#[cfg_attr(target_pointer_width = "16", repr(C, align(2)))]
#[cfg_attr(target_pointer_width = "32", repr(C, align(4)))]
#[cfg_attr(target_pointer_width = "64", repr(C, align(8)))]
pub(crate) struct AtomicPtr<T> {
    p: UnsafeCell<*mut T>,
}

// SAFETY: any data races are prevented by atomic builtins.
unsafe impl<T> Send for AtomicPtr<T> {}
// SAFETY: any data races are prevented by atomic builtins.
unsafe impl<T> Sync for AtomicPtr<T> {}

impl<T> AtomicPtr<T> {
    #[inline]
    pub(crate) const fn new(p: *mut T) -> Self {
        Self { p: UnsafeCell::new(p) }
    }

    #[inline]
    pub(crate) fn is_lock_free() -> bool {
        // SAFETY: calling __atomic_is_lock_free is safe.
        // Pass null ptr to retrieve the lock-free property  for a properly aligned object.
        unsafe { __atomic_is_lock_free(mem::size_of::<Self>(), ptr::null()) }
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
        #[cfg(target_pointer_width = "16")]
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            __atomic_load_2(self.p.get() as *mut u16, c_ordering(order)) as *mut T
        }
        #[cfg(target_pointer_width = "32")]
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            __atomic_load_4(self.p.get() as *mut u32, c_ordering(order)) as *mut T
        }
        #[cfg(target_pointer_width = "64")]
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            __atomic_load_8(self.p.get() as *mut u64, c_ordering(order)) as *mut T
        }
    }

    #[inline]
    pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
        crate::utils::assert_store_ordering(order);
        #[cfg(target_pointer_width = "16")]
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            __atomic_store_2(self.p.get() as *mut u16, ptr as u16, c_ordering(order));
        }
        #[cfg(target_pointer_width = "32")]
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            __atomic_store_4(self.p.get() as *mut u32, ptr as u32, c_ordering(order));
        }
        #[cfg(target_pointer_width = "64")]
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            __atomic_store_8(self.p.get() as *mut u64, ptr as u64, c_ordering(order));
        }
    }

    #[inline]
    pub(crate) fn swap(&self, ptr: *mut T, order: Ordering) -> *mut T {
        #[cfg(target_pointer_width = "16")]
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            __atomic_exchange_2(self.p.get() as *mut u16, ptr as u16, c_ordering(order)) as *mut T
        }
        #[cfg(target_pointer_width = "32")]
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            __atomic_exchange_4(self.p.get() as *mut u32, ptr as u32, c_ordering(order)) as *mut T
        }
        #[cfg(target_pointer_width = "64")]
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            __atomic_exchange_8(self.p.get() as *mut u64, ptr as u64, c_ordering(order)) as *mut T
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
        // SAFETY: any data races are prevented by atomic builtins and the raw
        // pointer passed in is valid because we got it from a reference.
        unsafe {
            let success = crate::utils::upgrade_success_ordering(success, failure); // stronger failure ordering requires c++17
            let mut expected = current as usize;
            #[cfg(target_pointer_width = "16")]
            let res = __atomic_compare_exchange_2(
                self.p.get() as *mut u16,
                &mut expected as *mut _ as *mut u16,
                new as u16,
                c_ordering(success),
                c_ordering(failure),
            );
            #[cfg(target_pointer_width = "32")]
            let res = __atomic_compare_exchange_4(
                self.p.get() as *mut u32,
                &mut expected as *mut _ as *mut u32,
                new as u32,
                c_ordering(success),
                c_ordering(failure),
            );
            #[cfg(target_pointer_width = "64")]
            let res = __atomic_compare_exchange_8(
                self.p.get() as *mut u64,
                &mut expected as *mut _ as *mut u64,
                new as u64,
                c_ordering(success),
                c_ordering(failure),
            );
            if res {
                Ok(expected as *mut T)
            } else {
                Err(expected as *mut T)
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
        $atomic_fetch_add:ident,
        $atomic_fetch_sub:ident,
        $atomic_fetch_and:ident,
        $atomic_fetch_or:ident,
        $atomic_fetch_xor:ident,
    ) => {
        #[repr(C, align($align))]
        pub(crate) struct $atomic_type {
            v: UnsafeCell<$int_type>,
        }

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by atomic builtins.
        unsafe impl Sync for $atomic_type {}

        #[allow(clippy::useless_transmute)]
        impl $atomic_type {
            #[inline]
            pub(crate) const fn new(v: $int_type) -> Self {
                Self { v: UnsafeCell::new(v) }
            }

            #[inline]
            pub(crate) fn is_lock_free() -> bool {
                // SAFETY: calling __atomic_is_lock_free is safe.
                // Pass null ptr to retrieve the lock-free property  for a properly aligned object.
                unsafe { __atomic_is_lock_free(mem::size_of::<Self>(), ptr::null()) }
            }
            #[inline]
            pub(crate) const fn is_always_lock_free() -> bool {
                false
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
                crate::utils::assert_load_ordering(order);
                // SAFETY: any data races are prevented by atomic builtins and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { mem::transmute($atomic_load(self.v.get() as *mut _, c_ordering(order))) }
            }

            #[inline]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                // SAFETY: any data races are prevented by atomic builtins and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    $atomic_store(self.v.get() as *mut _, mem::transmute(val), c_ordering(order))
                }
            }

            #[inline]
            pub(crate) fn swap(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic builtins and the raw
                // pointer passed in is valid because we got it from a reference.
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
                // SAFETY: any data races are prevented by atomic builtins and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let success = crate::utils::upgrade_success_ordering(success, failure); // stronger failure ordering requires c++17
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
                // SAFETY: any data races are prevented by atomic builtins and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    mem::transmute($atomic_fetch_add(
                        self.v.get() as *mut _,
                        mem::transmute(val),
                        c_ordering(order),
                    ))
                }
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic builtins and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    mem::transmute($atomic_fetch_sub(
                        self.v.get() as *mut _,
                        mem::transmute(val),
                        c_ordering(order),
                    ))
                }
            }

            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic builtins and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    mem::transmute($atomic_fetch_and(
                        self.v.get() as *mut _,
                        mem::transmute(val),
                        c_ordering(order),
                    ))
                }
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, order: Ordering) -> $int_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    !(x & val)
                })
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic builtins and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    mem::transmute($atomic_fetch_or(
                        self.v.get() as *mut _,
                        mem::transmute(val),
                        c_ordering(order),
                    ))
                }
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic builtins and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    mem::transmute($atomic_fetch_xor(
                        self.v.get() as *mut _,
                        mem::transmute(val),
                        c_ordering(order),
                    ))
                }
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
    __atomic_fetch_add_2,
    __atomic_fetch_sub_2,
    __atomic_fetch_and_2,
    __atomic_fetch_or_2,
    __atomic_fetch_xor_2,
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
    __atomic_fetch_add_2,
    __atomic_fetch_sub_2,
    __atomic_fetch_and_2,
    __atomic_fetch_or_2,
    __atomic_fetch_xor_2,
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
    __atomic_fetch_add_4,
    __atomic_fetch_sub_4,
    __atomic_fetch_and_4,
    __atomic_fetch_or_4,
    __atomic_fetch_xor_4,
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
    __atomic_fetch_add_4,
    __atomic_fetch_sub_4,
    __atomic_fetch_and_4,
    __atomic_fetch_or_4,
    __atomic_fetch_xor_4,
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
    __atomic_fetch_add_8,
    __atomic_fetch_sub_8,
    __atomic_fetch_and_8,
    __atomic_fetch_or_8,
    __atomic_fetch_xor_8,
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
    __atomic_fetch_add_8,
    __atomic_fetch_sub_8,
    __atomic_fetch_and_8,
    __atomic_fetch_or_8,
    __atomic_fetch_xor_8,
);

atomic_int!(
    AtomicI8,
    i8,
    1,
    __atomic_load_1,
    __atomic_store_1,
    __atomic_exchange_1,
    __atomic_compare_exchange_1,
    __atomic_fetch_add_1,
    __atomic_fetch_sub_1,
    __atomic_fetch_and_1,
    __atomic_fetch_or_1,
    __atomic_fetch_xor_1,
);
atomic_int!(
    AtomicU8,
    u8,
    1,
    __atomic_load_1,
    __atomic_store_1,
    __atomic_exchange_1,
    __atomic_compare_exchange_1,
    __atomic_fetch_add_1,
    __atomic_fetch_sub_1,
    __atomic_fetch_and_1,
    __atomic_fetch_or_1,
    __atomic_fetch_xor_1,
);
atomic_int!(
    AtomicI16,
    i16,
    2,
    __atomic_load_2,
    __atomic_store_2,
    __atomic_exchange_2,
    __atomic_compare_exchange_2,
    __atomic_fetch_add_2,
    __atomic_fetch_sub_2,
    __atomic_fetch_and_2,
    __atomic_fetch_or_2,
    __atomic_fetch_xor_2,
);
atomic_int!(
    AtomicU16,
    u16,
    2,
    __atomic_load_2,
    __atomic_store_2,
    __atomic_exchange_2,
    __atomic_compare_exchange_2,
    __atomic_fetch_add_2,
    __atomic_fetch_sub_2,
    __atomic_fetch_and_2,
    __atomic_fetch_or_2,
    __atomic_fetch_xor_2,
);

#[cfg(any(
    portable_atomic_unsafe_atomic_builtins_4,
    portable_atomic_unsafe_atomic_builtins_8,
    portable_atomic_unsafe_atomic_builtins_16,
    not(target_pointer_width = "16")
))]
atomic_int!(
    AtomicI32,
    i32,
    4,
    __atomic_load_4,
    __atomic_store_4,
    __atomic_exchange_4,
    __atomic_compare_exchange_4,
    __atomic_fetch_add_4,
    __atomic_fetch_sub_4,
    __atomic_fetch_and_4,
    __atomic_fetch_or_4,
    __atomic_fetch_xor_4,
);
#[cfg(any(
    portable_atomic_unsafe_atomic_builtins_4,
    portable_atomic_unsafe_atomic_builtins_8,
    portable_atomic_unsafe_atomic_builtins_16,
    not(target_pointer_width = "16")
))]
atomic_int!(
    AtomicU32,
    u32,
    4,
    __atomic_load_4,
    __atomic_store_4,
    __atomic_exchange_4,
    __atomic_compare_exchange_4,
    __atomic_fetch_add_4,
    __atomic_fetch_sub_4,
    __atomic_fetch_and_4,
    __atomic_fetch_or_4,
    __atomic_fetch_xor_4,
);

#[cfg(any(
    portable_atomic_unsafe_atomic_builtins_8,
    portable_atomic_unsafe_atomic_builtins_16,
    not(any(target_pointer_width = "16", target_pointer_width = "32"))
))]
atomic_int!(
    AtomicI64,
    i64,
    8,
    __atomic_load_8,
    __atomic_store_8,
    __atomic_exchange_8,
    __atomic_compare_exchange_8,
    __atomic_fetch_add_8,
    __atomic_fetch_sub_8,
    __atomic_fetch_and_8,
    __atomic_fetch_or_8,
    __atomic_fetch_xor_8,
);
#[cfg(any(
    portable_atomic_unsafe_atomic_builtins_8,
    portable_atomic_unsafe_atomic_builtins_16,
    not(any(target_pointer_width = "16", target_pointer_width = "32"))
))]
atomic_int!(
    AtomicU64,
    u64,
    8,
    __atomic_load_8,
    __atomic_store_8,
    __atomic_exchange_8,
    __atomic_compare_exchange_8,
    __atomic_fetch_add_8,
    __atomic_fetch_sub_8,
    __atomic_fetch_and_8,
    __atomic_fetch_or_8,
    __atomic_fetch_xor_8,
);

#[cfg(any(
    portable_atomic_unsafe_atomic_builtins_16,
    not(any(
        target_pointer_width = "16",
        target_pointer_width = "32",
        target_pointer_width = "64"
    ))
))]
atomic_int!(
    AtomicI128,
    i128,
    16,
    __atomic_load_16,
    __atomic_store_16,
    __atomic_exchange_16,
    __atomic_compare_exchange_16,
    __atomic_fetch_add_16,
    __atomic_fetch_sub_16,
    __atomic_fetch_and_16,
    __atomic_fetch_or_16,
    __atomic_fetch_xor_16,
);
#[cfg(any(
    portable_atomic_unsafe_atomic_builtins_16,
    not(any(
        target_pointer_width = "16",
        target_pointer_width = "32",
        target_pointer_width = "64"
    ))
))]
atomic_int!(
    AtomicU128,
    u128,
    16,
    __atomic_load_16,
    __atomic_store_16,
    __atomic_exchange_16,
    __atomic_compare_exchange_16,
    __atomic_fetch_add_16,
    __atomic_fetch_sub_16,
    __atomic_fetch_and_16,
    __atomic_fetch_or_16,
    __atomic_fetch_xor_16,
);

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
    #[cfg(any(
        portable_atomic_unsafe_atomic_builtins_8,
        portable_atomic_unsafe_atomic_builtins_16,
        not(any(target_pointer_width = "16", target_pointer_width = "32"))
    ))]
    test_atomic_int!(i64);
    #[cfg(any(
        portable_atomic_unsafe_atomic_builtins_8,
        portable_atomic_unsafe_atomic_builtins_16,
        not(any(target_pointer_width = "16", target_pointer_width = "32"))
    ))]
    test_atomic_int!(u64);
    #[cfg(any(
        portable_atomic_unsafe_atomic_builtins_16,
        not(any(
            target_pointer_width = "16",
            target_pointer_width = "32",
            target_pointer_width = "64"
        ))
    ))]
    test_atomic_int!(i128);
    #[cfg(any(
        portable_atomic_unsafe_atomic_builtins_16,
        not(any(
            target_pointer_width = "16",
            target_pointer_width = "32",
            target_pointer_width = "64"
        ))
    ))]
    test_atomic_int!(u128);
    test_atomic_int!(isize);
    test_atomic_int!(usize);
}

/*
RUSTFLAGS="--cfg portable_atomic_unsafe_atomic_builtins_16" ct -r --tests
*/
