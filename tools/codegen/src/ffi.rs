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
            "aarch64_be-unknown-linux-gnu",
            "aarch64-unknown-linux-gnu_ilp32",
            "aarch64_be-unknown-linux-gnu_ilp32",
            "aarch64-unknown-linux-musl",
            "aarch64-linux-android",
        ],
        headers: &[
            // TODO: getauxval
            // https://github.com/bminor/glibc/blob/HEAD/misc/sys/auxv.h
            // https://repo.or.cz/uclibc-ng.git/blob/HEAD:/include/sys/auxv.h
            Header {
                // https://github.com/torvalds/linux/blob/HEAD/include/uapi/linux/auxvec.h
                path: "linux-headers:linux/auxvec.h",
                types: &[],
                vars: &["AT_HWCAP.*"],
                functions: &[],
                arch: &[],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/torvalds/linux/blob/HEAD/arch/arm64/include/uapi/asm/hwcap.h
                path: "linux-headers:asm/hwcap.h",
                types: &[],
                vars: &["HWCAP.*"],
                functions: &[],
                arch: &[aarch64],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/bminor/musl/blob/HEAD/include/sys/auxv.h
                path: "musl:sys/auxv.h",
                types: &[],
                vars: &[],
                functions: &["getauxval"],
                arch: &[],
                os: &[linux],
                env: &[musl],
            },
            Header {
                // https://github.com/aosp-mirror/platform_bionic/blob/HEAD/libc/include/sys/auxv.h
                path: "bionic:sys/auxv.h",
                types: &[],
                vars: &[],
                functions: &["getauxval"],
                arch: &[],
                os: &[android],
                env: &[],
            },
            Header {
                // https://github.com/aosp-mirror/platform_bionic/blob/HEAD/libc/include/sys/system_properties.h
                path: "bionic:sys/system_properties.h",
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
            Header {
                // https://fuchsia.googlesource.com/fuchsia/+/refs/heads/main/zircon/system/public/zircon/types.h
                path: "zircon/system/public/zircon/types.h",
                types: &["zx_status_t"],
                vars: &[],
                functions: &[],
                arch: &[],
                os: &[],
                env: &[],
            },
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
                vars: &["ZX_FEATURE_KIND_CPU", "ZX_ARM64_FEATURE_ISA_.*"],
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
    env: &'static [TargetEnv],
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
        for &triple in triples {
            eprintln!("\ninfo: generating bindings for {triple}");
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
                if target.env != TargetEnv::none {
                    let env = target.env.as_str();
                    cfg.extend(quote! { , target_env = #env });
                }
                let endian = target.target_endian.as_str();
                cfg.extend(quote! { , target_endian = #endian });
                let width = &target.target_pointer_width;
                cfg.extend(quote! { , target_pointer_width = #width });
                target_modules.push(quote! {
                    #[cfg(all(#cfg))]
                    mod #module_name;
                    #[cfg(all(#cfg))]
                    pub use #module_name::*;
                });
            }
            fs::create_dir_all(out_dir)?;
            let src_dir = &git_clone(target, download_cache_dir)?;
            install_headers(target, src_dir)?;

            let target_flag = &*format!("--target={triple}");
            let mut clang_args = vec![target_flag, "-nostdinc"];
            macro_rules! define {
                ($name:ident, $value:literal) => {{
                    clang_args.push(concat!("-D", stringify!($name), "=", $value));
                }};
            }
            match target.os {
                macos => {
                    // https://github.com/apple-oss-distributions/xnu/blob/5c2921b07a2480ab43ec66f5b9e41cb872bc554f/bsd/sys/cdefs.h#L512-L522
                    define!(_POSIX_C_SOURCE, "200112L");
                }
                fuchsia => {
                    define!(size_t, "unsigned long");
                }
                _ => {}
            }

            let mut files = vec![];
            for &header in headers {
                if !header.arch.is_empty() && !header.arch.contains(&target.arch) {
                    continue;
                }
                if !header.os.is_empty() && !header.os.contains(&target.os) {
                    continue;
                }
                if !header.env.is_empty() && !header.env.contains(&target.env) {
                    continue;
                }

                let functions = header.functions.join("|");
                let types = header.types.join("|");
                let vars = header.vars.join("|");
                let mut clang_args = clang_args.clone();

                let out_file = format!(
                    "{}.rs",
                    Utf8PathBuf::from(header.path.replace(['/', '-', ':'], "_"))
                        .file_stem()
                        .unwrap()
                );
                let out_path = out_dir.join(&out_file);

                let header_path;
                let include;
                match target.os {
                    linux | android => {
                        let linux_headers_dir = linux_headers_dir(target, src_dir);
                        if let Some(path) = header.path.strip_prefix("linux-headers:") {
                            header_path = linux_headers_dir.join("include").join(path);
                            include = vec![linux_headers_dir.join("include")];
                        } else if let Some(path) = header.path.strip_prefix("musl:") {
                            let musl_headers_dir = musl_headers_dir(target, src_dir);
                            header_path = musl_headers_dir.join("include").join(path);
                            include = vec![musl_headers_dir.join("include")];
                        } else if let Some(path) = header.path.strip_prefix("bionic:") {
                            let bionic_dir = bionic_dir(src_dir).join("libc");
                            header_path = bionic_dir.join("include").join(path);
                            include = vec![
                                linux_headers_dir.join("include"),
                                bionic_dir.join("include"),
                                bionic_dir.join("kernel/uapi/linux"),
                                bionic_dir.join("kernel/uapi"),
                                bionic_dir.join("kernel/android/uapi"),
                            ];
                        } else {
                            todo!("{}", header.path);
                        }
                    }
                    macos => {
                        header_path = src_dir.join("bsd").join(header.path);
                        include = vec![
                            src_dir.join("bsd"),
                            src_dir.join("EXTERNAL_HEADERS"),
                            src_dir.join("osfmk"),
                            src_dir.parent().unwrap().join("Libc/include"),
                            src_dir.parent().unwrap().join("libpthread/include"),
                        ];
                    }
                    freebsd | openbsd => {
                        header_path = src_dir.join("include").join(header.path);
                        include = vec![src_dir.join("include")];
                    }
                    fuchsia => {
                        header_path = src_dir.join(header.path);
                        include = vec![
                            src_dir.join("zircon/system/public"),
                            src_dir.join("zircon/kernel/lib/libc/include"),
                        ];
                    }
                    _ => todo!("{target:?}"),
                }
                for include in &include {
                    clang_args.push("-I");
                    clang_args.push(include.as_str());
                }

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
            // e.g., clang -E -dM -x c /dev/null -target aarch64-unknown-linux-gnu | grep __CHAR_
            let clang_defs =
                cmd!("clang", "-E", "-dM", "-x", "c", "/dev/null", "-target", &target.llvm_target)
                    .read()?;
            let c_char_type = if clang_defs.lines().any(|l| l == "#define __CHAR_UNSIGNED__ 1") {
                quote! { u8 }
            } else {
                quote! { i8 }
            };
            file::write(function_name!(), out_dir.join("mod.rs"), quote! {
                #(#modules)*
                pub type c_char = #c_char_type;
            })?;
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

// https://github.com/bminor/musl
const MUSL_REPO: &str = "bminor/musl";
// https://github.com/aosp-mirror/platform_bionic
const BIONIC_REPO: &str = "aosp-mirror/platform_bionic";
fn git_clone(target: &TargetSpec, download_cache_dir: &Utf8Path) -> Result<Utf8PathBuf> {
    fn clone(
        download_cache_dir: &Utf8Path,
        repository: &str,
        sparse_checkout: &[&str],
    ) -> Result<Utf8PathBuf> {
        let name = repository.strip_suffix(".git").unwrap_or(repository);
        let name = name.strip_prefix("https://github.com/").unwrap_or(name);
        let name = name.replace("https://fuchsia.googlesource.com/", "fuchsia/");
        let src_dir = download_cache_dir.join(name);
        if !src_dir.exists() {
            fs::create_dir_all(src_dir.parent().unwrap())?;
            if sparse_checkout.is_empty() {
                cmd!("git", "clone", "--depth", "1", repository, &src_dir).run()?;
            } else {
                cmd!(
                    "git",
                    "clone",
                    "--depth",
                    "1",
                    "--filter=tree:0",
                    "--no-checkout",
                    repository,
                    &src_dir,
                )
                .run()?;
            }
        }
        if !sparse_checkout.is_empty() {
            cmd!("git", "sparse-checkout", "init",).dir(&src_dir).run()?;
            let mut out = String::from("/*\n!/*/\n"); // always download top-level files
            out.push_str(&sparse_checkout.join("\n"));
            fs::write(src_dir.join(".git/info/sparse-checkout"), out)?;
            cmd!("git", "checkout").dir(&src_dir).stdout_capture().run()?;
        }
        cmd!("git", "clean", "-df").dir(&src_dir).stdout_capture().run()?;
        // TODO: use stash?
        cmd!("git", "checkout", ".").dir(&src_dir).stderr_capture().run()?;
        Ok(src_dir)
    }
    let src_dir = match target.os {
        linux | android => {
            if target.os == android {
                clone(download_cache_dir, &format!("https://github.com/{BIONIC_REPO}.git"), &[])?;
            } else if target.env == musl {
                clone(download_cache_dir, &format!("https://github.com/{MUSL_REPO}.git"), &[
                    "/include/",
                    "/arch/",
                    "/tools/",
                ])?;
            }
            clone(download_cache_dir, "https://github.com/torvalds/linux.git", &[
                "/include/",
                "/arch/",
                "/scripts/",
                "/tools/",
            ])?
        }
        macos => {
            clone(download_cache_dir, "https://github.com/apple-oss-distributions/Libc.git", &[])?;
            clone(
                download_cache_dir,
                "https://github.com/apple-oss-distributions/libpthread.git",
                &[],
            )?;
            clone(download_cache_dir, "https://github.com/apple-oss-distributions/xnu.git", &[])?
        }
        freebsd => clone(download_cache_dir, "https://github.com/freebsd/freebsd-src.git", &[
            "/include/",
            "/sys/",
        ])?,
        openbsd => clone(download_cache_dir, "https://github.com/openbsd/src.git", &[
            "/include/",
            "/sys/",
        ])?,
        fuchsia => clone(download_cache_dir, "https://fuchsia.googlesource.com/fuchsia", &[])?,
        _ => todo!("{target:?}"),
    };
    // TODO: remove needs of patches.
    for e in fs::read_dir("tools/codegen/patches")?.filter_map(Result::ok) {
        let path = e.path();
        if path.file_stem() == Some(OsStr::new(target.os.as_str()))
            || path.file_stem()
                == Some(OsStr::new(&format!("{}-{}", target.os.as_str(), target.env.as_str())))
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

fn linux_headers_dir(target: &TargetSpec, src_dir: &Utf8Path) -> Utf8PathBuf {
    src_dir.join("../..").join("headers").join("linux").join(linux_arch(target))
}
fn musl_headers_dir(target: &TargetSpec, src_dir: &Utf8Path) -> Utf8PathBuf {
    src_dir.join("../..").join("headers").join("musl").join(musl_arch(target))
}
fn bionic_dir(src_dir: &Utf8Path) -> Utf8PathBuf {
    src_dir.join("../..").join(BIONIC_REPO)
}

fn install_headers(target: &TargetSpec, src_dir: &Utf8Path) -> Result<()> {
    match target.os {
        linux | android => {
            let linux_arch = linux_arch(target);
            let linux_headers_dir = &linux_headers_dir(target, src_dir);
            if !linux_headers_dir.exists() {
                // https://www.kernel.org/doc/Documentation/kbuild/headers_install.txt
                cmd!(
                    "make",
                    "headers_install",
                    format!("ARCH={linux_arch}"),
                    format!("INSTALL_HDR_PATH={linux_headers_dir}"),
                )
                .dir(src_dir)
                .stdout_capture()
                .run()?;
            }
            if target.env == musl {
                let musl_arch = musl_arch(target);
                let musl_src_dir = &src_dir.join("../..").join(MUSL_REPO);
                let musl_headers_dir = &musl_headers_dir(target, src_dir);
                if !musl_headers_dir.exists() {
                    // https://github.com/bminor/musl/blob/HEAD/Makefile
                    cmd!(
                        "make",
                        "install-headers",
                        format!("ARCH={musl_arch}"),
                        format!("DESTDIR={musl_headers_dir}"),
                        "prefix=/",
                    )
                    .dir(musl_src_dir)
                    .stdout_capture()
                    .run()?;
                }
            }
        }
        macos => {
            // TODO: use https://github.com/apple-oss-distributions/xnu/blob/5c2921b07a2480ab43ec66f5b9e41cb872bc554f/Makefile?
            // https://github.com/apple-oss-distributions/xnu/blob/5c2921b07a2480ab43ec66f5b9e41cb872bc554f/bsd/sys/make_symbol_aliasing.sh
            // https://github.com/apple-oss-distributions/xnu/blob/5c2921b07a2480ab43ec66f5b9e41cb872bc554f/bsd/sys/make_posix_availability.sh
            fs::write(src_dir.join("bsd/sys/_symbol_aliasing.h"), "")?;
            fs::write(src_dir.join("bsd/sys/_posix_availability.h"), "")?;
        }
        freebsd => {
            // TODO: use https://github.com/freebsd/freebsd-src/blob/HEAD/Makefile?
            let arch = freebsd_arch(target);
            for path in ["sys"] {
                symlink(src_dir.join("sys").join(path), src_dir.join("include").join(path))?;
            }
            symlink(
                src_dir.join("sys").join(arch).join("include"),
                src_dir.join("include/machine"),
            )?;
        }
        openbsd => {
            // TODO: use https://github.com/openbsd/src/blob/HEAD/Makefile?
            let arch = openbsd_arch(target);
            for path in ["sys", "uvm"] {
                symlink(src_dir.join("sys").join(path), src_dir.join("include").join(path))?;
            }
            symlink(
                src_dir.join("sys/arch").join(arch).join("include"),
                src_dir.join("include/machine"),
            )?;
        }
        fuchsia => {}
        _ => {}
    }
    Ok(())
}

fn linux_arch(target: &TargetSpec) -> &'static str {
    // https://github.com/torvalds/linux/tree/HEAD/arch
    match target.arch {
        arm => "arm",
        aarch64 => "arm64",
        hexagon => "hexagon",
        loongarch64 => "loongarch",
        m68k => "m68k",
        mips | mips64 => "mips",
        powerpc | powerpc64 => "powerpc",
        riscv32 | riscv64 => "riscv",
        s390x => "s390",
        sparc | sparc64 => "sparc",
        x86 | x86_64 => "x86",
        xtensa => "xtensa",
        _ => todo!("{target:?}"),
    }
}
fn musl_arch(target: &TargetSpec) -> &'static str {
    // https://github.com/bminor/musl/tree/HEAD/arch
    match target.arch {
        aarch64 => "aarch64",
        arm => "arm",
        x86 => "i386",
        m68k => "m68k",
        mips => "mips",
        mips64 if target.target_pointer_width == "64" => "mips64",
        mips64 if target.target_pointer_width == "32" => "mipsn32",
        powerpc => "powerpc",
        powerpc64 => "powerpc64",
        riscv64 => "riscv64",
        s390x => "s390x",
        x86_64 if target.target_pointer_width == "32" => "x32",
        x86_64 if target.target_pointer_width == "64" => "x86_64",
        _ => todo!("{target:?}"),
    }
}
fn freebsd_arch(target: &TargetSpec) -> &'static str {
    // https://github.com/freebsd/freebsd-src/tree/HEAD/sys
    match target.arch {
        aarch64 => "arm64",
        powerpc | powerpc64 => "powerpc",
        _ => todo!("{target:?}"),
    }
}
fn openbsd_arch(target: &TargetSpec) -> &'static str {
    // https://github.com/openbsd/src/tree/HEAD/sys/arch
    match target.arch {
        aarch64 => "arm64",
        powerpc64 => "powerpc64",
        _ => todo!("{target:?}"),
    }
}
