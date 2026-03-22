#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -CeEuo pipefail
IFS=$'\n\t'
trap -- 's=$?; printf >&2 "%s\n" "${0##*/}:${LINENO}: \`${BASH_COMMAND}\` exit with ${s}"; exit ${s}' ERR
trap -- 'printf >&2 "%s\n" "${0##*/}: trapped SIGINT"; exit 1' SIGINT
cd -- "$(dirname -- "$0")"/..

# See https://github.com/taiki-e/portable-atomic/blob/HEAD/DEVELOPMENT.md#testing-powerpc64le-using-power-functional-simulator
# for usage.
#
# USAGE:
#    ./tools/systemsim-test.sh [+toolchain] [cargo_options]...
#    ./tools/systemsim-test.sh emu

x() {
  (
    set -x
    "$@"
  )
}
bail() {
  printf >&2 'error: %s\n' "$*"
  exit 1
}

power_version=10
systemsim_version=1.2-4

pre_args=()
if [[ "${1:-}" == "+"* ]]; then
  pre_args+=("$1")
  shift
fi
cmd='test'
case "${1:-}" in
  emu)
    cmd="$1"
    shift
    if [[ $# -gt 0 ]]; then
      bail "unrecognized argument '$1' for emu subcommand"
    fi
    ;;
esac
target=powerpc64le-unknown-linux-gnu
if [[ -z "${CARGO_TARGET_POWERPC64LE_UNKNOWN_LINUX_GNU_LINKER:-}" ]]; then
  export CARGO_TARGET_POWERPC64LE_UNKNOWN_LINUX_GNU_LINKER=powerpc64le-linux-gnu-gcc
fi

cargo_options=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    --tests | --all-targets | --doc | --target | --target=*) bail "unsupported option '$1'" ;;
    --)
      shift
      if [[ $# -gt 0 ]]; then
        bail "argument after -- is not yet supported"
      fi
      break
      ;;
    *) cargo_options+=("$1") ;;
  esac
  shift
done

case "${cmd}" in
  emu)
    base_boot_tcl="boot-linux-ubuntu-p${power_version}"
    set -x
    cd -- "/opt/ibm/systemsim-p${power_version}-${systemsim_version}/run/p${power_version}/linux"
    cp -- "${base_boot_tcl}.tcl" "${base_boot_tcl}-test.tcl"
    # For multi-threaded tests.
    sed -Ei 's/ config cpus 1/ config cpus 2/' "${base_boot_tcl}-test.tcl"
    sed -Ei 's| config processor/number_of_threads 1| config processor/number_of_threads 2|' "${base_boot_tcl}-test.tcl"
    # For floating-point number tests.
    sed -Ei 's/#mysim set bit_accurate on/mysim set bit_accurate on/' "${base_boot_tcl}-test.tcl"
    mkdir -p -- /tmp/systemsim
    printf '1\n' >|/tmp/systemsim/w
    cat >|/tmp/systemsim/s <<'EOF'
#!/usr/bin/env bash
set -Cu
prev=$(callthru source /tmp/systemsim/w)
while true; do
  sleep 0.5
  new=$(callthru source /tmp/systemsim/w)
  [[ "${prev}" != "${new}" ]] || continue
  prev="${new}"
  callthru source /tmp/systemsim/bin >|bin || continue
  chmod +x ./bin || continue
  (
    set -x
    ./bin --test-threads=1 "$@"
  )
done
EOF
    # shellcheck disable=SC2016
    sed -Ei '/mysim go/d' "${base_boot_tcl}-test.tcl"
    printf 'console_input mysim "callthru source /tmp/systemsim/s >s"\n' >>"${base_boot_tcl}-test.tcl"
    printf 'console_input mysim "chmod +x ./s"\n' >>"${base_boot_tcl}-test.tcl"
    printf 'console_input mysim "./s"\n' >>"${base_boot_tcl}-test.tcl"
    printf 'mysim go\n' >>"${base_boot_tcl}-test.tcl"
    ../power10 -f "${base_boot_tcl}-test.tcl"
    exit 0
    ;;
  test) ;;
  *) bail "unrecognized command '${cmd}'" ;;
esac

rustup ${pre_args[@]+"${pre_args[@]}"} target add "${target}" &>/dev/null

binary_path=$(./tools/test.sh ${pre_args[@]+"${pre_args[@]}"} build --target "${target}" "${cargo_options[@]}")

w=$(</tmp/systemsim/w)
_=$((w++))
cp -- "${binary_path}" /tmp/systemsim/bin
printf '%s\n' "${w}" >|/tmp/systemsim/w
