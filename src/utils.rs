#![cfg_attr(not(all(test, feature = "float")), allow(dead_code, unused_macros))]

use core::{ops, sync::atomic::Ordering};

macro_rules! static_assert {
    ($cond:expr $(,)?) => {{
        let [] = [(); true as usize - $crate::utils::_assert_is_bool($cond) as usize];
    }};
}
pub(crate) const fn _assert_is_bool(v: bool) -> bool {
    v
}

macro_rules! static_assert_layout {
    ($atomic_type:ty, $value_type:ty) => {
        static_assert!(
            core::mem::align_of::<$atomic_type>() == core::mem::size_of::<$atomic_type>()
        );
        static_assert!(core::mem::size_of::<$atomic_type>() == core::mem::size_of::<$value_type>());
    };
}

// #[doc = concat!(...)] requires Rust 1.54
macro_rules! doc_comment {
    ($doc:expr, $($tt:tt)*) => {
        #[doc = $doc]
        $($tt)*
    };
}

// Adapted from https://github.com/BurntSushi/memchr/blob/2.4.1/src/memchr/x86/mod.rs#L9-L71.
/// # Safety
///
/// - the caller must uphold the safety contract for the function returned by $detect_body.
/// - the memory pointed by the function pointer returned by $detect_body must be visible from any threads.
///
/// The second requirement is always met if the function pointer is to the function definition.
/// (Currently, all uses of this macro in our code are in this case.)
#[allow(unused_macros)]
#[cfg(not(portable_atomic_no_outline_atomics))]
#[cfg(any(
    target_arch = "aarch64",
    target_arch = "arm",
    all(target_arch = "x86_64", not(target_env = "sgx")),
))]
macro_rules! ifunc {
    (unsafe fn($($arg_pat:ident: $arg_ty:ty),*) $(-> $ret_ty:ty)? { $($detect_body:tt)* }) => {{
        type FnTy = unsafe fn($($arg_ty),*) $(-> $ret_ty)?;
        #[cfg(not(case2))]
        static FUNC: crate::utils::CachePadded<core::sync::atomic::AtomicPtr<()>>
            = crate::utils::CachePadded::new(core::sync::atomic::AtomicPtr::new(detect as *mut ()));
        #[cfg(case2)]
        static FUNC: core::sync::atomic::AtomicPtr<()>
            = core::sync::atomic::AtomicPtr::new(detect as *mut ());
        #[cold]
        unsafe fn detect($($arg_pat: $arg_ty),*) $(-> $ret_ty)? {
            let func: FnTy = { $($detect_body)* };
            FUNC.store(func as *mut (), core::sync::atomic::Ordering::Relaxed);
            // SAFETY: the caller must uphold the safety contract for the function returned by $detect_body.
            unsafe { func($($arg_pat),*) }
        }
        // SAFETY: `FnTy` is a function pointer, which is always safe to transmute with a `*mut ()`.
        // (To force the caller to use unsafe block for this macro, do not use
        // unsafe block here.)
        let func = {
            core::mem::transmute::<*mut (), FnTy>(FUNC.load(core::sync::atomic::Ordering::Relaxed))
        };
        // SAFETY: the caller must uphold the safety contract for the function returned by $detect_body.
        // (To force the caller to use unsafe block for this macro, do not use
        // unsafe block here.)
        func($($arg_pat),*)
    }};
}

