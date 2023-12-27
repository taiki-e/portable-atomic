// SPDX-License-Identifier: Apache-2.0 OR MIT

// The rustc-cfg emitted by the build script are *not* public API.

// version.rs is shared with portable-atomic's build script, and portable-atomic-util only uses a part of it.
#[allow(dead_code)]
#[path = "version.rs"]
mod version;
use version::{rustc_version, Version};

use std::env;

fn main() {
    println!("cargo:rerun-if-changed=build.rs");
    println!("cargo:rerun-if-changed=version.rs");

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
    // alloc stabilized in Rust 1.36 (nightly-2019-04-15) https://github.com/rust-lang/rust/pull/59675
    if !version.probe(36, 2019, 4, 14) {
        println!("cargo:rustc-cfg=portable_atomic_no_alloc");
    }
    // Layout::{align_to,pad_to_align,extend,array} stabilized in Rust 1.44 (nightly-2020-04-22) https://github.com/rust-lang/rust/pull/69362
    if !version.probe(44, 2020, 4, 21) {
        println!("cargo:rustc-cfg=portable_atomic_no_alloc_layout_extras");
    }
    // min_const_generics stabilized in Rust 1.51 (nightly-2020-12-28): https://github.com/rust-lang/rust/pull/79135
    if !version.probe(51, 2020, 12, 27) {
        println!("cargo:rustc-cfg=portable_atomic_no_min_const_generics");
    }
    // unsafe_op_in_unsafe_fn stabilized in Rust 1.52 (nightly-2021-03-11): https://github.com/rust-lang/rust/pull/79208
    if !version.probe(52, 2021, 3, 10) {
        println!("cargo:rustc-cfg=portable_atomic_no_unsafe_op_in_unsafe_fn");
    }
    // https://github.com/rust-lang/rust/pull/84662 merged in Rust 1.56 (nightly-2021-08-02).
    if !version.probe(56, 2021, 8, 1) {
        println!("cargo:rustc-cfg=portable_atomic_no_core_unwind_safe");
    }

    if version.nightly {
        // `cfg(sanitize = "..")` is not stabilized.
        let sanitize = env::var("CARGO_CFG_SANITIZE").unwrap_or_default();
        if sanitize.contains("thread") {
            println!("cargo:rustc-cfg=portable_atomic_sanitize_thread");
        }
    }
}
