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

// rustc +stable -Vv | grep -E '^(commit-date|release)'
const LATEST_STABLE: Version =
    Version { minor: 61, nightly: false, commit_date: Date::new(2022, 5, 18) };

// Probe if unstable features can be compiled with the expected API.
// This prevents accidental depends on them if the upstream changes its API.
// This is the same approach used in autocfg, anyhow, etc.
// for x86_64
const PROBE_CMPXCHG16B: &str = r#"
#![no_std]
#![feature(stdsimd, cmpxchg16b_target_feature)]
#[allow(unused_unsafe)]
#[target_feature(enable = "cmpxchg16b")]
unsafe fn _probe(dst: *mut u128) {
    unsafe {
        let _: u128 = core::arch::x86_64::cmpxchg16b(
            dst,
            0_u128,
            0_u128,
            core::sync::atomic::Ordering::Relaxed,
            core::sync::atomic::Ordering::Relaxed,
        );
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
    // HACK: If --target is specified, rustflags is not applied to the build
    // script itself, so the build script will not be rerun when these are changed.
    //
    // Ideally, the build script should be rebuilt when CARGO_ENCODED_RUSTFLAGS
    // is changed, but since it is an environment variable set by cargo,
    // as of 1.62.0-nightly, it is not useful to specify it as rerun-if-env-changed.
    println!("cargo:rerun-if-env-changed=RUSTFLAGS");
    println!("cargo:rerun-if-env-changed=CARGO_BUILD_RUSTFLAGS");
    println!(
        "cargo:rerun-if-env-changed=CARGO_TARGET_{}_RUSTFLAGS",
        target.to_uppercase().replace('-', "_").replace('.', "_")
    );

    let version = match rustc_version() {
        Some(version) => version,
        None => {
            println!(
                "cargo:warning={}: unable to determine rustc version; assuming rustc 1.{}",
                env!("CARGO_PKG_NAME"),
                LATEST_STABLE.minor
            );
            LATEST_STABLE
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
    // aarch64_target_feature stabilized in Rust 1.61 (nightly-2022-03-16).
    if version.minor >= 61 && (!version.nightly || version.commit_date >= Date::new(2022, 3, 15)) {
    } else {
        println!("cargo:rustc-cfg=portable_atomic_no_aarch64_target_feature");
    }

    if version.minor >= 60 || version.nightly {
        // feature(cfg_target_has_atomic) stabilized in Rust 1.60 (nightly-2022-02-11) https://github.com/rust-lang/rust/pull/93824
        if version.nightly && version.minor <= 60 && version.commit_date < Date::new(2022, 2, 10) {
            println!("cargo:rustc-cfg=portable_atomic_unstable_cfg_target_has_atomic");
        }
    } else {
        println!("cargo:rustc-cfg=portable_atomic_no_cfg_target_has_atomic");
        if NO_ATOMIC_CAS.contains(&&*target) {
            println!("cargo:rustc-cfg=portable_atomic_no_atomic_cas");
        }
        if NO_ATOMIC_64.contains(&&*target) {
            println!("cargo:rustc-cfg=portable_atomic_no_atomic_64");
        } else {
            // Otherwise, assuming `"max-atomic-width" == 64` or `"max-atomic-width" == 128`.
        }
    }
    if NO_ATOMIC.contains(&&*target) {
        println!("cargo:rustc-cfg=portable_atomic_no_atomic_load_store");
    }

    if target.starts_with("thumbv6m-") && target.contains("-none") {
        println!("cargo:rustc-cfg=portable_atomic_armv6m");
    }
    // #[cfg(not(target_feature = "v6"))] doesn't work on stable.
    if target.starts_with("armv5te-") {
        println!("cargo:rustc-cfg=portable_atomic_armv5te");
    }

    // aarch64 macos always support lse and lse2 because it is armv8.6: https://github.com/rust-lang/rust/blob/1.61.0/compiler/rustc_target/src/spec/aarch64_apple_darwin.rs#L5
    if target.starts_with("aarch64") && (version.minor >= 59 || version.nightly) {
        // aarch64 macos always support lse and lse2 because it is armv8.6: https://github.com/rust-lang/rust/blob/1.61.0/compiler/rustc_target/src/spec/aarch64_apple_darwin.rs#L5
        let is_aarch64_macos = target == "aarch64-apple-darwin";
        // aarch64_target_feature stabilized in Rust 1.61.
        if has_target_feature("lse", is_aarch64_macos, &version, Some(61), true) {
            println!("cargo:rustc-cfg=portable_atomic_target_feature=\"lse\"");
        }
        // As of rustc 1.61.0, target_feature "lse2" is not available on rustc side:
        // https://github.com/rust-lang/rust/blob/1.61.0/compiler/rustc_codegen_ssa/src/target_features.rs#L45
        if has_target_feature("lse2", is_aarch64_macos, &version, None, false) {
            println!("cargo:rustc-cfg=portable_atomic_target_feature=\"lse2\"");
        }
    }

    // cmpxchg16b is available via asm (1.59+) or stdsimd (nightly).
    let may_use_cmpxchg16b =
        target.starts_with("x86_64") && (version.minor >= 59 || version.nightly);
    let mut has_cmpxchg16b = false;
    if may_use_cmpxchg16b {
        // x86_64 macos always support cmpxchg16b: https://github.com/rust-lang/rust/blob/1.61.0/compiler/rustc_target/src/spec/x86_64_apple_darwin.rs#L7
        let is_x86_64_macos = target == "x86_64-apple-darwin";
        has_cmpxchg16b = has_target_feature("cmpxchg16b", is_x86_64_macos, &version, None, true);
        if has_cmpxchg16b {
            println!("cargo:rustc-cfg=portable_atomic_target_feature=\"cmpxchg16b\"");
        }
    }

    if version.nightly {
        println!("cargo:rustc-cfg=portable_atomic_nightly");

        // `cfg(sanitize = "..")` is not stabilized.
        let sanitize = std::env::var("CARGO_CFG_SANITIZE").unwrap_or_default();
        if sanitize.contains("thread") {
            println!("cargo:rustc-cfg=sanitize_thread");
        }

        if may_use_cmpxchg16b
            && (has_cmpxchg16b || cfg!(feature = "fallback") && cfg!(feature = "outline-atomics"))
            && probe(PROBE_CMPXCHG16B, &target).unwrap_or(false)
        {
            println!("cargo:rustc-cfg=portable_atomic_cmpxchg16b_stdsimd");
            if cfg!(feature = "fallback") && cfg!(feature = "outline-atomics") {
                println!("cargo:rustc-cfg=portable_atomic_cmpxchg16b_dynamic");
            }
        } else if target.starts_with("powerpc64-") {
            // Only check powerpc64 (be) -- powerpc64le is pwr8+ https://github.com/llvm/llvm-project/blob/2ba5d820e2b0e5016ec706e324060a329f9a83a3/llvm/lib/Target/PowerPC/PPC.td#L652
            if let Some(cpu) = target_cpu() {
                // https://github.com/llvm/llvm-project/commit/549e118e93c666914a1045fde38a2cac33e1e445
                match &*cpu {
                    "pwr8" | "pwr9" | "pwr10" => {
                        println!(
                            "cargo:rustc-cfg=portable_atomic_target_feature=\"quadword-atomics\""
                        );
                    }
                    _ => {}
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

impl Date {
    const fn new(year: u16, month: u8, day: u8) -> Self {
        Self { year, month, day }
    }
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

    Some(Version { minor, nightly, commit_date: Date::new(year, month, day) })
}

// Adapted from https://github.com/cuviper/autocfg/blob/1.1.0/src/lib.rs#L205-L237 and https://github.com/dtolnay/anyhow/blob/1.0.53/build.rs#L67-L102.
fn probe(code: &str, target: &str) -> Option<bool> {
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
        .arg("--emit=llvm-ir")
        .arg("--cap-lints=warn");

    cmd.arg("--target").arg(target);

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

fn has_target_feature(
    name: &str,
    mut has_target_feature: bool,
    version: &Version,
    stabilized: Option<u32>,
    is_in_rustc: bool,
) -> bool {
    // HACK: Currently, it seems that the only way to handle unstable target
    // features on the stable is to parse the `-C target-feature` in RUSTFLAGS.
    //
    // - #[cfg(target_feature = "unstable_target_feature")] doesn't work on stable.
    // - CARGO_CFG_TARGET_FEATURE excludes unstable target features on stable.
    //
    // As mentioned in the [RFC2045], unstable target features are also passed to LLVM
    // (e.g., https://godbolt.org/z/8Eh3z5Wzb), so this hack works properly on stable.
    //
    // [RFC2045]: https://rust-lang.github.io/rfcs/2045-target-feature.html#backend-compilation-options
    if is_in_rustc
        && (version.nightly || stabilized.map_or(false, |stabilized| version.minor >= stabilized))
    {
        has_target_feature = env::var("CARGO_CFG_TARGET_FEATURE")
            .ok()
            .map_or(false, |s| s.split(',').any(|s| s == name));
    } else if let Some(rustflags) = env::var_os("CARGO_ENCODED_RUSTFLAGS") {
        for mut flag in rustflags.to_string_lossy().split('\x1f') {
            if flag.starts_with("-C") {
                flag = &flag["-C".len()..];
            }
            if flag.starts_with("target-feature=") {
                flag = &flag["target-feature=".len()..];
                for s in flag.split(',').filter(|s| !s.is_empty()) {
                    // TODO: Handles cases where a specific target feature
                    // implicitly enables another target feature.
                    match (s.as_bytes()[0] as char, &s.as_bytes()[1..]) {
                        ('+', f) if f == name.as_bytes() => has_target_feature = true,
                        ('-', f) if f == name.as_bytes() => has_target_feature = false,
                        _ => {}
                    }
                }
            }
        }
    }
    has_target_feature
}

fn target_cpu() -> Option<String> {
    let rustflags = env::var_os("CARGO_ENCODED_RUSTFLAGS")?;
    let rustflags = rustflags.to_string_lossy();
    let mut cpu = None;
    for mut flag in rustflags.split('\x1f') {
        if flag.starts_with("-C") {
            flag = &flag["-C".len()..];
        }
        if flag.starts_with("target-cpu=") {
            flag = &flag["target-cpu=".len()..];
            cpu = Some(flag);
        }
    }
    cpu.map(str::to_owned)
}
