// SPDX-License-Identifier: Apache-2.0 OR MIT

fn main() {
    println!(r#"cargo:rustc-check-cfg=cfg(target_arch,values("xtensa"))"#); // for helper.rs
}
