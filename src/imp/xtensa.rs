//! Implementations for Xtensa CPUs that have atomic CAS, but also have an address range where it is not working properly.
//!
//! For these CPUs rustc may, but should not provide atomic access unconditionally. portable-atomic generates code which selects
//! the appropriate implementation based on the address of the atomic variable.
#![allow(unreachable_code)]
use core::{arch::asm, ops::Range, sync::atomic::Ordering};

// https://documentation.espressif.com/esp32_technical_reference_manual_en.pdf, Table 3.3-4. External Memory Address Mapping
#[cfg(portable_atomic_target_cpu = "esp32")]
const EXTERNAL_DATA_BUS_ADDRESS_RANGE: Range<usize> = 0x3F80_0000..0x3FC0_0000;

// https://documentation.espressif.com/esp32-s3_technical_reference_manual_en.pdf, Table 4.3-2. External Memory Address Mapping
#[cfg(portable_atomic_target_cpu = "esp32s3")]
const EXTERNAL_DATA_BUS_ADDRESS_RANGE: Range<usize> = 0x3C00_0000..0x3E00_0000;

macro_rules! dispatch_impl {
    ($self:expr, $atomic:expr, $fallback:expr) => {
        {
            let addr = $self.as_ptr() as usize;
            if addr >= EXTERNAL_DATA_BUS_ADDRESS_RANGE.start && addr < EXTERNAL_DATA_BUS_ADDRESS_RANGE.end {
                return $fallback;
            } else {
                return $atomic;
            }
        }
    };
}

