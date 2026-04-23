// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
PSRAM-aware atomics for ESP32 / ESP32-S3.

These chips advertise native atomic CAS (Xtensa `S32C1I`) which works for
internal SRAM, but the instruction does NOT behave atomically on addresses
backed by the external data bus (PSRAM). Every operation therefore checks
the target address at runtime and dispatches to either
`core::sync::atomic::*` (fast path, when the atomic lives in internal
memory) or a critical section (when it lives in PSRAM).

Address ranges:
- ESP32:    0x3F80_0000..0x3FC0_0000
- ESP32-S3: 0x3C00_0000..0x3E00_0000

This module is selected in place of `src/imp/core_atomic.rs` by a `#[path]`
attribute in `src/imp/mod.rs`, so it exposes exactly the same public API.
*/

use core::{cell::UnsafeCell, marker::PhantomData, sync::atomic::Ordering};

// See `src/imp/core_atomic.rs` for why this marker is necessary — it
// prevents the `#[repr(transparent)]` wrapper below from inheriting
// `RefUnwindSafe` via the std atomic auto-impl, so that portable-atomic's
// public types carry `RefUnwindSafe` uniformly on every backend.
struct NotRefUnwindSafe(UnsafeCell<()>);
// SAFETY: marker type; the UnsafeCell value is never accessed.
unsafe impl Sync for NotRefUnwindSafe {}

// The external (PSRAM / data bus) address ranges that do not support
// atomic RMW instructions on these CPUs.

// https://documentation.espressif.com/esp32_technical_reference_manual_en.pdf, Table 3.3-4. External Memory Address Mapping
#[cfg(portable_atomic_target_cpu = "esp32")]
const PSRAM: core::ops::Range<usize> = 0x3F80_0000..0x3FC0_0000;

// https://documentation.espressif.com/esp32-s3_technical_reference_manual_en.pdf, Table 4.3-2. External Memory Address Mapping
#[cfg(portable_atomic_target_cpu = "esp32s3")]
const PSRAM: core::ops::Range<usize> = 0x3C00_0000..0x3E00_0000;

#[inline(always)]
fn in_psram<T>(ptr: *const T) -> bool {
    let addr = ptr as usize;
    addr >= PSRAM.start && addr < PSRAM.end
}

#[cfg(not(feature = "critical-section"))]
#[cold]
#[inline(never)]
#[track_caller]
fn psram_rmw_without_cs() -> ! {
    panic!(
        "portable-atomic: atomic read-modify-write on PSRAM requires the \
         `critical-section` feature on ESP32 / ESP32-S3"
    );
}

// Run an RMW closure either natively (addr in internal memory) or under a
// critical section (addr in PSRAM). When the `critical-section` feature is
// disabled, the PSRAM path panics.
//
// `$ptr` is the backing raw pointer; the CS-path closure is an
// `unsafe` block that uses `read_volatile`/`write_volatile` on it.
macro_rules! rmw {
    ($self:ident, $native:expr, |$ptr:ident| $cs:block) => {{
        let $ptr: *mut _ = $self.as_ptr();
        if in_psram($ptr) {
            #[cfg(feature = "critical-section")]
            {
                critical_section::with(|_cs| {
                    // SAFETY: inside a critical section, we have exclusive
                    // access to `$ptr` and the pointer is valid because
                    // we got it from `&self`. The accesses use volatile
                    // reads/writes and so are not reordered with respect
                    // to each other or with the CS entry/exit barriers.
                    unsafe { $cs }
                })
            }
            #[cfg(not(feature = "critical-section"))]
            {
                let _ = $ptr; // suppress unused warning for move-only closures
                psram_rmw_without_cs()
            }
        } else {
            $native
        }
    }};
}

// ---------------------------------------------------------------------------
// AtomicPtr

