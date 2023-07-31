#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"/..

# shellcheck disable=SC2154
trap 's=$?; echo >&2 "$0: error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}' ERR
trap -- 'echo >&2 "$0: trapped SIGINT"; exit 1' SIGINT

# USAGE:
#    ./tools/no-std.sh [+toolchain] [target]...

default_targets=(
    # armv4t
    armv4t-none-eabi
    thumbv4t-none-eabi
    # armv5te
    armv5te-none-eabi
    thumbv5te-none-eabi
    # armv6-m
    thumbv6m-none-eabi
    # armv7-m
    thumbv7m-none-eabi
    thumbv7em-none-eabi
    thumbv7em-none-eabihf
    # armv8-m
    thumbv8m.base-none-eabi
    thumbv8m.main-none-eabi
    thumbv8m.main-none-eabihf

    # riscv32
    riscv32i-unknown-none-elf
    riscv32im-unknown-none-elf
    riscv32imc-unknown-none-elf
    riscv32imac-unknown-none-elf
    riscv32gc-unknown-none-elf
    # riscv64
    riscv64i-unknown-none-elf
    riscv64imac-unknown-none-elf
    riscv64gc-unknown-none-elf

    # avr
    avr-unknown-gnu-atmega2560
)

x() {
    local cmd="$1"
    shift
    (
        set -x
        "${cmd}" "$@"
    )
}
x_cargo() {
    if [[ -n "${RUSTFLAGS:-}" ]]; then
        echo "+ RUSTFLAGS='${RUSTFLAGS}' \\"
    fi
    RUSTFLAGS="${RUSTFLAGS:-}" \
        x cargo "$@"
    echo
}
bail() {
    echo >&2 "error: $*"
    exit 1
}

pre_args=()
is_custom_toolchain=''
if [[ "${1:-}" == "+"* ]]; then
    if [[ "$1" == "+esp" ]]; then
        # shellcheck disable=SC1091
        . "${HOME}/export-esp.sh"
        is_custom_toolchain=1
    fi
    pre_args+=("$1")
    shift
fi
if [[ $# -gt 0 ]]; then
    targets=("$@")
else
    targets=("${default_targets[@]}")
fi

rustup_target_list=''
if [[ -z "${is_custom_toolchain}" ]]; then
    rustup_target_list=$(rustup ${pre_args[@]+"${pre_args[@]}"} target list | sed 's/ .*//g')
fi
rustc_target_list=$(rustc ${pre_args[@]+"${pre_args[@]}"} --print target-list)
rustc_version=$(rustc ${pre_args[@]+"${pre_args[@]}"} -Vv | grep 'release: ' | sed 's/release: //')
nightly=''
if [[ "${rustc_version}" == *"nightly"* ]] || [[ "${rustc_version}" == *"dev"* ]]; then
    nightly=1
    if [[ -z "${is_custom_toolchain}" ]]; then
        rustup ${pre_args[@]+"${pre_args[@]}"} component add rust-src &>/dev/null
    fi
fi
export QEMU_AUDIO_DRV=none

run() {
    local target="$1"
    shift
    local args=(${pre_args[@]+"${pre_args[@]}"})
    local target_rustflags="${RUSTFLAGS:-}"
    if ! grep <<<"${rustc_target_list}" -Eq "^${target}$" || [[ -f "target-specs/${target}.json" ]]; then
        if [[ ! -f "target-specs/${target}.json" ]]; then
            echo "target '${target}' not available on ${rustc_version} (skipped)"
            return 0
        fi
        local target_flags=(--target "$(pwd)/target-specs/${target}.json")
    else
        local target_flags=(--target "${target}")
    fi
    local subcmd=run
    case "${target}" in
        armv4t* | thumbv4t*)
            # TODO: run tests on CI (investigate mgba-test-runner in https://github.com/agbrs/agb)
            if ! type -P mgba &>/dev/null; then
                subcmd=build
            fi
            ;;
        xtensa*)
            # TODO: run test with simulator on CI
            if ! type -P wokwi-server &>/dev/null; then
                subcmd=build
            fi
            ;;
    esac
    args+=("${subcmd}" "${target_flags[@]}")
    if grep <<<"${rustup_target_list}" -Eq "^${target}$"; then
        rustup ${pre_args[@]+"${pre_args[@]}"} target add "${target}" &>/dev/null
    elif [[ -n "${nightly}" ]]; then
        args+=(-Z build-std="core")
    else
        echo "target '${target}' requires nightly compiler (skipped)"
        return 0
    fi

    # NB: sync with tools/build.sh
    case "${target}" in
        thumbv[4-5]t* | armv[4-5]t* | thumbv6m*)
            target_rustflags+=" --cfg portable_atomic_unsafe_assume_single_core"
            ;;
        riscv??i-* | riscv??im-* | riscv??imc-*)
            target_rustflags+=" --cfg portable_atomic_unsafe_assume_single_core --cfg portable_atomic_s_mode"
            ;;
    esac
    local test_dir
    # NB: sync with tools/build.sh
    case "${target}" in
        armv4t* | thumbv4t*)
            test_dir=tests/gba
            linker=link.ld
            target_rustflags+=" -C link-arg=-T${linker}"
            ;;
        armv5te* | thumbv5te*)
            test_dir=tests/no-std-qemu
            ;;
        thumb*)
            test_dir=tests/no-std-qemu
            linker=link.x
            target_rustflags+=" -C link-arg=-T${linker}"
            ;;
        riscv*)
            test_dir=tests/no-std-qemu
            case "${target}" in
                riscv32*) linker=riscv32.ld ;;
                riscv64*) linker=riscv64.ld ;;
                *) bail "unrecognized target '${target}'" ;;
            esac
            target_rustflags+=" -C link-arg=-T${linker}"
            ;;
        avr*)
            test_dir=tests/avr
            ;;
        xtensa*)
            test_dir=tests/xtensa
            linker=linkall.x
            target_rustflags+=" -C link-arg=-Wl,-T${linker} -C link-arg=-nostartfiles"
            ;;
        *) bail "unrecognized target '${target}'" ;;
    esac
    args+=(--all-features)

    (
        cd "${test_dir}"
        RUSTFLAGS="${target_rustflags}" \
            x_cargo "${args[@]}" "$@"
        RUSTFLAGS="${target_rustflags}" \
            x_cargo "${args[@]}" --release "$@"
    )
}

for target in "${targets[@]}"; do
    run "${target}"
done
