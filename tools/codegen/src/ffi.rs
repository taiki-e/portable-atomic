// SPDX-License-Identifier: Apache-2.0 OR MIT

// Run-time CPU feature detection on non-x86 systems usually requires the use of
// platform APIs, and we define our own FFI bindings to those APIs.
//
// We use only one or two function(s) and a few types/constants per platform,
// but technically OS can change these APIs (unfortunately, some OSes don't care
// about breaking API/ABI between releases), so it is preferable to be able
// to detect them.
//
// See also https://github.com/rust-lang/libc/issues/570.

use std::{ffi::OsStr, process::Command};

use anyhow::{Context as _, Result};
use camino::{Utf8Path, Utf8PathBuf};
use duct::cmd;
use fs::os::unix::fs::symlink;
use fs_err as fs;
use quote::{format_ident, quote};
use regex::Regex;
use target_spec_json::{
    Arch::{self, *},
    Env::{self, *},
    Os::{self, *},
    TargetSpec,
};

use crate::file::{self, workspace_root};

#[rustfmt::skip]
static TARGETS: &[Target] = &[
    Target {
        triples: &[
            "aarch64-unknown-linux-gnu",
            "aarch64_be-unknown-linux-gnu",
            "aarch64-unknown-linux-gnu_ilp32",
            "aarch64_be-unknown-linux-gnu_ilp32",
            "aarch64-unknown-linux-musl",
            "aarch64-unknown-linux-uclibc",
            "aarch64-linux-android",
            "powerpc64-unknown-linux-gnu",
            "powerpc64le-unknown-linux-gnu",
            "powerpc64-unknown-linux-musl",
            "powerpc64le-unknown-linux-musl",
            "riscv32gc-unknown-linux-gnu",
            "riscv32gc-unknown-linux-musl",
            "riscv64gc-unknown-linux-gnu",
            "riscv64gc-unknown-linux-musl",
            "riscv64-linux-android",
        ],
        headers: &[
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
                // https://github.com/torvalds/linux/blob/HEAD/include/uapi/linux/prctl.h
                path: "linux-headers:linux/prctl.h",
                types: &[],
                vars: &["PR_GET_AUXV"],
                functions: &[],
                arch: &[],
                os: &[],
                env: &[],
            },
            Header {
                path: "linux-headers:asm/unistd.h",
                types: &[],
                vars: &["__NR_.*"],
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
                // https://github.com/torvalds/linux/blob/HEAD/arch/powerpc/include/uapi/asm/cputable.h
                path: "linux-headers:asm/cputable.h",
                types: &[],
                vars: &["PPC_FEATURE.*"],
                functions: &[],
                arch: &[powerpc64],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/torvalds/linux/blob/HEAD/arch/riscv/include/uapi/asm/hwprobe.h
                path: "linux-headers:asm/hwprobe.h",
                types: &["riscv_hwprobe"],
                vars: &["RISCV_HWPROBE_.*"],
                functions: &[],
                arch: &[riscv32, riscv64],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/bminor/glibc/blob/HEAD/misc/sys/auxv.h
                // https://github.com/bminor/musl/blob/HEAD/include/sys/auxv.h
                // https://github.com/wbx-github/uclibc-ng/blob/HEAD/include/sys/auxv.h
                // https://github.com/aosp-mirror/platform_bionic/blob/HEAD/libc/include/sys/auxv.h
                path: "sys/auxv.h",
                types: &[],
                vars: &[],
                functions: &["getauxval"],
                arch: &[],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/aosp-mirror/platform_bionic/blob/HEAD/libc/include/sys/system_properties.h
                path: "sys/system_properties.h",
                types: &[],
                vars: &["PROP_VALUE_MAX"],
                functions: &["__system_property_get"],
                arch: &[aarch64],
                os: &[android],
                env: &[],
            },
            Header {
                // https://github.com/bminor/glibc/blob/HEAD/elf/elf.h
                // https://github.com/bminor/musl/blob/HEAD/include/elf.h
                // https://github.com/wbx-github/uclibc-ng/blob/HEAD/include/elf.h
                // https://github.com/aosp-mirror/platform_bionic/blob/HEAD/libc/include/elf.h
                path: "elf.h",
                types: &["Elf32_auxv_t", "Elf64_auxv_t"],
                vars: &[],
                functions: &[],
                arch: &[],
                os: &[],
                env: &[],
            },
        ],
    },
    Target {
        triples: &[
            "aarch64-apple-darwin",
            "aarch64-apple-ios",
            "aarch64-apple-tvos",
            "aarch64-apple-visionos",
            "aarch64-apple-watchos",
            "arm64_32-apple-watchos",
        ],
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
        triples: &[
            "aarch64-unknown-freebsd",
            "powerpc64-unknown-freebsd",
            "powerpc64le-unknown-freebsd",
            "riscv64gc-unknown-freebsd",
        ],
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
                // https://github.com/freebsd/freebsd-src/blob/HEAD/sys/sys/syscall.h
                path: "sys/syscall.h",
                types: &[],
                vars: &["SYS_.*"],
                functions: &[],
                arch: &[],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/freebsd/freebsd-src/blob/HEAD/sys/sys/sysctl.h
                path: "sys/sysctl.h",
                types: &[],
                vars: &["CTL_KERN", "KERN_PROC", "KERN_PROC_AUXV"],
                functions: &["sysctl"],
                arch: &[],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/freebsd/freebsd-src/blob/HEAD/sys/sys/elf_common.h
                path: "sys/elf_common.h",
                types: &[],
                vars: &["AT_HWCAP.*", "AT_COUNT"],
                functions: &[],
                arch: &[],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/freebsd/freebsd-src/blob/HEAD/include/unistd.h
                path: "unistd.h",
                types: &[],
                vars: &[],
                functions: &["getpid"],
                arch: &[],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/freebsd/freebsd-src/blob/HEAD/sys/arm64/include/elf.h
                path: "machine/elf.h",
                types: &["Elf64_Auxinfo"],
                vars: &["HWCAP.*"],
                functions: &[],
                arch: &[aarch64],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/freebsd/freebsd-src/blob/HEAD/sys/powerpc/include/elf.h
                path: "machine/elf.h",
                types: &["Elf64_Auxinfo"],
                vars: &[],
                functions: &[],
                arch: &[powerpc64],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/freebsd/freebsd-src/blob/HEAD/sys/powerpc/include/cpu.h
                path: "machine/cpu.h",
                types: &[],
                vars: &["PPC_FEATURE.*"],
                functions: &[],
                arch: &[powerpc64],
                os: &[],
                env: &[],
            },
        ],
    },
    Target {
        triples: &[
            "aarch64-unknown-netbsd",
            "aarch64_be-unknown-netbsd",
            // "riscv64gc-unknown-netbsd",
        ],
        headers: &[
            Header {
                // https://github.com/NetBSD/src/blob/HEAD/sys/sys/sysctl.h
                path: "sys/sysctl.h",
                types: &["sysctlnode"],
                vars: &["CTL_QUERY", "SYSCTL_VERS_1"],
                functions: &["sysctl", "sysctlbyname"],
                arch: &[],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/NetBSD/src/blob/HEAD/sys/sys/syscall.h
                path: "sys/syscall.h",
                types: &[],
                vars: &["SYS_.*"],
                functions: &[],
                arch: &[],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/NetBSD/src/blob/HEAD/sys/arch/aarch64/include/armreg.h
                path: "aarch64/armreg.h",
                types: &["aarch64_sysctl_cpu_id"],
                vars: &[],
                functions: &[],
                arch: &[aarch64],
                os: &[],
                env: &[],
            },
        ],
    },
    Target {
        triples: &[
            "aarch64-unknown-openbsd",
            "powerpc64-unknown-openbsd",
            "riscv64gc-unknown-openbsd",
        ],
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
                // https://github.com/openbsd/src/blob/HEAD/sys/sys/auxv.h
                path: "sys/auxv.h",
                types: &[],
                vars: &["AT_HWCAP.*"],
                functions: &["elf_aux_info"],
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
            Header {
                // https://github.com/openbsd/src/blob/HEAD/sys/arch/arm64/include/elf.h
                path: "machine/elf.h",
                types: &[],
                vars: &["HWCAP.*"],
                functions: &[],
                arch: &[aarch64],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/openbsd/src/blob/HEAD/sys/arch/powerpc/include/elf.h
                path: "machine/elf.h",
                types: &[],
                vars: &["PPC_FEATURE.*"],
                functions: &[],
                arch: &[powerpc64],
                os: &[],
                env: &[],
            },
        ],
    },
    Target {
        triples: &[
            "aarch64-unknown-illumos",
        ],
        headers: &[
            Header {
                // https://github.com/illumos/illumos-gate/blob/HEAD/usr/src/uts/common/sys/auxv.h
                // https://github.com/richlowe/illumos-gate/blob/arm64-gate/usr/src/uts/common/sys/auxv.h
                path: "sys/auxv.h",
                types: &[],
                vars: &[],
                functions: &["getisax"],
                arch: &[],
                os: &[],
                env: &[],
            },
            Header {
                // https://github.com/richlowe/illumos-gate/blob/arm64-gate/usr/src/uts/common/sys/auxv_aarch64.h
                path: "sys/auxv_aarch64.h",
                types: &[],
                vars: &["AV_AARCH64.*"],
                functions: &[],
                arch: &[aarch64],
                os: &[],
                env: &[],
            },
        ],
    },
    Target {
        triples: &[
            "aarch64-unknown-fuchsia",
            "riscv64gc-unknown-fuchsia",
        ],
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
                vars: &["ZX_.*"],
                functions: &[],
                arch: &[],
                os: &[],
                env: &[],
            },
        ],
    },
    Target {
        triples: &["powerpc64-ibm-aix"],
        // TODO: There is no way to access to AIX headers.
        headers: &[],
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
    arch: &'static [Arch],
    os: &'static [Os],
    env: &'static [Env],
}