#[repr(transparent)]
pub(crate) struct AtomicPtr<T> {
    inner: core::sync::atomic::AtomicPtr<T>,
    _not_ref_unwind_safe: PhantomData<NotRefUnwindSafe>,
}
impl<T> AtomicPtr<T> {
    #[inline]
    pub(crate) const fn new(v: *mut T) -> Self {
        Self { inner: core::sync::atomic::AtomicPtr::new(v), _not_ref_unwind_safe: PhantomData }
    }
    #[inline]
    pub(crate) fn is_lock_free() -> bool {
        Self::IS_ALWAYS_LOCK_FREE
    }
    // Not lock-free: if the atomic happens to live in PSRAM, RMWs take a
    // critical section. We can only give a conservative compile-time answer.
    pub(crate) const IS_ALWAYS_LOCK_FREE: bool = false;

    #[inline]
    #[cfg_attr(any(debug_assertions, miri), track_caller)]
    pub(crate) fn load(&self, order: Ordering) -> *mut T {
        crate::utils::assert_load_ordering(order);
        self.inner.load(order)
    }
    #[inline]
    #[cfg_attr(any(debug_assertions, miri), track_caller)]
    pub(crate) fn store(&self, ptr: *mut T, order: Ordering) {
        crate::utils::assert_store_ordering(order);
        self.inner.store(ptr, order);
    }

    #[inline]
    #[cfg_attr(miri, track_caller)]
    pub(crate) fn swap(&self, ptr: *mut T, order: Ordering) -> *mut T {
        rmw!(self, self.inner.swap(ptr, order), |p| {
            let prev = core::ptr::read_volatile(p);
            core::ptr::write_volatile(p, ptr);
            prev
        })
    }

    #[inline]
    #[cfg_attr(any(debug_assertions, miri), track_caller)]
    pub(crate) fn compare_exchange(
        &self,
        current: *mut T,
        new: *mut T,
        success: Ordering,
        failure: Ordering,
    ) -> Result<*mut T, *mut T> {
        crate::utils::assert_compare_exchange_ordering(success, failure);
        rmw!(self, self.inner.compare_exchange(current, new, success, failure), |p| {
            let prev = core::ptr::read_volatile(p);
            if prev == current {
                core::ptr::write_volatile(p, new);
                Ok(prev)
            } else {
                Err(prev)
            }
        })
    }
    #[inline]
    #[cfg_attr(any(debug_assertions, miri), track_caller)]
    pub(crate) fn compare_exchange_weak(
        &self,
        current: *mut T,
        new: *mut T,
        success: Ordering,
        failure: Ordering,
    ) -> Result<*mut T, *mut T> {
        crate::utils::assert_compare_exchange_ordering(success, failure);
        rmw!(self, self.inner.compare_exchange_weak(current, new, success, failure), |p| {
            let prev = core::ptr::read_volatile(p);
            if prev == current {
                core::ptr::write_volatile(p, new);
                Ok(prev)
            } else {
                Err(prev)
            }
        })
    }

