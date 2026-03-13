#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -CeEuo pipefail
IFS=$'\n\t'

bail() {
  printf >&2 'error: %s\n' "$*"
  exit 1
}

if [[ $# -ne 3 ]]; then
  cat <<EOF
USAGE:
    $0 <RUNNER> <TARGET> <BIN>
EOF
  exit 1
fi
runner="$1"
target="$2"
bin="$3"
stdout=".test-${target}.stdout"

setup_wokwi() {
  local bin="../../${bin#"${WOKWI_WORKSPACE_DIR}/"}"
  cat >|"${WOKWI_TMPDIR}/wokwi.toml" <<EOF
[wokwi]
version = 1
elf = "${bin}"
firmware = "${bin}"
EOF
  start_simulator() {
    "${WOKWI_CLI:-wokwi-cli}" "${WOKWI_TMPDIR}" &>>"${stdout}" &
  }
}

no_exit=1
case "${target}" in
  avr*)
    case "${runner}" in
      simavr)
        no_exit=''
        case "${target}" in
          avr-none) mcu=atmega2560 ;; # TODO: parse -C target-cpu
          avr-*) mcu="${target##*-}" ;;
          *) bail "unrecognized target '${target}'" ;;
        esac
        start_simulator() {
          "${SIMAVR:-simavr}" --mcu "${mcu}" "${bin}" &>>"${stdout}" &
        }
        ;;
      qemu-system)
        case "${target}" in
          avr-none) machine=mega2560 ;; # TODO: parse -C target-cpu
          avr-*) machine="${target##*-at}" ;;
          *) bail "unrecognized target '${target}'" ;;
        esac
        start_simulator() {
          "${QEMU_SYSTEM_AVR:-qemu-system-avr}" -M "${machine}" -display none -serial stdio -bios "${bin}" &>>"${stdout}" &
        }
        ;;
      wokwi-cli) setup_wokwi ;;
      *) bail "unrecognized runner '${runner}'" ;;
    esac
    ;;
  msp430*)
    case "${runner}" in
      mspdebug)
        start_simulator() {
          "${MSPDEBUG:-mspdebug}" -n sim &>>"${stdout}" <<EOF &
simio add console serial
prog ${bin}
run
EOF
        }
        ;;
      *) bail "unrecognized runner '${runner}'" ;;
    esac
    ;;
  xtensa*)
    case "${runner}" in
      wokwi-cli) setup_wokwi ;;
      *) bail "unrecognized runner '${runner}'" ;;
    esac
    ;;
  aarch64*-l4re*)
    case "${runner}" in
      l4image)
        cp -f -- "${bin}" "${L4RE_TMPDIR}"/workdir-arm
        l4image \
          -i "${L4RE_TMPDIR}"/l4re_hello-2_arm_virt.elf \
          -o "${L4RE_TMPDIR}"/l4re_test.elf \
          create \
          --modules-list-file modules.list \
          --search-path "${L4RE_SYSROOTS}"/usr/lib:"${L4RE_TMPDIR}"/workdir-arm
        start_simulator() {
          l4image -i "${L4RE_TMPDIR}"/l4re_test.elf launch &>>"${stdout}" &
        }
        ;;
      *) bail "unrecognized runner '${runner}'" ;;
    esac
    ;;
  *) bail "unrecognized target '${target}'" ;;
esac

simulator_pid=''
tail_pid=''
code=1
cleanup() {
  [[ -z "${simulator_pid}" ]] || kill -- "${simulator_pid}" || true
  [[ -z "${tail_pid}" ]] || kill -- "${tail_pid}" || true
  case "${target}" in
    aarch64*-l4re*)
      # shellcheck disable=SC2009
      qemu_pid=$(ps x -o "%p %c " | grep -F 'qemu-system-aar' | sed -E 's/^\s+//g' | cut -d' ' -f1)
      kill -- "${qemu_pid}" || true
      ;;
  esac
  rm -f -- ./"${stdout}"
  exit "${code}"
}
trap -- 'printf >&2 "%s\n" "${0##*/}: trapped SIGINT"; cleanup' SIGINT

rm -f -- ./"${stdout}"
touch -- ./"${stdout}"
tail -s0 -f "${stdout}" &
tail_pid=$!

start_simulator
[[ -n "${simulator_pid}" ]] || simulator_pid=$!

if [[ -n "${no_exit}" ]]; then
  # Inspired by mgba-test-runner.
  # If there is no way to exit the simulator from the program,
  # check output of the simulator on a regular basis.
  while true; do
    if grep -Fq 'panicked' "${stdout}"; then
      code=101
      break
    elif grep -Fq 'Tests finished successfully' "${stdout}"; then
      code=0
      break
    fi
    sleep 0.1
  done
else
  # If there is no way to exit the simulator with non-zero from the program,
  # check output of the simulator after the simulator finished.
  wait "${simulator_pid}"
  simulator_pid='' # simulator finished
  if grep -Fq 'panicked' "${stdout}"; then
    code=101
  elif grep -Fq 'Tests finished successfully' "${stdout}"; then
    code=0
  fi
fi

cleanup