pub(crate) fn gen() -> Result<()> {
    let workspace_root = &workspace_root();
    let download_dir = &workspace_root.join("tools/codegen/tmp/cache");
    fs::create_dir_all(download_dir)?;
    let out_dir = &workspace_root.join("tests/helper/src/gen/sys");
    fs::remove_dir_all(out_dir)?;
    let raw_line = file::header(function_name!());
    let raw_line = raw_line.strip_suffix("\n\n#![cfg_attr(rustfmt, rustfmt::skip)]\n").unwrap();

    let mut target_modules = vec![];
    for &Target { triples, headers } in TARGETS {
        for &triple in triples {
            eprintln!("\ninfo: generating bindings for {triple}");
            let target = &target_spec_json(triple)?;
            let module_name = triple.replace("-unknown", "").replace(['-', '.'], "_");
            let out_dir = &out_dir.join(&module_name);
            {
                let module_name = format_ident!("{}", module_name);
                let mut cfg = quote!();
                let arch = target.arch.as_str();
                cfg.extend(quote! { target_arch = #arch });
                let os = target.os.as_str();
                cfg.extend(quote! { , target_os = #os });
                if target.env != Env::none {
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

            let mut modules = vec![];
            if !headers.is_empty() {
                let src_dir = &download_headers(target, download_dir)?;
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

                    let out_file = format!(
                        "{}.rs",
                        Utf8PathBuf::from(header.path.replace(['/', '-', ':'], "_"))
                            .file_stem()
                            .unwrap()
                    );
                    let out_path = out_dir.join(&out_file);

                    let target_flag = &*format!("--target={}", target.llvm_target);
                    let mut clang_args = vec![target_flag, "-nostdinc"];
                    macro_rules! define {
                        ($name:ident) => {{
                            clang_args.push(concat!("-D", stringify!($name)));
                        }};
                        ($name:ident, $value:literal) => {{
                            clang_args.push(concat!("-D", stringify!($name), "=", $value));
                        }};
                    }
                    macro_rules! include_header {
                        ($value:literal) => {{
                            clang_args.push(concat!("-include", $value));
                        }};
                    }
                    let header_path;
                    let include;
                    match target.os {
                        linux | android => {
                            let linux_headers_dir = linux_headers_dir(target, src_dir);
                            if let Some(path) = header.path.strip_prefix("linux-headers:") {
                                header_path = linux_headers_dir.join("include").join(path);
                                include = vec![linux_headers_dir.join("include")];
                            } else if target.os == android {
                                let bionic_dir = bionic_dir(src_dir).join("libc");
                                header_path = bionic_dir.join("include").join(header.path);
                                include = vec![
                                    linux_headers_dir.join("include"),
                                    bionic_dir.join("include"),
                                    bionic_dir.join("kernel/uapi/linux"),
                                    bionic_dir.join("kernel/uapi"),
                                    bionic_dir.join("kernel/android/uapi"),
                                ];
                            } else if target.env == gnu {
                                let glibc_dir = glibc_dir(src_dir);
                                header_path = glibc_dir.join("include").join(header.path);
                                include = vec![
                                    glibc_dir.join("include"),
                                    glibc_dir.join("sysdeps").join(glibc_arch(target)),
                                    glibc_dir,
                                ];
                            } else {
                                let headers_dir = libc_headers_dir(target, src_dir);
                                header_path = headers_dir.join("include").join(header.path);
                                include = vec![headers_dir.join("include")];
                            }
                        }
                        _ if target.vendor.as_deref() == Some("apple") => {
                            header_path = src_dir.join("bsd").join(header.path);
                            include = vec![
                                src_dir.join("bsd"),
                                src_dir.join("EXTERNAL_HEADERS"),
                                src_dir.join("osfmk"),
                                src_dir.parent().unwrap().join("Libc/include"),
                                src_dir.parent().unwrap().join("libpthread/include"),
                            ];
                            // https://github.com/apple-oss-distributions/xnu/blob/5c2921b07a2480ab43ec66f5b9e41cb872bc554f/bsd/sys/cdefs.h#L512-L522
                            define!(_POSIX_C_SOURCE, "200112L");
                            include_header!("sys/_types/_u_char.h");
                            include_header!("sys/_types/_u_short.h");
                            include_header!("sys/_types/_u_int.h");
                        }
                        freebsd | openbsd => {
                            header_path = src_dir.join("include").join(header.path);
                            include = vec![src_dir.join("include")];
                            include_header!("sys/types.h");
                        }
                        netbsd => {
                            header_path = src_dir.join("include").join(header.path);
                            include = vec![
                                src_dir.join("include"),
                                src_dir.join("include/sys"),
                                src_dir.join("lib/libpthread"),
                            ];
                        }
                        illumos => {
                            header_path = src_dir.join("usr/src/uts/common").join(header.path);
                            include = vec![
                                src_dir.join("usr/src/uts/common"),
                                src_dir.join("usr/src/uts").join(illumos_arch(target)),
                                src_dir.join("usr/src/head"),
                            ];
                        }
                        fuchsia => {
                            header_path = src_dir.join(header.path);
                            include = vec![
                                src_dir.join("zircon/system/public"),
                                src_dir.join("zircon/kernel/lib/libc/include"),
                            ];
                            define!(_KERNEL);
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
                for (path, functions, types, vars) in &files {
                    let module_name = format_ident!("{}", Utf8Path::new(path).file_stem().unwrap());
                    let mut uses = vec![];
                    // Only export matched names because the module may contain type def.
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
                                            uses.push(format_ident!("{}", i.sig.ident));
                                        }
                                        _ => {}
                                    }
                                }
                            }
                            syn::Item::Struct(i)
                                if matches!(i.vis, syn::Visibility::Public(..))
                                    && types.is_match(&i.ident.to_string()) =>
                            {
                                uses.push(format_ident!("{}", i.ident));
                            }
                            syn::Item::Type(i)
                                if matches!(i.vis, syn::Visibility::Public(..))
                                    && types.is_match(&i.ident.to_string()) =>
                            {
                                uses.push(format_ident!("{}", i.ident));
                            }
                            syn::Item::Const(i)
                                if matches!(i.vis, syn::Visibility::Public(..))
                                    && vars.is_match(&i.ident.to_string()) =>
                            {
                                uses.push(format_ident!("{}", i.ident));
                            }
                            _ => {}
                        }
                    }
                    let uses = uses.iter();
                    modules.push(quote! {
                        mod #module_name;
                        #(pub use #module_name::#uses;)*
                    });
                }
            }
            // e.g., clang -E -dM -x c /dev/null -target aarch64-unknown-linux-gnu | grep -F __CHAR_
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
            clippy::pub_underscore_fields,
            clippy::unnecessary_cast,
        )]
        #(#target_modules)*
    })?;
    Ok(())
}

