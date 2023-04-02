// Run-time feature detection on aarch64 usually requires the use of
// platform APIs, and we define our own FFI bindings to those APIs.
//
// We use only one or two function(s) and a few types/constants per platform,
// but technically OS can change these APIs (unfortunately, some OSes don't care
// about breaking API/ABI between releases), so it is preferable to be able
// to detect them.
//
// See also https://github.com/rust-lang/libc/issues/570.

use std::{collections::BTreeSet, ffi::OsStr};

use anyhow::{Context as _, Result};
use camino::{Utf8Path, Utf8PathBuf};
use duct::cmd;
use fs::os::unix::fs::symlink;
use fs_err as fs;
use quote::{format_ident, quote};
use regex::Regex;

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
            "aarch64-unknown-linux-musl",
            "aarch64-linux-android",
        ],
        headers: &[
            // TODO: getauxval
            // https://github.com/bminor/glibc/blob/HEAD/misc/sys/auxv.h
            // https://repo.or.cz/uclibc-ng.git/blob/HEAD:/include/sys/auxv.h
            Header {
                // https://github.com/torvalds/linux/blob/HEAD/include/uapi/linux/auxvec.h
                path: "include/uapi/linux/auxvec.h",
                types: &[],
                vars: &["AT_HWCAP.*"],
                functions: &[],
                arch: &[],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/torvalds/linux/blob/HEAD/arch/arm64/include/uapi/asm/hwcap.h
                path: "arch/arm64/include/uapi/asm/hwcap.h",
                types: &[],
                vars: &["HWCAP.*"],
                functions: &[],
                arch: &[aarch64],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/bminor/musl/blob/HEAD/include/sys/auxv.h
                path: "musl:include/sys/auxv.h",
                types: &[],
                vars: &[],
                functions: &["getauxval"],
                arch: &[],
                os: &[linux],
                env: &["musl"],
            },
            Header {
                // https://github.com/aosp-mirror/platform_bionic/blob/HEAD/libc/include/sys/auxv.h
                path: "bionic:libc/include/sys/auxv.h",
                types: &[],
                vars: &[],
                functions: &["getauxval"],
                arch: &[],
                os: &[android],
                env: &[],
            },
            Header {
                // https://github.com/aosp-mirror/platform_bionic/blob/HEAD/libc/include/sys/system_properties.h
                path: "bionic:libc/include/sys/system_properties.h",
                types: &[],
                vars: &["PROP_VALUE_MAX"],
                functions: &["__system_property_get"],
                arch: &[aarch64],
                os: &[android],
                env: &[],
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
                arch: &[],
                os: &[],
                env: &[],
            },
        ],
    },
    Target {
        triples: &["aarch64-unknown-freebsd"],
        headers: &[
            Header {
                // https://github.com/freebsd/freebsd-src/blob/HEAD/sys/sys/auxv.h
                path: "sys/auxv.h",
                types: &[],
                vars: &[],
                functions: &["elf_aux_info"],
                arch: &[],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/freebsd/freebsd-src/blob/HEAD/sys/sys/elf_common.h
                path: "sys/elf_common.h",
                types: &[],
                vars: &["AT_HWCAP.*"],
                functions: &[],
                arch: &[],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/freebsd/freebsd-src/blob/HEAD/sys/arm64/include/elf.h
                path: "machine/elf.h",
                types: &[],
                vars: &["HWCAP.*"],
                functions: &[],
                arch: &[aarch64],
                os: &[],
                env: &[],
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
                arch: &[],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/openbsd/src/blob/HEAD/sys/arch/arm64/include/cpu.h
                path: "machine/cpu.h",
                types: &[],
                vars: &["CPU_ID_.*"],
                functions: &[],
                arch: &[aarch64],
                os: &[],
                env: &[],
            },
        ],
    },
    Target {
        triples: &["aarch64-unknown-fuchsia"],
        headers: &[
            // TODO: zx_system_get_features
            // TODO: zx_status_t
            // https://fuchsia.googlesource.com/fuchsia/+/refs/heads/main/zircon/system/public/zircon/types.h
            Header {
                // https://fuchsia.googlesource.com/fuchsia/+/refs/heads/main/zircon/system/public/zircon/errors.h
                path: "zircon/system/public/zircon/errors.h",
                types: &[],
                vars: &["ZX_OK"],
                functions: &[],
                arch: &[],
                os: &[],
                env: &[],
            },
            Header {
                // https://fuchsia.googlesource.com/fuchsia/+/refs/heads/main/zircon/system/public/zircon/features.h
                path: "zircon/system/public/zircon/features.h",
                types: &[],
                vars: &["ZX_FEATURE_KIND_CPU", "ZX_ARM64_FEATURE_ISA_ATOMICS"],
                functions: &[],
                arch: &[aarch64],
                os: &[],
                env: &[],
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

    // If not empty, code is generated only for the specified targets.
    arch: &'static [TargetArch],
    os: &'static [TargetOs],
    env: &'static [&'static str],
}

pub(crate) fn gen() -> Result<()> {
    let workspace_root = &workspace_root();
    let download_cache_dir = &workspace_root.join("tools/codegen/tmp/cache");
    fs::create_dir_all(download_cache_dir)?;
    let out_dir = &workspace_root.join("tests/helper/src/gen/sys");
    fs::remove_dir_all(out_dir)?;
    let raw_line = file::header(function_name!());
    let raw_line = raw_line.strip_suffix("\n\n#![cfg_attr(rustfmt, rustfmt::skip)]\n").unwrap();

    let mut target_modules = vec![];
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
                target_modules.push(quote! {
                    #[cfg(all(#cfg))]
                    mod #module_name;
                    #[cfg(all(#cfg))]
                    pub use #module_name::*;
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
            let mut include;
            match target.os {
                linux | android => {
                    // https://github.com/torvalds/linux/tree/HEAD/arch
                    let arch = match target.arch {
                        aarch64 => "arm64",
                        _ => todo!("{target:?}"),
                    };
                    include = vec![src_dir.join("arch").join(arch).join("include/uapi")];
                    if target.os == android {
                        let libc_dir =
                            src_dir.join("../../aosp-mirror/platform_bionic").join("libc");
                        include.push(libc_dir.join("include"));
                        include.push(libc_dir.join("kernel/uapi/linux"));
                        include.push(libc_dir.join("kernel/uapi"));
                        include.push(libc_dir.join("kernel/android/uapi"));
                    } else if target.env.as_deref() == Some("musl") {
                        let libc_dir = src_dir.join("../../bminor/musl");
                        include.push(libc_dir.join("include"));
                    }
                }
                macos => {
                    include = vec![
                        src_dir.join("bsd"),
                        src_dir.join("EXTERNAL_HEADERS"),
                        src_dir.join("osfmk"),
                        src_dir.parent().unwrap().join("Libc/include"),
                        src_dir.parent().unwrap().join("libpthread/include"),
                    ]
                }
                freebsd | openbsd => include = vec![src_dir.join("include")],
                fuchsia => include = vec![src_dir.join("zircon/system/public")],
                _ => todo!("{target:?}"),
            }
            for include in &include {
                clang_args.push("-I");
                clang_args.push(include.as_str());
            }

            let mut files = vec![];
            for &header in headers {
                if !header.arch.is_empty() && !header.arch.contains(&target.arch) {
                    continue;
                }
                if !header.os.is_empty() && !header.os.contains(&target.os) {
                    continue;
                }
                if !header.env.is_empty()
                    && !header.env.contains(&target.env.as_deref().unwrap_or_default())
                {
                    continue;
                }

                let functions = header.functions.join("|");
                let types = header.types.join("|");
                let vars = header.vars.join("|");

                let out_file = format!(
                    "{}.rs",
                    Utf8PathBuf::from(header.path.replace(['/', ':'], "_")).file_stem().unwrap()
                );
                let out_path = out_dir.join(&out_file);

                let header_path = match target.os {
                    linux | android => {
                        if let Some(path) = header.path.strip_prefix("musl:") {
                            src_dir.join("../../bminor/musl").join(path)
                        } else if let Some(path) = header.path.strip_prefix("bionic:") {
                            src_dir.join("../../aosp-mirror/platform_bionic").join(path)
                        } else {
                            src_dir.join(header.path)
                        }
                    }
                    macos => src_dir.join("bsd").join(header.path),
                    freebsd | openbsd => src_dir.join("include").join(header.path),
                    fuchsia => src_dir.join(header.path),
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
                    .allowlist_function(&functions)
                    .allowlist_type(&types)
                    .allowlist_var(&vars)
                    .raw_line(raw_line)
                    .generate()
                    .with_context(|| format!("failed to generate for {}", header.path))?;
                bindings
                    .write_to_file(out_path)
                    .with_context(|| format!("failed to write_to_file for {}", header.path))?;

                files.push((out_file, functions, types, vars));
            }
            let mut modules = vec![];
            for (path, functions, types, vars) in &files {
                let module_name = format_ident!("{}", Utf8Path::new(path).file_stem().unwrap());
                // Only export matched names because the module may contain type def.
                let mut uses = BTreeSet::new();
                let functions = Regex::new(&format!("^({functions})$"))?;
                let types = Regex::new(&format!("^({types})$"))?;
                let vars = Regex::new(&format!("^({vars})$"))?;
                let f = syn::parse_file(&fs::read_to_string(out_dir.join(path))?)?;
                for i in f.items {
                    match i {
                        syn::Item::ForeignMod(i) => {
                            for i in i.items {
                                match i {
                                    syn::ForeignItem::Fn(i)
                                        if matches!(i.vis, syn::Visibility::Public(..))
                                            && functions.is_match(&i.sig.ident.to_string()) =>
                                    {
                                        uses.insert(format_ident!("{}", i.sig.ident));
                                    }
                                    _ => {}
                                }
                            }
                        }
                        syn::Item::Struct(i)
                            if matches!(i.vis, syn::Visibility::Public(..))
                                && types.is_match(&i.ident.to_string()) =>
                        {
                            uses.insert(format_ident!("{}", i.ident));
                        }
                        syn::Item::Type(i)
                            if matches!(i.vis, syn::Visibility::Public(..))
                                && types.is_match(&i.ident.to_string()) =>
                        {
                            uses.insert(format_ident!("{}", i.ident));
                        }
                        syn::Item::Const(i)
                            if matches!(i.vis, syn::Visibility::Public(..))
                                && vars.is_match(&i.ident.to_string()) =>
                        {
                            uses.insert(format_ident!("{}", i.ident));
                        }
                        _ => {}
                    }
                }
                modules.push(quote! {
                    mod #module_name;
                    pub use #module_name::{#(#uses),*};
                });
            }
            file::write(function_name!(), out_dir.join("mod.rs"), quote! { #(#modules)* })?;
        }
    }
    file::write(function_name!(), out_dir.join("mod.rs"), quote! {
        #![allow(
            dead_code,
            non_camel_case_types,
            non_upper_case_globals,
            unreachable_pub,
            unused_imports,
            clippy::unreadable_literal,
        )]
        #(#target_modules)*
    })?;
    Ok(())
}

fn git_clone(target: &TargetSpec, download_cache_dir: &Utf8Path) -> Result<Utf8PathBuf> {
    fn clone(download_cache_dir: &Utf8Path, repository: &str) -> Result<Utf8PathBuf> {
        let name = repository.strip_suffix(".git").unwrap_or(repository);
        let name = name.strip_prefix("https://github.com/").unwrap_or(name);
        let name = name.replace("https://fuchsia.googlesource.com/", "fuchsia/");
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
        linux | android => {
            if target.os == android {
                clone(download_cache_dir, "https://github.com/aosp-mirror/platform_bionic.git")?;
            } else if target.env.as_deref() == Some("musl") {
                clone(download_cache_dir, "https://github.com/bminor/musl.git")?;
            }
            clone(download_cache_dir, "https://github.com/torvalds/linux.git")?
        }
        macos => {
            clone(download_cache_dir, "https://github.com/apple-oss-distributions/Libc.git")?;
            clone(download_cache_dir, "https://github.com/apple-oss-distributions/libpthread.git")?;
            clone(download_cache_dir, "https://github.com/apple-oss-distributions/xnu.git")?
        }
        freebsd => clone(download_cache_dir, "https://github.com/freebsd/freebsd-src.git")?,
        openbsd => clone(download_cache_dir, "https://github.com/openbsd/src.git")?,
        fuchsia => clone(download_cache_dir, "https://fuchsia.googlesource.com/fuchsia")?,
        _ => todo!("{target:?}"),
    };
    // TODO: remove needs of patches.
    for e in fs::read_dir("tools/codegen/patches")?.filter_map(Result::ok) {
        let path = e.path();
        if path.file_stem() == Some(OsStr::new(target.os.as_str()))
            || path.file_stem()
                == Some(OsStr::new(&format!(
                    "{}-{}",
                    target.os.as_str(),
                    target.env.as_deref().unwrap_or_default()
                )))
        {
            let dir = match target.os {
                linux | android => src_dir.parent().unwrap().parent().unwrap(),
                _ => &src_dir,
            };
            cmd!("patch", "-p1").stdin_file(fs::File::open(path)?.into_parts().0).dir(dir).run()?;
        }
    }
    Ok(src_dir)
}

// TODO: They should have a script included in their repository that does this automatically, so use it.
// https://github.com/bminor/musl/blob/HEAD/Makefile
// https://github.com/freebsd/freebsd-src/blob/HEAD/include/Makefile
// https://github.com/openbsd/src/blob/HEAD/include/Makefile
fn arch_symlink(target: &TargetSpec, src_dir: &Utf8Path) -> Result<()> {
    match target.os {
        linux | android => {
            if target.env.as_deref() == Some("musl") {
                let libc_dir = src_dir.join("../../bminor/musl");
                // https://github.com/bminor/musl/tree/HEAD/arch
                let arch = match target.arch {
                    aarch64 => "aarch64",
                    _ => todo!("{target:?}"),
                };
                for path in ["bits"] {
                    symlink(
                        libc_dir.join("arch").join(arch).join(path),
                        libc_dir.join("include").join(path),
                    )?;
                }
                let alltypes = cmd!(
                    "sed",
                    "-f",
                    libc_dir.join("tools/mkalltypes.sed"),
                    libc_dir.join("arch").join(arch).join("bits/alltypes.h.in"),
                    libc_dir.join("include/alltypes.h.in")
                )
                .read()?;
                fs::write(libc_dir.join("arch").join(arch).join("bits/alltypes.h"), alltypes)?;
            }
        }
        macos => {
            // https://github.com/apple-oss-distributions/xnu/blob/5c2921b07a2480ab43ec66f5b9e41cb872bc554f/bsd/sys/make_symbol_aliasing.sh
            // https://github.com/apple-oss-distributions/xnu/blob/5c2921b07a2480ab43ec66f5b9e41cb872bc554f/bsd/sys/make_posix_availability.sh
            fs::write(src_dir.join("bsd/sys/_symbol_aliasing.h"), "")?;
            fs::write(src_dir.join("bsd/sys/_posix_availability.h"), "")?;
        }
        freebsd => {
            // https://github.com/freebsd/freebsd-src/tree/HEAD/sys
            let arch = match target.arch {
                aarch64 => "arm64",
                _ => todo!("{target:?}"),
            };
            for path in ["sys"] {
                symlink(src_dir.join("sys").join(path), src_dir.join("include").join(path))?;
            }
            symlink(
                src_dir.join("sys").join(arch).join("include"),
                src_dir.join("include/machine"),
            )?;
        }
        openbsd => {
            // https://github.com/openbsd/src/tree/HEAD/sys/arch
            let arch = match target.arch {
                aarch64 => "arm64",
                _ => todo!("{target:?}"),
            };
            for path in ["sys", "uvm"] {
                symlink(src_dir.join("sys").join(path), src_dir.join("include").join(path))?;
            }
            symlink(
                src_dir.join("sys/arch").join(arch).join("include"),
                src_dir.join("include/machine"),
            )?;
        }
        fuchsia => {}
        _ => todo!("{target:?}"),
    }
    Ok(())
}
