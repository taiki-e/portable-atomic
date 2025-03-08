// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
Atomic float implementation on NVPTX.

Refs:
- https://docs.nvidia.com/cuda/parallel-thread-execution/index.html#data-movement-and-conversion-instructions-ld
- https://docs.nvidia.com/cuda/parallel-thread-execution/index.html#parallel-synchronization-and-communication-instructions-atom
- https://docs.nvidia.com/cuda/parallel-thread-execution/index.html#parallel-synchronization-and-communication-instructions-membar
- User Guide for NVPTX Back-end (LLVM documentation) https://llvm.org/docs/NVPTXUsage.html
- https://github.com/NVIDIA/cccl/blob/cc7c1bb7e888dcfc8665ca4936d8e99c7476a847/libcudacxx/include/cuda/std/__atomic/functions/cuda_ptx_generated.h

Generated asm:
- nvptx64 (+sm_70) https://godbolt.org/z/MzGcWc9T6
*/

// This module is currently enabled on sm_70+.
// TODO: Support pre-sm_70

use core::{arch::asm, cell::UnsafeCell, sync::atomic::Ordering};

// NVPTX's seqcst atomic op is preceding seqcst fence + acquire op.
macro_rules! fence_sc {
    () => {
        // TODO: LLVM 20 uses fence.sc.sys;
        "fence.sc.gl;"
    };
}

macro_rules! atomic_rmw {
    ($op:ident, $order:ident) => {
        match $order {
            Ordering::Relaxed => $op!("relaxed", ""),
            Ordering::Acquire => $op!("acquire", ""),
            Ordering::Release => $op!("release", ""),
            Ordering::AcqRel => $op!("acqrel", ""),
            Ordering::SeqCst => $op!("acquire", fence_sc!()),
            _ => unreachable!(),
        }
    };
}