    #[inline]
    #[cfg_attr(miri, track_caller)]
    pub(crate) fn fetch_byte_add(&self, val: usize, order: Ordering) -> *mut T {
        #[cfg(portable_atomic_no_strict_provenance)]
        use crate::utils::ptr::PtrExt as _;
        rmw!(
            self,
            {
                #[cfg(not(portable_atomic_no_strict_provenance_atomic_ptr))]
                {
                    self.inner.fetch_byte_add(val, order)
                }
                #[cfg(portable_atomic_no_strict_provenance_atomic_ptr)]
                {
                    crate::utils::ptr::with_exposed_provenance_mut(
                        self.as_atomic_usize().fetch_add(val, order),
                    )
                }
            },
            |p| {
                let prev = core::ptr::read_volatile(p);
                let next = prev.with_addr(prev.addr().wrapping_add(val));
                core::ptr::write_volatile(p, next);
                prev
            }
        )
    }
    #[inline]
    #[cfg_attr(miri, track_caller)]
    pub(crate) fn fetch_byte_sub(&self, val: usize, order: Ordering) -> *mut T {
        #[cfg(portable_atomic_no_strict_provenance)]
        use crate::utils::ptr::PtrExt as _;
        rmw!(
            self,
            {
                #[cfg(not(portable_atomic_no_strict_provenance_atomic_ptr))]
                {
                    self.inner.fetch_byte_sub(val, order)
                }
                #[cfg(portable_atomic_no_strict_provenance_atomic_ptr)]
                {
                    crate::utils::ptr::with_exposed_provenance_mut(
                        self.as_atomic_usize().fetch_sub(val, order),
                    )
                }
            },
            |p| {
                let prev = core::ptr::read_volatile(p);
                let next = prev.with_addr(prev.addr().wrapping_sub(val));
                core::ptr::write_volatile(p, next);
                prev
            }
        )
    }
    #[inline]
    #[cfg_attr(miri, track_caller)]
    pub(crate) fn fetch_or(&self, val: usize, order: Ordering) -> *mut T {
        #[cfg(portable_atomic_no_strict_provenance)]
        use crate::utils::ptr::PtrExt as _;
        rmw!(
            self,
            {
                #[cfg(not(portable_atomic_no_strict_provenance_atomic_ptr))]
                {
                    self.inner.fetch_or(val, order)
                }
                #[cfg(portable_atomic_no_strict_provenance_atomic_ptr)]
                {
                    crate::utils::ptr::with_exposed_provenance_mut(
                        self.as_atomic_usize().fetch_or(val, order),
                    )
                }
            },
            |p| {
                let prev = core::ptr::read_volatile(p);
                let next = prev.with_addr(prev.addr() | val);
                core::ptr::write_volatile(p, next);
                prev
            }
        )
    }
    #[inline]
    #[cfg_attr(miri, track_caller)]
    pub(crate) fn fetch_and(&self, val: usize, order: Ordering) -> *mut T {
        #[cfg(portable_atomic_no_strict_provenance)]
        use crate::utils::ptr::PtrExt as _;
        rmw!(
            self,
            {
                #[cfg(not(portable_atomic_no_strict_provenance_atomic_ptr))]
                {
                    self.inner.fetch_and(val, order)
                }
                #[cfg(portable_atomic_no_strict_provenance_atomic_ptr)]
                {
                    crate::utils::ptr::with_exposed_provenance_mut(
                        self.as_atomic_usize().fetch_and(val, order),
                    )
                }
            },
            |p| {
                let prev = core::ptr::read_volatile(p);
                let next = prev.with_addr(prev.addr() & val);
                core::ptr::write_volatile(p, next);
                prev
            }
        )
    }
    #[inline]
    #[cfg_attr(miri, track_caller)]
    pub(crate) fn fetch_xor(&self, val: usize, order: Ordering) -> *mut T {
        #[cfg(portable_atomic_no_strict_provenance)]
        use crate::utils::ptr::PtrExt as _;
        rmw!(
            self,
            {
                #[cfg(not(portable_atomic_no_strict_provenance_atomic_ptr))]
                {
                    self.inner.fetch_xor(val, order)
                }
                #[cfg(portable_atomic_no_strict_provenance_atomic_ptr)]
                {
                    crate::utils::ptr::with_exposed_provenance_mut(
                        self.as_atomic_usize().fetch_xor(val, order),
                    )
                }
            },
            |p| {
                let prev = core::ptr::read_volatile(p);
                let next = prev.with_addr(prev.addr() ^ val);
                core::ptr::write_volatile(p, next);
                prev
            }
        )
    }

    #[cfg(portable_atomic_no_strict_provenance_atomic_ptr)]
    #[inline(always)]
    fn as_atomic_usize(&self) -> &AtomicUsize {
        static_assert!(
            core::mem::size_of::<AtomicPtr<()>>() == core::mem::size_of::<AtomicUsize>()
        );
        static_assert!(
            core::mem::align_of::<AtomicPtr<()>>() == core::mem::align_of::<AtomicUsize>()
        );
        // SAFETY: AtomicPtr and AtomicUsize have the same layout, and both
        // route through the same PSRAM dispatch above.
        unsafe { &*(self as *const Self as *const AtomicUsize) }
    }

    #[inline]
    pub(crate) const fn as_ptr(&self) -> *mut *mut T {
        // SAFETY: Self is #[repr(transparent)] and internally
        // UnsafeCell<*mut T>. See also the equivalent trick in
        // src/imp/core_atomic.rs.
        unsafe { (*(self as *const Self as *const UnsafeCell<*mut T>)).get() }
    }
}
impl_default_bit_opts!(AtomicPtr, usize);

