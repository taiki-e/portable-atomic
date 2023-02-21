// Run-time feature detection on aarch64 usually requires the use of
// platform APIs, and we define our own FFI bindings to those APIs.
//
// We use only one or two function(s) and a few types/constants per platform,
// but technically OS can change these APIs (unfortunately, some operating
// systems don't care about breaking API/ABI between releases), so it is
// preferable to be able to detect them.
//
// See also https://github.com/rust-lang/libc/issues/570.

use std::ffi::OsStr;

use anyhow::{Context as _, Result};
use camino::{Utf8Path, Utf8PathBuf};
use duct::cmd;
use fs_err as fs;
use quote::{format_ident, quote};

use crate::{
    file::{self, workspace_root},
    target_spec::*,
};

#[rustfmt::skip]
static TARGETS: &[Target] = &[
    Target {
        triples: &[
            "aarch64-unknown-linux-gnu",
            "aarch64-unknown-linux-gnu_ilp32",
            "aarch64-linux-android",
        ],
        headers: &[
            // TODO: getauxval
            // https://github.com/bminor/glibc/blob/HEAD/misc/sys/auxv.h
            // https://github.com/bminor/musl/blob/HEAD/include/sys/auxv.h
            // https://repo.or.cz/uclibc-ng.git/blob/HEAD:/include/sys/auxv.h
            // https://android.googlesource.com/platform/bionic/+/refs/heads/master/libc/include/sys/auxv.h
            // https://github.com/picolibc/picolibc/blob/HEAD/newlib/libc/picolib/getauxval.c
            // TODO(android): __system_property_get, PROP_VALUE_MAX
            Header {
                // https://github.com/torvalds/linux/blob/HEAD/include/uapi/linux/auxvec.h
                path: "include/uapi/linux/auxvec.h",
                types: &[],
                vars: &["AT_HWCAP"],
                functions: &[],
            },
            Header {
                // https://github.com/torvalds/linux/blob/HEAD/arch/arm64/include/uapi/asm/hwcap.h
                path: "arch/arm64/include/uapi/asm/hwcap.h",
                types: &[],
                vars: &["HWCAP_ATOMICS", "HWCAP_CPUID", "HWCAP_USCAT"],
                functions: &[],
            },
        ],
    },
    Target {
        triples: &["aarch64-apple-darwin"],
        headers: &[
            Header {
                // https://github.com/apple-oss-distributions/xnu/blob/HEAD/bsd/sys/sysctl.h
                path: "sys/sysctl.h",
                types: &[],
                vars: &[],
                functions: &["sysctlbyname"],
            },
        ],
    },
    Target {
        triples: &["aarch64-unknown-openbsd"],
        headers: &[
            Header {
                // https://github.com/openbsd/src/blob/HEAD/sys/sys/sysctl.h
                path: "sys/sysctl.h",
                types: &[],
                vars: &["CTL_MACHDEP"],
                functions: &["sysctl"],
            },
            Header {
                // https://github.com/openbsd/src/blob/HEAD/sys/arch/arm64/include/cpu.h
                path: "machine/cpu.h",
                types: &[],
                vars: &["CPU_ID_.*"],
                functions: &[],
            },
        ],
    },
];

#[derive(Clone, Copy)]
struct Target {
    triples: &'static [&'static str],
    headers: &'static [Header],
}

#[derive(Clone, Copy)]
struct Header {
    path: &'static str,
    types: &'static [&'static str],
    vars: &'static [&'static str],
    functions: &'static [&'static str],
}

