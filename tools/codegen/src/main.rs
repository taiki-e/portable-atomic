#![warn(rust_2018_idioms, single_use_lifetimes)]
#![allow(
    clippy::match_on_vec_items,
    clippy::needless_pass_by_value,
    clippy::single_match,
    clippy::unnecessary_wraps
)]

#[cfg(unix)]
#[macro_use]
mod file;

#[cfg(unix)]
mod ffi;
#[cfg(unix)]
mod target_spec;

use anyhow::Result;

fn main() -> Result<()> {
    #[cfg(unix)]
    ffi::gen()?;
    Ok(())
}
