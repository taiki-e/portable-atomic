#![no_std]
#![warn(rust_2018_idioms, single_use_lifetimes, /* unsafe_op_in_unsafe_fn */)]

#[cfg(feature = "std")]
extern crate std;

#[cfg(feature = "std")]
#[cfg(unix)]
pub use libc;
#[cfg(feature = "std")]
#[cfg(windows)]
pub use windows_sys;

#[cfg(feature = "std")]
#[path = "gen/sys/mod.rs"]
pub mod sys;

#[cfg(feature = "std")]
pub mod cpuinfo;
#[cfg(feature = "std")]
mod critical_section_std;
#[cfg(feature = "std")]
mod once_lock;
#[cfg(feature = "std")]
pub mod serde;

use core::sync::atomic::Ordering;

pub const LOAD_ORDERINGS: [Ordering; 3] = [Ordering::Relaxed, Ordering::Acquire, Ordering::SeqCst];
pub const STORE_ORDERINGS: [Ordering; 3] = [Ordering::Relaxed, Ordering::Release, Ordering::SeqCst];
pub const SWAP_ORDERINGS: [Ordering; 5] =
    [Ordering::Relaxed, Ordering::Release, Ordering::Acquire, Ordering::AcqRel, Ordering::SeqCst];
pub const COMPARE_EXCHANGE_ORDERINGS: [(Ordering, Ordering); 15] = [
    (Ordering::Relaxed, Ordering::Relaxed),
    (Ordering::Relaxed, Ordering::Acquire),
    (Ordering::Relaxed, Ordering::SeqCst),
    (Ordering::Acquire, Ordering::Relaxed),
    (Ordering::Acquire, Ordering::Acquire),
    (Ordering::Acquire, Ordering::SeqCst),
    (Ordering::Release, Ordering::Relaxed),
    (Ordering::Release, Ordering::Acquire),
    (Ordering::Release, Ordering::SeqCst),
    (Ordering::AcqRel, Ordering::Relaxed),
    (Ordering::AcqRel, Ordering::Acquire),
    (Ordering::AcqRel, Ordering::SeqCst),
    (Ordering::SeqCst, Ordering::Relaxed),
    (Ordering::SeqCst, Ordering::Acquire),
    (Ordering::SeqCst, Ordering::SeqCst),
];
pub const FENCE_ORDERINGS: [Ordering; 4] =
    [Ordering::Release, Ordering::Acquire, Ordering::AcqRel, Ordering::SeqCst];

// For -C panic=abort -Z panic_abort_tests: https://github.com/rust-lang/rust/issues/67650
#[cfg(feature = "std")]
#[rustversion::since(1.60)] // cfg!(panic) requires Rust 1.60
pub fn is_panic_abort() -> bool {
    cfg!(panic = "abort")
}
#[cfg(feature = "std")]
#[rustversion::before(1.60)] // cfg!(panic) requires Rust 1.60
pub fn is_panic_abort() -> bool {
    false
}