macro_rules! atomic_float {
    (
        $atomic_type:ident, $float_type:ident, $atomic_int_type:ident, $int_type:ident,
        $val_reg:ident, $align:expr
    ) => {
        #[repr(C, align($align))]
        pub(crate) struct $atomic_type {
            v: UnsafeCell<$float_type>,
        }

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by atomic operations.
        unsafe impl Sync for $atomic_type {}

        impl $atomic_type {
            #[inline]
            pub(crate) const fn new(v: $float_type) -> Self {
                Self { v: UnsafeCell::new(v) }
            }

            #[inline]
            pub(crate) fn is_lock_free() -> bool {
                true
            }
            pub(crate) const IS_ALWAYS_LOCK_FREE: bool = true;

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn load(&self, order: Ordering) -> $float_type {
                let src = self.v.get();
                let out;
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    macro_rules! atomic_load {
                        ($sem:tt, $fence_sc:expr) => {
                            asm!(
                                $fence_sc,
                                concat!("ld.", $sem, ".gpu.", stringify!($float_type), " {out}, [{src}];"),
                                src = in(reg64) src,
                                out = out($val_reg) out,
                                options(nostack),
                            )
                        };
                    }
                    match order {
                        Ordering::Relaxed => atomic_load!("relaxed", ""),
                        Ordering::Acquire => atomic_load!("acquire", ""),
                        Ordering::SeqCst => atomic_load!("acquire", fence_sc!()),
                        _ => unreachable!(),
                    }
                }
                out
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn store(&self, val: $float_type, order: Ordering) {
                let dst = self.v.get();
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    macro_rules! atomic_store {
                        ($sem:tt, $fence_sc:expr) => {
                            asm!(
                                $fence_sc,
                                concat!("st.", $sem, ".gpu.", stringify!($float_type), " [{dst}], {val};"),
                                dst = in(reg64) dst,
                                val = in($val_reg) val,
                                options(nostack),
                            )
                        };
                    }
                    match order {
                        Ordering::Relaxed => atomic_store!("relaxed", ""),
                        Ordering::Release => atomic_store!("release", ""),
                        Ordering::SeqCst => atomic_store!("relaxed", fence_sc!()),
                        _ => unreachable!(),
                    }
                }
            }

            #[inline]
            pub(crate) fn swap(&self, val: $float_type, order: Ordering) -> $float_type {
                let dst = self.v.get();
                let out;
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    macro_rules! swap {
                        ($sem:tt, $fence_sc:expr) => {
                            asm!(
                                $fence_sc,
                                concat!("atom.", $sem, ".gpu.exch.", stringify!($float_type), " {out}, [{dst}], {val};"),
                                dst = in(reg64) dst,
                                val = in($val_reg) val,
                                out = out($val_reg) out,
                                options(nostack),
                            )
                        };
                    }
                    atomic_rmw!(swap, order);
                }
                out
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn compare_exchange(
                &self,
                old: $float_type,
                new: $float_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$float_type, $float_type> {
                let order = crate::utils::upgrade_success_ordering(success, failure);
                let dst = self.v.get();
                let out: $float_type;
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    macro_rules! cmpxchg {
                        ($sem:tt, $fence_sc:expr) => {
                            asm!(
                                $fence_sc,
                                concat!("atom.", $sem, ".gpu.cas.", stringify!($float_type), " {out}, [{dst}], {old}, {new};"),
                                dst = in(reg64) dst,
                                old = in($val_reg) old,
                                new = in($val_reg) new,
                                out = out($val_reg) out,
                                options(nostack),
                            )
                        };
                    }
                    atomic_rmw!(cmpxchg, order);
                }
                if out.to_bits() == old.to_bits() {
                    Ok(out)
                } else {
                    Err(out)
                }
            }

            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
            pub(crate) fn compare_exchange_weak(
                &self,
                current: $float_type,
                new: $float_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$float_type, $float_type> {
                self.compare_exchange(current, new, success, failure)
            }

            #[inline]
            pub(crate) fn fetch_add(&self, val: $float_type, order: Ordering) -> $float_type {
                let dst = self.v.get();
                let out;
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    macro_rules! add {
                        ($sem:tt, $fence_sc:expr) => {
                            asm!(
                                $fence_sc,
                                concat!("atom.", $sem, ".gpu.add.", stringify!($float_type), " {out}, [{dst}], {val};"),
                                dst = in(reg64) dst,
                                val = in($val_reg) val,
                                out = out($val_reg) out,
                                options(nostack),
                            )
                        };
                    }
                    atomic_rmw!(add, order);
                }
                out
            }

            #[inline]
            pub(crate) fn fetch_sub(&self, val: $float_type, order: Ordering) -> $float_type {
                // There is no atomic sub instruction, so add `-val`.
                self.fetch_add(-val, order)
            }

            #[allow(dead_code)] // TODO
            #[inline]
            pub(crate) fn fetch_and(&self, val: $float_type, order: Ordering) -> $float_type {
                let dst = self.v.get();
                let out;
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    macro_rules! and {
                        ($sem:tt, $fence_sc:expr) => {
                            asm!(
                                $fence_sc,
                                concat!("atom.", $sem, ".gpu.and.", stringify!($float_type), " {out}, [{dst}], {val};"),
                                dst = in(reg64) dst,
                                val = in($val_reg) val,
                                out = out($val_reg) out,
                                options(nostack),
                            )
                        };
                    }
                    atomic_rmw!(and, order);
                }
                out
            }

            #[allow(dead_code)] // TODO
            #[inline]
            pub(crate) fn fetch_or(&self, val: $float_type, order: Ordering) -> $float_type {
                let dst = self.v.get();
                let out;
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    macro_rules! or {
                        ($sem:tt, $fence_sc:expr) => {
                            asm!(
                                $fence_sc,
                                concat!("atom.", $sem, ".gpu.or.", stringify!($float_type), " {out}, [{dst}], {val};"),
                                dst = in(reg64) dst,
                                val = in($val_reg) val,
                                out = out($val_reg) out,
                                options(nostack),
                            )
                        };
                    }
                    atomic_rmw!(or, order);
                }
                out
            }

            #[allow(dead_code)] // TODO
            #[inline]
            pub(crate) fn fetch_xor(&self, val: $float_type, order: Ordering) -> $float_type {
                let dst = self.v.get();
                let out;
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    macro_rules! xor {
                        ($sem:tt, $fence_sc:expr) => {
                            asm!(
                                $fence_sc,
                                concat!("atom.", $sem, ".gpu.xor.", stringify!($float_type), " {out}, [{dst}], {val};"),
                                dst = in(reg64) dst,
                                val = in($val_reg) val,
                                out = out($val_reg) out,
                                options(nostack),
                            )
                        };
                    }
                    atomic_rmw!(xor, order);
                }
                out
            }

            #[inline]
            pub(crate) fn fetch_max(&self, val: $float_type, order: Ordering) -> $float_type {
                let dst = self.v.get();
                let out;
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    macro_rules! max {
                        ($sem:tt, $fence_sc:expr) => {
                            asm!(
                                $fence_sc,
                                concat!("atom.", $sem, ".gpu.max.", stringify!($float_type), " {out}, [{dst}], {val};"),
                                dst = in(reg64) dst,
                                val = in($val_reg) val,
                                out = out($val_reg) out,
                                options(nostack),
                            )
                        };
                    }
                    atomic_rmw!(max, order);
                }
                out
            }

            #[inline]
            pub(crate) fn fetch_min(&self, val: $float_type, order: Ordering) -> $float_type {
                let dst = self.v.get();
                let out;
                // SAFETY: any data races are prevented by atomic intrinsics and the raw
                // pointer passed in is valid because we got it from a reference.
                unsafe {
                    macro_rules! min {
                        ($sem:tt, $fence_sc:expr) => {
                            asm!(
                                $fence_sc,
                                concat!("atom.", $sem, ".gpu.min.", stringify!($float_type), " {out}, [{dst}], {val};"),
                                dst = in(reg64) dst,
                                val = in($val_reg) val,
                                out = out($val_reg) out,
                                options(nostack),
                            )
                        };
                    }
                    atomic_rmw!(min, order);
                }
                out
            }

            #[inline]
            pub(crate) fn fetch_neg(&self, order: Ordering) -> $float_type {
                const NEG_MASK: $int_type = !0 / 2 + 1;
                // TODO: use self.fetch_xor
                $float_type::from_bits(self.as_bits().fetch_xor(NEG_MASK, order))
            }

            #[inline]
            pub(crate) fn fetch_abs(&self, order: Ordering) -> $float_type {
                const ABS_MASK: $int_type = !0 / 2;
                // TODO: use self.fetch_and
                $float_type::from_bits(self.as_bits().fetch_and(ABS_MASK, order))
            }

            const_fn! {
                const_if: #[cfg(not(portable_atomic_no_const_raw_ptr_deref))];
                #[inline]
                pub(crate) const fn as_bits(&self) -> &crate::$atomic_int_type {
                    // SAFETY: $atomic_type and $atomic_int_type have the same layout,
                    // and there is no concurrent access to the value that does not go through this method.
                    unsafe { &*(self as *const $atomic_type as *const crate::$atomic_int_type) }
                }
            }

            #[inline]
            pub(crate) const fn as_ptr(&self) -> *mut $float_type {
                self.v.get()
            }
        }
    };
}

atomic_float!(AtomicF32, f32, AtomicU32, u32, reg32, 4);
atomic_float!(AtomicF64, f64, AtomicU64, u64, reg64, 8);
