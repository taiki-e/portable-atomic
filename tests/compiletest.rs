#![cfg(not(miri))]
#![cfg(not(valgrind))]
#![cfg(any(all(target_arch = "aarch64", target_endian = "little"), target_arch = "x86_64"))]
#![cfg(feature = "generic")]
#![cfg(feature = "derive")]
#![warn(rust_2018_idioms, single_use_lifetimes)]

use std::env;

#[rustversion::attr(not(nightly), ignore)]
#[test]
fn ui() {
    if env::var_os("CI").is_none() {
        env::set_var("TRYBUILD", "overwrite");
    }

    let t = trybuild::TestCases::new();
    t.compile_fail("tests/ui/**/*.rs");
}
