# Run-time CPU feature detection

This module has run-time CPU feature detection implementations.

Here is the table of targets that support run-time CPU feature detection and the instruction or API used:

| target_arch | target_os/target_env | instruction/API | features | note |
| ----------- | -------------------- | --------------- | -------- | ---- |
| x86_64 | all (except for sgx) | cpuid+xgetbv | all | |
| aarch64 | linux (gnu/ohos) | getauxval | all | |
| aarch64 | linux (musl) | getauxval | all | weakref is used by default unless dynamic linking or `std` feature enabled (both disabled by default, see [auxv.rs](auxv.rs) for details) |
| aarch64 | linux (uclibc) | getauxval | all | weakref is used by default for compatibility with older versions |
| aarch64 | android | getauxval+__system_property_get | all | |
| aarch64 | freebsd | elf_aux_info | all | |
| aarch64 | netbsd | sysctlbyname | all | |
| aarch64 | openbsd | sysctl | all | |
| aarch64 | macos/ios/tvos/watchos/visionos | sysctlbyname | all | |
| aarch64 | illumos | getisax | lse, lse2 | |
| aarch64/arm64ec | windows | IsProcessorFeaturePresent | lse, lse2 | |
| aarch64 | fuchsia | zx_system_get_features | lse | |
| riscv32/riscv64 | linux/android | riscv_hwprobe | all | |
| powerpc64 | linux (gnu) | getauxval | all | weakref is used on big endian by default for compatibility with older versions |
| powerpc64 | linux (musl) | getauxval | all | weakref is used by default unless dynamic linking or `std` feature enabled (both disabled by default, see [auxv.rs](auxv.rs) for details) |
| powerpc64 | freebsd | elf_aux_info | all | weakref is used on big endian by default for compatibility with older versions |
| powerpc64 | openbsd | elf_aux_info | all | weakref is used by default for compatibility with older versions |
| powerpc64 | aix | getsystemcfg | all | Requires LLVM 20+. Disabled by default (see [powerpc64_aix.rs](powerpc64_aix.rs)) |

Run-time detection is enabled by default unless otherwise noted and can be disabled with `--cfg portable_atomic_no_outline_atomics`.

On some targets, run-time detection is disabled by default mainly for compatibility with incomplete build environments or support for it is experimental, and can be enabled by `--cfg portable_atomic_outline_atomics`. (When both cfg are enabled, `*_no_*` cfg is preferred.)

On some targets, [weakref](https://sourceware.org/binutils/docs/as/Weakref.html) (which is similar to `dlsym` and [unstable `#[linkage = "extern_weak"]`](https://github.com/rust-lang/rust/issues/29603), but async-signal-safe unlike `dlsym` and works on stable and sound unlike `extern_weak`) is used by default if needed for compatibility with older versions.
You can use `--cfg portable_atomic_outline_atomics` to force the use of strong references.

For targets not included in the above table, run-time detection is always disabled and works the same as when `--cfg portable_atomic_no_outline_atomics` is set.

See [auxv.rs](auxv.rs) module-level comments for more details on Linux/Android/FreeBSD/OpenBSD.

See also [docs about `portable_atomic_no_outline_atomics` cfg](https://github.com/taiki-e/portable-atomic/blob/HEAD/README.md#optional-cfg-no-outline-atomics) in the top-level readme.
