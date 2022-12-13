// The rustc-cfg emitted by the build script are *not* public API.

#![warn(rust_2018_idioms, single_use_lifetimes)]

#[path = "version.rs"]
mod version;
use version::{rustc_version, Version};

use std::{env, str};

include!("no_atomic.rs");

fn main() {
    println!("cargo:rerun-if-changed=build.rs");
    println!("cargo:rerun-if-changed=no_atomic.rs");
    println!("cargo:rerun-if-changed=version.rs");

    let target = &*env::var("TARGET").expect("TARGET not set");
    let target_arch = &*env::var("CARGO_CFG_TARGET_ARCH").expect("CARGO_CFG_TARGET_ARCH not set");
    let target_os = &*env::var("CARGO_CFG_TARGET_OS").expect("CARGO_CFG_TARGET_OS not set");
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
    // underscore_const_names stabilized in Rust 1.37 (nightly-2019-06-18): https://github.com/rust-lang/rust/pull/61347
    if !version.probe(37, 2019, 6, 17) {
        println!("cargo:rustc-cfg=portable_atomic_no_underscore_consts");
    }
    // atomic_min_max stabilized in Rust 1.45 (nightly-2020-05-30): https://github.com/rust-lang/rust/pull/72324
    if !version.probe(45, 2020, 5, 29) {
        println!("cargo:rustc-cfg=portable_atomic_no_atomic_min_max");
    }
    // track_caller stabilized in Rust 1.46 (nightly-2020-07-02): https://github.com/rust-lang/rust/pull/72445
    if !version.probe(46, 2020, 7, 1) {
        println!("cargo:rustc-cfg=portable_atomic_no_track_caller");
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
    let no_asm = !version.probe(59, 2021, 12, 15);
    if no_asm {
        println!("cargo:rustc-cfg=portable_atomic_no_asm");
    }
    // aarch64_target_feature stabilized in Rust 1.61 (nightly-2022-03-16): https://github.com/rust-lang/rust/pull/90621
    if !version.probe(61, 2022, 3, 15) {
        println!("cargo:rustc-cfg=portable_atomic_no_aarch64_target_feature");
    }
    // https://github.com/rust-lang/rust/pull/98383 merged in Rust 1.64 (nightly-2022-07-19).
    if !version.probe(64, 2022, 7, 18) {
        println!("cargo:rustc-cfg=portable_atomic_no_stronger_failure_ordering");
    }

    // feature(cfg_target_has_atomic) stabilized in Rust 1.60 (nightly-2022-02-11): https://github.com/rust-lang/rust/pull/93824
    if !version.probe(60, 2022, 2, 10) {
        if version.nightly && is_allowed_feature("cfg_target_has_atomic") {
            // This feature has not been changed since the change in nightly-2019-10-14
            // until it was stabilized in nightly-2022-02-11, so it can be safely enabled in
            // nightly, which is older than nightly-2022-02-11.
            println!("cargo:rustc-cfg=portable_atomic_unstable_cfg_target_has_atomic");
        } else {
            let target = &*convert_custom_linux_target(target);
            println!("cargo:rustc-cfg=portable_atomic_no_cfg_target_has_atomic");
            if NO_ATOMIC_CAS.contains(&target) {
                println!("cargo:rustc-cfg=portable_atomic_no_atomic_cas");
            }
            if NO_ATOMIC_64.contains(&target) {
                println!("cargo:rustc-cfg=portable_atomic_no_atomic_64");
            } else {
                // Otherwise, assuming `"max-atomic-width" == 64` or `"max-atomic-width" == 128`.
            }
        }
    }
    // We don't need to use convert_custom_linux_target here because all linux targets have atomics.
    if NO_ATOMIC.contains(&target) {
        println!("cargo:rustc-cfg=portable_atomic_no_atomic_load_store");
    }

    if version.nightly {
        println!("cargo:rustc-cfg=portable_atomic_nightly");

        // https://github.com/rust-lang/rust/pull/97423 merged in Rust 1.64 (nightly-2022-06-30).
        if version.probe(64, 2022, 6, 29) {
            println!("cargo:rustc-cfg=portable_atomic_new_atomic_intrinsics");
        }
        // https://github.com/rust-lang/rust/pull/96935 merged in Rust 1.64 (nightly-2022-07-07).
        if version.probe(64, 2022, 7, 6) {
            println!("cargo:rustc-cfg=portable_atomic_unstable_strict_provenance_atomic_ptr");
        }
        // feature(isa_attribute) stabilized in Rust 1.67 (nightly-2022-11-06): https://github.com/rust-lang/rust/pull/102458
        if !version.probe(67, 2022, 11, 5) {
            println!("cargo:rustc-cfg=portable_atomic_unstable_isa_attribute");
        }

        // `cfg(sanitize = "..")` is not stabilized.
        let sanitize = env::var("CARGO_CFG_SANITIZE").unwrap_or_default();
        if sanitize.contains("thread") {
            // Most kinds of sanitizers are not compatible with asm
            // (https://github.com/google/sanitizers/issues/192),
            // but it seems that ThreadSanitizer is the only one that can cause
            // false positives in our code.
            println!("cargo:rustc-cfg=portable_atomic_sanitize_thread");
        }

        if version.llvm >= 15 {
            println!("cargo:rustc-cfg=portable_atomic_llvm15");
        }
        if !no_asm
            && (target_arch == "powerpc64" || target_arch == "s390x")
            && is_allowed_feature("asm_experimental_arch")
        {
            println!("cargo:rustc-cfg=portable_atomic_asm_experimental_arch");
        }
    }

    match target_arch {
        "x86_64" => {
            // x86_64 macos always support CMPXCHG16B: https://github.com/rust-lang/rust/blob/1.63.0/compiler/rustc_target/src/spec/x86_64_apple_darwin.rs#L7
            let has_cmpxchg16b = target_os == "macos";
            // LLVM recognizes this also as cx16 target feature: https://godbolt.org/z/o4Y8W1hcb
            // It is unlikely that rustc will support that name, so we will ignore it for now.
            target_feature_if("cmpxchg16b", has_cmpxchg16b, &version, None, true);
            if version.nightly
                && cfg!(feature = "fallback")
                && cfg!(feature = "outline-atomics")
                && is_allowed_feature("cmpxchg16b_target_feature")
            {
                println!("cargo:rustc-cfg=portable_atomic_cmpxchg16b_dynamic");
            }
        }
        "aarch64" => {
            // aarch64 macos always support FEAT_LSE and FEAT_LSE2 because it is armv8.6: https://github.com/rust-lang/rust/blob/1.63.0/compiler/rustc_target/src/spec/aarch64_apple_darwin.rs#L5
            let is_macos = target_os == "macos";
            // aarch64_target_feature stabilized in Rust 1.61.
            target_feature_if("lse", is_macos, &version, Some(61), true);
            // As of rustc 1.63, target_feature "lse2" is not available on rustc side:
            // https://github.com/rust-lang/rust/blob/1.63.0/compiler/rustc_codegen_ssa/src/target_features.rs#L45
            target_feature_if("lse2", is_macos, &version, None, false);
        }
        "arm" => {
            // #[cfg(target_feature = "v7")] and others don't work on stable.
            // armv7-unknown-linux-gnueabihf
            //    ^^
            let mut subarch =
                strip_prefix(target, "arm").or_else(|| strip_prefix(target, "thumb")).unwrap();
            subarch = subarch.split('-').next().unwrap(); // ignore vender/os/env
            subarch = subarch.split('.').next().unwrap(); // ignore .base/.main suffix
            subarch = strip_prefix(subarch, "eb").unwrap_or(subarch); // ignore endianness
            let mut known = true;
            // See https://github.com/taiki-e/atomic-maybe-uninit/blob/HEAD/build.rs for details
            match subarch {
                "v7" | "v7a" | "v7neon" | "v7s" | "v7k" => target_feature("aclass"),
                "v6m" | "v7em" | "v7m" | "v8m" => target_feature("mclass"),
                "v7r" => target_feature("rclass"),
                // arm-linux-androideabi is v5te
                // https://github.com/rust-lang/rust/blob/1.63.0/compiler/rustc_target/src/spec/arm_linux_androideabi.rs#L11-L12
                _ if target == "arm-linux-androideabi" => subarch = "v5te",
                // v6 targets other than v6m don't have *class target feature.
                "" | "v6" | "v6k" => subarch = "v6",
                // Other targets don't have *class target feature.
                "v4t" | "v5te" => {}
                _ => {
                    known = false;
                    println!(
                        "cargo:warning={}: unrecognized arm subarch: {}",
                        env!("CARGO_PKG_NAME"),
                        target
                    );
                }
            }
            if known
                && (subarch.starts_with("v6")
                    || subarch.starts_with("v7")
                    || subarch.starts_with("v8"))
            {
                target_feature("v6");
            }
        }
        "powerpc64" => {
            let target_endian =
                env::var("CARGO_CFG_TARGET_ENDIAN").expect("CARGO_CFG_TARGET_ENDIAN not set");
            // powerpc64le is pwr8+ by default https://github.com/llvm/llvm-project/blob/llvmorg-15.0.0/llvm/lib/Target/PowerPC/PPC.td#L652
            // See also https://github.com/rust-lang/rust/issues/59932
            let mut has_pwr8_features = target_endian == "little";
            // https://github.com/llvm/llvm-project/commit/549e118e93c666914a1045fde38a2cac33e1e445
            if let Some(cpu) = target_cpu().as_ref() {
                if let Some(mut cpu_version) = strip_prefix(cpu, "pwr") {
                    cpu_version = strip_suffix(cpu_version, "x").unwrap_or(cpu_version); // for pwr5x and pwr6x
                    if let Ok(cpu_version) = cpu_version.parse::<u32>() {
                        has_pwr8_features = cpu_version >= 8;
                    }
                } else {
                    // https://github.com/llvm/llvm-project/blob/llvmorg-15.0.0/llvm/lib/Target/PowerPC/PPC.td#L652
                    // https://github.com/llvm/llvm-project/blob/llvmorg-15.0.0/llvm/lib/Target/PowerPC/PPC.td#L434-L436
                    has_pwr8_features = cpu == "ppc64le" || cpu == "future";
                }
            }
            // lqarx and stqcx.
            target_feature_if("quadword-atomics", has_pwr8_features, &version, None, false);
        }
        _ => {}
    }
}

fn target_feature(name: &str) {
    println!("cargo:rustc-cfg=portable_atomic_target_feature=\"{}\"", name);
}

fn target_feature_if(
    name: &str,
    mut has_target_feature: bool,
    version: &Version,
    stabilized: Option<u32>,
    is_in_rustc: bool,
) {
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
        // In this case, cfg(target_feature = "...") would work, so skip emitting our own target_feature cfg.
        return;
    } else if let Some(rustflags) = env::var_os("CARGO_ENCODED_RUSTFLAGS") {
        for mut flag in rustflags.to_string_lossy().split('\x1f') {
            flag = strip_prefix(flag, "-C").unwrap_or(flag);
            if let Some(flag) = strip_prefix(flag, "target-feature=") {
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
    if has_target_feature {
        target_feature(name);
    }
}

fn target_cpu() -> Option<String> {
    let rustflags = env::var_os("CARGO_ENCODED_RUSTFLAGS")?;
    let rustflags = rustflags.to_string_lossy();
    let mut cpu = None;
    for mut flag in rustflags.split('\x1f') {
        flag = strip_prefix(flag, "-C").unwrap_or(flag);
        if let Some(flag) = strip_prefix(flag, "target-cpu=") {
            cpu = Some(flag);
        }
    }
    cpu.map(str::to_owned)
}

fn is_allowed_feature(name: &str) -> bool {
    if let Some(rustflags) = env::var_os("CARGO_ENCODED_RUSTFLAGS") {
        for mut flag in rustflags.to_string_lossy().split('\x1f') {
            flag = strip_prefix(flag, "-Z").unwrap_or(flag);
            if let Some(flag) = strip_prefix(flag, "allow-features=") {
                return flag.split(',').any(|allowed| allowed == name);
            }
        }
    }
    // allowed by default
    true
}

// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.14/build-common.rs.
//
// The target triplets have the form of 'arch-vendor-system'.
//
// When building for Linux (e.g. the 'system' part is
// 'linux-something'), replace the vendor with 'unknown'
// so that mapping to rust standard targets happens correctly.
fn convert_custom_linux_target(target: &str) -> String {
    let mut parts: Vec<&str> = target.split('-').collect();
    let system = parts.get(2);
    if system == Some(&"linux") {
        parts[1] = "unknown";
    }
    parts.join("-")
}

// str::strip_prefix requires Rust 1.45
#[must_use]
fn strip_prefix<'a>(s: &'a str, pat: &str) -> Option<&'a str> {
    if s.starts_with(pat) {
        Some(&s[pat.len()..])
    } else {
        None
    }
}
// str::strip_suffix requires Rust 1.45
#[must_use]
fn strip_suffix<'a>(s: &'a str, pat: &str) -> Option<&'a str> {
    if s.ends_with(pat) {
        Some(&s[..s.len() - pat.len()])
    } else {
        None
    }
}
