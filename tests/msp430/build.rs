// SPDX-License-Identifier: Apache-2.0 OR MIT

fn main() {
    println!("cargo:rerun-if-changed=build.rs");
    println!("cargo:rerun-if-changed=memory.x");
}
