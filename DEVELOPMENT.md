# Development

## Testing powerpc64le using POWER Functional Simulator

We mainly use qemu to test for targets other than x86_64/aarch64, but some instructions do not work well in qemu, so we sometimes use other tools. This section describes testing powerpc64le using IBM [POWER Functional Simulator](https://www.ibm.com/support/pages/node/6491145).

### Setup

Install dependencies.

```sh
# gcc-powerpc64le-linux-gnu and libc6-dev-ppc64el-cross for cross-compiling
# xterm for simulator
# jq for parsing json output from cargo
sudo apt-get install gcc-powerpc64le-linux-gnu libc6-dev-ppc64el-cross xterm jq
```

Download Simulator from [download page](https://www.ibm.com/support/pages/node/6493437).

Install POWER Functional Simulator.

```sh
sudo dpkg -i systemsim-p10-<version>_amd64.deb
```

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
    cargo test --no-run --all-features --target powerpc64le-unknown-linux-gnu --message-format=json --release \
    | jq -r "select(.manifest_path == \"$(cargo locate-project --message-format=plain)\") | select(.executable != null) | .executable"
)
```

Copy test binary to `/tmp` (to easily type in simulator's console).

```sh
cp "$binary_path" /tmp/t
```

In simulator's console, copy test binary from host.

```sh
callthru source /tmp/t>t && chmod +x ./t
```

Run test binary in simulator.

```sh
./t --test-threads=1
```

TODO: Automate more processes.
