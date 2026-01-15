// SPDX-License-Identifier: Apache-2.0 OR MIT

// TODO: fallback, critical-section, assume-privileged, pre-v6 arm linux with assume linux 3.1+?

use asmtest::{Revision, Tester};

#[rustfmt::skip]
#[test]
fn test() {
    let revisions = &[
        // AArch64
        Revision::new("aarch64", "aarch64-unknown-linux-gnu")
            .rustc_args(["-C", "target-feature=-outline-atomics", "--cfg", "portable_atomic_no_outline_atomics"]),
        Revision::new("aarch64_be", "aarch64_be-unknown-linux-gnu")
            .rustc_args(["-C", "target-feature=-outline-atomics", "--cfg", "portable_atomic_no_outline_atomics"]),
        Revision::new("aarch64_msvc", "aarch64-pc-windows-msvc")
            .rustc_args(["-C", "target-feature=-outline-atomics", "--cfg", "portable_atomic_no_outline_atomics"]),
        Revision::new("aarch64_lse", "aarch64-unknown-linux-gnu")
            .rustc_args(["-C", "target-feature=+lse", "--cfg", "portable_atomic_no_outline_atomics"]),
        Revision::new("aarch64_lse_msvc", "aarch64-pc-windows-msvc")
            .rustc_args(["-C", "target-feature=+lse", "--cfg", "portable_atomic_no_outline_atomics"]),
        Revision::new("aarch64_lse_lse2", "aarch64-unknown-linux-gnu")
            .rustc_args(["-C", "target-feature=+lse,+lse2"]),
        Revision::new("aarch64_lse_lse2_rcpc3", "aarch64-unknown-linux-gnu")
            .rustc_args(["-C", "target-feature=+lse,+lse2,+rcpc3"]),
        Revision::new("aarch64_lse2_lse128", "aarch64-unknown-linux-gnu")
            .rustc_args(["-C", "target-feature=+lse2,+lse128"]),
        Revision::new("aarch64_lse2_lse128_rcpc3", "aarch64-unknown-linux-gnu")
            .rustc_args(["-C", "target-feature=+lse2,+lse128,+rcpc3"]),
        // Arm64EC
        Revision::new("arm64ec", "arm64ec-pc-windows-msvc")
            .rustc_args(["-C", "target-feature=-outline-atomics", "--cfg", "portable_atomic_no_outline_atomics"]),
        // Arm
        Revision::new("armv4t_linux", "armv4t-unknown-linux-gnueabi"),
        Revision::new("armv4t_single_core", "armv4t-none-eabi")
            .rustc_args(["--cfg", "portable_atomic_unsafe_assume_single_core"]),
        Revision::new("armv4t_single_core_disable_fiq", "armv4t-none-eabi")
            .rustc_args(["--cfg", "portable_atomic_unsafe_assume_single_core", "--cfg", "portable_atomic_disable_fiq"]),
        Revision::new("armv5te_linux", "armv5te-unknown-linux-gnueabi"),
        Revision::new("armv6m_single_core", "thumbv6m-none-eabi")
            .rustc_args(["--cfg", "portable_atomic_unsafe_assume_single_core"]),
        // AVR
        Revision::new("avr", "avr-none")
            .rustc_args(["-C", "target-cpu=atmega2560"]),
        Revision::new("avr_rmw", "avr-none")
            .rustc_args(["-C", "target-cpu=atxmega384c3"]),
        // MSP430
        Revision::new("msp430", "msp430-none-elf"),
        // PowerPC64
        Revision::new("powerpc64_pwr8", "powerpc64-unknown-linux-gnu")
            .rustc_args(["-C", "target-cpu=pwr8"]),
        Revision::new("powerpc64le", "powerpc64le-unknown-linux-gnu"),
        // RISC-V
        Revision::new("riscv64im_single_core", "riscv64im-unknown-none-elf")
            .rustc_args(["--cfg", "portable_atomic_unsafe_assume_single_core"]),
        Revision::new("riscv64im_zaamo_single_core", "riscv64im-unknown-none-elf")
            .rustc_args(["-C", "target-feature=+zaamo", "--cfg", "portable_atomic_unsafe_assume_single_core"]),
        Revision::new("riscv64im_zabha_single_core", "riscv64im-unknown-none-elf")
            .rustc_args(["-C", "target-feature=+zabha", "--cfg", "portable_atomic_unsafe_assume_single_core"]),
        Revision::new("riscv64gc_zacas", "riscv64gc-unknown-linux-gnu")
            .rustc_args(["-C", "target-feature=+zacas"]),
        Revision::new("riscv32i_single_core", "riscv32i-unknown-none-elf")
            .rustc_args(["--cfg", "portable_atomic_unsafe_assume_single_core"]),
        Revision::new("riscv32i_single_core_s_mode", "riscv32i-unknown-none-elf")
            .rustc_args(["--cfg", "portable_atomic_unsafe_assume_single_core", "--cfg", "portable_atomic_s_mode"]),
        Revision::new("riscv32i_zaamo_single_core", "riscv32i-unknown-none-elf")
            .rustc_args(["-C", "target-feature=+zaamo", "--cfg", "portable_atomic_unsafe_assume_single_core"]),
        Revision::new("riscv32i_zabha_single_core", "riscv32i-unknown-none-elf")
            .rustc_args(["-C", "target-feature=+zabha", "--cfg", "portable_atomic_unsafe_assume_single_core"]),
        Revision::new("riscv32imac_zacas", "riscv32imac-unknown-none-elf")
            .rustc_args(["-C", "target-feature=+zacas"]),
        // s390x (SystemZ)
        Revision::new("s390x", "s390x-unknown-linux-gnu"),
        Revision::new("s390x_z196", "s390x-unknown-linux-gnu")
            .rustc_args(["-C", "target-cpu=z196"]),
        Revision::new("s390x_z15_no_vector", "s390x-unknown-linux-gnu")
            .rustc_args(["-C", "target-cpu=z15", "-C", "target-feature=-vector"]),
        Revision::new("s390x_z15", "s390x-unknown-linux-gnu")
            .rustc_args(["-C", "target-cpu=z15"]),
        // x86 and x86_64
        Revision::new("x86_64_cmpxchg16b", "x86_64-unknown-linux-gnu")
            .rustc_args(["-C", "target-feature=+cmpxchg16b", "--cfg", "portable_atomic_no_outline_atomics"]),
        Revision::new("x86_64_cmpxchg16b_avx", "x86_64-unknown-linux-gnu")
            .rustc_args(["-C", "target-feature=+cmpxchg16b,+avx"]),
        Revision::new("x86", "i686-unknown-linux-gnu"),
    ];
    let esp_revisions = &[
        // Xtensa
        Revision::new("xtensa_esp32s2", "xtensa-esp32s2-none-elf")
            .rustc_args(["--cfg", "portable_atomic_unsafe_assume_single_core"]),
    ];
    let revisions = if build_context::RUSTC.contains(".rustup/toolchains/esp/bin/") {
        &esp_revisions[..]
    } else {
        &revisions[..]
    };
    Tester::new()
        .cargo_args(["-Z", "build-std=core", "--features", "portable-atomic"])
        .dump(env!("CARGO_MANIFEST_DIR"), "asm/portable-atomic", revisions);
    Tester::new()
        .cargo_args(["-Z", "build-std=core", "--features", "core"])
        .dump(env!("CARGO_MANIFEST_DIR"), "asm/core", revisions);
}
