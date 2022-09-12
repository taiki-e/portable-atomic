// The rustc-cfg emitted by the build script are *not* public API.

#![warn(rust_2018_idioms, single_use_lifetimes)]

#[allow(dead_code)]
#[path = "version.rs"]
mod version;
use version::{rustc_version, Version};

use std::env;

fn main() {
    println!("cargo:rerun-if-changed=no_atomic.rs");

    let version = match rustc_version() {
        Some(version) => version,
        None => {
            println!(
                "cargo:warning={}: unable to determine rustc version; assuming latest stable rustc (1.{})",
                env!("CARGO_PKG_NAME"),
                Version::LATEST.minor
            );
            Version::LATEST
        }
    };

    // Note that this is `no_`*, not `has_*`. This allows treating as the latest
    // stable rustc is used when the build script doesn't run. This is useful
    // for non-cargo build systems that don't run the build script.
    if version.minor < 36 {
        println!("cargo:rustc-cfg=portable_atomic_no_alloc");
    }
    // raw_ref_macros stabilized in Rust 1.51 (nightly-2021-01-31) https://github.com/rust-lang/rust/pull/80886
    if !version.probe(51, 2021, 1, 30) {
        println!("cargo:rustc-cfg=portable_atomic_no_raw_ref_macros");
    }
    // unsafe_op_in_unsafe_fn stabilized in Rust 1.52 (nightly-2021-03-11): https://github.com/rust-lang/rust/pull/79208
    if !version.probe(52, 2021, 3, 10) {
        println!("cargo:rustc-cfg=portable_atomic_no_unsafe_op_in_unsafe_fn");
    }

    if version.nightly {
        // `cfg(sanitize = "..")` is not stabilized.
        let sanitize = env::var("CARGO_CFG_SANITIZE").unwrap_or_default();
        if sanitize.contains("thread") {
            println!("cargo:rustc-cfg=portable_atomic_sanitize_thread");
        }
    }
}
