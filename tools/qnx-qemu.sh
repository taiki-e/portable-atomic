#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -CeEuo pipefail
IFS=$'\n\t'

bail() {
  printf >&2 'error: %s\n' "$*"
  exit 1
}

if [[ $# -ne 1 ]]; then
  cat <<EOF
USAGE:
    $0 <TEST_BINARY>
EOF
  exit 1
fi
test_binary=$(realpath -- "$1")

[[ -f "${test_binary}" ]] || bail "test binary not found: ${test_binary}"
[[ -n "${QNX_TARGET:-}" ]] || bail 'QNX environment is not initialized'
for tool in mkifs mkqnximage qemu-system-aarch64; do
  type -P "${tool}" >/dev/null || bail "required tool not found: ${tool}"
done

tmp_dir=$(mktemp -d)
cleanup() {
  rm -rf -- "${tmp_dir}"
}
trap cleanup EXIT
cd -- "${tmp_dir}"

# Start with QNX's complete QEMU image. Besides reducing assumptions about
# shared-library placement, this provides /tmp and the virtio RNG used by the
# Rust test suite. This follows Ferrocene's public QNX 8 test runner.
# Refs:
# - https://github.com/ferrocene/ferrocene/blob/731dd55a0958fcc39135fe2f07435e77c19dde35/ferrocene/ci/scripts/emulated-aarch64-qnx8-test-runner.sh
# - https://github.com/eclipse-score/qnx_unit_tests/blob/d7cdc8832e649de8d2b1359134b8e24cb1690ab2/src/arm64_qnx8/run_under_qnx.sh
mkqnximage \
  --type=qemu \
  --arch=aarch64le \
  --data-size=5000 \
  --data-inodes=40000 \
  --hostname=portable-atomic-qnx \
  --ip=10.0.2.15 \
  --ssh-ident=none \
  --noprompt

cp -- "${test_binary}" output/build/portable-atomic-test
printf '%s\n' 'portable-atomic-test=output/build/portable-atomic-test' >>output/build/ifs.build
# shellcheck disable=SC2016 # Expanded by the QNX shell, not this script.
cat >>output/build/startup.sh <<'EOF'
/proc/boot/portable-atomic-test
echo "PORTABLE_ATOMIC_EXIT=$?"
shutdown
EOF
rm -- output/ifs.bin
mkifs output/build/ifs.build output/ifs.bin

run_qemu() {
  local qemu_cpu="$1"
  local expected_lse="$2"
  local log="${tmp_dir}/qemu-${qemu_cpu}.log"

  timeout 10m qemu-system-aarch64 \
    -machine virt-4.2 \
    -accel tcg,thread=multi \
    -cpu "${qemu_cpu}" \
    -smp 2 \
    -m 1G \
    -drive file=output/disk-qemu.vmdk,if=none,id=drv0 \
    -device virtio-blk-device,drive=drv0 \
    -netdev user,id=net0 \
    -device virtio-net-device,netdev=net0 \
    -nographic \
    -kernel output/ifs.bin \
    -serial mon:stdio \
    -no-reboot \
    -object rng-random,filename=/dev/urandom,id=rng0 \
    -device virtio-rng-device,rng=rng0 \
    2>&1 \
    | sed -u 's/[^[:print:]]//g; s/\r//g' \
    | tee -- "${log}"

  grep -Fq 'test result: ok' "${log}"
  grep -Fq 'PORTABLE_ATOMIC_EXIT=0' "${log}"
  grep -Fq "all_lse=${expected_lse}" "${log}"
}

run_qemu max true
run_qemu cortex-a57 false
