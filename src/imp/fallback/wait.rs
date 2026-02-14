// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
This uses:
- futex-based waiting on Linux, Android, FreeBSD, OpenBSD, DragonFly BSD, Fuchsia, Redox, Hermit, Apple targets, Windows 8+
- spinning-based waiting otherwise

TODO: The following platforms also supports futex:
- Emscripten: emscripten_futex_wait/emscripten_futex_wake https://github.com/emscripten-core/emscripten/blob/4.0.22/system/include/emscripten/threading.h
  - "atomics" target feature is nightly-only.
- Wasm: memory_atomic_wait32/memory_atomic_wait64/memory_atomic_notify https://doc.rust-lang.org/nightly/core/arch/wasm32/fn.memory_atomic_notify.html?search=memory_atomic_
  - core::arch::wasm*::memory_atomic_wait* is unstable.
  - "atomics" target feature is nightly-only.

Refs:
- https://github.com/rust-lang/rust/blob/1.92.0/library/std/src/sys/pal/unix/futex.rs
- https://github.com/rust-lang/rust/blob/1.92.0/library/std/src/sys/pal/windows/futex.rs
- https://github.com/rust-lang/rust/blob/1.92.0/library/std/src/sys/pal/hermit/futex.rs
- https://github.com/rust-lang/rust/blob/1.92.0/library/std/src/sys/pal/wasm/atomics/futex.rs
*/

cfg_no_fast_atomic_64! {
    #[allow(unused_imports)]
    pub(super) use self::os::{wait32, notify32_all, notify32_one};
}
cfg_has_fast_atomic_64! {
    #[allow(unused_imports)]
    pub(super) use self::os::{wait64, notify64_all, notify64_one};
}

// Exclude WASM Linux because it is not upstreamed and ABI is different between implementations.
// https://github.com/arjunr2/wali-musl/blob/ac08acb01cb951c725f7d05c5693a47129f5f679/arch/wasm32/bits/syscall.h.in
// https://github.com/joelseverin/linux-wasm/blob/970e08b0d605e63e36a99d22596e8899a1dab8b5/patches/kernel/0005-Add-Wasm-architecture.patch#L1457
#[cfg(any(
    all(target_os = "linux", not(any(target_arch = "wasm32", target_arch = "wasm64"))),
    target_os = "android",
))]
mod os {
    use core::{i32, ptr, sync::atomic::AtomicU32};

    // libc requires Rust 1.63
    #[allow(non_upper_case_globals)]
    mod ffi {
        pub(crate) use crate::utils::ffi::{c_int, c_long};

