// SPDX-License-Identifier: Apache-2.0 OR MIT

// rustflags parsing used in the build script.

use std::{env, string::String, vec, vec::Vec};

// Note that this doesn't catch the target-feature/target-cpu set via target spec,
// and -Z allow-features passed via CLI (https://github.com/rust-lang/cargo/issues/17065).
pub(crate) struct Rustflags<'a> {
    // -C target-feature=...
    pub(crate) target_feature: Vec<&'a str>,
    // -C target-cpu=...
    pub(crate) target_cpu: Option<&'a str>,
    // -Z allow-features=... / CARGO_UNSTABLE_ALLOW_FEATURES
    // (is_rustflags, allow_features)
    pub(crate) allow_features: Option<(bool, &'a str)>,
}

impl<'a> Rustflags<'a> {
    pub(crate) fn new(
        rustflags: &'a str,
        cargo_unstable_allow_features: Option<&'a String>,
    ) -> Self {
        let mut target_feature = vec![];
        let mut target_cpu = None;
        // -Z allow-features=... is preferred over CARGO_UNSTABLE_ALLOW_FEATURES
        let mut allow_features = cargo_unstable_allow_features.map(|f| (false, &**f));
        let mut rustflags = rustflags.split('\x1f');
        // https://github.com/rust-lang/rust/blob/67854e511de21d881bb16426996cd4259d44aa2e/compiler/rustc_session/src/config.rs#L1978
        while let Some(mut flag) = rustflags.next() {
            // rustc supports argfile via @<path> syntax, and it is accepted within rustflags, but
            // Cargo does not support it very well, and the fact that it is accepted might not be
            // intentional, so ignore it here for now.
            // https://github.com/rust-lang/cargo/issues/17369
            if flag.as_bytes().first() != Some(&b'-') {
                continue;
            }
            let mut start = 1;
            let mut long = false;
            if flag.as_bytes().get(start) == Some(&b'-') {
                start += 1;
                long = true;
            } else {
                // Handle known short flags without value.
                while match flag.as_bytes().get(start) {
                    Some(b'g') | Some(b'O') | Some(b'v') => true,
                    _ => false,
                } {
                    start += 1;
                }
            }
            let b = match flag.as_bytes().get(start) {
                Some(&b) => b,
                None => continue,
            };
            match b {
                // -C / -Z
                b'C' | b'Z' => {
                    start += 1;
                    if flag.len() == start {
                        match rustflags.next() {
                            Some(f) => flag = f,
                            None => break,
                        }
                    } else if long {
                        if flag.as_bytes().get(start) != Some(&b'=') {
                            continue;
                        }
                        flag = &flag[start + 1..];
                    } else {
                        flag = &flag[start..];
                    }
                    if b == b'Z' {
                        if let Some(flag) = strip_flag(flag, "allow-features=", "allow_features=") {
                            // If it is specified multiple times, the last value will be preferred.
                            allow_features = Some((true, flag));
                        }
                        continue;
                    }
                }
                // Handle other known short flags with value.
                b'L' | b'l' | b'o' | b'A' | b'W' | b'D' | b'F' | b'j'
                    if flag.len() == start + 1 =>
                {
                    rustflags.next();
                    continue;
                }
                _ => {
                    if !b.is_ascii() || !long {
                        continue;
                    }
                    flag = &flag[start..];
                    // --codegen (long version of -C)
                    if let Some(f) = strip_prefix(flag, "codegen") {
                        if let Some(f) = strip_prefix(f, "=") {
                            flag = f;
                        } else if f.is_empty() {
                            match rustflags.next() {
                                Some(f) => flag = f,
                                None => break,
                            }
                        } else {
                            continue;
                        }
                    } else if flag.contains('=') {
                        continue;
                    } else {
                        // Handle other known long flags with value.
                        match flag {
                            "cfg" | "check-cfg" | "crate-type" | "crate-name" | "edition"
                            | "emit" | "print" | "out-dir" | "explain" | "target" | "allow"
                            | "warn" | "force-warn" | "deny" | "forbid" | "cap-lints"
                            | "extern" | "sysroot" | "error-format" | "json" | "color"
                            | "diagnostic-width" | "remap-path-prefix" | "remap-path-scope"
                            | "env-set" | "jobs" | "jobs-frontend" | "jobs-backend"
                            | "jobs-linker" => {
                                rustflags.next();
                            }
                            _ => {}
                        }
                        continue;
                    }
                }
            }
            if let Some(flag) = strip_flag(flag, "target-feature=", "target_feature=") {
                for s in flag.split(',') {
                    target_feature.push(s);
                }
            } else if let Some(flag) = strip_flag(flag, "target-cpu=", "target_cpu=") {
                // If it is specified multiple times, the last value will be preferred.
                target_cpu = Some(flag);
            }
        }
        Self { target_feature, target_cpu, allow_features }
    }

    pub(crate) fn is_allowed_feature(&self, name: &str) -> bool {
        // https://github.com/dtolnay/thiserror/pull/248
        if env::var_os("RUSTC_STAGE").is_some() {
            return false;
        }

        if let Some((is_rustflags, allow_features)) = self.allow_features {
            if is_rustflags {
                allow_features.split(',').any(|f| f == name)
            } else {
                // Cargo also has an unstable feature that supports another format here, but we are unable
                // to determine if it is enabled, and they said that is very experimental and is
                // unlikely to be stabilized in the current form, so ignore it here for now.
                // https://github.com/rust-lang/cargo/issues/7406
                allow_features.split(|c: char| c == ',' || c.is_whitespace()).any(|f| f == name)
            }
        } else {
            // allowed by default
            true
        }
    }
}

fn strip_flag<'a>(
    flag: &'a str,
    prefix: &'static str,
    prefix_underscored: &'static str,
) -> Option<&'a str> {
    if let Some(flag) = strip_prefix(flag, prefix) {
        return Some(flag);
    }
    // rustc accepts both -C target-feature and -C target_feature: https://godbolt.org/z/snfGeKnrv
    strip_prefix(flag, prefix_underscored)
}

// str::strip_prefix requires Rust 1.45
#[must_use]
pub(crate) fn strip_prefix<'a>(s: &'a str, pat: &str) -> Option<&'a str> {
    if s.starts_with(pat) { Some(&s[pat.len()..]) } else { None }
}
// str::strip_suffix requires Rust 1.45
#[must_use]
pub(crate) fn strip_suffix<'a>(s: &'a str, pat: &str) -> Option<&'a str> {
    if s.ends_with(pat) { Some(&s[..s.len() - pat.len()]) } else { None }
}
