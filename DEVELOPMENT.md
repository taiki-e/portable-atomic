# Development Guide

- [Project layout](#project-layout)
- [Testing powerpc64le using POWER Functional Simulator](#testing-powerpc64le-using-power-functional-simulator)
- [Testing Fuchsia](#testing-fuchsia)

## Project layout

```text
portable-atomic/
├── bench/                        -- simple benchmarks
├── build.rs                      -- build script
├── no_atomic.rs                  -- definitions of statics used by build script (auto-generated)
├── version.rs                    -- rustc version detection code used by build script
├── portable-atomic-util/         -- crate that defines synchronization primitives built with portable-atomic
├── src/
│   ├── imp/
│   │   ├── atomic128/            -- 128-bit atomic implementations (mainly by asm)
│   │   │   └── detect/           -- Run-time feature detection implementations used for outline-atomics
│   │   ├── arm_linux.rs          -- 64-bit atomic implementation for pre-v6 ARM Linux/Android
│   │   ├── core_atomic.rs        -- wrapper for core::sync::atomic types
│   │   ├── fallback/             -- fallback implementation based on global locks
│   │   ├── float.rs              -- atomic float implementation based on atomic integer
│   │   ├── interrupt/            -- fallback implementation based on disabling interrupts (for no-std)
│   │   ├── msp430.rs             -- atomic implementation for MSP430 (by asm)
│   │   ├── riscv.rs              -- atomic implementation for RISC-V without A-extension (by asm)
│   │   └── x86.rs                -- atomic implementation for x86/x86_64 (by asm)
│   ├── lib.rs                    -- definitions of public APIs
│   ├── tests/                    -- unit tests and test helpers
│   └── utils.rs                  -- common code
├── target-specs/                 -- specs of custom targets used for tests
├── tests/
│   ├── api-test/                 -- API check
│   ├── {avr,gba,no-std-qemu}/    -- tests for no-std targets
│   └── helper/                   -- test helpers
└── tools/                        -- tools for CI and/or development
```

## Testing powerpc64le using POWER Functional Simulator

We mainly use QEMU to test for targets other than x86_64/aarch64, but some instructions do not work well in QEMU, so we sometimes use other tools. This section describes testing powerpc64le using IBM [POWER Functional Simulator](https://www.ibm.com/support/pages/node/6491145).

Note: Since QEMU 8.1.1, QEMU now supports all the instructions we use.

<!-- omit in toc -->
### Setup

Host requirements: x86_64 Linux

Install dependencies.

```sh
# gcc-powerpc64le-linux-gnu and libc6-dev-ppc64el-cross for cross-compiling
# xterm and libtcl8.6 for simulator
# jq for parsing json output from cargo
sudo apt-get install gcc-powerpc64le-linux-gnu libc6-dev-ppc64el-cross xterm libtcl8.6 jq
```

Download Simulator from [download page](https://www.ibm.com/support/pages/node/6493437).

Install POWER Functional Simulator.

```sh
sudo dpkg -i systemsim-p10-<version>_amd64.deb
```

(If the installation failed due to missing dependencies, etc., systemsim-p10 must be uninstalled once by `sudo dpkg --remove systemsim-p10` before reinstallation)

Download images (see `/opt/ibm/systemsim-p10-<version>/examples/linux/README` for more).

```sh
cd /opt/ibm/systemsim-p10-<version>/examples/linux
./fetch_ubuntu_disk_image.sh
./fetch_vmlinux.sh
./fetch_skiboot.sh
mv deb2004.img ../../images/disk.img
mv vmlinux ../../images
mv skiboot.lid ../../images
```

Start simulator.

```sh
cd /opt/ibm/systemsim-<version>/run/p10/linux
../power10 -f boot-linux-ubuntu-p10.tcl
```

<!-- omit in toc -->
### Run tests

Install Rust target.

```sh
rustup target add powerpc64le-unknown-linux-gnu
```

Build tests for powerpc64le and get path to test binary.

```sh
# Note: Below is a way to get path to unit test binary. If you need to get
# binaries for other tests, you need to adjust the script or copy paths from
# cargo's "Executable ..." output.
binary_path=$(
  CARGO_TARGET_POWERPC64LE_UNKNOWN_LINUX_GNU_LINKER=powerpc64le-linux-gnu-gcc \
    ./tools/test.sh build --target powerpc64le-unknown-linux-gnu --release
)
```

Copy test binary to `/tmp` (to easily type in simulator's console).

```sh
cp "$binary_path" /tmp/t
```

In simulator's console, copy test binary from host.

```sh
callthru source /tmp/t >t && chmod +x ./t
```

Run test binary in simulator.

```sh
./t --test-threads=1
```

TODO: Automate more processes.

## Testing Fuchsia

This section describes testing Fuchsia using the emulator included in the Fuchsia SDK. See [rustc's platform support documentation][fuchsia-platform-support-doc] for details.

<!-- omit in toc -->
### Setup

Host requirements: x86_64 Linux/macOS

Download the Fuchsia SDK according to the instructions in [rustc's platform support documentation][fuchsia-platform-support-doc].

Then set `SDK_PATH` environment variable.

```sh
export SDK_PATH=<path/to/sdk>
```

Start simulator (Ctrl-C to stop).

```sh
./tools/fuchsia-test.sh emu aarch64
```

(The only fuchsia-specific code in our codebase is for aarch64, so here we use the aarch64 emulator, but if you pass `x86_64` instead of `aarch64` as the first argument of the script, it works for x86_64.)

<!-- omit in toc -->
### Run tests

```sh
# By default this runs test with --lib on workspace root.
./tools/fuchsia-test.sh aarch64 --release
```

TODO: Reflects whether the test was successful in the exit code of the script.

[fuchsia-platform-support-doc]: https://doc.rust-lang.org/nightly/rustc/platform-support/fuchsia.html
