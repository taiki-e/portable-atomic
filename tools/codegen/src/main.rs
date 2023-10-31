// SPDX-License-Identifier: Apache-2.0 OR MIT

#![allow(
    clippy::enum_glob_use,
    clippy::match_on_vec_items,
    clippy::needless_pass_by_value,
    clippy::unnecessary_wraps,
    clippy::wildcard_imports
)]

#[cfg(unix)]
#[macro_use]
mod file;

#[cfg(unix)]
mod ffi;

use anyhow::Result;

fn main() -> Result<()> {
    #[cfg(unix)]
    ffi::gen()?;
    Ok(())
}
