// SPDX-License-Identifier: Apache-2.0 OR MIT

#![allow(
    clippy::assigning_clones,
    clippy::collapsible_else_if,
    clippy::enum_glob_use,
    clippy::needless_pass_by_value,
    clippy::unnecessary_wraps,
    clippy::wildcard_imports
)]

#[cfg(unix)]
#[macro_use]
mod file;

#[cfg(unix)]
mod ffi;

fn main() {
    #[cfg(unix)]
    ffi::gen();
}