        sys_const!({
            // https://man7.org/linux/man-pages/man2/futex.2.html
            // Note that alpha, arc, hppa, hppa64, microblaze, or1k, and sh are currently not supported by rustc,
            // but included here because they are supported by GCC and some of them are mentioned in issues in rustc_codegen_gcc.
            // https://github.com/torvalds/linux/blob/v6.19/include/uapi/asm-generic/unistd.h#L270
            // https://github.com/torvalds/linux/blob/v6.19/arch/arc/include/uapi/asm/unistd.h
            // https://github.com/torvalds/linux/blob/v6.19/arch/arm64/include/uapi/asm/unistd.h
            // https://github.com/torvalds/linux/blob/v6.19/arch/csky/include/uapi/asm/unistd.h
            // https://github.com/torvalds/linux/blob/v6.19/arch/hexagon/include/uapi/asm/unistd.h
            // https://github.com/torvalds/linux/blob/v6.19/arch/loongarch/include/uapi/asm/unistd.h
            // https://github.com/torvalds/linux/blob/v6.19/arch/openrisc/include/uapi/asm/unistd.h
            // https://github.com/torvalds/linux/blob/v6.19/arch/riscv/include/uapi/asm/unistd.h
            #[cfg(any(
                target_arch = "aarch64",
                target_arch = "arc",
                target_arch = "csky",
                target_arch = "hexagon",
                target_arch = "loongarch32",
                target_arch = "loongarch64",
                target_arch = "or1k",
                target_arch = "riscv32",
                target_arch = "riscv64",
            ))]
            pub(crate) const __NR_futex: c_long = 98;
            // https://github.com/torvalds/linux/blob/v6.19/arch/alpha/kernel/syscalls/syscall.tbl#L327
            #[cfg(target_arch = "alpha")]
            pub(crate) const __NR_futex: c_long = 394;
            // https://github.com/torvalds/linux/blob/v6.19/arch/arm/tools/syscall.tbl#L258
            #[cfg(target_arch = "arm")]
            pub(crate) const __NR_futex: c_long = 240;
            // https://github.com/torvalds/linux/blob/v6.19/arch/parisc/kernel/syscalls/syscall.tbl#L233-L234
            #[cfg(any(target_arch = "hppa", target_arch = "hppa64"))]
            pub(crate) const __NR_futex: c_long = 210;
            // https://github.com/torvalds/linux/blob/v6.19/arch/m68k/kernel/syscalls/syscall.tbl#L245
            #[cfg(target_arch = "m68k")]
            pub(crate) const __NR_futex: c_long = 235;
            // https://github.com/torvalds/linux/blob/v6.19/arch/microblaze/kernel/syscalls/syscall.tbl#L250
            #[cfg(target_arch = "microblaze")]
            pub(crate) const __NR_futex: c_long = 240;
            // https://github.com/torvalds/linux/blob/v6.19/arch/mips/include/uapi/asm/unistd.h
            // https://github.com/torvalds/linux/blob/v6.19/arch/mips/kernel/syscalls/syscall_o32.tbl#L252
            #[cfg(target_arch = "mips")]
            pub(crate) const __NR_futex: c_long = /* __NR_Linux */ 4000 + 238;
            // https://github.com/torvalds/linux/blob/v6.19/arch/mips/kernel/syscalls/syscall_n64.tbl#L205
            #[cfg(all(
                any(target_arch = "mips64", target_arch = "mips64r6"),
                target_pointer_width = "64"
            ))]
            pub(crate) const __NR_futex: c_long = /* __NR_Linux */ 5000 + 194;
            // https://github.com/torvalds/linux/blob/v6.19/arch/mips/kernel/syscalls/syscall_n32.tbl#L205
            #[cfg(all(
                any(target_arch = "mips64", target_arch = "mips64r6"),
                target_pointer_width = "32"
            ))]
            pub(crate) const __NR_futex: c_long = /* __NR_Linux */ 6000 + 194;
            // https://github.com/torvalds/linux/blob/v6.19/arch/powerpc/kernel/syscalls/syscall.tbl#L281-L283
            #[cfg(any(target_arch = "powerpc", target_arch = "powerpc64"))]
            pub(crate) const __NR_futex: c_long = 221;
            // https://github.com/torvalds/linux/blob/v6.19/arch/s390/kernel/syscalls/syscall.tbl#L195
            #[cfg(target_arch = "s390x")]
            pub(crate) const __NR_futex: c_long = 238;
            // https://github.com/torvalds/linux/blob/v6.19/arch/sh/kernel/syscalls/syscall.tbl#L250
            #[cfg(target_arch = "sh")]
            pub(crate) const __NR_futex: c_long = 240;
            // https://github.com/torvalds/linux/blob/v6.19/arch/sparc/kernel/syscalls/syscall.tbl#L178-L179
            #[cfg(any(target_arch = "sparc", target_arch = "sparc64"))]
            pub(crate) const __NR_futex: c_long = 142;
            // https://github.com/torvalds/linux/blob/v6.19/arch/x86/entry/syscalls/syscall_32.tbl#L255
            #[cfg(target_arch = "x86")]
            pub(crate) const __NR_futex: c_long = 240;
            // https://github.com/torvalds/linux/blob/v6.19/arch/x86/entry/syscalls/syscall_64.tbl#L214
            #[cfg(all(target_arch = "x86_64", target_pointer_width = "64"))]
            pub(crate) const __NR_futex: c_long = 202;
            // https://github.com/torvalds/linux/blob/v6.19/arch/x86/include/uapi/asm/unistd.h#L13
            #[cfg(all(target_arch = "x86_64", target_pointer_width = "32"))]
            pub(crate) const __NR_futex: c_long = /* __X32_SYSCALL_BIT */ 0x40000000 + 202;
            // https://github.com/torvalds/linux/blob/v6.19/arch/xtensa/kernel/syscalls/syscall.tbl#L209
            #[cfg(target_arch = "xtensa")]
            pub(crate) const __NR_futex: c_long = 191;

            // https://github.com/torvalds/linux/blob/v6.19/include/uapi/linux/futex.h
            // Linux 2.6.0+
            pub(crate) const FUTEX_WAKE: c_int = 1;
            // Linux 2.6.25+
            pub(crate) const FUTEX_WAIT_BITSET: c_int = 9;
            // Linux 2.6.22+
            pub(crate) const FUTEX_PRIVATE_FLAG: c_int = 128;
        });

        cfg_sel!({
            // Use asm-based syscall on Linux for compatibility with non-libc targets if possible.
            // Do not use it on Android, see https://github.com/bytecodealliance/rustix/issues/1095 for details.
            // Skip aarch64/s390x because we can always provide 128-bit atomics on them when inline
            // assembly is available (i.e., this module is only used in older versions where inline
            // assembly isn't available or in testing.
            // Skip x86_32 which has complex syscall mechanism.
            // Miri and Sanitizer do not support inline assembly.
            #[cfg(all(
                target_os = "linux",
                any(
                    all(
                        any(
                            target_arch = "x86_64",
                            target_arch = "arm",
                            target_arch = "riscv32",
                            all(target_arch = "riscv64", target_pointer_width = "64"),
                        ),
                        any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
                    ),
                    all(
                        any(
                            target_arch = "loongarch32",
                            all(target_arch = "loongarch64", target_pointer_width = "64"),
                        ),
                        any(
                            not(portable_atomic_no_asm),
                            portable_atomic_unstable_asm_experimental_arch,
                        ),
                    ),
                    all(
                        // TODO: requires https://github.com/rust-lang/rust/pull/146831
                        any(
                            target_arch = "powerpc",
                            all(target_arch = "powerpc64", target_pointer_width = "64"),
                        ),
                        any(
                            not(portable_atomic_no_asm),
                            portable_atomic_unstable_asm_experimental_arch,
                        ),
                    ),
                ),
                not(any(miri, portable_atomic_sanitize_thread)),
            ))]
            {
                #[cfg(not(all(portable_atomic_no_asm, portable_atomic_unstable_asm)))]
                use core::arch::asm;

                use crate::utils::RegSize;

                // Refs:
                // - x86_64
                //   https://git.musl-libc.org/cgit/musl/tree/arch/x86_64/syscall_arch.h?h=v1.2.5
                //   https://git.musl-libc.org/cgit/musl/tree/arch/x32/syscall_arch.h?h=v1.2.5
                //   https://stackoverflow.com/questions/2535989/what-are-the-calling-conventions-for-unix-linux-system-calls-and-user-space-f#comment96684215_54957101
                // - arm
                //   https://git.musl-libc.org/cgit/musl/tree/arch/arm/syscall_arch.h?h=v1.2.5
                // - loongarch32/loongarch64
                //   https://git.musl-libc.org/cgit/musl/tree/arch/loongarch64/syscall_arch.h?h=v1.2.5
                // - powerpc/powerpc64
                //   https://github.com/torvalds/linux/blob/v6.19/Documentation/arch/powerpc/syscall64-abi.rst
                //   https://git.musl-libc.org/cgit/musl/tree/arch/powerpc/syscall_arch.h?h=1b76ff0767d01df72f692806ee5adee13c67ef88
                //   https://git.musl-libc.org/cgit/musl/tree/arch/powerpc64/syscall_arch.h?h=1b76ff0767d01df72f692806ee5adee13c67ef88
                // - riscv32/riscv64
                // - https://git.musl-libc.org/cgit/musl/tree/arch/riscv32/syscall_arch.h?h=v1.2.5
                // - https://git.musl-libc.org/cgit/musl/tree/arch/riscv64/syscall_arch.h?h=v1.2.5
                #[inline]
                pub(crate) unsafe fn syscall3(
                    number: c_long,
                    u_addr: *mut u32,
                    op: c_int,
                    val: u32,
                ) -> c_long {
                    // arguments must be extended to 64-bit if 64-bit arch.
                    let number = number as RegSize;
                    let arg1 = ptr_reg!(u_addr);
                    let arg2 = op as RegSize;
                    let arg3 = val as RegSize;
                    let r;
                    // SAFETY: the caller must uphold the safety contract.
                    unsafe {
                        #[cfg(target_arch = "x86_64")]
                        asm!(
                            "syscall",
                            inout("rax") number => r,
                            in("rdi") arg1,
                            in("rsi") arg2,
                            in("rdx") arg3,
                            out("rcx") _,
                            out("r11") _,
                            options(nostack, preserves_flags),
                        );
                        #[cfg(all(
                            target_arch = "arm",
                            not(any(
                                target_feature = "thumb-mode",
                                portable_atomic_target_feature = "thumb-mode",
                            )),
                        ))]
                        asm!(
                            "svc 0",
                            in("r7") number,
                            inout("r0") arg1 => r,
                            in("r1") arg2,
                            in("r2") arg3,
                            options(nostack, preserves_flags),
                        );
                        #[cfg(all(
                            target_arch = "arm",
                            any(
                                target_feature = "thumb-mode",
                                portable_atomic_target_feature = "thumb-mode",
                            ),
                        ))]
                        asm!(
                            // r7 is reserved on thumb
                            "mov {tmp}, r7",
                            "mov r7, {number}",
                            "svc 0",
                            "mov r7, {tmp}",
                            number = in(reg) number,
                            tmp = out(reg) _,
                            inout("r0") arg1 => r,
                            in("r1") arg2,
                            in("r2") arg3,
                            options(nostack, preserves_flags),
                        );
                        #[cfg(any(target_arch = "loongarch32", target_arch = "loongarch64"))]
                        asm!(
                            "syscall 0",
                            inout("$a7") number => _,
                            inout("$a0") arg1 => r,
                            inout("$a1") arg2 => _,
                            inout("$a2") arg3 => _,
                            out("$t0") _,
                            out("$t1") _,
                            out("$t2") _,
                            out("$t3") _,
                            out("$t4") _,
                            out("$t5") _,
                            out("$t6") _,
                            out("$t7") _,
                            out("$t8") _,
                            options(nostack, preserves_flags),
                        );
                        #[cfg(any(target_arch = "powerpc", target_arch = "powerpc64"))]
                        asm!(
                            "sc",
                            "bns+ 2f",
                            "neg %r3, %r3",
                            "2:",
                            inout("r0") number => _,
                            inout("r3") arg1 => r,
                            inout("r4") arg2 => _,
                            inout("r5") arg3 => _,
                            out("r6") _,
                            out("r7") _,
                            out("r8") _,
                            out("r9") _,
                            out("r10") _,
                            out("r11") _,
                            out("r12") _,
                            out("cr0") _,
                            out("ctr") _,
                            out("xer") _,
                            options(nostack, preserves_flags),
                        );
                        #[cfg(any(target_arch = "riscv32", target_arch = "riscv64"))]
                        asm!(
                            "ecall",
                            in("a7") number,
                            inout("a0") arg1 => r,
                            in("a1") arg2,
                            in("a2") arg3,
                            // Clobber vector registers and do not use `preserves_flags` because RISC-V Linux syscalls don't preserve them.
                            // https://github.com/torvalds/linux/blob/v6.19/Documentation/arch/riscv/vector.rst#3--vector-register-state-across-system-calls
                            out("v0") _,
                            out("v1") _,
                            out("v2") _,
                            out("v3") _,
                            out("v4") _,
                            out("v5") _,
                            out("v6") _,
                            out("v7") _,
                            out("v8") _,
                            out("v9") _,
                            out("v10") _,
                            out("v11") _,
                            out("v12") _,
                            out("v13") _,
                            out("v14") _,
                            out("v15") _,
                            out("v16") _,
                            out("v17") _,
                            out("v18") _,
                            out("v19") _,
                            out("v20") _,
                            out("v21") _,
                            out("v22") _,
                            out("v23") _,
                            out("v24") _,
                            out("v25") _,
                            out("v26") _,
                            out("v27") _,
                            out("v28") _,
                            out("v29") _,
                            out("v30") _,
                            out("v31") _,
                            options(nostack),
                        );
                    }
                    r
                }
                #[inline]
                pub(crate) unsafe fn syscall6(
                    number: c_long,
                    u_addr: *mut u32,
                    op: c_int,
                    val: u32,
                    arg4: *const [u8; 0],
                    arg5: *const u32,
                    arg6: u32,
                ) -> c_long {
                    // arguments must be extended to 64-bit if 64-bit arch.
                    let number = number as RegSize;
                    let arg1 = ptr_reg!(u_addr);
                    let arg2 = op as RegSize;
                    let arg3 = val as RegSize;
                    let arg4 = ptr_reg!(arg4);
                    let arg5 = ptr_reg!(arg5);
                    let arg6 = arg6 as RegSize;
                    let r;
                    // SAFETY: the caller must uphold the safety contract.
                    unsafe {
                        #[cfg(target_arch = "x86_64")]
                        asm!(
                            "syscall",
                            inout("rax") number => r,
                            in("rdi") arg1,
                            in("rsi") arg2,
                            in("rdx") arg3,
                            in("r10") arg4,
                            in("r8") arg5,
                            in("r9") arg6,
                            out("rcx") _,
                            out("r11") _,
                            options(nostack, preserves_flags),
                        );
                        #[cfg(all(
                            target_arch = "arm",
                            not(any(
                                target_feature = "thumb-mode",
                                portable_atomic_target_feature = "thumb-mode",
                            )),
                        ))]
                        asm!(
                            "svc 0",
                            in("r7") number,
                            inout("r0") arg1 => r,
                            in("r1") arg2,
                            in("r2") arg3,
                            in("r3") arg4,
                            in("r4") arg5,
                            in("r5") arg6,
                            options(nostack, preserves_flags),
                        );
                        #[cfg(all(
                            target_arch = "arm",
                            any(
                                target_feature = "thumb-mode",
                                portable_atomic_target_feature = "thumb-mode",
                            ),
                        ))]
                        asm!(
                            // r7 is reserved on thumb
                            "mov {tmp}, r7",
                            "mov r7, {number}",
                            "svc 0",
                            "mov r7, {tmp}",
                            number = in(reg) number,
                            tmp = out(reg) _,
                            inout("r0") arg1 => r,
                            in("r1") arg2,
                            in("r2") arg3,
                            in("r3") arg4,
                            in("r4") arg5,
                            in("r5") arg6,
                            options(nostack, preserves_flags),
                        );
                        #[cfg(any(target_arch = "loongarch32", target_arch = "loongarch64"))]
                        asm!(
                            "syscall 0",
                            inout("$a7") number => _,
                            inout("$a0") arg1 => r,
                            inout("$a1") arg2 => _,
                            inout("$a2") arg3 => _,
                            inout("$a3") arg4 => _,
                            inout("$a4") arg5 => _,
                            inout("$a5") arg6 => _,
                            out("$t0") _,
                            out("$t1") _,
                            out("$t2") _,
                            out("$t3") _,
                            out("$t4") _,
                            out("$t5") _,
                            out("$t6") _,
                            out("$t7") _,
                            out("$t8") _,
                            options(nostack, preserves_flags),
                        );
                        #[cfg(any(target_arch = "powerpc", target_arch = "powerpc64"))]
                        asm!(
                            "sc",
                            "bns+ 2f",
                            "neg %r3, %r3",
                            "2:",
                            inout("r0") number => _,
                            inout("r3") arg1 => r,
                            inout("r4") arg2 => _,
                            inout("r5") arg3 => _,
                            inout("r6") arg4 => _,
                            inout("r7") arg5 => _,
                            inout("r8") arg6 => _,
                            out("r9") _,
                            out("r10") _,
                            out("r11") _,
                            out("r12") _,
                            out("cr0") _,
                            out("ctr") _,
                            out("xer") _,
                            options(nostack, preserves_flags),
                        );
                        #[cfg(any(target_arch = "riscv32", target_arch = "riscv64"))]
                        asm!(
                            "ecall",
                            in("a7") number,
                            inout("a0") arg1 => r,
                            in("a1") arg2,
                            in("a2") arg3,
                            in("a3") arg4,
                            in("a4") arg5,
                            in("a5") arg6,
                            // Clobber vector registers and do not use `preserves_flags` because RISC-V Linux syscalls don't preserve them.
                            // https://github.com/torvalds/linux/blob/v6.19/Documentation/arch/riscv/vector.rst#3--vector-register-state-across-system-calls
                            out("v0") _,
                            out("v1") _,
                            out("v2") _,
                            out("v3") _,
                            out("v4") _,
                            out("v5") _,
                            out("v6") _,
                            out("v7") _,
                            out("v8") _,
                            out("v9") _,
                            out("v10") _,
                            out("v11") _,
                            out("v12") _,
                            out("v13") _,
                            out("v14") _,
                            out("v15") _,
                            out("v16") _,
                            out("v17") _,
                            out("v18") _,
                            out("v19") _,
                            out("v20") _,
                            out("v21") _,
                            out("v22") _,
                            out("v23") _,
                            out("v24") _,
                            out("v25") _,
                            out("v26") _,
                            out("v27") _,
                            out("v28") _,
                            out("v29") _,
                            out("v30") _,
                            out("v31") _,
                            options(nostack),
                        );
                    }
                    r
                }
            }
            #[cfg(else)]
            {
                sys_fn!({
                    extern "C" {
                        // https://man7.org/linux/man-pages/man2/syscall.2.html
                        pub(crate) fn syscall(number: c_long, ...) -> c_long;
                    }
                });
                pub(crate) use self::{syscall as syscall3, syscall as syscall6};
            }
        });
    }

    #[inline]
    pub(crate) fn wait32(a: &AtomicU32, expected: u32) {
        unsafe {
            ffi::syscall6(
                ffi::__NR_futex,
                a as *const AtomicU32 as *mut u32,
                ffi::FUTEX_WAIT_BITSET | ffi::FUTEX_PRIVATE_FLAG,
                expected,
                ptr::null::<[u8; 0]>(), // TODO: timeout is actually a pointer to timespec
                ptr::null::<u32>(),     // This argument is unused for FUTEX_WAIT_BITSET.
                !0u32, // A full bitmask, to make it behave like a regular FUTEX_WAIT.
            );
        }
    }
    #[inline]
    pub(crate) fn notify32_one(a: *const AtomicU32) {
        unsafe {
            ffi::syscall3(
                ffi::__NR_futex,
                a as *const AtomicU32 as *mut u32,
                ffi::FUTEX_WAKE | ffi::FUTEX_PRIVATE_FLAG,
                1,
            );
        }
    }
    #[allow(dead_code)]
    #[inline]
    pub(crate) fn notify32_all(a: *const AtomicU32) {
        unsafe {
            ffi::syscall3(
                ffi::__NR_futex,
                a as *const AtomicU32 as *mut u32,
                ffi::FUTEX_WAKE | ffi::FUTEX_PRIVATE_FLAG,
                i32::MAX as u32,
            );
        }
    }

    cfg_has_fast_atomic_64! {
        pub(crate) use super::no_futex64::{wait64, notify64_all, notify64_one};
    }
}
#[cfg(target_os = "freebsd")]
mod os {
    // https://man.freebsd.org/_umtx_op(2)

