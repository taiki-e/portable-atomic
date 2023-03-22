use std::{env, fs, path::Path};

fn main() {
    println!("cargo:rerun-if-changed=build.rs");

    let manifest_dir = Path::new(env!("CARGO_MANIFEST_DIR"));
    for e in fs::read_dir(manifest_dir).unwrap() {
        let path = e.unwrap().path();
        if path.extension().map_or(false, |e| e == "ld" || e == "x") {
            let path = path.strip_prefix(manifest_dir).unwrap();
            println!("cargo:rerun-if-changed={}", path.to_str().unwrap());
        }
    }
}
