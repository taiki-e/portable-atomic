// This file is @generated by target_spec.sh.
// It is not intended for manual editing.

#![allow(non_camel_case_types)]

use serde::Deserialize;
use strum::{Display, IntoStaticStr};

#[derive(Debug, Clone, Copy, PartialEq, Eq, Deserialize, Display, IntoStaticStr)]
pub enum TargetArch {
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
    // Architectures that do not included in builtin targets.
    // See also https://github.com/rust-lang/rust/blob/1.68.0/compiler/rustc_target/src/abi/call/mod.rs#L663
    // and https://github.com/rust-lang/rust/blob/540a50df0fb23127edf0b35b0e497748e24bba1a/src/bootstrap/lib.rs#L132.
    amdgpu,
    asmjs,
    loongarch64,
    nvptx,
    spirv,
    xtensa,
}
pub use TargetArch::*;
impl TargetArch {
    pub fn as_str(self) -> &'static str {
        self.into()
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Deserialize, Display, IntoStaticStr)]
pub enum TargetOs {
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

#[derive(Debug, Clone, Copy, PartialEq, Eq, Deserialize, Display, IntoStaticStr)]
pub enum TargetEnv {
    eabihf,
    gnu,
    gnueabihf,
    msvc,
    musl,
    newlib,
    nto71,
    none,
    ohos,
    psx,
    relibc,
    sgx,
    uclibc,
    // Environments that do not included in builtin targets.
    // See also https://github.com/rust-lang/rust/blob/540a50df0fb23127edf0b35b0e497748e24bba1a/src/bootstrap/lib.rs#L130.
    libnx,
}
pub use TargetEnv::*;
impl TargetEnv {
    pub fn as_str(self) -> &'static str {
        match self {
            Self::none => "",
            _ => self.into(),
        }
    }
}
impl Default for TargetEnv {
    fn default() -> Self {
        Self::none
    }
}