    use core::{i32, ptr};

    // libc requires Rust 1.63
    mod ffi {
        pub(crate) use crate::utils::ffi::{c_int, c_ulong, c_void};

        sys_const!({
            // Defined in sys/umtx.h.
            // https://github.com/freebsd/freebsd-src/blob/release/15.0.0/sys/sys/umtx.h
            // FreeBSD 6.0+
            // https://github.com/freebsd/freebsd-src/blob/release/6.0.0/sys/sys/umtx.h
            pub(crate) const UMTX_OP_WAIT: c_int = 2;
            // FreeBSD 8.0+/7.2+
            // https://github.com/freebsd/freebsd-src/commit/727158f6f64df04094d41ca5ee4b0641308c39d0
            // https://github.com/freebsd/freebsd-src/blame/release/7.2.0/sys/sys/umtx.h
            pub(crate) const UMTX_OP_WAIT_UINT_PRIVATE: c_int = 15;
            pub(crate) const UMTX_OP_WAKE_PRIVATE: c_int = 16;
        });

        sys_fn!({
            extern "C" {
                // Defined in sys/umtx.h.
                // https://github.com/freebsd/freebsd-src/blob/release/15.0.0/sys/sys/umtx.h
                pub(crate) fn _umtx_op(
                    obj: *mut c_void,
                    op: c_int,
                    val: c_ulong,
                    u_addr: *mut c_void,
                    u_addr2: *mut c_void,
                ) -> c_int;
            }
        });
    }