#[allow(unused_macros)]
#[cfg(not(portable_atomic_no_outline_atomics))]
#[cfg(any(target_arch = "aarch64", target_arch = "arm", target_arch = "x86_64"))]
macro_rules! fn_alias {
    (
        $(#[$($fn_attr:tt)*])*
        $vis:vis unsafe fn($($arg_pat:ident: $arg_ty:ty),*) $(-> $ret_ty:ty)?;
        $(#[$($alias_attr:tt)*])*
        $new:ident = $from:ident($($last_args:tt)*);
        $($rest:tt)*
    ) => {
        $(#[$($fn_attr)*])*
        $(#[$($alias_attr)*])*
        $vis unsafe fn $new($($arg_pat: $arg_ty),*) $(-> $ret_ty)? {
            // SAFETY: the caller must uphold the safety contract.
            unsafe { $from($($arg_pat,)* $($last_args)*) }
        }
        fn_alias! {
            $(#[$($fn_attr)*])*
            $vis unsafe fn($($arg_pat: $arg_ty),*) $(-> $ret_ty)?;
            $($rest)*
        }
    };
    (
        $(#[$($attr:tt)*])*
        $vis:vis unsafe fn($($arg_pat:ident: $arg_ty:ty),*) $(-> $ret_ty:ty)?;
    ) => {}
}

/// Make the given function const if the given condition is true.
macro_rules! const_fn {
    (
        const_if: #[cfg($($cfg:tt)+)];
        $(#[$($attr:tt)*])*
        $vis:vis const fn $($rest:tt)*
    ) => {
        #[cfg($($cfg)+)]
        $(#[$($attr)*])*
        $vis const fn $($rest)*
        #[cfg(not($($cfg)+))]
        $(#[$($attr)*])*
        $vis fn $($rest)*
    };
}

/// Implements `core::fmt::Debug` and `serde::{Serialize, Deserialize}` (when serde
/// feature is enabled) for atomic bool, integer, or float.
macro_rules! impl_debug_and_serde {
    ($atomic_type:ident) => {
        impl fmt::Debug for $atomic_type {
            #[allow(clippy::missing_inline_in_public_items)] // fmt is not hot path
            fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                // std atomic types use Relaxed in Debug::fmt: https://github.com/rust-lang/rust/blob/1.68.0/library/core/src/sync/atomic.rs#L1934
                fmt::Debug::fmt(&self.load(Ordering::Relaxed), f)
            }
        }
        #[cfg(feature = "serde")]
        #[cfg_attr(docsrs, doc(cfg(feature = "serde")))]
        impl serde::Serialize for $atomic_type {
            #[allow(clippy::missing_inline_in_public_items)] // serde doesn't use inline on std atomic's Serialize/Deserialize impl
            fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
            where
                S: serde::Serializer,
            {
                // https://github.com/serde-rs/serde/blob/v1.0.152/serde/src/ser/impls.rs#L958-L959
                self.load(Ordering::Relaxed).serialize(serializer)
            }
        }
        #[cfg(feature = "serde")]
        #[cfg_attr(docsrs, doc(cfg(feature = "serde")))]
        impl<'de> serde::Deserialize<'de> for $atomic_type {
            #[allow(clippy::missing_inline_in_public_items)] // serde doesn't use inline on std atomic's Serialize/Deserialize impl
            fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
            where
                D: serde::Deserializer<'de>,
            {
                serde::Deserialize::deserialize(deserializer).map(Self::new)
            }
        }
    };
}

// We do not provide `nand` because it cannot be optimized on neither x86 nor MSP430.
// https://godbolt.org/z/x88voWGov
macro_rules! impl_default_no_fetch_ops {
    ($atomic_type:ident, bool) => {
        impl $atomic_type {
            #[inline]
            pub(crate) fn and(&self, val: bool, order: Ordering) {
                self.fetch_and(val, order);
            }
            #[inline]
            pub(crate) fn or(&self, val: bool, order: Ordering) {
                self.fetch_or(val, order);
            }
            #[inline]
            pub(crate) fn xor(&self, val: bool, order: Ordering) {
                self.fetch_xor(val, order);
            }
        }
    };
    ($atomic_type:ident, $int_type:ident) => {
        impl $atomic_type {
            #[inline]
            pub(crate) fn add(&self, val: $int_type, order: Ordering) {
                self.fetch_add(val, order);
            }
            #[inline]
            pub(crate) fn sub(&self, val: $int_type, order: Ordering) {
                self.fetch_sub(val, order);
            }
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
        }
    };
}
macro_rules! impl_default_bit_opts {
    ($atomic_type:ident, $int_type:ident) => {
        impl $atomic_type {
            #[inline]
            pub(crate) fn bit_set(&self, bit: u32, order: Ordering) -> bool {
                let mask = (1 as $int_type).wrapping_shl(bit);
                self.fetch_or(mask, order) & mask != 0
            }
            #[inline]
            pub(crate) fn bit_clear(&self, bit: u32, order: Ordering) -> bool {
                let mask = (1 as $int_type).wrapping_shl(bit);
                self.fetch_and(!mask, order) & mask != 0
            }
            #[inline]
            pub(crate) fn bit_toggle(&self, bit: u32, order: Ordering) -> bool {
                let mask = (1 as $int_type).wrapping_shl(bit);
                self.fetch_xor(mask, order) & mask != 0
            }
        }
    };
}

macro_rules! cfg_atomic_64 {
    ($($tt:tt)*) => {
        #[cfg_attr(
            portable_atomic_no_cfg_target_has_atomic,
            cfg(any(
                all(
                    feature = "fallback",
                    any(
                        not(portable_atomic_no_atomic_cas),
                        portable_atomic_unsafe_assume_single_core,
                        feature = "critical-section",
                        target_arch = "avr",
                        target_arch = "msp430",
                    ),
                ),
                not(portable_atomic_no_atomic_64),
                not(any(target_pointer_width = "16", target_pointer_width = "32")),
            ))
        )]
        #[cfg_attr(
            not(portable_atomic_no_cfg_target_has_atomic),
            cfg(any(
                all(
                    feature = "fallback",
                    any(
                        target_has_atomic = "ptr",
                        portable_atomic_unsafe_assume_single_core,
                        feature = "critical-section",
                        target_arch = "avr",
                        target_arch = "msp430",
                    ),
                ),
                target_has_atomic = "64",
                not(any(target_pointer_width = "16", target_pointer_width = "32")),
            ))
        )]
        $($tt)*
    };
}
macro_rules! cfg_atomic_128 {
    ($($tt:tt)*) => {
        #[cfg_attr(
            not(feature = "fallback"),
            cfg(any(
                all(
                    any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
                    target_arch = "aarch64",
                ),
                all(
                    any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
                    any(
                        target_feature = "cmpxchg16b",
                        portable_atomic_target_feature = "cmpxchg16b",
                        all(
                            feature = "fallback",
                            portable_atomic_cmpxchg16b_target_feature,
                            not(portable_atomic_no_outline_atomics),
                            not(target_env = "sgx"),
                        ),
                    ),
                    target_arch = "x86_64",
                ),
                all(
                    portable_atomic_unstable_asm_experimental_arch,
                    any(
                        target_feature = "quadword-atomics",
                        portable_atomic_target_feature = "quadword-atomics",
                    ),
                    target_arch = "powerpc64",
                ),
                all(portable_atomic_unstable_asm_experimental_arch, target_arch = "s390x"),
            ))
        )]
        #[cfg_attr(
            all(feature = "fallback", portable_atomic_no_cfg_target_has_atomic),
            cfg(any(
                not(portable_atomic_no_atomic_cas),
                portable_atomic_unsafe_assume_single_core,
                feature = "critical-section",
                target_arch = "avr",
                target_arch = "msp430",
            ))
        )]
        #[cfg_attr(
            all(feature = "fallback", not(portable_atomic_no_cfg_target_has_atomic)),
            cfg(any(
                target_has_atomic = "ptr",
                portable_atomic_unsafe_assume_single_core,
                feature = "critical-section",
                target_arch = "avr",
                target_arch = "msp430",
            ))
        )]
        $($tt)*
    };
}

