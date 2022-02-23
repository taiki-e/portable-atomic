// The rustc-cfg emitted by the build script are *not* public API.

#![warn(rust_2018_idioms, single_use_lifetimes)]

use std::{
    env,
    io::Write,
    process::{Command, Stdio},
    str,
    sync::atomic::{AtomicUsize, Ordering},
};

include!("no_atomic.rs");

const PROBE_ATOMIC_128: &str = r#"
#![no_std]
#![feature(integer_atomics)]
fn _probe() {
    let v = core::sync::atomic::AtomicU128::new(0);
    let _ = v.swap(1, core::sync::atomic::Ordering::Relaxed);
}
"#;
const PROBE_CMPXCHG16B: &str = r#"
#![no_std]
#![feature(stdsimd, cmpxchg16b_target_feature)]
#[allow(unused_unsafe)]
#[target_feature(enable = "cmpxchg16b")]
unsafe fn _probe(dst: *mut u128) -> u128 {
    unsafe {
        core::arch::x86_64::cmpxchg16b(
            dst,
            0_u128,
            0_u128,
            core::sync::atomic::Ordering::Relaxed,
            core::sync::atomic::Ordering::Relaxed,
        )
    }
}
"#;

fn main() {
    println!("cargo:rerun-if-changed=no_atomic.rs");

    let target = match env::var("TARGET") {
        Ok(target) => target,
        Err(e) => {
            println!(
                "cargo:warning={}: unable to get TARGET environment variable: {}",
                env!("CARGO_PKG_NAME"),
                e
            );
            return;
        }
    };
    let version = match rustc_version() {
        Some(version) => version,
        None => {
            println!("cargo:warning={}: unable to determine rustc version", env!("CARGO_PKG_NAME"));
            return;
        }
    };

    // Note that this is `no_`*, not `has_*`. This allows treating as the latest
    // stable rustc is used when the build script doesn't run. This is useful
    // for non-cargo build systems that don't run the build script.
    if version.minor < 37 {
        println!("cargo:rustc-cfg=portable_atomic_no_underscore_consts");
    }
    if version.minor < 45 {
        println!("cargo:rustc-cfg=portable_atomic_no_atomic_min_max");
    }
    if version.minor < 52 {
        println!("cargo:rustc-cfg=portable_atomic_no_unsafe_op_in_unsafe_fn");
    }
    if version.minor < 56 {
        println!("cargo:rustc-cfg=portable_atomic_no_core_unwind_safe");
    }
    if version.minor < 59 {
        println!("cargo:rustc-cfg=portable_atomic_no_asm");
    }

    if version.minor >= 60 || version.nightly {
        println!("cargo:rustc-cfg=portable_atomic_cfg_target_has_atomic");
        // feature(cfg_target_has_atomic) stabilized in 1.60 (commit-date: 2022-02-10) https://github.com/rust-lang/rust/pull/93824
        if version.nightly
            && version.minor <= 60
            && (version.commit_date < Date { year: 2022, month: 2, day: 10 })
        {
            println!("cargo:rustc-cfg=portable_atomic_unstable_cfg_target_has_atomic");
        }
    } else {
        println!("cargo:rustc-cfg=portable_atomic_no_cfg_target_has_atomic");
    }
    if NO_ATOMIC_CAS.contains(&&*target) {
        println!("cargo:rustc-cfg=portable_atomic_no_atomic_cas");
    }
    if NO_ATOMIC.contains(&&*target) {
        println!("cargo:rustc-cfg=portable_atomic_no_atomic_64");
        println!("cargo:rustc-cfg=portable_atomic_no_atomic_load_store");
    } else if NO_ATOMIC_64.contains(&&*target) {
        println!("cargo:rustc-cfg=portable_atomic_no_atomic_64");
    } else {
        // Otherwise, assuming `"max-atomic-width" == 64` or `"max-atomic-width" == 128`.
    }

    if target.starts_with("thumbv6m-") && target.contains("-none") {
        println!("cargo:rustc-cfg=thumbv6m");
    }

    if version.nightly {
        println!("cargo:rustc-cfg=portable_atomic_nightly");
    }
    if cfg!(feature = "i128") {
        if version.nightly
            && HAS_ATOMIC_128.contains(&&*target)
            && probe(PROBE_ATOMIC_128, Some(&target)).unwrap_or(false)
        {
            println!("cargo:rustc-cfg=portable_atomic_core_atomic_128");
        } else if (version.minor >= 59 || version.nightly)
            && target.starts_with("x86_64-")
            && (version.nightly && cfg!(feature = "i128-dynamic")
                || env::var("CARGO_CFG_TARGET_FEATURE")
                    .ok()
                    .map_or(false, |s| s.split(',').any(|s| s == "cmpxchg16b")))
        {
            // On x86_64, if cmpxchg16b is available, we can use it to provide Atomic*128.
            println!("cargo:rustc-cfg=portable_atomic_cmpxchg16b");
            if version.nightly && probe(PROBE_CMPXCHG16B, Some(&target)).unwrap_or(false) {
                println!("cargo:rustc-cfg=portable_atomic_cmpxchg16b_stdsimd");
                if cfg!(feature = "i128-dynamic") {
                    println!("cargo:rustc-cfg=portable_atomic_cmpxchg16b_dynamic");
                }
            }
        }
    }
}

