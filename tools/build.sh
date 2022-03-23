#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"/..

trap -- 'exit 0' SIGINT

default_targets=(
    # no atomic load/store (16-bit)
    avr-unknown-gnu-atmega328
    msp430-none-elf
    # no atomic load/store (32-bit)
    riscv32i-unknown-none-elf
    riscv32im-unknown-none-elf
    riscv32imc-unknown-none-elf

    # no atomic CAS (32-bit)
    thumbv4t-none-eabi
    thumbv6m-none-eabi
    # no atomic CAS (64-bit)
    bpfeb-unknown-none
    bpfel-unknown-none

    # no-std 32-bit
    thumbv7m-none-eabi
    # no-std 64-bit
    x86_64-unknown-none
    # no-std 64-bit has Atomic{I,U}128
    aarch64-unknown-none
    # aarch64 no Atomic{I,U}128
    aarch64-pc-windows-msvc
    # aarch64 has Atomic{I,U}128
    aarch64-unknown-freebsd
    # aarch64 always support lse
    aarch64-apple-darwin
    # aarch64_be
    aarch64_be-unknown-linux-gnu
    # riscv32 with atomic
    riscv32imac-unknown-none-elf
    riscv32imc-esp-espidf

    # tier 1 targets
    aarch64-unknown-linux-gnu
    i686-pc-windows-gnu
    i686-pc-windows-msvc
    i686-unknown-linux-gnu
    x86_64-apple-darwin
    x86_64-pc-windows-gnu
    x86_64-pc-windows-msvc
    x86_64-unknown-linux-gnu

    # tier 2 targets we run tests on CI
    arm-unknown-linux-gnueabi
    armv5te-unknown-linux-gnueabi
    armv7-unknown-linux-gnueabi
    armv7-unknown-linux-gnueabihf
    i586-unknown-linux-gnu
    mips-unknown-linux-gnu
    mips64-unknown-linux-gnuabi64
    mips64el-unknown-linux-gnuabi64
    mipsel-unknown-linux-gnu
    powerpc-unknown-linux-gnu
    powerpc64-unknown-linux-gnu
    powerpc64le-unknown-linux-gnu
    riscv64gc-unknown-linux-gnu
    s390x-unknown-linux-gnu
    sparc64-unknown-linux-gnu
    thumbv7neon-unknown-linux-gnueabihf
)

pre_args=()
if [[ "${1:-}" == "+"* ]]; then
    pre_args+=("$1")
    shift
fi
if [[ $# -gt 0 ]]; then
    targets=("$@")
else
    targets=("${default_targets[@]}")
fi

rustup_target_list=$(rustup ${pre_args[@]+"${pre_args[@]}"} target list)
rustc_target_list=$(rustc ${pre_args[@]+"${pre_args[@]}"} --print target-list)
rustc_version=$(rustc ${pre_args[@]+"${pre_args[@]}"} -Vv | grep 'release: ' | sed 's/release: //')
subcmd=build
if [[ "${rustc_version}" == *"nightly"* ]] || [[ "${rustc_version}" == *"dev"* ]]; then
    rustup ${pre_args[@]+"${pre_args[@]}"} component add rust-src &>/dev/null
    case "${rustc_version}" in
        # -Z check-cfg-features requires 1.61.0-nightly
        1.[0-5]* | 1.60.*) ;;
        *)
            # shellcheck disable=SC2207
            build_script_cfg=($(grep -E 'cargo:rustc-cfg=' build.rs | sed -E 's/^.*cargo:rustc-cfg=//' | sed -E 's/".*$//' | LC_ALL=C sort | uniq))
            check_cfg="-Z unstable-options --check-cfg=names(docsrs,portable_atomic_unsafe_assume_single_core,$(IFS=',' && echo "${build_script_cfg[*]}"))"
            echo "base rustflags='${check_cfg}'"
            rustup ${pre_args[@]+"${pre_args[@]}"} component add clippy &>/dev/null
            subcmd=clippy
            ;;
    esac
fi

x() {
    local cmd="$1"
    shift
    (
        set -x
        "${cmd}" "$@"
    )
}
build() {
    local target="$1"
    shift
    args=()
    if ! grep <<<"${rustc_target_list}" -Eq "^${target}$"; then
        echo "target '${target}' not available on ${rustc_version}"
        return 0
    fi
    if [[ "${target}" == "avr-"* ]]; then
        # https://github.com/rust-lang/compiler-builtins/issues/400
        case "${rustc_version}" in
            1.4* | 1.50.* | 1.51.*) ;;
            *) return 0 ;;
        esac
    fi
    args+=(${pre_args[@]+"${pre_args[@]}"} hack "${subcmd}")
    if grep <<<"${rustup_target_list}" -Eq "^${target}( |$)"; then
        x rustup ${pre_args[@]+"${pre_args[@]}"} target add "${target}" &>/dev/null
    elif [[ "${rustc_version}" == *"nightly"* ]] || [[ "${rustc_version}" == *"dev"* ]]; then
        case "${target}" in
            # TODO: aarch64 freebsd https://github.com/rust-lang/stdarch/issues/1289
            *-none* | avr-* | *-esp-espidf | aarch64-unknown-freebsd) args+=(-Z build-std="core,alloc") ;;
            *) args+=(-Z build-std) ;;
        esac
    else
        echo "target '${target}' requires nightly compiler"
        return 0
    fi
    if [[ -n "${check_cfg:-}" ]]; then
        args+=(-Z check-cfg-features)
    fi
    args+=(--target "${target}")

    # x cargo "${args[@]}" --manifest-path tests/no-std/Cargo.toml "$@"

    args+=(
        --workspace --ignore-private
        --no-dev-deps --feature-powerset --depth 3 --optional-deps
    )
    case "${target}" in
        x86_64* | aarch64*) ;;
        # outline-atomics feature only affects x86_64 and aarch64.
        *) args+=(--exclude-features "outline-atomics") ;;
    esac
    case "${target}" in
        # TODO: aarch64 freebsd https://github.com/rust-lang/stdarch/issues/1289
        *-none* | avr-* | riscv32imc-esp-espidf | aarch64-unknown-freebsd)
            args+=(--exclude-features "std")
            cfgs=$(RUSTC_BOOTSTRAP=1 rustc ${pre_args[@]+"${pre_args[@]}"} --print cfg --target "${target}")
            if ! grep <<<"${cfgs}" -q "target_has_atomic="; then
                case "${target}" in
                    bpf* | thumbv4t-*) ;; # TODO
                    *)
                        RUSTFLAGS="${RUSTFLAGS:-} ${check_cfg:-} --cfg portable_atomic_unsafe_assume_single_core" \
                            x cargo "${args[@]}" --target-dir target/assume-single-core "$@"
                        ;;
                esac
            fi
            ;;
    esac
    RUSTFLAGS="${RUSTFLAGS:-} ${check_cfg:-}" \
        x cargo "${args[@]}" "$@"
    if [[ "${target}" == "x86_64"* ]]; then
        RUSTFLAGS="${RUSTFLAGS:-} ${check_cfg:-} -C target-feature=+cmpxchg16b" \
            x cargo "${args[@]}" --target-dir target/cmpxchg16b "$@"
    fi
    if [[ "${target}" == "aarch64"* ]]; then
        RUSTFLAGS="${RUSTFLAGS:-} ${check_cfg:-} -C target-feature=+lse" \
            x cargo "${args[@]}" --target-dir target/lse "$@"
    fi
}

for target in "${targets[@]}"; do
    build "${target}"
done
