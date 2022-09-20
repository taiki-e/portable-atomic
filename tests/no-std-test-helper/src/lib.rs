#![no_std]
#![cfg_attr(target_os = "none", feature(panic_info_message))]

#[cfg(not(target_os = "none"))]
pub use core::prelude::v1::test;
#[cfg(target_os = "none")]
pub use no_std_test_helper_macro::test;

#[macro_use]
#[cfg(target_os = "none")]
mod api;
#[cfg(target_os = "none")]
pub use api::*;

#[cfg(target_os = "none")]
#[cfg_attr(any(target_arch = "riscv32", target_arch = "riscv64"), path = "riscv.rs")]
#[cfg_attr(all(target_arch = "arm", target_feature = "mclass"), path = "cortex-m.rs")]
mod arch;

// Not public API.
#[doc(hidden)]
pub mod __private {
    #[doc(hidden)]
    pub use core;

    #[cfg(target_os = "none")]
    #[doc(hidden)]
    pub mod arch {
        #[doc(hidden)]
        pub use crate::arch::*;
    }
}
