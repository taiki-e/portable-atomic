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
pub mod serde;

use core::sync::atomic::Ordering;

#[inline]
pub fn load_orderings() -> [Ordering; 3] {
    [Ordering::Relaxed, Ordering::Acquire, Ordering::SeqCst]
}
#[inline]
pub fn store_orderings() -> [Ordering; 3] {
    [Ordering::Relaxed, Ordering::Release, Ordering::SeqCst]
}
#[inline]
pub fn swap_orderings() -> [Ordering; 5] {
    [Ordering::Relaxed, Ordering::Release, Ordering::Acquire, Ordering::AcqRel, Ordering::SeqCst]
}
#[inline]
pub fn compare_exchange_orderings() -> [(Ordering, Ordering); 15] {
    [
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
    ]
}