// https://github.com/bminor/glibc
const GLIBC_REPO: &str = "bminor/glibc";
// https://github.com/bminor/musl
const MUSL_REPO: &str = "bminor/musl";
// https://github.com/wbx-github/uclibc-ng
const UCLIBC_REPO: &str = "wbx-github/uclibc-ng";
// https://github.com/aosp-mirror/platform_bionic
const BIONIC_REPO: &str = "aosp-mirror/platform_bionic";
fn download_headers(target: &TargetSpec, download_dir: &Utf8Path) -> Result<Utf8PathBuf> {
    fn clone(
        download_dir: &Utf8Path,
        repository: &str,
        sparse_checkout: &[&str],
    ) -> Result<Utf8PathBuf> {
        let name = repository.strip_suffix(".git").unwrap_or(repository);
        let name = name.replace("https://fuchsia.googlesource.com/", "fuchsia/");
        assert!(!name.contains("://"), "{}", name);
        let repository = if repository.contains("://") {
            repository.to_owned()
        } else {
            format!("https://github.com/{repository}.git")
        };
        let src_dir = download_dir.join(name);
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
            cmd!("git", "sparse-checkout", "init").dir(&src_dir).run()?;
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
    fn patch(target: &TargetSpec, src_dir: &Utf8Path) -> Result<()> {
        let patch_dir = Utf8Path::new("tools/codegen/patches");
        for path in [
            patch_dir.join(format!("{}.diff", target.os)),
            patch_dir.join(format!("{}-{}.diff", target.os, target.env)),
        ] {
            if !path.exists() {
                continue;
            }
            let dir = match target.os {
                linux | android => src_dir.parent().unwrap().parent().unwrap(),
                _ => src_dir,
            };
            cmd!("patch", "-p1").stdin_file(fs::File::open(path)?.into_parts().0).dir(dir).run()?;
        }
        Ok(())
    }
    let src_dir;
    match target.os {
        linux | android => {
            if target.os == android {
                clone(download_dir, BIONIC_REPO, &["/libc/"])?;
            } else if target.env == gnu {
                clone(download_dir, GLIBC_REPO, &[])?;
            } else if target.env == musl {
                clone(download_dir, MUSL_REPO, &["/arch/", "/include/", "/tools/"])?;
            } else if target.env == uclibc {
                clone(download_dir, UCLIBC_REPO, &[])?;
            }
            src_dir = clone(download_dir, "torvalds/linux", &[
                "/arch/",
                "/include/",
                "/scripts/",
                "/tools/",
            ])?;
            let linux_arch = linux_arch(target);
            let linux_headers_dir = &linux_headers_dir(target, &src_dir);
            if !linux_headers_dir.exists() {
                // https://github.com/torvalds/linux/blob/HEAD/Documentation/kbuild/headers_install.rst
                cmd!(
                    "make",
                    "headers_install",
                    format!("ARCH={linux_arch}"),
                    format!("INSTALL_HDR_PATH={linux_headers_dir}"),
                )
                .dir(&src_dir)
                .stdout_capture()
                .run()?;
            }
            if target.os == android {
                fs::write(
                    bionic_dir(&src_dir).join("libc/include/stdbool.h"),
                    "#define bool _Bool",
                )?;
            } else if target.env == gnu {
                let glibc_arch = glibc_arch(target);
                let glibc_src_dir = &src_dir.join("../..").join(GLIBC_REPO);
                // TODO: use https://github.com/bminor/glibc/blob/HEAD/Makefile?
                let sysdeps_dir = &glibc_src_dir.join("sysdeps");
                for e in fs::read_dir(sysdeps_dir.join("generic"))?.filter_map(Result::ok) {
                    let path = &e.path();
                    if path.extension() != Some(OsStr::new("h")) {
                        continue;
                    }
                    let file = path.file_name().unwrap().to_str().unwrap();
                    if !sysdeps_dir.join(glibc_arch).join(file).exists() {
                        symlink(path, sysdeps_dir.join(glibc_arch).join(file))?;
                    }
                }
                fs::write(glibc_src_dir.join("include/stddef.h"), "")?;
                patch(target, &src_dir)?;
            } else if target.env == musl {
                let musl_arch = musl_arch(target);
                let musl_src_dir = &src_dir.join("../..").join(MUSL_REPO);
                let headers_dir = &libc_headers_dir(target, &src_dir);
                if !headers_dir.exists() {
                    // https://github.com/bminor/musl/blob/HEAD/Makefile
                    cmd!(
                        "make",
                        "install-headers",
                        format!("ARCH={musl_arch}"),
                        format!("DESTDIR={headers_dir}"),
                        "prefix=/",
                    )
                    .dir(musl_src_dir)
                    .stdout_capture()
                    .run()?;
                }
            } else if target.env == uclibc {
                let uclibc_arch = uclibc_arch(target);
                let uclibc_src_dir = &src_dir.join("../..").join(UCLIBC_REPO);
                let config_path = &uclibc_src_dir.join(".config");
                if config_path.exists() {
                    fs::remove_file(config_path)?;
                }
                patch(target, &src_dir)?;
                let headers_dir = &libc_headers_dir(target, &src_dir);
                if !headers_dir.exists() {
                    // https://github.com/wbx-github/uclibc-ng/blob/HEAD/Makefile.in
                    cmd!("make", "allnoconfig", format!("ARCH={uclibc_arch}"))
                        .dir(uclibc_src_dir)
                        .stdout_capture()
                        .run()?;
                    cmd!(
                        "make",
                        "install_headers",
                        format!("ARCH={uclibc_arch}"),
                        "HAVE_SHARED=y",
                        format!("DESTDIR={headers_dir}"),
                        format!("PREFIX={headers_dir}"),
                        "DEVEL_PREFIX=/",
                        format!("KERNEL_HEADERS={linux_headers_dir}/include"),
                    )
                    .dir(uclibc_src_dir)
                    .stdout_capture()
                    .run()?;
                }
                fs::write(headers_dir.join("include/stddef.h"), "")?;
            }
        }
        _ if target.vendor.as_deref() == Some("apple") => {
            clone(download_dir, "apple-oss-distributions/Libc", &["/include/"])?;
            clone(download_dir, "apple-oss-distributions/libpthread", &["/include/"])?;
            src_dir = clone(download_dir, "apple-oss-distributions/xnu", &[
                "/bsd/",
                "/EXTERNAL_HEADERS/",
                "/osfmk/",
            ])?;
            // TODO: use https://github.com/apple-oss-distributions/xnu/blob/5c2921b07a2480ab43ec66f5b9e41cb872bc554f/Makefile?
            // https://github.com/apple-oss-distributions/xnu/blob/5c2921b07a2480ab43ec66f5b9e41cb872bc554f/bsd/sys/make_symbol_aliasing.sh
            fs::write(src_dir.join("bsd/sys/_symbol_aliasing.h"), "")?;
            // https://github.com/apple-oss-distributions/xnu/blob/5c2921b07a2480ab43ec66f5b9e41cb872bc554f/bsd/sys/make_posix_availability.sh
            cmd!("bash", "bsd/sys/make_posix_availability.sh", "bsd/sys/_posix_availability.h")
                .dir(&src_dir)
                .stdout_capture()
                .run()?;
        }
        freebsd => {
            src_dir = clone(download_dir, "freebsd/freebsd-src", &["/include/", "/sys/"])?;
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
        netbsd => {
            src_dir = clone(download_dir, "NetBSD/src", &[])?;
            let arch = netbsd_arch(target);
            for path in ["sys", "uvm"] {
                symlink(src_dir.join("sys").join(path), src_dir.join("include").join(path))?;
            }
            for path in [arch, "machine"] {
                symlink(
                    src_dir.join("sys/arch").join(arch).join("include"),
                    src_dir.join("include").join(path),
                )?;
            }
            let link = match target.arch {
                aarch64 => Some(("arm", src_dir.join("include").join("arm"))),
                _ => None,
            };
            if let Some((arch, link)) = link {
                symlink(src_dir.join("sys/arch").join(arch).join("include"), link)?;
            }
        }
        openbsd => {
            src_dir = clone(download_dir, "openbsd/src", &["/include/", "/sys/"])?;
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
        illumos => {
            if target.arch == aarch64 {
                // TODO: use illumos/illumos-gate once merged to upstream
                src_dir = clone(download_dir, "richlowe/illumos-gate", &["/usr/"])?;
            } else {
                todo!("{target:?}")
            }
        }
        fuchsia => {
            src_dir = clone(download_dir, "https://fuchsia.googlesource.com/fuchsia", &[])?;
            fs::write(src_dir.join("zircon/kernel/lib/libc/include/stdbool.h"), "")?;
            fs::write(
                src_dir.join("zircon/kernel/lib/libc/include/stddef.h"),
                "#define size_t unsigned long",
            )?;
        }
        _ => todo!("{target:?}"),
    }
    Ok(src_dir)
}

fn linux_headers_dir(target: &TargetSpec, src_dir: &Utf8Path) -> Utf8PathBuf {
    src_dir.join("../..").join("headers").join("linux").join(linux_arch(target))
}
fn glibc_dir(src_dir: &Utf8Path) -> Utf8PathBuf {
    src_dir.join("../..").join(GLIBC_REPO)
}
fn libc_headers_dir(target: &TargetSpec, src_dir: &Utf8Path) -> Utf8PathBuf {
    assert_eq!(target.os, linux);
    let (lib, arch) = match target.env {
        musl => ("musl", musl_arch(target)),
        uclibc => ("uclibc", uclibc_arch(target)),
        _ => todo!("{target:?}"),
    };
    src_dir.join("../..").join("headers").join(lib).join(arch)
}
fn bionic_dir(src_dir: &Utf8Path) -> Utf8PathBuf {
    src_dir.join("../..").join(BIONIC_REPO)
}

fn linux_arch(target: &TargetSpec) -> &'static str {
    // https://github.com/torvalds/linux/tree/HEAD/arch
    match target.arch {
        arm => "arm",
        aarch64 => "arm64",
        csky => "csky",
        hexagon => "hexagon",
        loongarch64 => "loongarch",
        m68k => "m68k",
        mips | mips32r6 | mips64 | mips64r6 => "mips",
        powerpc | powerpc64 => "powerpc",
        riscv32 | riscv64 => "riscv",
        s390x => "s390",
        sparc | sparc64 => "sparc",
        x86 | x86_64 => "x86",
        xtensa => "xtensa",
        _ => todo!("{target:?}"),
    }
}
fn glibc_arch(target: &TargetSpec) -> &'static str {
    // https://github.com/bminor/glibc/tree/HEAD/sysdeps
    match target.arch {
        aarch64 => "aarch64",
        powerpc64 => "powerpc/powerpc64",
        riscv32 | riscv64 => "riscv",
        _ => todo!("{target:?}"),
    }
}
fn musl_arch(target: &TargetSpec) -> &'static str {
    // https://github.com/bminor/musl/tree/HEAD/arch
    match target.arch {
        aarch64 => "aarch64",
        arm => "arm",
        x86 => "i386",
        loongarch64 => "loongarch64",
        m68k => "m68k",
        mips | mips32r6 => "mips",
        mips64 | mips64r6 if target.target_pointer_width == "64" => "mips64",
        mips64 | mips64r6 if target.target_pointer_width == "32" => "mipsn32",
        powerpc => "powerpc",
        powerpc64 => "powerpc64",
        riscv32 => "riscv32",
        riscv64 => "riscv64",
        s390x => "s390x",
        x86_64 if target.target_pointer_width == "32" => "x32",
        x86_64 if target.target_pointer_width == "64" => "x86_64",
        _ => todo!("{target:?}"),
    }
}
fn uclibc_arch(target: &TargetSpec) -> &'static str {
    // https://github.com/wbx-github/uclibc-ng/tree/HEAD/libc/sysdeps/linux
    match target.arch {
        aarch64 => "aarch64",
        arm => "arm",
        riscv32 => "riscv32",
        riscv64 => "riscv64",
        _ => todo!("{target:?}"),
    }
}
fn freebsd_arch(target: &TargetSpec) -> &'static str {
    // https://github.com/freebsd/freebsd-src/tree/HEAD/sys
    match target.arch {
        x86_64 => "amd64",
        arm => "arm",
        aarch64 => "arm64",
        x86 => "i386",
        powerpc | powerpc64 => "powerpc",
        riscv64 => "riscv",
        _ => todo!("{target:?}"),
    }
}
fn netbsd_arch(target: &TargetSpec) -> &'static str {
    // https://github.com/NetBSD/src/tree/HEAD/sys/arch
    match target.arch {
        aarch64 => "aarch64",
        riscv32 | riscv64 => "riscv",
        _ => todo!("{target:?}"),
    }
}
fn openbsd_arch(target: &TargetSpec) -> &'static str {
    // https://github.com/openbsd/src/tree/HEAD/sys/arch
    match target.arch {
        x86_64 => "amd64",
        aarch64 => "arm64",
        x86 => "i386",
        powerpc64 => "powerpc64",
        riscv64 => "riscv64",
        sparc64 => "sparc64",
        _ => todo!("{target:?}"),
    }
}
fn illumos_arch(target: &TargetSpec) -> &'static str {
    // https://github.com/illumos/illumos-gate/tree/HEAD/usr/src/uts
    // https://github.com/richlowe/illumos-gate/tree/arm64-gate/usr/src/uts
    match target.arch {
        aarch64 => "aarch64",
        _ => todo!("{target:?}"),
    }
}

fn target_spec_json(target: &str) -> Result<TargetSpec> {
    let spec_path = workspace_root().join("target-specs").join(target).with_extension("json");
    let target = if spec_path.exists() { spec_path.as_str() } else { target };
    Ok(target_spec_json::target_spec_json(Command::new("rustc"), target)?)
}