    macro_rules! futex {
        (
            $atomic:ident, $val:ident, $op:ident,
            $wait:ident, $notify_one:ident, $notify_all:ident
        ) => {
            use core::sync::atomic::$atomic;
            #[inline]
            pub(crate) fn $wait(a: &$atomic, expected: $val) {
                unsafe {
                    ffi::_umtx_op(
                        a as *const $atomic as *mut ffi::c_void,
                        ffi::$op,
                        expected,
                        ptr::null_mut(),
                        ptr::null_mut(),
                    );
                }
            }
            #[inline]
            pub(crate) fn $notify_one(a: *const $atomic) {
                unsafe {
                    ffi::_umtx_op(
                        a as *const $atomic as *mut ffi::c_void,
                        ffi::UMTX_OP_WAKE_PRIVATE,
                        1 as ffi::c_ulong,
                        ptr::null_mut(),
                        ptr::null_mut(),
                    );
                }
            }
            #[allow(dead_code)]
            #[inline]
            pub(crate) fn $notify_all(a: *const $atomic) {
                unsafe {
                    ffi::_umtx_op(
                        a as *const $atomic as *mut ffi::c_void,
                        ffi::UMTX_OP_WAKE_PRIVATE,
                        i32::MAX as ffi::c_ulong,
                        ptr::null_mut(),
                        ptr::null_mut(),
                    );
                }
            }
        };
    }
    cfg_no_fast_atomic_64! {
        futex!(AtomicU32, u32, UMTX_OP_WAIT_UINT_PRIVATE, wait32, notify32_one, notify32_all);
    }
    cfg_has_fast_atomic_64! {
        futex!(AtomicU64, u64, UMTX_OP_WAIT, wait64, notify64_one, notify64_all);
    }
}
#[cfg(target_os = "openbsd")]
mod os {
    use core::{i32, ptr, sync::atomic::AtomicU32};

