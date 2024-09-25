// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
Atomic load/store implementation on MIPS-I.

This is for MIPS-I. (rustc doesn't provide atomics
at all on such targets. https://github.com/ayrtonm/psx-sdk-rs/issues/6)

TODO:
https://psx-spx.consoledev.net/cpuspecifications/
https://github.com/PeterLemon/PSX/blob/54b95d7bd0125f3c24ba760c8ca5648568b62b31/CPUTest/GTE/AVSZ/GTEAVSZ.asm#L167
https://en.wikipedia.org/wiki/MIPS_architecture#MIPS_I
https://github.com/ayrtonm/psx-sdk-rs/blob/959ef93c2774b9b3fe38d6bc2186a87dc5b1c792/psx/src/hw/irq.rs

Generated asm:
*/

use core::{arch::asm, cell::UnsafeCell, sync::atomic::Ordering};

extern "C" {
    fn __sync_synchronize();
}

macro_rules! atomic_load_store {
    ($([$($generics:tt)*])? $atomic_type:ident, $value_type:ty, $asm_suffix:tt) => {
        #[repr(transparent)]
        pub(crate) struct $atomic_type $(<$($generics)*>)? {
            v: UnsafeCell<$value_type>,
        }

        // Send is implicitly implemented for atomic integers, but not for atomic pointers.
        // SAFETY: any data races are prevented by atomic operations.
        unsafe impl $(<$($generics)*>)? Send for $atomic_type $(<$($generics)*>)? {}
        // SAFETY: any data races are prevented by atomic operations.
        unsafe impl $(<$($generics)*>)? Sync for $atomic_type $(<$($generics)*>)? {}

        #[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
        impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
            #[inline]
            pub(crate) const fn new(v: $value_type) -> Self {
                Self { v: UnsafeCell::new(v) }
            }

            #[inline]
            pub(crate) fn is_lock_free() -> bool {
                Self::IS_ALWAYS_LOCK_FREE
            }
            pub(crate) const IS_ALWAYS_LOCK_FREE: bool = true;

            #[inline]
            pub(crate) fn get_mut(&mut self) -> &mut $value_type {
                // SAFETY: the mutable reference guarantees unique ownership.
                // (UnsafeCell::get_mut requires Rust 1.50)
                unsafe { &mut *self.v.get() }
            }

            #[inline]
            pub(crate) const fn as_ptr(&self) -> *mut $value_type {
                self.v.get()
            }
        }
        impl $(<$($generics)*>)? $atomic_type $(<$($generics)*>)? {
            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn load(&self, order: Ordering) -> $value_type {
                crate::utils::assert_load_ordering(order);
                let src = self.v.get();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    let out;
                    macro_rules! atomic_load {
                        ($acquire:expr) => {{
                            asm!(
                                ".set push",
                                ".set noat",
                                concat!("l", $asm_suffix, " {out}, 0({src})"),
                                ".set pop",
                                src = in(reg) ptr_reg!(src),
                                out = out(reg) out,
                                options(nostack),
                            );
                            $acquire;
                        }};
                    }
                    match order {
                        Ordering::Relaxed => atomic_load!(()),
                        // Acquire and SeqCst loads are equivalent.
                        Ordering::Acquire | Ordering::SeqCst => atomic_load!(__sync_synchronize()),
                        _ => unreachable!(),
                    }
                    out
                }
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $value_type, order: Ordering) {
                crate::utils::assert_store_ordering(order);
                let dst = self.v.get();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    macro_rules! atomic_store {
                        ($acquire:expr, $release:expr) => {{
                            $release;
                            asm!(
                                ".set push",
                                ".set noat",
                                concat!("s", $asm_suffix, " {val}, 0({dst})"),
                                ".set pop",
                                dst = in(reg) ptr_reg!(dst),
                                val = in(reg) val,
                                options(nostack),
                            );
                            $acquire;
                        }};
                    }
                    match order {
                        Ordering::Relaxed => atomic_store!((), ()),
                        Ordering::Release => atomic_store!((), __sync_synchronize()),
                        Ordering::SeqCst
                            => atomic_store!(__sync_synchronize(), __sync_synchronize()),
                        _ => unreachable!(),
                    }
                }
            }
        }
    };
}

atomic_load_store!(AtomicI8, i8, "b");
atomic_load_store!(AtomicU8, u8, "b");
atomic_load_store!(AtomicI16, i16, "h");
atomic_load_store!(AtomicU16, u16, "h");
atomic_load_store!(AtomicI32, i32, "w");
atomic_load_store!(AtomicU32, u32, "w");
atomic_load_store!(AtomicIsize, isize, "w");
atomic_load_store!(AtomicUsize, usize, "w");
atomic_load_store!([T] AtomicPtr, *mut T, "w");

#[cfg(test)]
mod tests {
    use super::*;

    test_atomic_ptr_load_store!();
    test_atomic_int_load_store!(i8);
    test_atomic_int_load_store!(u8);
    test_atomic_int_load_store!(i16);
    test_atomic_int_load_store!(u16);
    test_atomic_int_load_store!(i32);
    test_atomic_int_load_store!(u32);
    test_atomic_int_load_store!(isize);
    test_atomic_int_load_store!(usize);
}
