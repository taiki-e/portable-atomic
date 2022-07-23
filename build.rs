// The rustc-cfg emitted by the build script are *not* public API.

#![warn(rust_2018_idioms, single_use_lifetimes)]

use std::{env, str};

include!("no_atomic.rs");

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
    let target_arch = match env::var("CARGO_CFG_TARGET_ARCH") {
        Ok(target_arch) => target_arch,
        Err(e) => {
            println!(
                "cargo:warning={}: unable to get CARGO_CFG_TARGET_ARCH environment variable: {}",
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
    // as of 1.62.0-nightly, specifying it as rerun-if-env-changed does not work.
    println!("cargo:rerun-if-env-changed=CARGO_ENCODED_RUSTFLAGS");
    println!("cargo:rerun-if-env-changed=RUSTFLAGS");
    println!("cargo:rerun-if-env-changed=CARGO_BUILD_RUSTFLAGS");
    let mut target_upper = target.replace(|c: char| c == '-' || c == '.', "_");
    target_upper.make_ascii_uppercase();
    println!("cargo:rerun-if-env-changed=CARGO_TARGET_{}_RUSTFLAGS", target_upper);

    let version = match rustc_version() {
        Some(version) => version,
        None => {
            println!(
                "cargo:warning={}: unable to determine rustc version; assuming rustc 1.{}",
                env!("CARGO_PKG_NAME"),
                Version::LATEST.minor
            );
            Version::LATEST
        }
    };

    // Note that this is `no_`*, not `has_*`. This allows treating as the latest
    // stable rustc is used when the build script doesn't run. This is useful
    // for non-cargo build systems that don't run the build script.
    // underscore_const_names stabilized in Rust 1.37 (nightly-2019-06-18): https://github.com/rust-lang/rust/pull/61347
    if !version.probe(37, 2019, 6, 17) {
        println!("cargo:rustc-cfg=portable_atomic_no_underscore_consts");
    }
    // atomic_min_max stabilized in Rust 1.45 (nightly-2020-05-30): https://github.com/rust-lang/rust/pull/72324
    if !version.probe(45, 2020, 5, 29) {
        println!("cargo:rustc-cfg=portable_atomic_no_atomic_min_max");
    }
    // unsafe_op_in_unsafe_fn stabilized in Rust 1.52 (nightly-2021-03-11): https://github.com/rust-lang/rust/pull/79208
    if !version.probe(52, 2021, 3, 10) {
        println!("cargo:rustc-cfg=portable_atomic_no_unsafe_op_in_unsafe_fn");
    }
    // https://github.com/rust-lang/rust/pull/84662 merged in Rust 1.56 (nightly-2021-08-02).
    if !version.probe(56, 2021, 8, 1) {
        println!("cargo:rustc-cfg=portable_atomic_no_core_unwind_safe");
    }
    // asm stabilized in Rust 1.59 (nightly-2021-12-16): https://github.com/rust-lang/rust/pull/91728
    if !version.probe(59, 2021, 12, 15) {
        println!("cargo:rustc-cfg=portable_atomic_no_asm");
    }
    // aarch64_target_feature stabilized in Rust 1.61 (nightly-2022-03-16): https://github.com/rust-lang/rust/pull/90621
    if !version.probe(61, 2022, 3, 15) {
        println!("cargo:rustc-cfg=portable_atomic_no_aarch64_target_feature");
    }
    // https://github.com/rust-lang/rust/pull/98383 merged in Rust 1.64 (nightly-2022-07-19).
    if version.probe(64, 2022, 7, 18) {
        // TODO: invert cfg once Rust 1.64 became stable.
        println!("cargo:rustc-cfg=portable_atomic_core_stronger_failure_ordering");
    }

    // feature(cfg_target_has_atomic) stabilized in Rust 1.60 (nightly-2022-02-11): https://github.com/rust-lang/rust/pull/93824
    if !version.probe(60, 2022, 2, 10) {
        if version.nightly {
            println!("cargo:rustc-cfg=portable_atomic_unstable_cfg_target_has_atomic");
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
    }
    if NO_ATOMIC.contains(&&*target) {
        println!("cargo:rustc-cfg=portable_atomic_no_atomic_load_store");
    }

    if version.nightly {
        println!("cargo:rustc-cfg=portable_atomic_nightly");

        // `cfg(sanitize = "..")` is not stabilized.
        let sanitize = std::env::var("CARGO_CFG_SANITIZE").unwrap_or_default();
        if sanitize.contains("thread") {
            println!("cargo:rustc-cfg=sanitize_thread");
        }
    }

    match &*target_arch {
        "x86_64" => {
            // x86_64 macos always support cmpxchg16b: https://github.com/rust-lang/rust/blob/1.62.0/compiler/rustc_target/src/spec/x86_64_apple_darwin.rs#L7
            let is_x86_64_macos = target == "x86_64-apple-darwin";
            if has_target_feature("cmpxchg16b", is_x86_64_macos, &version, None, true) {
                target_feature("cmpxchg16b");
            }
            if version.nightly && cfg!(feature = "fallback") && cfg!(feature = "outline-atomics") {
                println!("cargo:rustc-cfg=portable_atomic_cmpxchg16b_dynamic");
            }
        }
        "aarch64" => {
            // aarch64 macos always support lse and lse2 because it is armv8.6: https://github.com/rust-lang/rust/blob/1.62.0/compiler/rustc_target/src/spec/aarch64_apple_darwin.rs#L5
            let is_aarch64_macos = target == "aarch64-apple-darwin";
            // aarch64_target_feature stabilized in Rust 1.61.
            if has_target_feature("lse", is_aarch64_macos, &version, Some(61), true) {
                target_feature("lse");
            }
            // As of rustc 1.62.0, target_feature "lse2" is not available on rustc side:
            // https://github.com/rust-lang/rust/blob/1.62.0/compiler/rustc_codegen_ssa/src/target_features.rs#L45
            if has_target_feature("lse2", is_aarch64_macos, &version, None, false) {
                target_feature("lse2");
            }
        }
        "arm" => {
            if target.starts_with("thumbv6m-") && target.contains("-none") {
                println!("cargo:rustc-cfg=portable_atomic_armv6m");
            }
            // #[cfg(target_feature = "v7")] and others don't work on stable.
            // armv7-unknown-linux-gnueabihf
            //    ^^
            let mut arch =
                target.strip_prefix("arm").or_else(|| target.strip_prefix("thumb")).unwrap();
            arch = arch.split_once('-').unwrap().0;
            arch = arch.split_once('.').unwrap_or((arch, "")).0; // ignore .base/.main suffix
            arch = arch.strip_prefix("eb").unwrap_or(arch); // ignore endianness
            let mut known = true;
            // See https://github.com/taiki-e/atomic-maybe-uninit/blob/HEAD/build.rs for details
            match arch {
                "v7" | "v7a" | "v7neon" | "v7s" | "v7k" => target_feature("aclass"),
                "v6m" | "v7em" | "v7m" | "v8m" => target_feature("mclass"),
                "v7r" => target_feature("rclass"),
                // arm-linux-androideabi is v5te
                // https://github.com/rust-lang/rust/blob/1.62.0/compiler/rustc_target/src/spec/arm_linux_androideabi.rs#L11-L12
                _ if target == "arm-linux-androideabi" => arch = "v5te",
                // v6 targets other than v6m don't have *class target feature.
                "" | "v6" | "v6k" => arch = "v6",
                // Other targets don't have *class target feature.
                "v4t" | "v5te" => {}
                _ => {
                    known = false;
                    println!(
                        "cargo:warning={}: unrecognized arm target: {}",
                        env!("CARGO_PKG_NAME"),
                        target
                    );
                }
            }
            if known && (arch.starts_with("v6") || arch.starts_with("v7") || arch.starts_with("v8"))
            {
                target_feature("v6");
            }
        }
        "powerpc64" => {
            if version.nightly && target.starts_with("powerpc64-") {
                // Only check powerpc64 (be) -- powerpc64le is pwr8+ https://github.com/llvm/llvm-project/blob/2ba5d820e2b0e5016ec706e324060a329f9a83a3/llvm/lib/Target/PowerPC/PPC.td#L652
                if let Some(cpu) = target_cpu() {
                    // https://github.com/llvm/llvm-project/commit/549e118e93c666914a1045fde38a2cac33e1e445
                    match &*cpu {
                        "pwr8" | "pwr9" | "pwr10" => {
                            target_feature("quadword-atomics");
                        }
                        _ => {}
                    }
                }
            }
        }
        _ => {}
    }
}

fn target_feature(name: &str) {
    println!("cargo:rustc-cfg=portable_atomic_target_feature=\"{}\"", name);
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
                for s in flag.split(',') {
                    // TODO: Handles cases where a specific target feature
                    // implicitly enables another target feature.
                    match (s.as_bytes().first(), s.as_bytes().get(1..)) {
                        (Some(b'+'), Some(f)) if f == name.as_bytes() => has_target_feature = true,
                        (Some(b'-'), Some(f)) if f == name.as_bytes() => has_target_feature = false,
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

mod version {
    use std::{env, process::Command, str};

    pub(crate) struct Version {
        pub(crate) minor: u32,
        pub(crate) nightly: bool,
        commit_date: Date,
    }

    impl Version {
        pub(crate) const LATEST: Self = Self::stable(62);

        const fn stable(minor: u32) -> Self {
            Self { minor, nightly: false, commit_date: Date::new(0, 0, 0) }
        }

        pub(crate) fn probe(&self, minor: u32, year: u16, month: u8, day: u8) -> bool {
            self.minor >= minor
                && (!self.nightly || self.commit_date >= Date::new(year, month, day))
        }
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

    pub(crate) fn rustc_version() -> Option<Version> {
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

        if nightly {
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
        } else {
            Some(Version::stable(minor))
        }
    }
}
use version::{rustc_version, Version};