    // libc requires Rust 1.63
    mod ffi {
        pub(crate) use crate::utils::ffi::{c_int, c_void};

        sys_const!({
            // Defined in sys/futex.h.
            // https://github.com/openbsd/src/blob/ed8f5e8d82ace15e4cefca2c82941b15cb1a7830/sys/sys/futex.h
            // OpenBSD 6.2+
            pub(crate) const FUTEX_WAIT: c_int = 1;
            pub(crate) const FUTEX_WAKE: c_int = 2;
            // OpenBSD 6.4+
            // https://github.com/openbsd/src/commit/672a12b33825d37824af0ad0853546e9826c5e48?
            pub(crate) const FUTEX_PRIVATE_FLAG: c_int = 128;
            pub(crate) const FUTEX_WAIT_PRIVATE: c_int = FUTEX_WAIT | FUTEX_PRIVATE_FLAG;
            pub(crate) const FUTEX_WAKE_PRIVATE: c_int = FUTEX_WAKE | FUTEX_PRIVATE_FLAG;
        });

        sys_fn!({
            extern "C" {
                // Defined in sys/futex.h.
                // https://man.openbsd.org/futex.2
                // https://github.com/openbsd/src/blob/ed8f5e8d82ace15e4cefca2c82941b15cb1a7830/sys/sys/futex.h
                // TODO: timeout is actually a pointer to timespec
                pub(crate) fn futex(
                    u_addr: *mut u32,
                    op: c_int,
                    val: c_int,
                    timeout: *const [u8; 0],
                    u_addr2: *mut u32,
                ) -> c_int;
            }
        });
    }

    #[inline]
    pub(crate) fn wait32(a: &AtomicU32, expected: u32) {
        unsafe {
            ffi::futex(
                a as *const AtomicU32 as *mut u32,
                ffi::FUTEX_WAIT_PRIVATE,
                expected as i32,
                ptr::null(),
                ptr::null_mut(),
            );
        }
    }
    #[inline]
    pub(crate) fn notify32_one(a: *const AtomicU32) {
        unsafe {
            ffi::futex(
                a as *const AtomicU32 as *mut u32,
                ffi::FUTEX_WAKE_PRIVATE,
                1,
                ptr::null(),
                ptr::null_mut(),
            );
        }
    }
    #[allow(dead_code)]
    #[inline]
    pub(crate) fn notify32_all(a: *const AtomicU32) {
        unsafe {
            ffi::futex(
                a as *const AtomicU32 as *mut u32,
                ffi::FUTEX_WAKE_PRIVATE,
                i32::MAX,
                ptr::null(),
                ptr::null_mut(),
            );
        }
    }

    cfg_has_fast_atomic_64! {
        pub(crate) use super::no_futex64::{wait64, notify64_all, notify64_one};
    }
}
#[cfg(target_os = "dragonfly")]
mod os {
    use core::{i32, sync::atomic::AtomicU32};

    mod ffi {
        pub(crate) use crate::utils::ffi::c_int;

        sys_fn!({
            extern "C" {
                // https://man.dragonflybsd.org/?command=umtx&section=2
                // https://github.com/DragonFlyBSD/DragonFlyBSD/blob/v6.5.0/include/unistd.h
                pub(crate) fn umtx_sleep(ptr: *const c_int, value: c_int, timeout: c_int) -> c_int;
                pub(crate) fn umtx_wakeup(ptr: *const c_int, count: c_int) -> c_int;
            }
        });
    }

    #[inline]
    pub(crate) fn wait32(a: &AtomicU32, expected: u32) {
        unsafe {
            ffi::umtx_sleep(a as *const AtomicU32 as *const ffi::c_int, expected as ffi::c_int, 0);
        }
    }
    #[inline]
    pub(crate) fn notify32_one(a: *const AtomicU32) {
        unsafe {
            ffi::umtx_wakeup(a as *const AtomicU32 as *const i32, 1);
        }
    }
    #[allow(dead_code)]
    #[inline]
    pub(crate) fn notify32_all(a: *const AtomicU32) {
        unsafe {
            ffi::umtx_wakeup(a as *const AtomicU32 as *const i32, i32::MAX);
        }
    }

    cfg_has_fast_atomic_64! {
        pub(crate) use super::no_futex64::{wait64, notify64_all, notify64_one};
    }
}
#[cfg(target_os = "fuchsia")]
mod os {
    // TODO: https://github.com/rust-lang/rust/pull/96768#issuecomment-1160866285 https://github.com/rust-lang/rust/blob/1.92.0/library/std/src/sys/sync/mutex/fuchsia.rs

    use core::{sync::atomic::AtomicU32, u32};

    #[allow(non_camel_case_types)]
    mod ffi {
        sys_type!({
            pub(crate) type zx_futex_t = core::sync::atomic::AtomicU32;
            pub(crate) type zx_handle_t = u32;
            pub(crate) type zx_status_t = i32;
            pub(crate) type zx_time_t = i64;
        });

        sys_const!({
            pub(crate) const ZX_HANDLE_INVALID: zx_handle_t = 0;
            pub(crate) const ZX_TIME_INFINITE: zx_time_t = zx_time_t::MAX;
        });

        // TODO: use sys_fn!
        #[link(name = "zircon")]
        extern "C" {
            // https://fuchsia.dev/reference/syscalls/futex_wait
            pub(crate) fn zx_futex_wait(
                value_ptr: *const zx_futex_t,
                current_value: zx_futex_t,
                new_futex_owner: zx_handle_t,
                deadline: zx_time_t,
            ) -> zx_status_t;
            // https://fuchsia.dev/reference/syscalls/futex_wake
            pub(crate) fn zx_futex_wake(
                value_ptr: *const zx_futex_t,
                wake_count: u32,
            ) -> zx_status_t;
        }
    }