// hthttps://github.com/rust-lang/rust/blob/1.68.0/library/core/src/sync/atomic.rs#L2992
#[allow(dead_code)]
#[inline]
pub(crate) fn strongest_failure_ordering(order: Ordering) -> Ordering {
    match order {
        Ordering::Release | Ordering::Relaxed => Ordering::Relaxed,
        Ordering::SeqCst => Ordering::SeqCst,
        Ordering::Acquire | Ordering::AcqRel => Ordering::Acquire,
        _ => unreachable!("{:?}", order),
    }
}

// https://github.com/rust-lang/rust/blob/1.68.0/library/core/src/sync/atomic.rs#L3019
#[inline]
#[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
pub(crate) fn assert_load_ordering(order: Ordering) {
    match order {
        Ordering::Acquire | Ordering::Relaxed | Ordering::SeqCst => {}
        Ordering::Release => panic!("there is no such thing as a release load"),
        Ordering::AcqRel => panic!("there is no such thing as an acquire-release load"),
        _ => unreachable!("{:?}", order),
    }
}

// https://github.com/rust-lang/rust/blob/1.68.0/library/core/src/sync/atomic.rs#L3004
#[inline]
#[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
pub(crate) fn assert_store_ordering(order: Ordering) {
    match order {
        Ordering::Release | Ordering::Relaxed | Ordering::SeqCst => {}
        Ordering::Acquire => panic!("there is no such thing as an acquire store"),
        Ordering::AcqRel => panic!("there is no such thing as an acquire-release store"),
        _ => unreachable!("{:?}", order),
    }
}

