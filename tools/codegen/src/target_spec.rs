use anyhow::Result;
use duct::cmd;
use serde::Deserialize;
use strum::{Display, IntoStaticStr};

pub(crate) fn target_spec_json(target: &str) -> Result<TargetSpec> {
    Ok(serde_json::from_str(
        &cmd!(
            "rustc",
            "--print",
            "target-spec-json",
            "-Z",
            "unstable-options",
            "--target",
            &target
        )
        .read()?,
    )?)
}

#[derive(Debug, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub struct TargetSpec {
    pub arch: TargetArch,
    pub env: Option<String>,
    pub os: TargetOs,
    pub target_pointer_width: String,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Deserialize, Display, IntoStaticStr)]
#[allow(non_camel_case_types)]
pub enum TargetArch {
    // Script to get the list:
    // (for target in $(rustc --print target-list); do rustc --print target-spec-json -Z unstable-options --target "${target}" | jq -r '.arch'; done) | LC_ALL=C sort -u | sed -E 's/^/    /g' | sed -E 's/$/,/g'
    aarch64,
    arm,
    avr,
    bpf,
    hexagon,
    m68k,
    mips,
    mips64,
    msp430,
    nvptx64,
    powerpc,
    powerpc64,
    riscv32,
    riscv64,
    s390x,
    sparc,
    sparc64,
    wasm32,
    wasm64,
    x86,
    x86_64,
}
pub use TargetArch::*;

impl TargetArch {
    pub fn as_str(self) -> &'static str {
        self.into()
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Deserialize, Display, IntoStaticStr)]
#[allow(non_camel_case_types)]
pub enum TargetOs {
    // Script to get the list:
    // (for target in $(rustc --print target-list); do rustc --print target-spec-json -Z unstable-options --target "${target}" | jq -r '.os'; done) | LC_ALL=C sort -u | sed -E 's/^/    /g' | sed -E 's/$/,/g' | sed -E 's/null/none/g'
    aix,
    android,
    cuda,
    dragonfly,
    emscripten,
    espidf,
    freebsd,
    fuchsia,
    haiku,
    hermit,
    horizon,
    illumos,
    ios,
    l4re,
    linux,
    macos,
    netbsd,
    nto,
    none,
    openbsd,
    psp,
    redox,
    solaris,
    solid_asp3,
    tvos,
    uefi,
    unknown,
    vita,
    vxworks,
    wasi,
    watchos,
    windows,
    xous,
}
pub use TargetOs::*;

impl TargetOs {
    pub fn as_str(self) -> &'static str {
        self.into()
    }
}

impl Default for TargetOs {
    fn default() -> Self {
        Self::none
    }
}
