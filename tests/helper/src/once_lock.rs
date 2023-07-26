// Based on std::sync::OnceLock.
// Note that we cannot use once_cell crate due to its MSRV (we run tests on Rust 1.56).

use std::{cell::UnsafeCell, mem::MaybeUninit, sync::Once};

pub struct OnceLock<T> {
    once: Once,
    value: UnsafeCell<MaybeUninit<T>>,
    // Unlike std::sync::OnceLock, we don't need PhantomData here because
    // we don't use #[may_dangle].
}

unsafe impl<T: Sync + Send> Sync for OnceLock<T> {}

impl<T> OnceLock<T> {
    #[must_use]
    pub const fn new() -> Self {
        Self { once: Once::new(), value: UnsafeCell::new(MaybeUninit::uninit()) }
    }

    pub fn get_or_init<F>(&self, f: F) -> &T
    where
        F: FnOnce() -> T,
    {
        if !self.once.is_completed() {
            self.once.call_once(|| {
                let value = f();
                unsafe {
                    self.value.get().cast::<T>().write(value);
                }
            });
        }
        // SAFETY: The inner value has been initialized
        unsafe { &*self.value.get().cast::<T>() }
    }
}

impl<T> Drop for OnceLock<T> {
    fn drop(&mut self) {
        if self.once.is_completed() {
            // SAFETY: The inner value has been initialized
            unsafe { self.value.get().cast::<T>().drop_in_place() };
        }
    }
}