// https://github.com/rust-lang/rust/pull/98383
// https://github.com/rust-lang/rust/blob/1.68.0/library/core/src/sync/atomic.rs#L3085
#[inline]
#[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
pub(crate) fn assert_compare_exchange_ordering(success: Ordering, failure: Ordering) {
    match success {
        Ordering::AcqRel
        | Ordering::Acquire
        | Ordering::Relaxed
        | Ordering::Release
        | Ordering::SeqCst => {}
        _ => unreachable!("{:?}, {:?}", success, failure),
    }
    match failure {
        Ordering::Acquire | Ordering::Relaxed | Ordering::SeqCst => {}
        Ordering::Release => panic!("there is no such thing as a release failure ordering"),
        Ordering::AcqRel => panic!("there is no such thing as an acquire-release failure ordering"),
        _ => unreachable!("{:?}, {:?}", success, failure),
    }
}

// https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0418r2.html
#[allow(dead_code)]
#[inline]
pub(crate) fn upgrade_success_ordering(success: Ordering, failure: Ordering) -> Ordering {
    match (success, failure) {
        (Ordering::Relaxed, Ordering::Acquire) => Ordering::Acquire,
        (Ordering::Release, Ordering::Acquire) => Ordering::AcqRel,
        (_, Ordering::SeqCst) => Ordering::SeqCst,
        _ => success,
    }
}

// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/d49a0f8454499ced8af0b61aeb661379c4eb0588/crossbeam-utils/src/cache_padded.rs.
/// Pads and aligns a value to the length of a cache line.
// Starting from Intel's Sandy Bridge, spatial prefetcher is now pulling pairs of 64-byte cache
// lines at a time, so we have to align to 128 bytes rather than 64.
//
// Sources:
// - https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-optimization-manual.pdf
// - https://github.com/facebook/folly/blob/1b5288e6eea6df074758f877c849b6e73bbb9fbb/folly/lang/Align.h#L107
//
// ARM's big.LITTLE architecture has asymmetric cores and "big" cores have 128-byte cache line size.
//
// Sources:
// - https://www.mono-project.com/news/2016/09/12/arm64-icache/
//
// powerpc64 has 128-byte cache line size.
//
// Sources:
// - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_ppc64x.go#L9
#[cfg_attr(
    any(target_arch = "x86_64", target_arch = "aarch64", target_arch = "powerpc64"),
    repr(align(128))
)]
// arm, mips, mips64, riscv64, sparc, and hexagon have 32-byte cache line size.
//
// Sources:
// - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_arm.go#L7
// - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_mips.go#L7
// - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_mipsle.go#L7
// - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_mips64x.go#L9
// - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_riscv64.go#L7
// - https://github.com/torvalds/linux/blob/3516bd729358a2a9b090c1905bd2a3fa926e24c6/arch/sparc/include/asm/cache.h#L17
// - https://github.com/torvalds/linux/blob/3516bd729358a2a9b090c1905bd2a3fa926e24c6/arch/hexagon/include/asm/cache.h#L12
//
// riscv32 is assumed not to exceed the cache line size of riscv64.
#[cfg_attr(
    any(
        target_arch = "arm",
        target_arch = "mips",
        target_arch = "mips64",
        target_arch = "riscv32",
        target_arch = "riscv64",
        target_arch = "sparc",
        target_arch = "hexagon",
    ),
    repr(align(32))
)]
// m68k has 16-byte cache line size.
//
// Sources:
// - https://github.com/torvalds/linux/blob/3516bd729358a2a9b090c1905bd2a3fa926e24c6/arch/m68k/include/asm/cache.h#L9
#[cfg_attr(target_arch = "m68k", repr(align(16)))]
// s390x has 256-byte cache line size.
//
// Sources:
// - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_s390x.go#L7
// - https://github.com/torvalds/linux/blob/3516bd729358a2a9b090c1905bd2a3fa926e24c6/arch/s390/include/asm/cache.h#L13
#[cfg_attr(target_arch = "s390x", repr(align(256)))]
// x86, wasm, and sparc64 have 64-byte cache line size.
//
// Sources:
// - https://github.com/golang/go/blob/dda2991c2ea0c5914714469c4defc2562a907230/src/internal/cpu/cpu_x86.go#L9
// - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_wasm.go#L7
// - https://github.com/torvalds/linux/blob/3516bd729358a2a9b090c1905bd2a3fa926e24c6/arch/sparc/include/asm/cache.h#L19
//
// All others are assumed to have 64-byte cache line size.
#[cfg_attr(
    not(any(
        target_arch = "x86_64",
        target_arch = "aarch64",
        target_arch = "powerpc64",
        target_arch = "arm",
        target_arch = "mips",
        target_arch = "mips64",
        target_arch = "riscv32",
        target_arch = "riscv64",
        target_arch = "sparc",
        target_arch = "hexagon",
        target_arch = "m68k",
        target_arch = "s390x",
    )),
    repr(align(64))
)]
pub(crate) struct CachePadded<T> {
    value: T,
}

impl<T> CachePadded<T> {
    #[inline]
    pub(crate) const fn new(value: T) -> Self {
        Self { value }
    }
}

impl<T> ops::Deref for CachePadded<T> {
    type Target = T;

    #[inline(always)]
    fn deref(&self) -> &T {
        &self.value
    }
}

/// Emulate strict provenance.
///
/// Once strict_provenance is stable, migrate to the standard library's APIs.
#[cfg(miri)]
#[allow(
    clippy::cast_possible_wrap,
    clippy::transmutes_expressible_as_ptr_casts,
    clippy::useless_transmute
)]
pub(crate) mod strict {
    use core::mem;

    /// Get the address of a pointer.
    #[inline]
    #[must_use]
    pub(crate) fn addr<T>(ptr: *mut T) -> usize {
        // SAFETY: Every sized pointer is a valid integer for the time being.
        unsafe { mem::transmute(ptr) }
    }

    /// Replace the address portion of this pointer with a new address.
    #[inline]
    #[must_use]
    pub(crate) fn with_addr<T>(ptr: *mut T, addr: usize) -> *mut T {
        // FIXME(strict_provenance_magic): I am magic and should be a compiler intrinsic.
        //
        // In the mean-time, this operation is defined to be "as if" it was
        // a wrapping_offset, so we can emulate it as such. This should properly
        // restore pointer provenance even under today's compiler.
        let self_addr = self::addr(ptr) as isize;
        let dest_addr = addr as isize;
        let offset = dest_addr.wrapping_sub(self_addr);

        // This is the canonical desugaring of this operation.
        (ptr as *mut u8).wrapping_offset(offset) as *mut T
    }

    /// Run an operation of some kind on a pointer.
    #[inline]
    #[must_use]
    pub(crate) fn map_addr<T>(ptr: *mut T, f: impl FnOnce(usize) -> usize) -> *mut T {
        self::with_addr(ptr, f(addr(ptr)))
    }
}