items!({
    macro_rules! atomic {
        (base, $([$($generics:tt)*])? $atomic_type:ident, $value_type:ty, $int_type:ty, $size:tt) => {
            #[repr(transparent)]
            pub(crate) struct $atomic_type $(<$($generics)*>)? {
                v: crate::imp::interrupt::$atomic_type $(<$($generics)*>)?,
            }

            impl_default_bit_opts!($atomic_type, $int_type);

            // Send is implicitly implemented for atomic integers, but not for atomic pointers.
            // SAFETY: any data races are prevented by atomic operations.
            unsafe impl $(<$($generics)*>)? Send for $atomic_type $(<$($generics)*>)? {}
            // SAFETY: any data races are prevented by atomic operations.
            unsafe impl $(<$($generics)*>)? Sync for $atomic_type $(<$($generics)*>)? {}

            impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
                #[inline]
                pub(crate) const fn new(v: $value_type) -> Self {
                    Self { v: crate::imp::interrupt::$atomic_type::new(v) }
                }

                #[inline]
                pub(crate) const fn as_ptr(&self) -> *mut $value_type {
                    self.v.as_ptr()
                }

                #[inline]
                pub(crate) fn is_lock_free() -> bool {
                    <crate::imp::interrupt::$atomic_type$(<$($generics)*>)?>::is_lock_free()
                }
                pub(crate) const IS_ALWAYS_LOCK_FREE: bool = <crate::imp::interrupt::$atomic_type$(<$($generics)*>)?>::IS_ALWAYS_LOCK_FREE;

                #[inline]
                pub(crate) fn swap(&self, val: $value_type, order: Ordering) -> $value_type {
                    dispatch_impl!(self,
                        unsafe { <$value_type>::atomic_swap(self.v.as_ptr(), val, order) },
                        self.v.swap(val, order)
                    )
                }

                #[inline]
                pub(crate) fn compare_exchange(
                    &self,
                    current: $value_type,
                    new: $value_type,
                    success: Ordering,
                    failure: Ordering,
                ) -> Result<$value_type, $value_type> {
                    dispatch_impl!(self,
                        to_result(unsafe { <$value_type>::atomic_compare_exchange(self.v.as_ptr(), current, new, success, failure) }),
                        self.v.compare_exchange(current, new, success, failure)
                    )
                }

                #[inline]
                pub(crate) fn compare_exchange_weak(
                    &self,
                    current: $value_type,
                    new: $value_type,
                    success: Ordering,
                    failure: Ordering,
                ) -> Result<$value_type, $value_type> {
                    dispatch_impl!(self,
                        to_result(unsafe { <$value_type>::atomic_compare_exchange_weak(self.v.as_ptr(), current, new, success, failure) }),
                        self.v.compare_exchange_weak(current, new, success, failure)
                    )
                }
            }
        };
        (load_store, $([$($generics:tt)*])? $atomic_type:ident, $value_type:ty, $int_type:ty, $size:tt) => {
            atomic!(base, $([$($generics)*])? $atomic_type, $value_type, $int_type, $size);
            impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
                #[inline]
                #[cfg_attr(
                    all(debug_assertions, not(portable_atomic_no_track_caller)),
                    track_caller
                )]
                pub(crate) fn load(&self, order: Ordering) -> $value_type {
                    dispatch_impl!(self,
                        unsafe { <$value_type>::atomic_load(self.v.as_ptr(), order) },
                        self.v.load(order)
                    )
                }

                #[inline]
                #[cfg_attr(
                    all(debug_assertions, not(portable_atomic_no_track_caller)),
                    track_caller
                )]
                pub(crate) fn store(&self, val: $value_type, order: Ordering) {
                    dispatch_impl!(self,
                        unsafe { <$value_type>::atomic_store(self.v.as_ptr(), val, order) },
                        self.v.store(val, order)
                    )
                }
            }
        };
        (boolean, $([$($generics:tt)*])? $atomic_type:ident, $value_type:ty, $int_type:ty, $size:tt) => {
            atomic!(load_store, $([$($generics)*])? $atomic_type, $value_type, $int_type, $size);
            impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
                #[inline]
                pub(crate) fn and(&self, val: $int_type, order: Ordering) {
                    self.fetch_and(val, order);
                }

                #[inline]
                pub(crate) fn or(&self, val: $int_type, order: Ordering) {
                    self.fetch_or(val, order);
                }

                #[inline]
                pub(crate) fn xor(&self, val: $int_type, order: Ordering) {
                    self.fetch_xor(val, order);
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
                pub(crate) fn fetch_and(&self, _val: $int_type, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_or(&self, _val: $int_type, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_xor(&self, _val: $int_type, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_not(&self, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_neg(&self, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_nor(&self, _val: $int_type, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_nand(&self, _val: $int_type, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_min(&self, _val: $int_type, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_max(&self, _val: $int_type, _order: Ordering) -> $value_type {
                    loop {}
                }
            }
        };
        (ptr, $([$($generics:tt)*])? $atomic_type:ident, $value_type:ty, $int_type:ty, $size:tt) => {
            atomic!(boolean, $([$($generics)*])? $atomic_type, $value_type, $int_type, $size);
            impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
                #[inline]
                pub(crate) fn fetch_byte_sub(&self, _val: usize, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_byte_add(&self, _val: usize, _order: Ordering) -> $value_type {
                    loop {}
                }
            }
        };
        ($([$($generics:tt)*])? $atomic_type:ident, $value_type:ty, $int_type:ty, $size:tt) => {
            atomic!(boolean, $([$($generics)*])? $atomic_type, $value_type, $int_type, $size);
            impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
                #[inline]
                pub(crate) fn add(&self, val: $value_type, order: Ordering) {
                    self.fetch_add(val, order);
                }

                #[inline]
                pub(crate) fn sub(&self, val: $value_type, order: Ordering) {
                    self.fetch_sub(val, order);
                }

                #[inline]
                pub(crate) fn fetch_sub(&self, _val: $value_type, _order: Ordering) -> $value_type {
                    loop {}
                }

                #[inline]
                pub(crate) fn fetch_add(&self, _val: $value_type, _order: Ordering) -> $value_type {
                    loop {}
                }
            }
        };
    }

    atomic!(AtomicI8, i8, i8, "b");
    atomic!(AtomicU8, u8, u8, "b");
    atomic!(AtomicI16, i16, i16, "h");
    atomic!(AtomicU16, u16, u16, "h");
    atomic!(AtomicI32, i32, i32, "w");
    atomic!(AtomicU32, u32, u32, "w");
    atomic!(AtomicIsize, isize, isize, "w");
    atomic!(AtomicUsize, usize, usize, "w");
    atomic!(ptr, [T] AtomicPtr, *mut T, usize, "w");
});

#[cfg(feature = "fallback")]
items!({
    pub(crate) use crate::imp::interrupt::{AtomicI64, AtomicU64};
});

macro_rules! atomic_asm_rmw {
    ($op:ident, $order:ident) => {
        match $order {
            Ordering::Relaxed => $op!("", ""),
            Ordering::Acquire => $op!("memw", ""),
            Ordering::Release => $op!("", "memw"),
            Ordering::AcqRel | Ordering::SeqCst => $op!("memw", "memw"),
            _ => unreachable!(),
        }
    };
}

#[rustfmt::skip]
macro_rules! atomic_asm_load_store {
    (($($ty:tt)*), $bits:tt, $narrow:tt, $unsigned:tt $(, [$generic:ident])?) => {
        delegate_signed!(delegate_all, $($ty)*);
        impl$(<$generic>)? AtomicLoad for $($ty)* {
            #[inline]
            unsafe fn atomic_load(
                src: *const Self,
                order: Ordering,
            ) -> Self {
                let out: Self;

                // SAFETY: the caller must uphold the safety contract.
                unsafe {
                    macro_rules! atomic_load {
                        ($acquire:tt) => {
                            asm!(
                                concat!("l", $bits, $unsigned, "i", $narrow, " {out}, {src}, 0"), // atomic { out = *src }
                                $acquire,                                                         // fence
                                src = in(reg) ptr_reg!(src),
                                out = lateout(reg) out,
                                options(nostack, preserves_flags),
                            )
                        };
                    }
                    match order {
                        Ordering::Relaxed => atomic_load!(""),
                        Ordering::Acquire | Ordering::SeqCst => atomic_load!("memw"),
                        _ => unreachable!(),
                    }
                }
                out
            }
        }
        impl$(<$generic>)? AtomicStore for $($ty)* {
            #[inline]
            unsafe fn atomic_store(
                dst: *mut Self,
                val: Self,
                order: Ordering,
            ) {
                // SAFETY: the caller must uphold the safety contract.
                unsafe {
                    macro_rules! store {
                        ($acquire:tt, $release:tt) => {
                            asm!(
                                $release,                                              // fence
                                concat!("s", $bits, "i", $narrow, " {val}, {dst}, 0"), // atomic { *dst = val }
                                $acquire,                                              // fence
                                dst = in(reg) ptr_reg!(dst),
                                val = in(reg) val,
                                options(nostack, preserves_flags),
                            )
                        };
                    }
                    atomic_asm_rmw!(store, order);
                }
            }
        }
    };
}

trait AtomicLoad: Sized {
    unsafe fn atomic_load(
        src: *const Self,
        order: Ordering,
    ) -> Self;
}

trait AtomicStore: Sized {
    unsafe fn atomic_store(
        dst: *mut Self,
        val: Self,
        order: Ordering,
    );
}

trait AtomicSwap: Sized {
    unsafe fn atomic_swap(
        dst: *mut Self,
        val: Self,
        order: Ordering,
    ) -> Self;
}

trait AtomicCompareExchange: Sized {
    unsafe fn atomic_compare_exchange(
        dst: *mut Self,
        expected: Self,
        desired: Self,
        success: Ordering,
        failure: Ordering,
    ) -> (Self, bool);

    #[inline]
    unsafe fn atomic_compare_exchange_weak(
        dst: *mut Self,
        current: Self,
        new: Self,
        success: Ordering,
        failure: Ordering,
    ) -> (Self, bool) {
        // SAFETY: the caller must uphold the safety contract.
        unsafe { Self::atomic_compare_exchange(dst, current, new, success, failure) }
    }
}

#[rustfmt::skip]
macro_rules! atomic_asm {
    (($($ty:tt)*) $(, [$generic:ident])?) => {
        atomic_asm_load_store!(($($ty)*), "32", ".n", "" $(, [$generic])? );

        impl$(<$generic>)? AtomicSwap for $($ty)* {
            #[inline]
            unsafe fn atomic_swap(
                dst: *mut Self,
                val: Self,
                order: Ordering,
            ) -> Self {
                let mut out: Self;

                // SAFETY: the caller must uphold the safety contract.
                unsafe {
                    macro_rules! swap {
                        ($acquire:tt, $release:tt) => {
                            asm!(
                                $release,                     // fence
                                "l32i.n {out}, {dst}, 0",     // atomic { out = *dst }
                                "2:", // 'retry:
                                    "mov.n {tmp}, {out}",     // tmp = out
                                    "wsr {tmp}, scompare1",   // scompare1 = tmp
                                    "mov.n {out}, {val}",     // out = val
                                    "s32c1i {out}, {dst}, 0", // atomic { _x = *dst; if _x == scompare1 { *dst = out }; out = _x }
                                    "bne {tmp}, {out}, 2b",   // if tmp != out { jump 'retry }
                                $acquire,                     // fence
                                dst = in(reg) ptr_reg!(dst),
                                val = in(reg) val,
                                out = out(reg) out,
                                tmp = out(reg) _,
                                out("scompare1") _,
                                options(nostack, preserves_flags),
                            )
                        };
                    }
                    atomic_asm_rmw!(swap, order);
                }
                out
            }
        }

        impl$(<$generic>)? AtomicCompareExchange for $($ty)* {
            #[inline]
            unsafe fn atomic_compare_exchange(
                dst: *mut Self,
                old: Self,
                new: Self,
                success: Ordering,
                failure: Ordering,
            ) -> (Self, bool) {
                let order = crate::utils::upgrade_success_ordering(success, failure);
                let out: Self;

                // SAFETY: the caller must uphold the safety contract.
                unsafe {
                    let mut r: u32 = 1;
                    macro_rules! cmpxchg {
                        ($acquire:tt, $release:tt) => {
                            asm!(
                                $release,                 // fence
                                "wsr {old}, scompare1",   // scompare1 = old
                                "s32c1i {out}, {dst}, 0", // atomic { _x = *dst; if _x == scompare1 { *dst = out }; out = _x }
                                $acquire,                 // fence
                                "beq {old}, {out}, 2f",   // if old == out { jump 'success }
                                "movi {r}, 0",            // r = 0
                                "2:", // 'success:
                                dst = in(reg) ptr_reg!(dst),
                                old = in(reg) old,
                                out = inout(reg) new => out,
                                r = inout(reg) r,
                                out("scompare1") _,
                                options(nostack, preserves_flags),
                            )
                        };
                    }
                    atomic_asm_rmw!(cmpxchg, order);
                    crate::utils::assert_unchecked(r == 0 || r == 1); // may help remove extra test
                    (out, r != 0)
                }
            }
        }
    };
}

#[rustfmt::skip]
macro_rules! atomic_asm_sub_word {
    (($($ty:tt)*), $bits:tt) => {
        atomic_asm_load_store!(($($ty)*), $bits, "", "u");

        impl AtomicSwap for $($ty)* {
            #[inline]
            unsafe fn atomic_swap(
                dst: *mut Self,
                val: Self,
                order: Ordering,
            ) -> Self {
                let (dst, shift, mask) = crate::utils::create_sub_word_mask_values(dst);
                let mut out: Self;

                // SAFETY: the caller must uphold the safety contract.
                unsafe {
                    macro_rules! swap {
                        ($acquire:tt, $release:tt) => {
                            // Implement sub-word atomic operations using word-sized CAS loop.
                            // See also create_sub_word_mask_values.
                            asm!(
                                "ssl {shift}",                  // sar = for_sll(shift & 31)
                                "sll {mask}, {mask}",           // mask <<= sar
                                "sll {val}, {val}",             // val <<= sar
                                $release,                       // fence
                                "l32i.n {out}, {dst}, 0",       // atomic { out = *dst }
                                "2:", // 'retry:
                                    "mov.n {tmp}, {out}",       // tmp = out
                                    "wsr {tmp}, scompare1",     // scompare1 = tmp
                                    "xor {out}, {tmp}, {val}",  // out = tmp ^ val
                                    "and {out}, {out}, {mask}", // out &= mask
                                    "xor {out}, {out}, {tmp}",  // out ^= out
                                    "s32c1i {out}, {dst}, 0",   // atomic { _x = *dst; if _x == scompare1 { *dst = out }; out = _x }
                                    "bne {tmp}, {out}, 2b",     // if tmp != out { jump 'retry }
                                "ssr {shift}",                  // sar = for_srl(shift & 31)
                                "srl {out}, {out}",             // out >>= sar
                                $acquire,                       // fence
                                dst = in(reg) ptr_reg!(dst),
                                val = inout(reg) val as u32 => _,
                                out = out(reg) out,
                                shift = in(reg) shift,
                                mask = inout(reg) mask => _,
                                tmp = out(reg) _,
                                out("scompare1") _,
                                out("sar") _,
                                options(nostack, preserves_flags),
                            )
                        };
                    }
                    atomic_asm_rmw!(swap, order);
                }
                out
            }
        }

        impl AtomicCompareExchange for $($ty)* {
            #[inline]
            unsafe fn atomic_compare_exchange(
                dst: *mut Self,
                old: Self,
                new: Self,
                success: Ordering,
                failure: Ordering,
            ) -> (Self, bool) {
                let order = crate::utils::upgrade_success_ordering(success, failure);
                let (dst, shift, mask) = crate::utils::create_sub_word_mask_values(dst);
                let mut out: Self;

                // SAFETY: the caller must uphold the safety contract.
                unsafe {
                    let mut r: u32 = 0;
                    macro_rules! cmpxchg {
                        ($acquire:tt, $release:tt) => {
                            // Implement sub-word atomic operations using word-sized CAS loop.
                            // See also create_sub_word_mask_values.
                            asm!(
                                "ssl {shift}",                  // sar = for_sll(shift & 31)
                                "sll {mask}, {mask}",           // mask <<= sar
                                "sll {old}, {old}",             // old <<= sar
                                "sll {new}, {new}",             // new <<= sar
                                $release,                       // fence
                                "l32i.n {out}, {dst}, 0",       // atomic { out = *dst }
                                "2:", // 'retry:
                                    "and {tmp}, {out}, {mask}", // tmp = out & mask
                                    "bne {tmp}, {old}, 3f",     // if tmp != old { jump 'cmp-fail }
                                    "mov.n {tmp}, {out}",       // tmp = out
                                    "wsr {tmp}, scompare1",     // scompare1 = tmp
                                    "xor {out}, {tmp}, {new}",  // out = tmp ^ new
                                    "and {out}, {out}, {mask}", // out &= mask
                                    "xor {out}, {out}, {tmp}",  // out ^= tmp
                                    "s32c1i {out}, {dst}, 0",   // atomic { _x = *dst; if _x == scompare1 { *dst = out }; out = _x }
                                    "bne {tmp}, {out}, 2b",     // if tmp != out { jump 'retry }
                                    "movi {r}, 1",              // r = 1
                                "3:", // 'cmp-fail:
                                "ssr {shift}",                  // sar = for_srl(shift & 31)
                                "srl {out}, {out}",             // out >>= sar
                                $acquire,                       // fence
                                dst = in(reg) ptr_reg!(dst),
                                old = inout(reg) old as u32 => _,
                                new = inout(reg) new as u32 => _,
                                out = out(reg) out,
                                shift = in(reg) shift,
                                mask = inout(reg) mask => _,
                                tmp = out(reg) _,
                                r = inout(reg) r,
                                out("scompare1") _,
                                out("sar") _,
                                options(nostack, preserves_flags),
                            )
                        };
                    }
                    atomic_asm_rmw!(cmpxchg, order);
                    crate::utils::assert_unchecked(r == 0 || r == 1); // may help remove extra test
                    (out, r != 0)
                }
            }
        }
    };
}


macro_rules! delegate_load_store {
    ($ty:ty, $base:ident $(, [$generic:ident])?) => {
        const _: () = {
            use core::mem;
            assert!(mem::size_of::<$ty>() == mem::size_of::<$base>());
            assert!(mem::align_of::<$ty>() == mem::align_of::<$base>());
        };
        impl$(<$generic>)? AtomicLoad for $ty {
            #[inline]
            unsafe fn atomic_load(
                src: *const Self,
                order: Ordering,
            ) -> Self {
                // SAFETY: the caller must uphold the safety contract.
                // cast and transmute are okay because $ty and $base implement the same layout.
                unsafe {
                    <$base as AtomicLoad>::atomic_load(src.cast::<$base>(), order) as Self
                }
            }
        }
        impl$(<$generic>)? AtomicStore for $ty {
            #[inline]
            unsafe fn atomic_store(
                dst: *mut Self,
                val: Self,
                order: Ordering,
            ) {
                // SAFETY: the caller must uphold the safety contract.
                // cast and transmute are okay because $ty and $base implement the same layout.
                unsafe {
                    <$base as AtomicStore>::atomic_store(
                        dst.cast::<$base>(),
                        val as $base,
                        order,
                    );
                }
            }
        }
    };
}
#[allow(unused_macros)]
macro_rules! delegate_swap {
    ($ty:ty, $base:ident $(, [$generic:ident])?) => {
        const _: () = {
            use core::mem;
            assert!(mem::size_of::<$ty>() == mem::size_of::<$base>());
            assert!(mem::align_of::<$ty>() == mem::align_of::<$base>());
        };
        impl$(<$generic:ty>)? AtomicSwap for $ty {
            #[inline]
            unsafe fn atomic_swap(
                dst: *mut Self,
                val: Self,
                order: Ordering,
            ) -> Self {
                // SAFETY: the caller must uphold the safety contract.
                // cast and transmute are okay because $ty and $base implement the same layout.
                unsafe {
                    <$base as AtomicSwap>::atomic_swap(
                        dst.cast::<$base>(),
                        val as $base,
                        order,
                    ) as Self
                }
            }
        }
    };
}

macro_rules! delegate_cas {
    ($ty:ty, $base:ident $(, [$generic:ident])?) => {
        const _: () = {
            use core::mem;
            assert!(mem::size_of::<$ty>() == mem::size_of::<$base>());
            assert!(mem::align_of::<$ty>() == mem::align_of::<$base>());
        };
        impl$(<$generic:ty>)?  AtomicCompareExchange for $ty {
            #[inline]
            unsafe fn atomic_compare_exchange(
                dst: *mut Self,
                current: Self,
                new: Self,
                success: Ordering,
                failure: Ordering,
            ) -> (Self, bool) {
                // SAFETY: the caller must uphold the safety contract.
                // cast and transmute are okay because $ty and $base implement the same layout.
                unsafe {
                    let (out, ok) = <$base as AtomicCompareExchange>::atomic_compare_exchange(
                        dst.cast::<$base>(),
                        current as $base,
                        new as $base,
                        success,
                        failure,
                    );
                    (out as Self, ok)
                }
            }
        }
    };
}

macro_rules! delegate_all {
    ($ty:ident, $base:ident) => {
        delegate_load_store!($ty, $base);
        delegate_swap!($ty, $base);
        delegate_cas!($ty, $base);
    };
}

macro_rules! delegate_signed {
    ($delegate:ident, u8) => {
        $delegate!(i8, u8);
    };
    ($delegate:ident, u16) => {
        $delegate!(i16, u16);
    };
    ($delegate:ident, u32) => {
        $delegate!(i32, u32);
    };
    ($delegate:ident, usize) => {
        $delegate!(isize, usize);
    };
    ($delegate:ident, u64) => {
        $delegate!(i64, u64);
    };
    ($delegate:ident, u128) => {
        $delegate!(i128, u128);
    };
    ($delegate:ident, *mut T) => {};
}

atomic_asm_sub_word!((u8), "8");
atomic_asm_sub_word!((u16), "16");
atomic_asm!((u32));
atomic_asm!((usize));
atomic_asm!((*mut T), [T]);

fn to_result<T>((value, ok): (T, bool)) -> Result<T, T> {
    if ok { Ok(value) } else { Err(value) }
}