pub(crate) fn gen() -> Result<()> {
    let workspace_root = &workspace_root();
    let download_cache_dir = &workspace_root.join("tools/codegen/tmp/cache");
    fs::create_dir_all(download_cache_dir)?;
    let out_dir = &workspace_root.join("src/tests/gen/sys");
    let raw_line = file::header(function_name!());
    let raw_line = raw_line.strip_suffix("\n\n#![cfg_attr(rustfmt, rustfmt::skip)]\n").unwrap();

    let mut modules = vec![];
    for &Target { triples, headers } in TARGETS {
        for triple in triples {
            let target = &target_spec_json(triple)?;
            let module_name = triple.replace("-unknown", "").replace('-', "_");
            let out_dir = &out_dir.join(&module_name);
            {
                let module_name = format_ident!("{}", module_name);
                let mut cfg = quote!();
                let arch = target.arch.as_str();
                cfg.extend(quote! { target_arch = #arch });
                let os = target.os.as_str();
                cfg.extend(quote! { , target_os = #os });
                if let Some(env) = &target.env {
                    cfg.extend(quote! { , target_env = #env });
                }
                if target.os == linux && matches!(target.arch, aarch64 | x86_64) {
                    let width = &target.target_pointer_width;
                    cfg.extend(quote! { , target_pointer_width = #width });
                }
                modules.push(quote! {
                    #[cfg(all(#cfg))]
                    mod #module_name;
                    #[cfg(all(#cfg))]
                    pub(crate) use #module_name::*;
                });
            }
            fs::create_dir_all(out_dir)?;
            let src_dir = &git_clone(target, download_cache_dir)?;
            arch_symlink(target, src_dir)?;

            let target_flag = &*format!("--target={triple}");
            let mut clang_args = vec![target_flag, "-nostdinc"];
            match target.os {
                macos => {
                    // https://github.com/apple-oss-distributions/xnu/blob/5c2921b07a2480ab43ec66f5b9e41cb872bc554f/bsd/sys/cdefs.h#L512-L522
                    clang_args.push("-D_POSIX_C_SOURCE=200112L");
                }
                _ => {}
            }
            let include = match target.os {
                linux | android => {
                    let arch = match target.arch {
                        aarch64 => "arm64",
                        _ => todo!("{target:?}"),
                    };
                    vec![src_dir.join("arch").join(arch).join("include/uapi")]
                }
                macos => vec![
                    src_dir.join("bsd"),
                    src_dir.join("EXTERNAL_HEADERS"),
                    src_dir.join("osfmk"),
                    src_dir.parent().unwrap().join("Libc/include"),
                    src_dir.parent().unwrap().join("libpthread/include"),
                ],
                openbsd => vec![src_dir.join("sys")],
                _ => todo!("{target:?}"),
            };
            for include in &include {
                clang_args.push("-I");
                clang_args.push(include.as_str());
            }

            let mut files = vec![];
            for &header in headers {
                let out_file = format!(
                    "{}.rs",
                    Utf8PathBuf::from(header.path.replace('/', "_")).file_stem().unwrap()
                );
                let out_path = out_dir.join(&out_file);
                files.push(out_file);

                let header_path = match target.os {
                    linux | android => src_dir.join(header.path),
                    macos => src_dir.join(format!("bsd/{}", header.path)),
                    openbsd => src_dir.join(format!("sys/{}", header.path)),
                    _ => todo!("{target:?}"),
                };

                let bindings = bindgen::builder()
                    .array_pointers_in_arguments(true)
                    .derive_debug(false)
                    .disable_header_comment()
                    .generate_comments(false)
                    .layout_tests(false)
                    .rust_target(bindgen::RustTarget::Stable_1_36)
                    .use_core()
                    .header(header_path.as_str())
                    .clang_args(&clang_args)
                    .allowlist_function(header.functions.join("|"))
                    .allowlist_type(header.types.join("|"))
                    .allowlist_var(header.vars.join("|"))
                    .raw_line(raw_line)
                    .generate()
                    .with_context(|| format!("failed to generate for {}", header.path))?;
                bindings
                    .write_to_file(out_path)
                    .with_context(|| format!("failed to write_to_file for {}", header.path))?;
            }
            let modules = files.iter().map(|path| {
                let name = format_ident!("{}", Utf8Path::new(path).file_stem().unwrap());
                quote! {
                    pub(crate) mod #name;
                }
            });
            file::write(function_name!(), out_dir.join("mod.rs"), quote! { #(#modules)* })?;
        }
    }
    file::write(function_name!(), out_dir.join("mod.rs"), quote! {
        #![allow(
            dead_code,
            non_camel_case_types,
            unreachable_pub,
            unused_imports,
            clippy::unreadable_literal,
        )]
        #(#modules)*
    })?;
    Ok(())
}

fn git_clone(target: &TargetSpec, download_cache_dir: &Utf8Path) -> Result<Utf8PathBuf> {
    fn clone(download_cache_dir: &Utf8Path, repository: &str) -> Result<Utf8PathBuf> {
        let name = repository.strip_suffix(".git").unwrap_or(repository);
        let name = name.strip_prefix("https://github.com/").unwrap_or(name);
        let src_dir = download_cache_dir.join(name);
        if src_dir.exists() {
            cmd!("git", "clean", "-df",).dir(&src_dir).run()?;
            // TODO: use stash?
            cmd!("git", "checkout", ".",).dir(&src_dir).run()?;
        } else {
            fs::create_dir_all(src_dir.parent().unwrap())?;
            // TODO: use sparse-checkout
            cmd!("git", "clone", "--depth", "1", repository, &src_dir).run()?;
        }
        Ok(src_dir)
    }
    let src_dir = match target.os {
        linux | android => clone(download_cache_dir, "https://github.com/torvalds/linux.git")?,
        macos => {
            clone(download_cache_dir, "https://github.com/apple-oss-distributions/Libc.git")?;
            clone(download_cache_dir, "https://github.com/apple-oss-distributions/libpthread.git")?;
            clone(download_cache_dir, "https://github.com/apple-oss-distributions/xnu.git")?
        }
        openbsd => clone(download_cache_dir, "https://github.com/openbsd/src.git")?,
        _ => todo!("{target:?}"),
    };
    // TODO: remove needs of patches.
    for e in fs::read_dir("tools/codegen/patches")?.filter_map(Result::ok) {
        let path = e.path();
        if path.file_stem() == Some(OsStr::new(target.os.as_str())) {
            cmd!("patch", "-p1")
                .stdin_file(fs::File::open(path)?.into_parts().0)
                .dir(&src_dir)
                .run()?;
        }
    }
    Ok(src_dir)
}

// TODO: They should have a script included in their repository that does this automatically, so use it.
fn arch_symlink(target: &TargetSpec, src_dir: &Utf8Path) -> Result<()> {
    match target.os {
        linux | android => {}
        macos => {
            // https://github.com/apple-oss-distributions/xnu/blob/xnu-8792.81.2/bsd/sys/make_symbol_aliasing.sh
            // https://github.com/apple-oss-distributions/xnu/blob/xnu-8792.81.2/bsd/sys/make_posix_availability.sh
            fs::write(src_dir.join("bsd/sys/_symbol_aliasing.h"), "")?;
            fs::write(src_dir.join("bsd/sys/_posix_availability.h"), "")?;
        }
        openbsd => {
            let arch = match target.arch {
                aarch64 => "arm64",
                _ => todo!("{target:?}"),
            };
            let link = &src_dir.join("sys/machine");
            fs::os::unix::fs::symlink(src_dir.join("sys/arch").join(arch).join("include"), link)?;
        }
        _ => todo!("{target:?}"),
    }
    Ok(())
}
