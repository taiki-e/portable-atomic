# Run-time CPU feature detection

This module has run-time CPU feature detection implementations.

Here is the table of targets that support run-time CPU feature detection and the instruction or API used:

| target_arch | target_os/target_env | instruction/API | features | no_libc | note |
| ----------- | -------------------- | --------------- | -------- | ------- | ---- |
| x86_64      | all (except for sgx) | cpuid           | all      | always  | Enabled by default |
| aarch64     | linux                | getauxval       | all      | optional | Only enabled by default on `*-linux-gnu*` and `*-linux-{musl,ohos,uclibc}*` with dynamic linking enabled (musl is static linking by default). (dlsym is used by default if needed for compatibility with older versions) |
| aarch64     | android              | getauxval       | all      | optional | Enabled by default |
| aarch64     | freebsd              | elf_aux_info    | lse, lse2 | optional | Enabled by default |
| aarch64     | netbsd               | sysctlbyname    | all      | optional | Enabled by default |
| aarch64     | openbsd              | sysctl          | all      | unsupported | Enabled by default |
| aarch64     | macos/ios/tvos/watchos/visionos | sysctlbyname | all | optional | Currently only used in tests (see [aarch64_apple.rs](aarch64_apple.rs)). |
| aarch64     | illumos              | getisax         | lse, lse2 | unsupported | Disabled by default |
| aarch64/arm64ec | windows          | IsProcessorFeaturePresent | lse | unsupported | Enabled by default |
| aarch64     | fuchsia              | zx_system_get_features | lse | unsupported | Enabled by default |
| riscv32/riscv64 | linux/android    | riscv_hwprobe   | all      | always(linux)/optional(android) | Disabled by default |
| powerpc64   | linux                | getauxval       | all      | optional | Only enabled by default on `*-linux-{gnu,musl,ohos,uclibc}*` with dynamic linking enabled (musl is static linking by default). (dlsym is used by default if needed for compatibility with older versions) |
| powerpc64   | freebsd              | elf_aux_info    | all      | optional | Enabled by default (dlsym is used by default for compatibility with older versions) |
| powerpc64   | openbsd              | elf_aux_info    | all      | unsupported | Enabled by default (dlsym is used by default for compatibility with older versions) |

Run-time detection is enabled by default on most targets and can be disabled with `--cfg portable_atomic_no_outline_atomics`.

On some targets, run-time detection is disabled by default mainly for incomplete build environments, and can be enabled by `--cfg portable_atomic_outline_atomics`. (When both cfg are enabled, `*_no_*` cfg is preferred.)

For targets not included in the above table, run-time detection is always disabled and works the same as when `--cfg portable_atomic_no_outline_atomics` is set.

See [auxv.rs](auxv.rs) module-level comments for more details on Linux/Android/FreeBSD/OpenBSD.

See also [docs on `portable_atomic_no_outline_atomics`](https://github.com/taiki-e/portable-atomic/blob/HEAD/README.md#optional-cfg-no-outline-atomics) in the top-level readme.
