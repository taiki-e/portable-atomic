macro_rules! doc_comment {
    ($doc:expr, $($tt:tt)*) => {
        #[doc = $doc]
        $($tt)*
    };
}

/// Implements `core::fmt::Debug` and `serde::{Serialize, Deserialize}` (when serde
/// feature is enabled) for atomic bool, integer, or float.
macro_rules! impl_debug_and_serde {
    ($atomic_type:ident) => {
        impl fmt::Debug for $atomic_type {
            #[allow(clippy::missing_inline_in_public_items)] // fmt is not hot path
            fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                // std atomic types use Relaxed in Debug::fmt: https://github.com/rust-lang/rust/blob/1.69.0/library/core/src/sync/atomic.rs#L2023
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