    #[inline]
    pub(crate) fn wait32(a: &AtomicU32, expected: u32) {
        unsafe {
            ffi::zx_futex_wait(
                a,
                ffi::zx_futex_t::new(expected),
                ffi::ZX_HANDLE_INVALID,
                ffi::ZX_TIME_INFINITE,
            );
        }
    }
    #[inline]
    pub(crate) fn notify32_one(a: *const AtomicU32) {
        unsafe {
            ffi::zx_futex_wake(a, 1);
        }
    }
    #[allow(dead_code)]
    #[inline]
    pub(crate) fn notify32_all(a: *const AtomicU32) {
        unsafe {
            ffi::zx_futex_wake(a, u32::MAX);
        }
    }

    cfg_has_fast_atomic_64! {
        pub(crate) use super::no_futex64::{wait64, notify64_all, notify64_one};
    }
}
#[cfg(target_os = "redox")]
mod os {
    // Refs: https://github.com/redox-os/kernel/blob/92132132c16bd5a09322c1558c9987e07f46c14f/src/syscall/futex.rs

    use core::{ptr, sync::atomic::AtomicU32, u32};

    #[allow(non_camel_case_types)]
    mod ffi {
        #[cfg(not(portable_atomic_no_asm))]
        use core::arch::asm;

        sys_const!({
            // https://github.com/redox-os/syscall/blob/0.6.0/src/number.rs#L72
            pub(crate) const SYS_FUTEX: usize = 240;

            // https://github.com/redox-os/syscall/blob/0.6.0/src/flag.rs#L60
            pub(crate) const FUTEX_WAIT: usize = 0;
            pub(crate) const FUTEX_WAKE: usize = 1;
            // Added in https://github.com/redox-os/kernel/commit/9e9d025bb57d5b832854f310c0f8a34070c5faf9
            pub(crate) const FUTEX_WAIT64: usize = 3;
        });

        pub(crate) unsafe fn syscall5(
            a: *mut (),
            b: usize,
            c: usize,
            d: usize,
            e: *const (),
            f: *mut (),
        ) -> usize {
            let ret: usize;
            unsafe {
                // https://github.com/redox-os/syscall/blob/0.6.0/src/arch/aarch64.rs
                #[cfg(target_arch = "aarch64")]
                asm!(
                    "svc 0",
                    in("x8") a,
                    in("x0") b,
                    in("x1") c,
                    in("x2") d,
                    in("x3") e,
                    in("x4") f,
                    lateout("x0") ret,
                    options(nostack),
                );
                // https://github.com/redox-os/syscall/blob/0.6.0/src/arch/riscv64.rs
                #[cfg(target_arch = "riscv64")]
                asm!(
                    "ecall",
                    in("a7") a,
                    in("a0") b,
                    in("a1") c,
                    in("a2") d,
                    in("a3") e,
                    in("a4") f,
                    lateout("a0") ret,
                    options(nostack),
                );
                // https://github.com/redox-os/syscall/blob/0.6.0/src/arch/x86.rs
                #[cfg(target_arch = "x86")]
                asm!(
                    "xchg esi, {e}
                    int 0x80
                    xchg esi, {e}",
                    e = in(reg) e,
                    inout("eax") a,
                    in("ebx") b,
                    in("ecx") c,
                    in("edx") d,
                    in("edi") f,
                    options(nostack),
                );
                // https://github.com/redox-os/syscall/blob/0.6.0/src/arch/x86_64.rs
                #[cfg(target_arch = "x86_64")]
                asm!(
                    "syscall",
                    inout("rax") a,
                    in("rdi") b,
                    in("rsi") c,
                    in("rdx") d,
                    in("r10") e,
                    in("r8") f,
                    out("rcx") _,
                    out("r11") _,
                    options(nostack),
                );
            }
            ret
        }
    }

    macro_rules! futex {
        (
            $atomic:ident, $val:ident, $op:ident,
            $wait:ident, $notify_one:ident, $notify_all:ident
        ) => {
            use core::sync::atomic::$atomic;
            #[inline]
            pub(crate) fn $wait(a: &$atomic, expected: $val) {
                unsafe {
                    ffi::syscall5(
                        ffi::SYS_FUTEX,
                        a as *const $atomic as *mut (),
                        ffi::$op,
                        expected as usize,
                        ptr::null(),
                        ptr::null_mut(),
                    );
                }
            }
            #[inline]
            pub(crate) fn $notify_one(a: *const $atomic) {
                unsafe {
                    ffi::syscall5(
                        ffi::SYS_FUTEX,
                        a as *mut (),
                        ffi::FUTEX_WAKE,
                        1,
                        ptr::null(),
                        ptr::null_mut(),
                    );
                }
            }
            #[allow(dead_code)]
            #[inline]
            pub(crate) fn $notify_all(a: *const $atomic) {
                unsafe {
                    ffi::syscall5(
                        ffi::SYS_FUTEX,
                        a as *mut (),
                        ffi::FUTEX_WAKE,
                        usize::MAX,
                        ptr::null(),
                        ptr::null_mut(),
                    );
                }
            }
        };
    }

    cfg_no_fast_atomic_64! {
        futex!(AtomicU32, u32, FUTEX_WAIT, wait32, notify32_one, notify32_all);
    }
    cfg_has_fast_atomic_64! {
        futex!(AtomicU64, u64, FUTEX_WAIT64, wait64, notify64_one, notify64_all);
    }
}
#[cfg(target_os = "hermit")]
mod os {
    use core::{ptr, sync::atomic::AtomicU32, u32};

    #[allow(non_camel_case_types)]
    mod ffi {
        sys_type!({
            pub(crate) type time_t = i64;
        });

        sys_const!({
            pub(crate) const FUTEX_RELATIVE_TIMEOUT: u32 = 1;
        });

        // TODO: use sys_fn!
        extern "C" {
            // https://github.com/hermit-os/hermit-rs/blob/hermit-abi-0.5.2/hermit-abi/src/lib.rs#L412
            // TODO: timeout is actually a pointer to timespec
            #[link_name = "sys_futex_wait"]
            pub(crate) fn futex_wait(
                address: *mut u32,
                expected: u32,
                timeout: *const [u8; 0],
                flags: u32,
            ) -> i32;
            #[link_name = "sys_futex_wake"]
            pub(crate) fn futex_wake(address: *mut u32, count: i32) -> i32;
        }
    }

    #[inline]
    pub(crate) fn wait32(a: &AtomicU32, expected: u32) {
        unsafe {
            ffi::futex_wait(
                a as *const AtomicU32 as *mut u32,
                expected,
                ptr::null(),
                ffi::FUTEX_RELATIVE_TIMEOUT,
            );
        }
    }
    #[inline]
    pub(crate) fn notify32_one(a: *const AtomicU32) {
        unsafe {
            ffi::futex_wake(a as *mut u32, 1);
        }
    }
    #[allow(dead_code)]
    #[inline]
    pub(crate) fn notify32_all(a: *const AtomicU32) {
        unsafe {
            ffi::futex_wake(a as *mut u32, i32::MAX);
        }
    }

