// Based on:
// - https://github.com/serde-rs/serde/blob/v1.0.136/serde/src/ser/impls.rs#L909-L936.
// - https://github.com/serde-rs/serde/blob/v1.0.136/serde/src/de/impls.rs#L2664-L2690.

#![allow(clippy::missing_inline_in_public_items)] // serde doesn't use inline on std atomic's Serialize/Deserialize impl

use core::sync::atomic::Ordering;

use serde::{
    de::{Deserialize, Deserializer},
    ser::{Serialize, Serializer},
};

macro_rules! atomic_impl {
    ($($ty:ident),*) => {$(
        #[cfg_attr(docsrs, doc(cfg(feature = "serde")))]
        impl Serialize for crate::$ty {
            fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
            where
                S: Serializer,
            {
                // https://github.com/serde-rs/serde/blob/v1.0.136/serde/src/ser/impls.rs#L918-L919
                self.load(Ordering::SeqCst).serialize(serializer)
            }
        }
        #[cfg_attr(docsrs, doc(cfg(feature = "serde")))]
        impl<'de> Deserialize<'de> for crate::$ty {
            fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
            where
                D: Deserializer<'de>,
            {
                Deserialize::deserialize(deserializer).map(Self::new)
            }
        }
    )*};
}

atomic_impl!(AtomicBool, AtomicIsize, AtomicUsize);
atomic_impl!(AtomicI8, AtomicU8, AtomicI16, AtomicU16);
// cfg(any(target_has_atomic_load_store = "32", target_arch = "riscv32", portable_atomic_unsafe_assume_single_core))
#[cfg(any(not(target_pointer_width = "16"), portable_atomic_unsafe_assume_single_core))]
atomic_impl!(AtomicI32, AtomicU32);
#[cfg_attr(
    not(portable_atomic_cfg_target_has_atomic),
    cfg(any(
        all(feature = "fallback", not(portable_atomic_no_atomic_cas)),
        not(portable_atomic_no_atomic_64),
        portable_atomic_unsafe_assume_single_core
    ))
)]
// cfg(any(target_has_atomic = "ptr", target_has_atomic_load_store = "64", portable_atomic_unsafe_assume_single_core))
#[cfg_attr(
    portable_atomic_cfg_target_has_atomic,
    cfg(any(
        all(feature = "fallback", target_has_atomic = "ptr"),
        target_has_atomic = "64",
        target_pointer_width = "64",
        portable_atomic_unsafe_assume_single_core
    ))
)]
atomic_impl!(AtomicI64, AtomicU64);
#[cfg(feature = "i128")]
#[cfg_attr(
    not(portable_atomic_cfg_target_has_atomic),
    cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
)]
#[cfg_attr(
    portable_atomic_cfg_target_has_atomic,
    cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
)]
atomic_impl!(AtomicI128, AtomicU128);
#[cfg(feature = "float")]
// cfg(any(target_has_atomic_load_store = "32", target_arch = "riscv32", portable_atomic_unsafe_assume_single_core))
#[cfg(any(not(target_pointer_width = "16"), portable_atomic_unsafe_assume_single_core))]
atomic_impl!(AtomicF32);
#[cfg(feature = "float")]
#[cfg_attr(
    not(portable_atomic_cfg_target_has_atomic),
    cfg(any(
        all(feature = "fallback", not(portable_atomic_no_atomic_cas)),
        not(portable_atomic_no_atomic_64),
        portable_atomic_unsafe_assume_single_core
    ))
)]
// cfg(any(target_has_atomic = "ptr", target_has_atomic_load_store = "64", portable_atomic_unsafe_assume_single_core))
#[cfg_attr(
    portable_atomic_cfg_target_has_atomic,
    cfg(any(
        all(feature = "fallback", target_has_atomic = "ptr"),
        target_has_atomic = "64",
        target_pointer_width = "64",
        portable_atomic_unsafe_assume_single_core
    ))
)]
atomic_impl!(AtomicF64);