struct Version {
    minor: u32,
    nightly: bool,
    commit_date: Date,
}

#[derive(PartialEq, Eq, PartialOrd, Ord)]
struct Date {
    year: u16,
    month: u8,
    day: u8,
}

fn rustc_version() -> Option<Version> {
    let rustc = env::var_os("RUSTC")?;
    // Use verbose version output because the packagers add extra strings to the normal version output.
    let output = Command::new(rustc).args(&["--version", "--verbose"]).output().ok()?;
    let output = str::from_utf8(&output.stdout).ok()?;

    let mut release = output
        .lines()
        .find(|line| line.starts_with("release: "))
        .map(|line| &line["release: ".len()..])?
        .splitn(2, '-');
    let version = release.next().unwrap();
    let channel = release.next().unwrap_or_default();
    let mut digits = version.splitn(3, '.');
    let major = digits.next()?.parse::<u32>().ok()?;
    if major != 1 {
        return None;
    }
    let minor = digits.next()?.parse::<u32>().ok()?;
    let _patch = digits.next().unwrap_or("0").parse::<u32>().ok()?;
    let nightly = channel == "nightly" || channel == "dev";

    let mut commit_date = output
        .lines()
        .find(|line| line.starts_with("commit-date: "))
        .map(|line| &line["commit-date: ".len()..])?
        .splitn(3, '-');
    let year = commit_date.next()?.parse::<u16>().ok()?;
    let month = commit_date.next()?.parse::<u8>().ok()?;
    let day = commit_date.next()?.parse::<u8>().ok()?;
    if month > 12 || day > 31 {
        return None;
    }

    Some(Version { minor, nightly, commit_date: Date { year, month, day } })
}

// Adapted from https://github.com/cuviper/autocfg/blob/1.1.0/src/lib.rs#L205-L237 and https://github.com/dtolnay/anyhow/blob/1.0.53/build.rs#L67-L102.
fn probe(code: &str, target: Option<&str>) -> Option<bool> {
    static ID: AtomicUsize = AtomicUsize::new(0);

    let rustc = env::var_os("RUSTC")?;
    let out_dir = env::var_os("OUT_DIR")?;

    let id = ID.fetch_add(1, Ordering::Relaxed);

    // Make sure to pick up Cargo rustc configuration.
    let mut cmd = if let Some(wrapper) = env::var_os("CARGO_RUSTC_WRAPPER") {
        let mut cmd = Command::new(wrapper);
        // The wrapper's first argument is supposed to be the path to rustc.
        cmd.arg(rustc);
        cmd
    } else {
        Command::new(rustc)
    };
    cmd.stderr(Stdio::null())
        .arg("--edition=2018")
        .arg("--crate-name")
        .arg(format!("portable_atomic_build{}", id))
        .arg("--crate-type=lib")
        .arg("--out-dir")
        .arg(out_dir)
        .arg("--emit=llvm-ir");

    if let Some(target) = target {
        cmd.arg("--target").arg(target);
    }

    if let Some(rustflags) = env::var_os("CARGO_ENCODED_RUSTFLAGS") {
        if !rustflags.is_empty() {
            for flag in rustflags.to_string_lossy().split('\x1f') {
                cmd.arg(flag);
            }
        }
    }

    cmd.arg("-").stdin(Stdio::piped());
    let mut child = cmd.spawn().ok()?;
    let mut stdin = child.stdin.take().expect("rustc stdin");

    stdin.write_all(code.as_bytes()).ok()?;
    drop(stdin);

    let status = child.wait().ok()?;
    Some(status.success())
}
