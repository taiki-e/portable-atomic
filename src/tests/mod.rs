#![allow(
    clippy::alloc_instead_of_core,
    clippy::std_instead_of_alloc,
    clippy::undocumented_unsafe_blocks,
    clippy::wildcard_imports
)]

#[macro_use]
pub(crate) mod helper;

#[cfg(feature = "serde")]
mod serde;
