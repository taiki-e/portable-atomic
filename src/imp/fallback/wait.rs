// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
This uses:
- futex-based waiting on Linux, Android, FreeBSD, NetBSD, OpenBSD, DragonFly BSD, Fuchsia, and Hermit.
- spinning-based waiting otherwise (we always used this in portable-atomic 1.14.0 and earlier).

The following platforms also supports futex, but currently not used here:
- Redox:
  - It seems that the interface is not stabilized?
    https://github.com/rust-lang/libc/blob/0.2.189/src/unix/redox/mod.rs
    https://redox-os.org/news/development-priorities-2023-09/
  - std does't use this in mutex, as of Rust 1.97.
- Motor: futex_wait/futex_wake
  - It seems syscalls need to be made via VDSO vtable, for which ABI stability may not guaranteed.
    https://github.com/moturus/motor-os/blob/d7a9ac1810d4e5626fdd535533f39660f57f5240/src/sys/lib/moto-rt/src/futex.rs
    https://github.com/moturus/motor-os/blob/d7a9ac1810d4e5626fdd535533f39660f57f5240/src/sys/lib/moto-rt/src/lib.rs#L145
- WASIp3: __wasilibc_futex_wait/__wasilibc_futex_wake
  - It seems that this is not yet released? https://github.com/WebAssembly/wasi-libc/pull/834
- Emscripten: emscripten_futex_wait/emscripten_futex_wake https://github.com/emscripten-core/emscripten/blob/4.0.22/system/include/emscripten/threading.h
  - "atomics" target feature is nightly-only.
- Wasm: memory_atomic_wait32/memory_atomic_wait64/memory_atomic_notify https://doc.rust-lang.org/nightly/core/arch/wasm32/fn.memory_atomic_notify.html?search=memory_atomic_
  - core::arch::wasm*::memory_atomic_wait* are unstable.
  - "atomics" target feature is nightly-only.
- Apple targets: os_sync_wait_on_address/os_sync_wake_by_address_any
  - All 64-bit architecture targets have 128-bit atomics in the baseline.
  - All 32-bit architecture targets are tier 3 since Apple dropped support for them:
    https://github.com/rust-lang/rfcs/pull/2837
  - Public futex APIs are only available on recent versions (iOS 17.4+, macOS 14.4+, tvOS 17.4+,
    visionOS 1.1+, watchOS 10.4+), which do not support 32-bit architecture.
- Windows: WaitOnAddress/WakeByAddressSingle
  - All 64-bit architecture targets except Windows 7 have 128-bit atomics in the baseline (they are
    included in the baseline since Windows 8.1+).
  - futex APIs are only available on Windows 8+, so futex APIs is usually unavailable in 64-bit
    architecture targets do not have 128-bit atomics in the baseline.
  - The last versions that supports 32-bit architectures (Windows 10 / Server 2008) has already reached EoL.
    https://learn.microsoft.com/en-us/lifecycle/announcements/windows-10-end-of-support
    https://learn.microsoft.com/en-us/lifecycle/products/windows-10-home-and-pro
    https://learn.microsoft.com/en-us/lifecycle/products/windows-server-2008

Refs:
- https://github.com/rust-lang/rust/blob/1.97.0/library/std/src/sys/pal/unix/futex.rs
- https://github.com/rust-lang/rust/blob/1.97.0/library/std/src/sys/pal/windows/futex.rs
- https://github.com/rust-lang/rust/blob/1.97.0/library/std/src/sys/pal/hermit/futex.rs
- https://github.com/rust-lang/rust/blob/1.97.0/library/std/src/sys/pal/wasm/atomics/futex.rs
- https://github.com/rust-lang/rust/blob/29e68fe2295f8fc2feb52b8cb0b61a055842fdcf/library/std/src/sys/pal/wasi/wasilibc_futex.rs
*/