    cfg_has_fast_atomic_64! {
        pub(crate) use super::no_futex64::{wait64, notify64_all, notify64_one};
    }
}
#[cfg(target_vendor = "apple")]
mod os {
    use core::mem;

    // libc requires Rust 1.63
    mod ffi {
        pub(crate) use crate::utils::ffi::{c_char, c_int, c_size_t, c_void};

        // TODO: use sys_const!
        #[allow(clippy::cast_sign_loss)]
        pub(crate) const RTLD_DEFAULT: *mut c_void = -2_isize as usize as *mut c_void;
        pub(crate) const OS_SYNC_WAIT_ON_ADDRESS_NONE: u32 = 0x00000000;
        pub(crate) const OS_SYNC_WAKE_BY_ADDRESS_NONE: u32 = 0x00000000;

        // https://github.com/apple-oss-distributions/xnu/blob/f6217f891ac0bb64f3d375211650a4c1ff8ca1ea/bsd/sys/ulock.h
        pub(crate) const UL_COMPARE_AND_WAIT: u32 = 1;
        pub(crate) const UL_COMPARE_AND_WAIT64: u32 = 5;
        pub(crate) const ULF_WAKE_ALL: u32 = 0x00000100;
        pub(crate) const ULF_NO_ERRNO: u32 = 0x01000000;
        sys_const!({
            // https://github.com/apple-oss-distributions/xnu/blob/f6217f891ac0bb64f3d375211650a4c1ff8ca1ea/bsd/sys/errno.h
            pub(crate) const EINTR: c_int = 4;
        });

        // TODO: use sys_fn!
        extern "C" {
            // https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man3/dlsym.3.html
            pub(crate) fn dlsym(handle: *mut c_void, symbol: *const c_char) -> *mut c_void;
        }
    }

    // https://developer.apple.com/documentation/os/os_sync_wait_on_address
    dlsym!(
        unsafe extern "C" fn os_sync_wait_on_address(
            addr: *mut ffi::c_void,
            value: u64,
            size: ffi::c_size_t,
            flags: u32,
        ) -> ffi::c_int;
    );
    dlsym!(
        unsafe extern "C" fn os_sync_wake_by_address_any(
            addr: *mut ffi::c_void,
            size: ffi::c_size_t,
            flags: u32,
        ) -> ffi::c_int;
    );
    dlsym!(
        unsafe extern "C" fn os_sync_wake_by_address_all(
            addr: *mut ffi::c_void,
            size: ffi::c_size_t,
            flags: u32,
        ) -> ffi::c_int;
    );
    // https://github.com/apple-oss-distributions/xnu/blob/f6217f891ac0bb64f3d375211650a4c1ff8ca1ea/bsd/sys/ulock.h
    // See https://github.com/rust-lang/rust/pull/122408
    dlsym!(
        unsafe extern "C" fn __ulock_wait(
            operation: u32,
            addr: *mut ffi::c_void,
            value: u64,
            timeout: u32,
        ) -> ffi::c_int;
    );
    dlsym!(
        unsafe extern "C" fn __ulock_wake(
            operation: u32,
            addr: *mut ffi::c_void,
            wake_value: u64,
        ) -> ffi::c_int;
    );

    macro_rules! futex {
        (
            $atomic:ident, $val:ident,
            $wait:ident, $notify_one:ident, $notify_all:ident
        ) => {
            use core::sync::atomic::$atomic;
            #[inline]
            pub(crate) fn $wait(a: &$atomic, expected: $val) {
                if let Some(wait) = os_sync_wait_on_address() {
                    unsafe {
                        wait(
                            a as *const $atomic as *mut ffi::c_void,
                            expected as u64,
                            mem::size_of::<$atomic>(),
                            ffi::OS_SYNC_WAIT_ON_ADDRESS_NONE,
                        );
                    }
                } else if let Some(wait) = __ulock_wait() {
                    unsafe {
                        wait(
                            match mem::size_of::<$atomic>() {
                                4 => ffi::UL_COMPARE_AND_WAIT | ffi::ULF_NO_ERRNO,
                                8 => ffi::UL_COMPARE_AND_WAIT64 | ffi::ULF_NO_ERRNO,
                                _ => unreachable!(),
                            },
                            a as *const $atomic as *mut ffi::c_void,
                            expected as u64,
                            0,
                        );
                    }
                } else {
                    super::no_futex::$wait(a, expected);
                }
            }
            #[inline]
            pub(crate) fn $notify_one(a: *const $atomic) {
                if let Some(wake) = os_sync_wake_by_address_any() {
                    unsafe {
                        wake(
                            a as *mut ffi::c_void,
                            mem::size_of::<$atomic>(),
                            ffi::OS_SYNC_WAKE_BY_ADDRESS_NONE,
                        );
                    }
                } else if let Some(wake) = __ulock_wake() {
                    loop {
                        unsafe {
                            let r = wake(
                                match mem::size_of::<$atomic>() {
                                    4 => ffi::UL_COMPARE_AND_WAIT | ffi::ULF_NO_ERRNO,
                                    8 => ffi::UL_COMPARE_AND_WAIT64 | ffi::ULF_NO_ERRNO,
                                    _ => unreachable!(),
                                },
                                a as *const $atomic as *mut ffi::c_void,
                                0,
                            );
                            if r != -ffi::EINTR {
                                break;
                            }
                        }
                    }
                } else {
                    super::no_futex::$notify_one(a);
                }
            }
            #[allow(dead_code)]
            #[inline]
            pub(crate) fn $notify_all(a: *const $atomic) {
                if let Some(wake) = os_sync_wake_by_address_all() {
                    unsafe {
                        wake(
                            a as *mut ffi::c_void,
                            mem::size_of::<$atomic>(),
                            ffi::OS_SYNC_WAKE_BY_ADDRESS_NONE,
                        );
                    }
                } else if let Some(wake) = __ulock_wake() {
                    loop {
                        unsafe {
                            let r = wake(
                                match mem::size_of::<$atomic>() {
                                    4 => {
                                        ffi::UL_COMPARE_AND_WAIT
                                            | ffi::ULF_WAKE_ALL
                                            | ffi::ULF_NO_ERRNO
                                    }
                                    8 => {
                                        ffi::UL_COMPARE_AND_WAIT64
                                            | ffi::ULF_WAKE_ALL
                                            | ffi::ULF_NO_ERRNO
                                    }
                                    _ => unreachable!(),
                                },
                                a as *const $atomic as *mut ffi::c_void,
                                0,
                            );
                            if r != -ffi::EINTR {
                                break;
                            }
                        }
                    }
                } else {
                    super::no_futex::$notify_all(a);
                }
            }
        };
    }
    cfg_no_fast_atomic_64! {
        futex!(AtomicU32, u32, wait32, notify32_one, notify32_all);
    }
    cfg_has_fast_atomic_64! {
        futex!(AtomicU64, u64, wait64, notify64_one, notify64_all);
    }
}
#[cfg(all(windows, not(target_vendor = "win7")))]
mod os {
    // https://learn.microsoft.com/en-us/windows/win32/api/synchapi/nf-synchapi-waitonaddress

