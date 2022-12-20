fn main() {
    println!("cargo:rerun-if-changed=build.rs");
    println!("cargo:rerun-if-changed=link32.ld");
    println!("cargo:rerun-if-changed=link64.ld");
}