cfg_sel!({
    // -------------------------------------------------------------------------
    // Linux/Android
    //
    // Do not include WASM Linux because it is not upstreamed and ABI is different between implementations.
    // https://github.com/arjunr2/wali-musl/blob/ac08acb01cb951c725f7d05c5693a47129f5f679/arch/wasm32/bits/syscall.h.in
    // https://github.com/joelseverin/linux-wasm/blob/970e08b0d605e63e36a99d22596e8899a1dab8b5/patches/kernel/0005-Add-Wasm-architecture.patch#L1457
    #[cfg(all(
        any(target_os = "linux", target_os = "android"),
        any(
            // NB: When adding/enabling target_arch here,
            //     - Add syscall number below.
            //     - Add target for new arch to tools/matrix.sh or tools/build.sh if possible.
            // Note that alpha, arc, arc64, hppa, hppa64, ia64, microblaze, nios2, or1k, and sh
            // are currently disabled because they are currently not supported by rustc.
            target_arch = "aarch64",
            // target_arch = "arc",
            // target_arch = "arc64",
            target_arch = "csky",
            target_arch = "hexagon",
            target_arch = "loongarch64",
            // target_arch = "nios2",
            // target_arch = "or1k",
            target_arch = "riscv64",
            target_arch = "loongarch32",
            target_arch = "riscv32",
            // target_arch = "alpha",
            target_arch = "arm",
            // target_arch = "hppa",
            // target_arch = "hppa64",
            // target_arch = "ia64",
            target_arch = "m68k",
            // target_arch = "microblaze",
            target_arch = "mips",
            target_arch = "mips32r6",
            target_arch = "mips64",
            target_arch = "mips64r6",
            target_arch = "powerpc",
            target_arch = "powerpc64",
            target_arch = "s390x",
            // target_arch = "sh",
            target_arch = "sparc",
            target_arch = "sparc64",
            target_arch = "x86",
            target_arch = "x86_64",
            target_arch = "xtensa",
        ),
    ))]
    {
        use core::{ptr, sync::atomic::AtomicU32};

        // libc requires Rust 1.63
        #[allow(non_upper_case_globals)]
        mod ffi {
            pub(crate) use crate::utils::ffi::{c_int, c_long};

            sys_const!({
                // https://man7.org/linux/man-pages/man2/futex.2.html
                // NB: When adding/enabling syscall number here,
                //     - Update cfg for Linux/Android above.
                //     - Add target for new arch to tools/matrix.sh or tools/build.sh if possible.
                // Note that alpha, arc, arc64, hppa, hppa64, ia64, microblaze, nios2, or1k, and sh
                // are currently disabled because they are currently not supported by rustc.
                // https://github.com/torvalds/linux/blob/v7.1/include/uapi/asm-generic/unistd.h#L270
                // https://github.com/torvalds/linux/blob/v7.1/include/uapi/asm-generic/unistd.h#L751
                // https://github.com/torvalds/linux/blob/v7.1/arch/arc/include/uapi/asm/unistd.h
                // https://github.com/torvalds/linux/blob/v7.1/arch/arc/kernel/Makefile.syscalls
                // https://github.com/foss-for-synopsys-dwc-arc-processors/linux/blob/arc64/arch/arc/include/uapi/asm/unistd.h
                // https://github.com/torvalds/linux/blob/v7.1/arch/arm64/include/uapi/asm/unistd.h
                // https://github.com/torvalds/linux/blob/v7.1/arch/csky/include/uapi/asm/unistd.h
                // https://github.com/torvalds/linux/blob/v7.1/arch/csky/kernel/Makefile.syscalls
                // https://github.com/torvalds/linux/blob/v7.1/arch/hexagon/include/uapi/asm/unistd.h
                // https://github.com/torvalds/linux/blob/v7.1/arch/hexagon/kernel/Makefile.syscalls
                // https://github.com/torvalds/linux/blob/v7.1/arch/loongarch/include/uapi/asm/unistd.h
                // https://github.com/torvalds/linux/blob/v7.1/arch/nios2/include/uapi/asm/unistd.h
                // https://github.com/torvalds/linux/blob/v7.1/arch/openrisc/include/uapi/asm/unistd.h
                // https://github.com/torvalds/linux/blob/v7.1/arch/openrisc/kernel/Makefile.syscalls
                // https://github.com/torvalds/linux/blob/v7.1/arch/riscv/include/uapi/asm/unistd.h
                #[cfg(any(
                    target_arch = "aarch64",
                    // target_arch = "arc",
                    // target_arch = "arc64",
                    target_arch = "csky",
                    target_arch = "hexagon",
                    target_arch = "loongarch64",
                    // target_arch = "nios2",
                    // target_arch = "or1k",
                    target_arch = "riscv64",
                ))]
                pub(crate) const __NR_futex: c_long = 98;
                // These have no time32 syscalls.
                // https://github.com/torvalds/linux/blob/v7.1/arch/loongarch/kernel/Makefile.syscalls
                // https://github.com/torvalds/linux/blob/v7.1/arch/riscv/kernel/Makefile.syscalls
                #[cfg(any(target_arch = "loongarch32", target_arch = "riscv32"))]
                pub(crate) const __NR_futex_time64: c_long = 422;
                // // https://github.com/torvalds/linux/blob/v7.1/arch/alpha/kernel/syscalls/syscall.tbl#L327
                // #[cfg(target_arch = "alpha")]
                // pub(crate) const __NR_futex: c_long = 394;
                // https://github.com/torvalds/linux/blob/v7.1/arch/arm/tools/syscall.tbl#L258
                #[cfg(target_arch = "arm")]
                pub(crate) const __NR_futex: c_long = 240;
                // // https://github.com/torvalds/linux/blob/v7.1/arch/parisc/kernel/syscalls/syscall.tbl#L233-L234
                // #[cfg(any(target_arch = "hppa", target_arch = "hppa64"))]
                // pub(crate) const __NR_futex: c_long = 210;
                // // https://github.com/linux-ia64/linux-ia64/blob/v7.1-epic2/arch/ia64/kernel/syscalls/syscall.tbl#L8
                // // https://github.com/linux-ia64/linux-ia64/blob/v7.1-epic2/arch/ia64/kernel/syscalls/syscall.tbl#L218
                // #[cfg(target_arch = "ia64")]
                // pub(crate) const __NR_futex: c_long = 1024 + 206;
                // https://github.com/torvalds/linux/blob/v7.1/arch/m68k/kernel/syscalls/syscall.tbl#L245
                #[cfg(target_arch = "m68k")]
                pub(crate) const __NR_futex: c_long = 235;
                // // https://github.com/torvalds/linux/blob/v7.1/arch/microblaze/kernel/syscalls/syscall.tbl#L250
                // #[cfg(target_arch = "microblaze")]
                // pub(crate) const __NR_futex: c_long = 240;
                // https://github.com/torvalds/linux/blob/v7.1/arch/mips/include/uapi/asm/unistd.h
                // https://github.com/torvalds/linux/blob/v7.1/arch/mips/kernel/syscalls/syscall_o32.tbl#L252
                #[cfg(any(target_arch = "mips", target_arch = "mips32r6"))]
                pub(crate) const __NR_futex: c_long = /* __NR_Linux */ 4000 + 238;
                // https://github.com/torvalds/linux/blob/v7.1/arch/mips/kernel/syscalls/syscall_n64.tbl#L205
                #[cfg(all(
                    any(target_arch = "mips64", target_arch = "mips64r6"),
                    target_pointer_width = "64"
                ))]
                pub(crate) const __NR_futex: c_long = /* __NR_Linux */ 5000 + 194;
                // https://github.com/torvalds/linux/blob/v7.1/arch/mips/kernel/syscalls/syscall_n32.tbl#L205
                #[cfg(all(
                    any(target_arch = "mips64", target_arch = "mips64r6"),
                    target_pointer_width = "32"
                ))]
                pub(crate) const __NR_futex: c_long = /* __NR_Linux */ 6000 + 194;
                // https://github.com/torvalds/linux/blob/v7.1/arch/powerpc/kernel/syscalls/syscall.tbl#L281-L283
                #[cfg(any(target_arch = "powerpc", target_arch = "powerpc64"))]
                pub(crate) const __NR_futex: c_long = 221;
                // https://github.com/torvalds/linux/blob/v7.1/arch/s390/kernel/syscalls/syscall.tbl#L195
                #[cfg(target_arch = "s390x")]
                pub(crate) const __NR_futex: c_long = 238;
                // // https://github.com/torvalds/linux/blob/v7.1/arch/sh/kernel/syscalls/syscall.tbl#L250
                // #[cfg(target_arch = "sh")]
                // pub(crate) const __NR_futex: c_long = 240;
                // https://github.com/torvalds/linux/blob/v7.1/arch/sparc/kernel/syscalls/syscall.tbl#L178-L179
                #[cfg(any(target_arch = "sparc", target_arch = "sparc64"))]
                pub(crate) const __NR_futex: c_long = 142;
                // https://github.com/torvalds/linux/blob/v7.1/arch/x86/entry/syscalls/syscall_32.tbl#L255
                #[cfg(target_arch = "x86")]
                pub(crate) const __NR_futex: c_long = 240;
                // https://github.com/torvalds/linux/blob/v7.1/arch/x86/entry/syscalls/syscall_64.tbl#L214
                #[cfg(all(target_arch = "x86_64", target_pointer_width = "64"))]
                pub(crate) const __NR_futex: c_long = 202;
                // https://github.com/torvalds/linux/blob/v7.1/arch/x86/include/uapi/asm/unistd.h#L13
                #[cfg(all(target_arch = "x86_64", target_pointer_width = "32"))]
                pub(crate) const __NR_futex: c_long = /* __X32_SYSCALL_BIT */ 0x40000000 + 202;
                // https://github.com/torvalds/linux/blob/v7.1/arch/xtensa/kernel/syscalls/syscall.tbl#L209
                #[cfg(target_arch = "xtensa")]
                pub(crate) const __NR_futex: c_long = 191;

                // https://github.com/torvalds/linux/blob/v7.1/include/uapi/linux/futex.h
                // Linux 2.6.0+
                pub(crate) const FUTEX_WAIT: c_int = 0;
                pub(crate) const FUTEX_WAKE: c_int = 1;
                // Linux 2.6.22+
                pub(crate) const FUTEX_PRIVATE_FLAG: c_int = 128;
                pub(crate) const FUTEX_WAIT_PRIVATE: c_int = FUTEX_WAIT | FUTEX_PRIVATE_FLAG;
                pub(crate) const FUTEX_WAKE_PRIVATE: c_int = FUTEX_WAKE | FUTEX_PRIVATE_FLAG;
            });
            #[cfg(any(target_arch = "loongarch32", target_arch = "riscv32"))]
            pub(crate) use self::__NR_futex_time64 as __NR_futex;

            cfg_sel!({
                // Use asm-based syscall on Linux for compatibility with non-libc targets if possible.
                // Do not use this on Android. See comments on syscall_helper module in src/utils.rs for details.
                //
                // aarch64 and s390x are test-only even without test cfg because we can always
                // provide 128-bit atomics on them when inline assembly is available (i.e.,
                // this module is only used in older versions where inline assembly isn't available
                // or in testing).
                //
                // x86_32's fast syscall (__kernel_vsyscall) is complex and needs access to auxv
                // (usually exposed via getauxval), so we use syscall from libc instead of manually
                // implements it for targets with libc.
                // Slow x86_32 asm syscall is used only on non-libc targets and testing.
                //
                // Miri and Sanitizer do not support inline assembly.
                #[cfg(all(
                    target_os = "linux",
                    any(
                        all(
                            any(
                                all(
                                    target_arch = "x86",
                                    any(
                                        portable_atomic_test_asm_syscall,
                                        not(any(
                                            target_env = "gnu",
                                            target_env = "musl",
                                            target_env = "ohos",
                                            target_env = "uclibc",
                                        )),
                                    ),
                                ),
                                target_arch = "x86_64",
                                target_arch = "arm",
                                all(test, target_arch = "aarch64", target_pointer_width = "64"),
                                target_arch = "riscv32",
                                all(target_arch = "riscv64", target_pointer_width = "64"),
                            ),
                            any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
                        ),
                        all(
                            any(
                                target_arch = "loongarch32",
                                all(target_arch = "loongarch64", target_pointer_width = "64"),
                                target_arch = "powerpc",
                                all(target_arch = "powerpc64", target_pointer_width = "64"),
                                all(test, target_arch = "s390x", target_pointer_width = "64"),
                            ),
                            any(
                                not(portable_atomic_no_asm),
                                portable_atomic_unstable_asm_experimental_arch,
                            ),
                        ),
                    ),
                    not(any(miri, portable_atomic_sanitize_thread)),
                    not(portable_atomic_no_asm_syscall),
                ))]
                {
                    #[cfg(not(all(portable_atomic_no_asm, portable_atomic_unstable_asm)))]
                    use core::arch::asm;

                    use crate::utils::{RegISize, RegSize};

                    #[inline]
                    pub(crate) unsafe fn futex_wake_syscall3(
                        number: c_long,
                        u_addr: *mut u32,
                        op: c_int,
                        val: u32,
                    ) -> c_long {
                        debug_assert_eq!(number, __NR_futex);
                        // arguments must be extended to 64-bit if 64-bit arch.
                        #[cfg_attr(
                            any(target_arch = "arm", target_arch = "s390x"),
                            allow(unused_variables)
                        )]
                        #[allow(clippy::cast_possible_truncation)]
                        let number = number as RegISize;
                        let arg1 = ptr_reg!(u_addr);
                        let arg2 = op as RegISize;
                        let arg3 = val as RegSize;
                        let r;
                        // SAFETY: the caller must uphold the safety contract.
                        unsafe {
                            #[cfg(target_arch = "arm")]
                            asm_syscall!(__NR_futex, 240, r, arg1, arg2, arg3);
                            #[cfg(target_arch = "s390x")]
                            asm_syscall!(__NR_futex, 238, r, arg1, arg2, arg3);
                            // POWER9+ has fast syscall using SCV, but since 128-bit atomics are
                            // available in POWER8+, there’s no need to consider it here.
                            #[cfg(not(any(target_arch = "arm", target_arch = "s390x")))]
                            asm_syscall!(number, r, arg1, arg2, arg3);
                        }
                        r
                    }
                    #[inline]
                    pub(crate) unsafe fn futex_wait_no_timeout_syscall4(
                        number: c_long,
                        u_addr: *mut u32,
                        op: c_int,
                        val: u32,
                        arg4: *const [u8; 0],
                    ) -> c_long {
                        debug_assert_eq!(number, __NR_futex);
                        debug_assert!(arg4.is_null());
                        // arguments must be extended to 64-bit if 64-bit arch.
                        #[cfg_attr(
                            any(target_arch = "arm", target_arch = "s390x"),
                            allow(unused_variables)
                        )]
                        #[allow(clippy::cast_possible_truncation)]
                        let number = number as RegISize;
                        let arg1 = ptr_reg!(u_addr);
                        let arg2 = op as RegISize;
                        let arg3 = val as RegSize;
                        #[cfg_attr(target_arch = "x86", allow(unused_variables))]
                        let arg4 = ptr_reg!(arg4);
                        let r;
                        // SAFETY: the caller must uphold the safety contract.
                        unsafe {
                            #[cfg(target_arch = "x86")]
                            asm_syscall!(number, r, arg1, arg2, arg3, 0);
                            #[cfg(target_arch = "arm")]
                            asm_syscall!(__NR_futex, 240, r, arg1, arg2, arg3, arg4);
                            #[cfg(target_arch = "s390x")]
                            asm_syscall!(__NR_futex, 238, r, arg1, arg2, arg3, arg4);
                            // POWER9+ has fast syscall using SCV, but since 128-bit atomics are
                            // available in POWER8+, there’s no need to consider it here.
                            #[cfg(not(any(
                                target_arch = "x86",
                                target_arch = "arm",
                                target_arch = "s390x",
                            )))]
                            asm_syscall!(number, r, arg1, arg2, arg3, arg4);
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
                    pub(crate) use self::{
                        syscall as futex_wake_syscall3, syscall as futex_wait_no_timeout_syscall4,
                    };
                }
            });
        }

        // Always use "wide" sequence lock because Linux doesn't provide 64-bit futex.
        //
        // Compared to the approach that uses a 32-bit futex on the lower bits of a 64-bit atomic
        // (which is UB under our current memory model: https://github.com/rust-lang/unsafe-code-guidelines/issues/345),
        // this is about 5% slower in a simple concurrent read benchmark (no difference in concurrent write benchmark).
        // However, since normal mutex is much slower in the same benchmark, this is acceptable.
        #[path = "seq_lock_wide.rs"]
        pub(crate) mod seq_lock;
        #[inline]
        pub(crate) fn wait32(a: &AtomicU32, expected: u32) {
            // SAFETY: any data races are prevented since accesses to `a` are atomic and
            // the raw pointer passed in is valid because we got it from a reference.
            unsafe {
                // std uses FUTEX_WAIT_BITSET instead of FUTEX_WAIT for timeout with absolute time,
                // but we use FUTEX_WAIT since we don't use timeout.
                // https://github.com/rust-lang/rust/blob/1.97.0/library/std/src/sys/pal/unix/futex.rs#L71
                ffi::futex_wait_no_timeout_syscall4(
                    ffi::__NR_futex,
                    a as *const AtomicU32 as *mut u32,
                    ffi::FUTEX_WAIT_PRIVATE,
                    expected,
                    ptr::null::<[u8; 0]>(), // timeout is actually a pointer to timespec, but is fine because we only pass null.
                );
            }
        }
        #[inline]
        pub(crate) fn notify32_one(a: &AtomicU32) {
            // SAFETY: the raw pointer passed in is valid because we got it from a reference.
            // (AFAIK, FUTEX_WAKE_PRIVATE (not FUTEX_WAKE) is safe even is the pointer is invalid,
            // but Valgrind complains about invalid pointers including null at least on Linux.
            // https://bugs.kde.org/show_bug.cgi?id=377698)
            unsafe {
                ffi::futex_wake_syscall3(
                    ffi::__NR_futex,
                    a as *const AtomicU32 as *mut u32,
                    ffi::FUTEX_WAKE_PRIVATE,
                    1,
                );
            }
        }
    }
    // -------------------------------------------------------------------------
    // FreeBSD
    #[cfg(target_os = "freebsd")]
    {
        use core::ptr;

        // libc requires Rust 1.63
        mod ffi {
            pub(crate) use crate::utils::ffi::{c_int, c_ulong, c_void};

            sys_const!({
                // Defined in sys/umtx.h.
                // https://github.com/freebsd/freebsd-src/blob/release/15.0.0/sys/sys/umtx.h
                // FreeBSD 6.0+
                // https://github.com/freebsd/freebsd-src/blob/release/6.0.0/sys/sys/umtx.h
                #[allow(dead_code)]
                pub(crate) const UMTX_OP_WAIT: c_int = 2;
                #[allow(dead_code)]
                pub(crate) const UMTX_OP_WAKE: c_int = 3;
                // FreeBSD 8.0+/7.2+
                // https://github.com/freebsd/freebsd-src/commit/727158f6f64df04094d41ca5ee4b0641308c39d0
                // https://github.com/freebsd/freebsd-src/blame/release/7.2.0/sys/sys/umtx.h
                #[allow(dead_code)]
                pub(crate) const UMTX_OP_WAIT_UINT_PRIVATE: c_int = 15;
                #[allow(dead_code)]
                pub(crate) const UMTX_OP_WAKE_PRIVATE: c_int = 16;
            });

            sys_fn!({
                extern "C" {
                    // Defined in sys/umtx.h.
                    // https://man.freebsd.org/_umtx_op(2)
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
                $atomic:ident, $val:ident, $wait_op:ident, $wake_op:ident,
                $wait:ident, $notify_one:ident
            ) => {
                use core::sync::atomic::$atomic;
                #[inline]
                pub(crate) fn $wait(a: &$atomic, expected: $val) {
                    // SAFETY: any data races are prevented since accesses to `a` are atomic and
                    // the raw pointer passed in is valid because we got it from a reference.
                    unsafe {
                        ffi::_umtx_op(
                            a as *const $atomic as *mut ffi::c_void,
                            ffi::$wait_op,
                            expected,
                            ptr::null_mut(),
                            ptr::null_mut(),
                        );
                    }
                }
                #[inline]
                pub(crate) fn $notify_one(a: &$atomic) {
                    // SAFETY: the raw pointer passed in is valid because we got it from a reference.
                    unsafe {
                        ffi::_umtx_op(
                            a as *const $atomic as *mut ffi::c_void,
                            ffi::$wake_op,
                            1,
                            ptr::null_mut(),
                            ptr::null_mut(),
                        );
                    }
                }
            };
        }
        // Use "wide" sequence lock if the pointer width <= 32 for preventing its counter against wrap around.
        #[cfg(target_pointer_width = "32")]
        #[path = "seq_lock_wide.rs"]
        pub(crate) mod seq_lock;
        #[cfg(target_pointer_width = "32")]
        futex!(
            AtomicU32,
            u32,
            UMTX_OP_WAIT_UINT_PRIVATE,
            UMTX_OP_WAKE_PRIVATE,
            wait32,
            notify32_one
        );
        // Do not use cfg_{has,no}_fast_atomic_64 because val of _umtx_op is c_ulong.
        #[cfg(target_pointer_width = "64")]
        #[path = "seq_lock.rs"]
        pub(crate) mod seq_lock;
        // No UMTX_OP_WAIT_PRIVATE...
        #[cfg(target_pointer_width = "64")]
        futex!(AtomicU64, u64, UMTX_OP_WAIT, UMTX_OP_WAKE, wait64, notify64_one);
    }
    // -------------------------------------------------------------------------
    // NetBSD
    #[cfg(target_os = "netbsd")]
    {
        use core::{mem, ptr, sync::atomic::AtomicU32};

        // libc requires Rust 1.63
        #[allow(non_upper_case_globals)]
        mod ffi {
            pub(crate) use crate::utils::ffi::{c_int, c_size_t, c_uint, c_void};

            sys_const!({
                // Defined in sys/syscall.h.
                // https://github.com/NetBSD/src/blob/f5cfc934b2f7e3f91edd7ff7b2c88a68ccf0cd94/sys/kern/syscalls.master
                // NetBSD 10.0+/9.99.60+
                pub(crate) const SYS___futex: c_int = 166;

                // Defined in sys/sysctl.h.
                // https://github.com/NetBSD/src/blob/f5cfc934b2f7e3f91edd7ff7b2c88a68ccf0cd94/sys/sys/sysctl.h
                pub(crate) const CTL_KERN: c_int = 1;
                pub(crate) const KERN_OSREV: c_int = 3;

                // Defined in sys/futex.h.
                // https://github.com/NetBSD/src/blob/f5cfc934b2f7e3f91edd7ff7b2c88a68ccf0cd94/sys/sys/futex.h
                // NetBSD 10.0+/9.99.60+
                pub(crate) const FUTEX_WAIT: c_int = 0;
                pub(crate) const FUTEX_WAKE: c_int = 1;
            });
            // TODO: use sys_const!
            pub(crate) const FUTEX_PRIVATE_FLAG: c_int = 1 << 7;
            // Not in sys/futex.h.
            pub(crate) const FUTEX_WAIT_PRIVATE: c_int = FUTEX_WAIT | FUTEX_PRIVATE_FLAG;
            pub(crate) const FUTEX_WAKE_PRIVATE: c_int = FUTEX_WAKE | FUTEX_PRIVATE_FLAG;

            sys_fn!({
                extern "C" {
                    // Defined in unistd.h.
                    // https://man.netbsd.org/syscall.2
                    // https://github.com/NetBSD/src/blob/f5cfc934b2f7e3f91edd7ff7b2c88a68ccf0cd94/include/unistd.h
                    pub(crate) fn syscall(number: c_int, ...) -> c_int;

                    // Defined in sys/sysctl.h.
                    // https://man.netbsd.org/sysctl.3
                    // https://github.com/NetBSD/src/blob/f5cfc934b2f7e3f91edd7ff7b2c88a68ccf0cd94/sys/sys/sysctl.h
                    pub(crate) fn sysctl(
                        name: *const c_int,
                        name_len: c_uint,
                        old_p: *mut c_void,
                        old_len_p: *mut c_size_t,
                        new_p: *const c_void,
                        new_len: c_size_t,
                    ) -> c_int;
                }
            });
        }

        // On NetBSD, calling unsupported syscall rises SIGSYS, so check OS version.
        // https://github.com/NetBSD/src/blob/netbsd-9/sys/kern/kern_stub.c#L221
        // https://github.com/rust-lang/rust/pull/96510#issuecomment-1115166761
        #[inline]
        pub(crate) fn has_futex() -> i32 {
            use core::sync::atomic::{AtomicI32, Ordering};
            // -1: uninit
            // 1: true
            // 0: false
            static CACHE: AtomicI32 = AtomicI32::new(-1);
            let mut has = CACHE.load(Ordering::Relaxed);
            if has < 0 {
                has = _has_futex();
                CACHE.store(has, Ordering::Relaxed);
            }
            has
        }
        #[cold]
        fn _has_futex() -> i32 {
            // 9.99.59 https://github.com/NetBSD/src/blob/a05c41214ee690611f4ea1807eb5a0ed6f1f887a/sys/kern/syscalls.master#L355
            // 9.99.60 https://github.com/NetBSD/src/blob/33f8b0c3e31b8851ba0e4a7a740d2f5b8ba13464/sys/kern/syscalls.master#L355
            const FUTEX_MIN_OSREV: ffi::c_int = 999_006_000; // NetBSD 9.99.60
            const OSREV_LEN: ffi::c_size_t = mem::size_of::<ffi::c_int>() as ffi::c_size_t;
            let mib = [ffi::CTL_KERN, ffi::KERN_OSREV];
            #[allow(clippy::cast_possible_truncation)]
            let mib_len = mib.len() as ffi::c_uint;
            let mut osrev: ffi::c_int = 0;
            let mut osrev_len: ffi::c_size_t = OSREV_LEN;
            // SAFETY:
            // - `mib_len` does not exceed the size of `mib`.
            // - `osrev_len` does not exceed the size of `osrev`.
            // - `sysctl` is thread-safe.
            let res = unsafe {
                ffi::sysctl(
                    mib.as_ptr(),
                    mib_len,
                    &mut osrev as *mut ffi::c_int as *mut ffi::c_void,
                    &mut osrev_len,
                    ptr::null(),
                    0,
                )
            };
            (res == 0 && osrev_len == OSREV_LEN && osrev >= FUTEX_MIN_OSREV) as i32
        }

        // Always use "wide" sequence lock because NetBSD doesn't provide 64-bit futex.
        #[path = "seq_lock_wide.rs"]
        pub(crate) mod seq_lock;
        #[inline]
        pub(crate) fn wait32(a: &AtomicU32, expected: u32) {
            if has_futex() != 0 {
                #[allow(clippy::cast_possible_wrap)]
                let expected = expected as ffi::c_int;
                // SAFETY: any data races are prevented since accesses to `a` are atomic and
                // the raw pointer passed in is valid because we got it from a reference, and
                // we've checked the NetBSD version.
                unsafe {
                    ffi::syscall(
                        ffi::SYS___futex,
                        a as *const AtomicU32 as *mut ffi::c_int,
                        ffi::FUTEX_WAIT_PRIVATE,
                        expected,
                        ptr::null::<[u8; 0]>(), // timeout is actually a pointer to timespec, but is fine because we only pass null.
                        ptr::null_mut::<ffi::c_int>(),
                        0_i32,
                        0_i32,
                    );
                }
            } else {
                self::no_futex::wait32(a, expected);
            }
        }
        #[inline]
        pub(crate) fn notify32_one(a: &AtomicU32) {
            if has_futex() != 0 {
                // SAFETY: the raw pointer passed in is valid because we got it from a reference, and
                // we've checked the NetBSD version.
                unsafe {
                    ffi::syscall(
                        ffi::SYS___futex,
                        a as *const AtomicU32 as *mut ffi::c_int,
                        ffi::FUTEX_WAKE_PRIVATE,
                        1,
                    );
                }
            } else {
                self::no_futex::notify32_one(a);
            }
        }
    }
    // -------------------------------------------------------------------------
    // OpenBSD
    #[cfg(target_os = "openbsd")]
    {
        use core::{ptr, sync::atomic::AtomicU32};

        // libc requires Rust 1.63
        mod ffi {
            pub(crate) use crate::utils::ffi::c_int;

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
                    // timeout is actually a pointer to timespec, but is fine because we only pass null.
                    // (And somehow it matches what bindgen generates.)
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

        // Always use "wide" sequence lock because OpenBSD doesn't provide 64-bit futex.
        #[path = "seq_lock_wide.rs"]
        pub(crate) mod seq_lock;
        #[inline]
        pub(crate) fn wait32(a: &AtomicU32, expected: u32) {
            #[allow(clippy::cast_possible_wrap)]
            let expected = expected as ffi::c_int;
            // SAFETY: any data races are prevented since accesses to `a` are atomic and
            // the raw pointer passed in is valid because we got it from a reference.
            unsafe {
                ffi::futex(
                    a as *const AtomicU32 as *mut u32,
                    ffi::FUTEX_WAIT_PRIVATE,
                    expected,
                    ptr::null(),
                    ptr::null_mut(),
                );
            }
        }
        #[inline]
        pub(crate) fn notify32_one(a: &AtomicU32) {
            // SAFETY: the raw pointer passed in is valid because we got it from a reference.
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
    }
    // -------------------------------------------------------------------------
    // DragonFly BSD
    #[cfg(target_os = "dragonfly")]
    {
        use core::sync::atomic::AtomicU32;

        mod ffi {
            pub(crate) use crate::utils::ffi::c_int;

            sys_fn!({
                extern "C" {
                    // https://man.dragonflybsd.org/?command=umtx&section=2
                    // https://github.com/DragonFlyBSD/DragonFlyBSD/blob/v6.5.0/include/unistd.h
                    // DragonFly 1.1+
                    pub(crate) fn umtx_sleep(
                        ptr: *const c_int,
                        value: c_int,
                        timeout: c_int,
                    ) -> c_int;
                    pub(crate) fn umtx_wakeup(ptr: *const c_int, count: c_int) -> c_int;
                }
            });
        }

        // Always use "wide" sequence lock because Dragonfly BSD doesn't provide 64-bit futex.
        #[path = "seq_lock_wide.rs"]
        pub(crate) mod seq_lock;
        #[inline]
        pub(crate) fn wait32(a: &AtomicU32, expected: u32) {
            #[allow(clippy::cast_possible_wrap)]
            let expected = expected as ffi::c_int;
            // SAFETY: any data races are prevented since accesses to `a` are atomic and
            // the raw pointer passed in is valid because we got it from a reference.
            unsafe {
                ffi::umtx_sleep(a as *const AtomicU32 as *const ffi::c_int, expected, 0);
            }
        }
        #[inline]
        pub(crate) fn notify32_one(a: &AtomicU32) {
            // SAFETY: the raw pointer passed in is valid because we got it from a reference.
            unsafe {
                ffi::umtx_wakeup(a as *const AtomicU32 as *const i32, 1);
            }
        }
    }
    // -------------------------------------------------------------------------
    // Fuchsia
    #[cfg(target_os = "fuchsia")]
    {
        use core::sync::atomic::AtomicU32;

        #[allow(non_camel_case_types)]
        mod ffi {
            use core::i64;

            sys_type!({
                // https://fuchsia.googlesource.com/fuchsia/+/refs/heads/main/zircon/system/public/zircon/types.h
                pub(crate) type zx_handle_t = u32;
                pub(crate) type zx_status_t = i32;
                // https://fuchsia.googlesource.com/fuchsia/+/refs/heads/main/zircon/system/public/zircon/time.h
                pub(crate) type zx_time_t = i64;
            });
            // TODO: use sys_type!
            // https://fuchsia.googlesource.com/fuchsia/+/refs/heads/main/zircon/system/public/zircon/types.h
            pub(crate) type zx_futex_t = core::sync::atomic::AtomicU32;

            sys_const!({
                // https://fuchsia.googlesource.com/fuchsia/+/refs/heads/main/zircon/system/public/zircon/types.h
                pub(crate) const ZX_HANDLE_INVALID: zx_handle_t = 0;
            });
            // TODO: use sys_const!
            // https://fuchsia.googlesource.com/fuchsia/+/refs/heads/main/zircon/system/public/zircon/time.h
            pub(crate) const ZX_TIME_INFINITE: zx_time_t = i64::MAX;

            // TODO: use sys_fn!
            #[link(name = "zircon")]
            extern "C" {
                // https://fuchsia.dev/fuchsia-src/reference/kernel_objects/futex
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

        // Always use "wide" sequence lock because Fuchsia doesn't provide 64-bit futex.
        #[path = "seq_lock_wide.rs"]
        pub(crate) mod seq_lock;
        #[inline]
        pub(crate) fn wait32(a: &AtomicU32, expected: u32) {
            // SAFETY: any data races are prevented since accesses to `a` are atomic and
            // the raw pointer passed in is valid because we got it from a reference.
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
        pub(crate) fn notify32_one(a: &AtomicU32) {
            // SAFETY: the raw pointer passed in is valid because we got it from a reference.
            unsafe {
                ffi::zx_futex_wake(a, 1);
            }
        }
    }
    // -------------------------------------------------------------------------
    // Hermit
    #[cfg(target_os = "hermit")]
    {
        use core::{ptr, sync::atomic::AtomicU32};

        #[allow(non_camel_case_types)]
        mod ffi {
            sys_const!({
                pub(crate) const FUTEX_RELATIVE_TIMEOUT: u32 = 1;
            });

            sys_fn!({
                extern "C" {
                    // https://github.com/rust-lang/libc/blob/0.2.186/src/hermit.rs#L419
                    // https://github.com/hermit-os/hermit-rs/blob/hermit-abi-0.5.2/hermit-abi/src/lib.rs#L412
                    // https://github.com/hermit-os/kernel/blob/v0.13.2/src/syscalls/futex.rs
                    // Hermit 0.6+
                    // https://github.com/hermit-os/kernel/commit/2de40472db9d691e18a42c76043c1592cd04d252
                    // timeout is actually a pointer to timespec, but is fine because we only pass null.
                    #[cfg(not(any(test, portable_atomic_test_no_std_static_assert_ffi)))]
                    #[link_name = "sys_futex_wait"]
                    pub(crate) fn futex_wait(
                        address: *mut u32,
                        expected: u32,
                        timeout: *const [u8; 0],
                        flags: u32,
                    ) -> i32;
                    // use a pointer to libc's timespec for static assertions.
                    #[cfg(any(test, portable_atomic_test_no_std_static_assert_ffi))]
                    #[link_name = "sys_futex_wait"]
                    pub(crate) fn futex_wait(
                        address: *mut u32,
                        expected: u32,
                        timeout: *const libc::timespec,
                        flags: u32,
                    ) -> i32;
                    #[link_name = "sys_futex_wake"]
                    pub(crate) fn futex_wake(address: *mut u32, count: i32) -> i32;
                }
            });
        }

        // Always use "wide" sequence lock because Hermit doesn't provide 64-bit futex.
        #[path = "seq_lock_wide.rs"]
        pub(crate) mod seq_lock;
        #[inline]
        pub(crate) fn wait32(a: &AtomicU32, expected: u32) {
            // SAFETY: any data races are prevented since accesses to `a` are atomic and
            // the raw pointer passed in is valid because we got it from a reference.
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
        pub(crate) fn notify32_one(a: &AtomicU32) {
            // SAFETY: the raw pointer passed in is valid because we got it from a reference.
            unsafe {
                ffi::futex_wake(a as *const AtomicU32 as *mut u32, 1);
            }
        }
    }
    #[cfg(else)]
    {
        #[allow(unused_imports)] // for benchmark
        pub(crate) use self::no_futex::{notify32_one, wait32};
        cfg_no_fast_atomic_64!({
            // Use "wide" sequence lock if the pointer width <= 32 for preventing its counter against wrap around.
            #[path = "seq_lock_wide.rs"]
            pub(crate) mod seq_lock;
        });
        cfg_has_fast_atomic_64!({
            #[path = "seq_lock.rs"]
            pub(crate) mod seq_lock;
            pub(crate) use self::no_futex::{notify64_one, wait64};
        });
    }
});

#[cfg(not(any(
    target_os = "freebsd",
    target_os = "openbsd",
    target_os = "dragonfly",
    target_os = "fuchsia",
    target_os = "hermit",
)))]
#[allow(dead_code)]
mod no_futex {
    // No futex... fallback to spinlock...

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
    pub(crate) fn notify32_one(_: &AtomicU32) {}

    cfg_has_fast_atomic_64!({
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
        pub(crate) fn notify64_one(_: &AtomicU64) {}
    });
}

#[cfg(test)]
mod tests {
    use core::time::Duration;
    use std::time::Instant;

    use super::seq_lock::{AtomicState, CONTENDED, notify_one, wait};

    fn ms(ms: u64) -> Duration {
        Duration::from_millis(ms)
    }

    #[test]
    fn smoke() {
        let start = Instant::now();
        let a = AtomicState::new(0);
        wait(&a, CONTENDED);
        assert!(start.elapsed() < ms(150));
        notify_one(&a);
    }

    #[test]
    fn test_wait() {
        use core::sync::atomic::Ordering;

        use crossbeam_utils::thread;

        let a = AtomicState::new(CONTENDED);

        thread::scope(|s| {
            let start = Instant::now();
            s.spawn(|_| {
                std::thread::sleep(ms(150));
                a.store(0, Ordering::Relaxed);
                notify_one(&a);
            });
            let mut wait_count = 0;
            while a.load(Ordering::Relaxed) == CONTENDED {
                wait(&a, CONTENDED);
                wait_count += 1;
            }
            assert_eq!(a.load(Ordering::Relaxed), 0);
            let elapsed = start.elapsed();
            assert!(elapsed >= ms(150) && elapsed <= ms(150 * 3), "{:?}", elapsed);
            #[cfg(not(target_os = "netbsd"))]
            let has_futex = cfg!(any(
                target_os = "linux",
                target_os = "android",
                target_os = "freebsd",
                target_os = "openbsd",
                target_os = "dragonfly",
                target_os = "fuchsia",
                target_os = "hermit",
            ));
            #[cfg(target_os = "netbsd")]
            let has_futex = super::has_futex() != 0;
            if has_futex {
                assert!((1..=3).contains(&wait_count), "{}", wait_count);
            } else {
                assert!(wait_count >= 10, "{}", wait_count);
            }
        })
        .unwrap();
    }
}