    use core::{ffi::c_void, mem};

    // windows-sys requires Rust 1.71
    #[allow(non_camel_case_types, clippy::upper_case_acronyms)]
    mod ffi {
        use core::{ffi::c_void, u32};

        sys_type!({
            pub(crate) type [core] BOOL = i32;
        });
        sys_const!({
            pub(crate) const [Win32::System::Threading] INFINITE: u32 = u32::MAX;
        });
        sys_fn!({
            extern "system" {
                pub(crate) fn [Win32::System::Threading] WaitOnAddress(
                    address: *const c_void,
                    compare_address: *const c_void,
                    address_size: usize,
                    dw_milliseconds: u32,
                ) -> BOOL;
                pub(crate) fn [Win32::System::Threading] WakeByAddressSingle(
                    address: *const c_void,
                );
                pub(crate) fn [Win32::System::Threading] WakeByAddressAll(address: *const c_void);
            }
        });
    }

    macro_rules! futex {
        (
            $atomic:ident, $val:ident,
            $wait:ident, $notify_one:ident, $notify_all:ident
        ) => {
            use core::sync::atomic::$atomic;
            #[inline]
            pub(crate) fn $wait(a: &$atomic, expected: $val) {
                unsafe {
                    ffi::WaitOnAddress(
                        a as *const $atomic as *const c_void,
                        &expected as *const $val as *const c_void,
                        mem::size_of::<$atomic>(),
                        ffi::INFINITE,
                    );
                }
            }
            #[inline]
            pub(crate) fn $notify_one(a: *const $atomic) {
                unsafe {
                    ffi::WakeByAddressSingle(a as *const c_void);
                }
            }
            #[allow(dead_code)]
            #[inline]
            pub(crate) fn $notify_all(a: *const $atomic) {
                unsafe {
                    ffi::WakeByAddressAll(a as *const c_void);
                }
            }
        };
    }
    cfg_no_fast_atomic_64! {
        futex!(AtomicU32, u32, wait32, notify32_one, notify32_all);
    }
    cfg_has_fast_atomic_64! {
        futex!(AtomicU64, u64, wait64, notify64_one, notify64_all);
    }
}
#[cfg(not(any(
    all(target_os = "linux", not(any(target_arch = "wasm32", target_arch = "wasm64"))),
    target_os = "android",
    target_os = "freebsd",
    target_os = "openbsd",
    target_os = "dragonfly",
    target_os = "fuchsia",
    target_os = "hermit",
    target_vendor = "apple",
    all(windows, not(target_vendor = "win7")),
)))]
mod os {
    cfg_no_fast_atomic_64! {
        pub(crate) use super::no_futex::{wait32, notify32_all, notify32_one};
    }
    cfg_has_fast_atomic_64! {
        pub(crate) use super::no_futex::{wait64, notify64_all, notify64_one};
    }
}

#[cfg(any(
    all(target_os = "linux", not(any(target_arch = "wasm32", target_arch = "wasm64"))),
    target_os = "android",
    target_os = "openbsd",
    target_os = "dragonfly",
    target_os = "fuchsia",
    target_os = "hermit",
))]
cfg_has_fast_atomic_64! {
mod no_futex64 {
    use core::{convert::TryFrom as _, sync::atomic::{AtomicU32, AtomicU64}};

    use super::os;

    #[cfg(miri)]
    pub(crate) use super::no_futex::{wait64, notify64_all, notify64_one};

    #[cfg(not(miri))]
    #[inline]
    pub(crate) fn wait64(a: &AtomicU64, expected: u64) {
        let expected = u32::try_from(expected).unwrap();
        // TODO:
        // - https://github.com/rust-lang/unsafe-code-guidelines/issues/345
        let a = unsafe { &*(a as *const AtomicU64 as *const [AtomicU32; 2]) };
        os::wait32(&a[cfg!(target_endian = "big") as usize], expected);
    }
    #[cfg(not(miri))]
    #[inline]
    pub(crate) fn notify64_one(a: *const AtomicU64) {
        os::notify32_one(a as *const AtomicU32);
    }
    #[cfg(not(miri))]
    #[allow(dead_code)]
    #[inline]
    pub(crate) fn notify64_all(a: *const AtomicU64) {
        os::notify32_all(a as *const AtomicU32);
    }
}
} // cfg_has_fast_atomic_64!

#[cfg(not(any(target_os = "freebsd", all(windows, not(target_vendor = "win7")))))]
#[allow(dead_code)]
mod no_futex {
    // No futex... fallback to spinlock...
    #[cfg(not(any(
        target_os = "linux",
        target_os = "android",
        target_os = "freebsd",
        target_os = "openbsd",
        target_os = "dragonfly",
        target_os = "fuchsia",
        target_os = "hermit",
        all(windows, not(target_vendor = "win7")),
    )))]
    cfg_no_fast_atomic_64! {
        use core::sync::atomic::AtomicU32;
        #[inline]
        pub(crate) fn wait32(_: &AtomicU32, _: u32) {
            #[cfg(not(feature = "std"))]
            #[allow(deprecated)]
            core::sync::atomic::spin_loop_hint();
            #[cfg(feature = "std")]
            std::thread::yield_now();
        }
        #[inline(always)]
        pub(crate) fn notify32_one(_: *const AtomicU32) {}
        #[inline(always)]
        pub(crate) fn notify32_all(_: *const AtomicU32) {}
    }
    cfg_has_fast_atomic_64! {
        use core::sync::atomic::AtomicU64;
        #[inline]
        pub(crate) fn wait64(_: &AtomicU64, _: u64) {
            #[cfg(not(feature = "std"))]
            #[allow(deprecated)]
            core::sync::atomic::spin_loop_hint();
            #[cfg(feature = "std")]
            std::thread::yield_now();
        }
        #[inline(always)]
        pub(crate) fn notify64_one(_: *const AtomicU64) {}
        #[inline(always)]
        pub(crate) fn notify64_all(_: *const AtomicU64) {}
    }
}