// ---------------------------------------------------------------------------
// AtomicInt

macro_rules! atomic_int {
    ($atomic_type:ident, $int_type:ident, $align:literal) => {
        #[repr(transparent)]
        pub(crate) struct $atomic_type {
            inner: core::sync::atomic::$atomic_type,
            _not_ref_unwind_safe: PhantomData<NotRefUnwindSafe>,
        }
        impl $atomic_type {
            #[inline]
            pub(crate) const fn new(v: $int_type) -> Self {
                Self {
                    inner: core::sync::atomic::$atomic_type::new(v),
                    _not_ref_unwind_safe: PhantomData,
                }
            }
            #[inline]
            pub(crate) fn is_lock_free() -> bool {
                Self::IS_ALWAYS_LOCK_FREE
            }
            // We cannot promise lock-freedom without knowing the address
            // at compile time; RMWs on PSRAM take a critical section.
            pub(crate) const IS_ALWAYS_LOCK_FREE: bool = false;

            #[inline]
            #[cfg_attr(any(debug_assertions, miri), track_caller)]
            pub(crate) fn load(&self, order: Ordering) -> $int_type {
                crate::utils::assert_load_ordering(order);
                self.inner.load(order)
            }
            #[inline]
            #[cfg_attr(any(debug_assertions, miri), track_caller)]
            pub(crate) fn store(&self, val: $int_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                self.inner.store(val, order);
            }

            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn swap(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, self.inner.swap(val, order), |p| {
                    let prev = core::ptr::read_volatile(p);
                    core::ptr::write_volatile(p, val);
                    prev
                })
            }

            #[inline]
            #[cfg_attr(any(debug_assertions, miri), track_caller)]
            pub(crate) fn compare_exchange(
                &self,
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                crate::utils::assert_compare_exchange_ordering(success, failure);
                rmw!(self, self.inner.compare_exchange(current, new, success, failure), |p| {
                    let prev = core::ptr::read_volatile(p);
                    if prev == current {
                        core::ptr::write_volatile(p, new);
                        Ok(prev)
                    } else {
                        Err(prev)
                    }
                })
            }
            #[inline]
            #[cfg_attr(any(debug_assertions, miri), track_caller)]
            pub(crate) fn compare_exchange_weak(
                &self,
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                crate::utils::assert_compare_exchange_ordering(success, failure);
                rmw!(self, self.inner.compare_exchange_weak(current, new, success, failure), |p| {
                    let prev = core::ptr::read_volatile(p);
                    if prev == current {
                        core::ptr::write_volatile(p, new);
                        Ok(prev)
                    } else {
                        Err(prev)
                    }
                })
            }

            #[allow(dead_code)]
            #[inline]
            #[cfg_attr(miri, track_caller)]
            fn fetch_update_<F>(&self, order: Ordering, mut f: F) -> $int_type
            where
                F: FnMut($int_type) -> $int_type,
            {
                let mut prev = self.load(Ordering::Relaxed);
                loop {
                    let next = f(prev);
                    match self.compare_exchange_weak(prev, next, order, Ordering::Relaxed) {
                        Ok(x) => return x,
                        Err(next_prev) => prev = next_prev,
                    }
                }
            }

            // Arithmetic RMWs ------------------------------------------------
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_add(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, self.inner.fetch_add(val, order), |p| {
                    let prev = core::ptr::read_volatile(p);
                    core::ptr::write_volatile(p, prev.wrapping_add(val));
                    prev
                })
            }
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_sub(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, self.inner.fetch_sub(val, order), |p| {
                    let prev = core::ptr::read_volatile(p);
                    core::ptr::write_volatile(p, prev.wrapping_sub(val));
                    prev
                })
            }

            // Bitwise RMWs ---------------------------------------------------
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_and(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, self.inner.fetch_and(val, order), |p| {
                    let prev = core::ptr::read_volatile(p);
                    core::ptr::write_volatile(p, prev & val);
                    prev
                })
            }
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_nand(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, self.inner.fetch_nand(val, order), |p| {
                    let prev = core::ptr::read_volatile(p);
                    core::ptr::write_volatile(p, !(prev & val));
                    prev
                })
            }
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_or(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, self.inner.fetch_or(val, order), |p| {
                    let prev = core::ptr::read_volatile(p);
                    core::ptr::write_volatile(p, prev | val);
                    prev
                })
            }
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_xor(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, self.inner.fetch_xor(val, order), |p| {
                    let prev = core::ptr::read_volatile(p);
                    core::ptr::write_volatile(p, prev ^ val);
                    prev
                })
            }

            // fetch_max / fetch_min -----------------------------------------
            //
            // The PSRAM arm performs the whole read-compute-write inside a
            // single critical section. std's native min/max atomics are
            // always available on xtensa (stabilized in 1.45; xtensa MSRV
            // is 1.81+).
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_max(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, self.inner.fetch_max(val, order), |p| {
                    let prev = core::ptr::read_volatile(p);
                    core::ptr::write_volatile(p, core::cmp::max(prev, val));
                    prev
                })
            }
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
                rmw!(self, self.inner.fetch_min(val, order), |p| {
                    let prev = core::ptr::read_volatile(p);
                    core::ptr::write_volatile(p, core::cmp::min(prev, val));
                    prev
                })
            }

            // Unary RMWs ----------------------------------------------------
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_not(&self, order: Ordering) -> $int_type {
                self.fetch_xor(!0, order)
            }
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn fetch_neg(&self, order: Ordering) -> $int_type {
                // `core::sync::atomic::*` has no native fetch_neg, so the
                // SRAM path is a CAS loop. The PSRAM path does the negate
                // inside a single critical section.
                rmw!(self, self.fetch_update_(order, $int_type::wrapping_neg), |p| {
                    let prev = core::ptr::read_volatile(p);
                    core::ptr::write_volatile(p, prev.wrapping_neg());
                    prev
                })
            }
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn not(&self, order: Ordering) {
                self.fetch_not(order);
            }
            #[inline]
            #[cfg_attr(miri, track_caller)]
            pub(crate) fn neg(&self, order: Ordering) {
                self.fetch_neg(order);
            }

            #[inline]
            pub(crate) const fn as_ptr(&self) -> *mut $int_type {
                // SAFETY: Self is #[repr(transparent)] and internally
                // UnsafeCell<$int_type>.
                unsafe { (*(self as *const Self as *const UnsafeCell<$int_type>)).get() }
            }
        }
        impl_default_no_fetch_ops!($atomic_type, $int_type);
        impl_default_bit_opts!($atomic_type, $int_type);

        // Force the requested alignment just like `core::sync::atomic::*`.
        // #[repr(transparent)] inherits the inner alignment; the asserts
        // document the expected layout.
        #[allow(dead_code)]
        const _: () = {
            if core::mem::align_of::<$atomic_type>() < $align {
                panic!(concat!(stringify!($atomic_type), " has smaller alignment than expected"));
            }
        };
    };
}

atomic_int!(AtomicIsize, isize, 4);
atomic_int!(AtomicUsize, usize, 4);
atomic_int!(AtomicI8, i8, 1);
atomic_int!(AtomicU8, u8, 1);
atomic_int!(AtomicI16, i16, 2);
atomic_int!(AtomicU16, u16, 2);
atomic_int!(AtomicI32, i32, 4);
atomic_int!(AtomicU32, u32, 4);

// espidf Xtensa targets expose 64-bit atomics via libatomic; wrap those too.
// On bare-metal xtensa targets `target_has_atomic = "64"` is false and these
// types are not emitted. `cfg(target_has_atomic = ...)` stabilized in Rust
// 1.60; xtensa MSRV is 1.81+ so `portable_atomic_no_cfg_target_has_atomic`
// is never set in this module.
#[cfg(any(
    target_has_atomic = "64",
    not(any(target_pointer_width = "16", target_pointer_width = "32")),
))]
items!({
    atomic_int!(AtomicI64, i64, 8);
    atomic_int!(AtomicU64, u64, 8);
});
