macro_rules! atomic128 {
    ($atomic_type:ident, $int_type:ident, $atomic_max:ident, $atomic_min:ident) => {
        #[repr(C, align(16))]
        pub(crate) struct $atomic_type {
            v: core::cell::UnsafeCell<$int_type>,
        }

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by atomic intrinsics.
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
                is_lock_free()
            }
            #[inline]
            pub(crate) const fn is_always_lock_free() -> bool {
                is_always_lock_free()
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
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_load(self.v.get().cast::<u128>(), order) as $int_type }
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_store(self.v.get().cast::<u128>(), val as u128, order) }
            }

            #[inline]
            pub(crate) fn swap(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_swap(self.v.get().cast::<u128>(), val as u128, order) as $int_type }
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
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    match atomic_compare_exchange(
                        self.v.get().cast::<u128>(),
                        current as u128,
                        new as u128,
                        success,
                        failure,
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
                crate::utils::assert_compare_exchange_ordering(success, failure);
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    match atomic_compare_exchange_weak(
                        self.v.get().cast::<u128>(),
                        current as u128,
                        new as u128,
                        success,
                        failure,
                    ) {
                        Ok(v) => Ok(v as $int_type),
                        Err(v) => Err(v as $int_type),
                    }
                }
            }

            #[inline]
            pub(crate) fn fetch_add(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_add(self.v.get().cast::<u128>(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_sub(self.v.get().cast::<u128>(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_and(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_and(self.v.get().cast::<u128>(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_nand(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_nand(self.v.get().cast::<u128>(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_or(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_or(self.v.get().cast::<u128>(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_xor(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_xor(self.v.get().cast::<u128>(), val as u128, order) as $int_type }
            }

            #[inline]
            pub(crate) fn fetch_max(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { $atomic_max(self.v.get(), val, order) }
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { $atomic_min(self.v.get(), val, order) }
            }

            #[inline]
            pub(crate) fn fetch_not(&self, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_not(self.v.get().cast::<u128>(), order) as $int_type }
            }
            #[inline]
            pub(crate) fn not(&self, order: Ordering) {
                self.fetch_not(order);
            }

            #[inline]
            pub(crate) fn fetch_neg(&self, order: Ordering) -> $int_type {
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe { atomic_neg(self.v.get().cast::<u128>(), order) as $int_type }
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

#[cfg(any(
    all(
        target_arch = "aarch64",
        any(target_feature = "lse", portable_atomic_target_feature = "lse")
    ),
    target_arch = "s390x",
    target_arch = "x86_64",
))]
macro_rules! atomic_rmw_by_atomic_update {
    () => {
        #[inline]
        unsafe fn atomic_add(dst: *mut u128, val: u128, order: Ordering) -> u128 {
            // SAFETY: the caller must uphold the safety contract.
            unsafe { atomic_update(dst, order, |x| x.wrapping_add(val)) }
        }
        #[inline]
        unsafe fn atomic_sub(dst: *mut u128, val: u128, order: Ordering) -> u128 {
            // SAFETY: the caller must uphold the safety contract.
            unsafe { atomic_update(dst, order, |x| x.wrapping_sub(val)) }
        }
        #[inline]
        unsafe fn atomic_and(dst: *mut u128, val: u128, order: Ordering) -> u128 {
            // SAFETY: the caller must uphold the safety contract.
            unsafe { atomic_update(dst, order, |x| x & val) }
        }
        #[inline]
        unsafe fn atomic_nand(dst: *mut u128, val: u128, order: Ordering) -> u128 {
            // SAFETY: the caller must uphold the safety contract.
            unsafe { atomic_update(dst, order, |x| !(x & val)) }
        }
        #[inline]
        unsafe fn atomic_or(dst: *mut u128, val: u128, order: Ordering) -> u128 {
            // SAFETY: the caller must uphold the safety contract.
            unsafe { atomic_update(dst, order, |x| x | val) }
        }
        #[inline]
        unsafe fn atomic_xor(dst: *mut u128, val: u128, order: Ordering) -> u128 {
            // SAFETY: the caller must uphold the safety contract.
            unsafe { atomic_update(dst, order, |x| x ^ val) }
        }
        #[inline]
        unsafe fn atomic_not(dst: *mut u128, order: Ordering) -> u128 {
            // SAFETY: the caller must uphold the safety contract.
            unsafe { atomic_update(dst, order, |x| !x) }
        }
        #[inline]
        unsafe fn atomic_neg(dst: *mut u128, order: Ordering) -> u128 {
            // SAFETY: the caller must uphold the safety contract.
            unsafe { atomic_update(dst, order, u128::wrapping_neg) }
        }
        #[inline]
        unsafe fn atomic_max(dst: *mut i128, val: i128, order: Ordering) -> i128 {
            #[allow(clippy::cast_possible_wrap, clippy::cast_sign_loss)]
            // SAFETY: the caller must uphold the safety contract.
            unsafe {
                atomic_update(dst.cast::<u128>(), order, |x| core::cmp::max(x as i128, val) as u128)
                    as i128
            }
        }
        #[inline]
        unsafe fn atomic_umax(dst: *mut u128, val: u128, order: Ordering) -> u128 {
            // SAFETY: the caller must uphold the safety contract.
            unsafe { atomic_update(dst, order, |x| core::cmp::max(x, val)) }
        }
        #[inline]
        unsafe fn atomic_min(dst: *mut i128, val: i128, order: Ordering) -> i128 {
            #[allow(clippy::cast_possible_wrap, clippy::cast_sign_loss)]
            // SAFETY: the caller must uphold the safety contract.
            unsafe {
                atomic_update(dst.cast::<u128>(), order, |x| core::cmp::min(x as i128, val) as u128)
                    as i128
            }
        }
        #[inline]
        unsafe fn atomic_umin(dst: *mut u128, val: u128, order: Ordering) -> u128 {
            // SAFETY: the caller must uphold the safety contract.
            unsafe { atomic_update(dst, order, |x| core::cmp::min(x, val)) }
        }
    };
}
