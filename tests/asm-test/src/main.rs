#![allow(clippy::single_match)]

use std::{env, path::Path};

use anyhow::{bail, Result};
use duct::cmd;
use fs_err as fs;
use indexmap::{IndexMap, IndexSet};
use lexopt::prelude::*;

const DEFAULT_TARGETS: &[&str] = &[
    // riscv
    "riscv64gc-unknown-linux-gnu",
    "riscv32imc-unknown-none-elf",
    "riscv32i-unknown-none-elf",
];

fn main() -> Result<()> {
    let mut parser = lexopt::Parser::from_env();
    let mut target_triples = vec![];
    let mut target_modules = vec![];
    while let Some(arg) = parser.next()? {
        match arg {
            Short('m') => target_modules.push(parser.value()?.parse::<String>()?),
            Value(v) => target_triples.push(v.parse::<String>()?),
            Short('h') | Long("help") => {
                println!("Usage: cargo run -p asm-test -- [-m <module>]... [TARGET]...");
                return Ok(());
            }
            arg => return Err(arg.unexpected().into()),
        }
    }
    let targets = if target_triples.is_empty() {
        DEFAULT_TARGETS.to_vec()
    } else {
        target_triples.iter().map(String::as_str).collect()
    };
    let manifest_dir = Path::new(env!("CARGO_MANIFEST_DIR"));
    let outdir = &manifest_dir.join("asm");

    let file = &fs::read_to_string(manifest_dir.join("src/lib.rs"))?;
    let file = syn::parse_file(file)?;
    let crate_name = env!("CARGO_PKG_NAME").replace('-', "_");
    let mut modules: IndexMap<_, IndexSet<_>> = IndexMap::new();
    for item in file.items {
        match item {
            syn::Item::Fn(f) if matches!(f.vis, syn::Visibility::Public(..)) => {
                bail!("top-level public functions are not allowed; public functions must be in a module");
            }
            syn::Item::Mod(m) => {
                let mod_name = m.ident.to_string();
                if !target_modules.is_empty() && !target_modules.contains(&mod_name) {
                    continue;
                }
                for item in m.content.unwrap().1 {
                    match item {
                        syn::Item::Fn(f) if matches!(f.vis, syn::Visibility::Public(..)) => {
                            let path = format!("{}::{}::{}", crate_name, mod_name, f.sig.ident);
                            if let Some(v) = modules.get_mut(&mod_name) {
                                v.insert(path);
                            } else {
                                modules.insert(mod_name.clone(), indexmap::indexset![path]);
                            }
                        }
                        _ => {}
                    }
                }
            }
            _ => {}
        }
    }

    for target in targets {
        println!("{}", target);
        cmd!("rustup", "target", "add", target).stderr_capture().stdout_capture().run()?;
        let target_cfg = cmd!("rustc", "--print", "cfg", "--target", target).read()?;
        let target_cfg: Vec<_> = target_cfg.lines().collect();
        let outdir = &outdir.join(target);
        fs::create_dir_all(outdir)?;
        for (m, functions) in &modules {
            if m.contains("atomic_u128")
                && !target_cfg.contains(&"target_has_atomic_load_store=\"128\"")
                && !target.contains("x86_64")
            {
                continue;
            }
            if m.contains("atomic_u64")
                && !target_cfg.contains(&"target_has_atomic_load_store=\"64\"")
            {
                continue;
            }
            println!("  {}", m);
            let mut out = String::new();
            for func in functions {
                let mut cmd = cmd!(
                    "cargo",
                    "asm",
                    "--no-color",
                    "--lib",
                    "--no-default-features",
                    "--target",
                    target,
                    func
                );
                if target.contains("x86_64") {
                    cmd = cmd.env("RUSTFLAGS", "-C target-feature=+cmpxchg16b");
                } else {
                    cmd = cmd.env_remove("RUSTFLAGS");
                }
                let cmd = cmd.dir(manifest_dir);
                if (target.starts_with("riscv32i-") || target.starts_with("riscv32imc-"))
                    && func.ends_with("store::seq_cst")
                {
                    // store::release and store::seq_cst are the same so store::seq_cst is omitted
                    assert!(cmd.run().is_err());
                    continue;
                }
                if target.starts_with("x86_64-")
                    && (func.ends_with("load_portable_atomic::relaxed")
                        || func.ends_with("load_portable_atomic::seq_cst")
                        || func.ends_with("store_portable_atomic::release")
                        || func.ends_with("store_portable_atomic::seq_cst"))
                {
                    // the same as above case
                    assert!(cmd.run().is_err());
                    continue;
                }
                let asm = &cmd.read()?;
                if target.starts_with("arm")
                    || target.starts_with("thumb")
                    || target.starts_with("riscv") && !target.contains("linux")
                {
                    // cargo-asm has demangling bug on arm/riscv32 asm
                    let mut lines = asm.lines().peekable();
                    while let Some(line) = lines.next() {
                        assert!(!line.starts_with(' '));
                        let sym = line.strip_suffix(':').unwrap_or(line);
                        if rustc_demangle::demangle(sym).to_string() == sym {
                            out.push_str(line);
                            out.push('\n');
                            while lines.peek().map_or(false, |l| l.starts_with(' ')) {
                                out.push_str(lines.next().unwrap());
                                out.push('\n');
                            }
                        } else {
                            while lines.peek().map_or(false, |l| l.starts_with(' ')) {
                                lines.next().unwrap();
                            }
                        }
                    }
                } else {
                    out.push_str(asm);
                    out.push('\n');
                }
            }
            fs::write(outdir.join(m), out)?;
        }
    }
    Ok(())
}
