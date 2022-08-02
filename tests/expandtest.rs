#![cfg(not(miri))]
#![cfg(not(valgrind))]
#![cfg(any(all(target_arch = "aarch64", target_endian = "little"), target_arch = "x86_64"))]
#![cfg(feature = "generic")]
#![cfg(feature = "derive")]
#![warn(rust_2018_idioms, single_use_lifetimes)]

use std::{
    env,
    process::{Command, ExitStatus, Stdio},
};

const PATH: &str = "tests/expand/**/*.rs";

#[rustversion::attr(not(nightly), ignore)]
#[test]
fn expandtest() {
    let is_ci = env::var_os("CI").is_some();
    let cargo = &*env::var("CARGO").unwrap_or_else(|_| "cargo".into());
    if !has_command(&[cargo, "expand"]) || !has_command(&[cargo, "fmt"]) {
        return;
    }

    let args = &["--all-features"];
    if is_ci {
        macrotest::expand_without_refresh_args(PATH, args);
    } else {
        env::set_var("MACROTEST", "overwrite");
        macrotest::expand_args(PATH, args);
    }
}

fn has_command(command: &[&str]) -> bool {
    Command::new(command[0])
        .args(&command[1..])
        .arg("--version")
        .stdin(Stdio::null())
        .stdout(Stdio::null())
        .stderr(Stdio::null())
        .status()
        .as_ref()
        .map(ExitStatus::success)
        .unwrap_or(false)
}
