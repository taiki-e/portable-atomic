// SPDX-License-Identifier: Apache-2.0 OR MIT

use std::env;

fn main() {
    println!("cargo:rerun-if-changed=build.rs");
    println!("cargo:rustc-check-cfg=cfg(armv5te,f,d)");
    println!(r#"cargo:rustc-check-cfg=cfg(target_arch,values("xtensa"))"#); // for helper.rs

    let target = &*env::var("TARGET").expect("TARGET not set");
    let target_arch = &*env::var("CARGO_CFG_TARGET_ARCH").expect("CARGO_CFG_TARGET_ARCH not set");

    if target_arch == "arm" {
        let mut subarch =
            target.strip_prefix("arm").or_else(|| target.strip_prefix("thumb")).unwrap();
        subarch = subarch.strip_prefix("eb").unwrap_or(subarch); // ignore endianness
        subarch = subarch.split('-').next().unwrap(); // ignore vender/os/env
        subarch = subarch.split('.').next().unwrap(); // ignore .base/.main suffix
        match subarch {
            "v5te" => println!("cargo:rustc-cfg=armv5te"),
            _ => {}
        }
    }
    if target_arch.starts_with("riscv") {
        let mut subarch = target.strip_prefix(target_arch).unwrap();
        subarch = subarch.split('-').next().unwrap();
        if subarch.contains('f') || subarch.contains('d') || subarch.contains('g') {
            println!("cargo:rustc-cfg=f");
            if subarch.contains('d') || subarch.contains('g') {
                println!("cargo:rustc-cfg=d");
            }
        }
    }
}
