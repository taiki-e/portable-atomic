#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -CeEuo pipefail
IFS=$'\n\t'
trap -- 's=$?; printf >&2 "%s\n" "${0##*/}:${LINENO}: \`${BASH_COMMAND}\` exit with ${s}"; exit ${s}' ERR
trap -- 'printf >&2 "%s\n" "${0##*/}: trapped SIGINT"; exit 1' SIGINT
cd -- "$(dirname -- "$0")"/..

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
    riscv32gc-unknown-none-elf # custom target
    # riscv64
    riscv64i-unknown-none-elf # custom target
    riscv64imac-unknown-none-elf
    riscv64gc-unknown-none-elf

    # avr
    avr-unknown-gnu-atmega2560 # custom target
)

x() {
    (
        set -x
        "$@"
    )
}
x_cargo() {
    if [[ -n "${RUSTFLAGS:-}" ]]; then
        printf '%s\n' "+ RUSTFLAGS='${RUSTFLAGS}' \\"
    fi
    x cargo "$@"
    printf '\n'
}
bail() {
    printf >&2 'error: %s\n' "$*"
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
    rustup_target_list=$(rustup ${pre_args[@]+"${pre_args[@]}"} target list | cut -d' ' -f1)
fi
rustc_target_list=$(rustc ${pre_args[@]+"${pre_args[@]}"} --print target-list)
rustc_version=$(rustc ${pre_args[@]+"${pre_args[@]}"} -vV | grep -E '^release:' | cut -d' ' -f2)
rustc_minor_version="${rustc_version#*.}"
rustc_minor_version="${rustc_minor_version%%.*}"
llvm_version=$(rustc ${pre_args[@]+"${pre_args[@]}"} -vV | { grep -E '^LLVM version:' || true; } | cut -d' ' -f3)
llvm_version="${llvm_version%%.*}"
target_dir=$(pwd)/target
nightly=''
if [[ "${rustc_version}" =~ nightly|dev ]]; then
    nightly=1
    if [[ -z "${is_custom_toolchain}" ]]; then
        rustup ${pre_args[@]+"${pre_args[@]}"} component add rust-src &>/dev/null
    fi
fi
export QEMU_AUDIO_DRV=none
export PORTABLE_ATOMIC_DENY_WARNINGS=1

run() {
    local target="$1"
    shift
    target_lower="${target//-/_}"
    target_lower="${target_lower//./_}"
    target_upper=$(tr '[:lower:]' '[:upper:]' <<<"${target_lower}")
    local args=(${pre_args[@]+"${pre_args[@]}"})
    local target_rustflags="${RUSTFLAGS:-}"
    if ! grep -Eq "^${target}$" <<<"${rustc_target_list}" || [[ -f "target-specs/${target}.json" ]]; then
        if [[ ! -f "target-specs/${target}.json" ]]; then
            printf '%s\n' "target '${target}' not available on ${rustc_version} (skipped)"
            return 0
        fi
        local target_flags=(--target "$(pwd)/target-specs/${target}.json")
    else
        local target_flags=(--target "${target}")
    fi
    local subcmd=run
    if [[ -z "${CI:-}" ]]; then
        case "${target}" in
            armv4t* | thumbv4t*)
                if ! type -P mgba-test-runner >/dev/null; then
                    printf '%s\n' "no-std test for ${target} requires mgba-test-runner (switched to build-only)"
                    subcmd=build
                fi
                ;;
            avr*)
                if ! type -P simavr >/dev/null; then
                    printf '%s\n' "no-std test for ${target} requires simavr (switched to build-only)"
                    subcmd=build
                fi
                ;;
        esac
    fi
    case "${target}" in
        xtensa*)
            # TODO: run test with simulator on CI
            if ! type -P wokwi-server >/dev/null; then
                printf '%s\n' "no-std test for ${target} requires wokwi-server (switched to build-only)"
                subcmd=build
            fi
            ;;
    esac
    args+=("${subcmd}" "${target_flags[@]}")
    if grep -Eq "^${target}$" <<<"${rustup_target_list}"; then
        rustup ${pre_args[@]+"${pre_args[@]}"} target add "${target}" &>/dev/null
    elif [[ -n "${nightly}" ]]; then
        args+=(-Z build-std="core")
    else
        printf '%s\n' "target '${target}' requires nightly compiler (skipped)"
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
        thumb* | riscv*)
            test_dir=tests/no-std-qemu
            linker=link.x
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
        cd -- "${test_dir}"
        CARGO_TARGET_DIR="${target_dir}/no-std-test" \
            RUSTFLAGS="${target_rustflags}" \
            x_cargo "${args[@]}" "$@"
        CARGO_TARGET_DIR="${target_dir}/no-std-test" \
            RUSTFLAGS="${target_rustflags}" \
            x_cargo "${args[@]}" --release "$@"
        case "${target}" in
            thumbv[4-5]t* | armv[4-5]t*)
                CARGO_TARGET_DIR="${target_dir}/no-std-test-disable-fiq" \
                    RUSTFLAGS="${target_rustflags} --cfg portable_atomic_disable_fiq" \
                    x_cargo "${args[@]}" "$@"
                CARGO_TARGET_DIR="${target_dir}/no-std-test-disable-fiq" \
                    RUSTFLAGS="${target_rustflags} --cfg portable_atomic_disable_fiq" \
                    x_cargo "${args[@]}" --release "$@"
                ;;
            riscv??i-* | riscv??im-* | riscv??imc-*)
                # .option arch requires 1.72
                if [[ "${rustc_minor_version}" -ge 72 ]]; then
                    CARGO_TARGET_DIR="${target_dir}/no-std-test-force-amo" \
                        RUSTFLAGS="${target_rustflags} --cfg portable_atomic_force_amo" \
                        x_cargo "${args[@]}" "$@"
                    CARGO_TARGET_DIR="${target_dir}/no-std-test-force-amo" \
                        RUSTFLAGS="${target_rustflags} --cfg portable_atomic_force_amo" \
                        x_cargo "${args[@]}" --release "$@"
                    CARGO_TARGET_DIR="${target_dir}/no-std-test-zaamo" \
                        RUSTFLAGS="${target_rustflags} -C target-feature=+zaamo" \
                        x_cargo "${args[@]}" "$@"
                    CARGO_TARGET_DIR="${target_dir}/no-std-test-zaamo" \
                        RUSTFLAGS="${target_rustflags} -C target-feature=+zaamo" \
                        x_cargo "${args[@]}" --release "$@"
                    local arch
                    case "${target}" in
                        riscv32*) arch=riscv32 ;;
                        riscv64*) arch=riscv64 ;;
                        *) bail "${target}" ;;
                    esac
                    # Support for Zabha extension requires LLVM 19+ and QEMU 9.1+.
                    # https://github.com/qemu/qemu/commit/be4a8db7f304347395b081ae5848bad2f507d0c4
                    qemu_version=$(qemu-system-"${arch}" --version | sed -En '1 s/QEMU emulator version [^ ]+ \(v([^ )]+)\)/\1/p')
                    if [[ "${llvm_version}" -ge 19 ]] && [[ "${qemu_version}" =~ ^(9\.[^0]|[1-9][0-9]+\.) ]]; then
                        export "CARGO_TARGET_${target_upper}_RUNNER"="qemu-system-${arch} -M virt -cpu max -display none -semihosting -kernel"
                        CARGO_TARGET_DIR="${target_dir}/no-std-test-zabha" \
                            RUSTFLAGS="${target_rustflags} -C target-feature=+zaamo,+zabha" \
                            x_cargo "${args[@]}" "$@"
                        CARGO_TARGET_DIR="${target_dir}/no-std-test-zabha" \
                            RUSTFLAGS="${target_rustflags} -C target-feature=+zaamo,+zabha" \
                            x_cargo "${args[@]}" --release "$@"
                    fi
                fi
                ;;
        esac
    )
}

for target in "${targets[@]}"; do
    run "${target}"
done
