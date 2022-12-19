#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"/..

# shellcheck disable=SC2154
trap 's=$?; echo >&2 "$0: Error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}' ERR
trap -- 'exit 0' SIGINT

# USAGE:
#    ./tools/build.sh [+toolchain] [target]...

default_targets=(
    # no atomic load/store (16-bit)
    avr-unknown-gnu-atmega168 # for checking custom target
    avr-unknown-gnu-atmega328
    msp430-none-elf
    msp430-unknown-none-elf # same as msp430-none-elf, but for checking custom target
    # no atomic load/store (32-bit)
    riscv32i-unknown-none-elf
    riscv32im-unknown-none-elf
    riscv32imc-unknown-none-elf
    # no atomic load/store (64-bit)
    riscv64i-unknown-none-elf # custom target

    # no atomic CAS (32-bit)
    thumbv4t-none-eabi
    thumbv6m-none-eabi
    # no atomic CAS (64-bit)
    bpfeb-unknown-none
    bpfel-unknown-none

    # no-std 32-bit with 32-bit atomic
    thumbv7m-none-eabi
    # no-std 64-bit with 64-bit atomic
    x86_64-unknown-none
    # no-std 64-bit with 128-bit atomic
    aarch64-unknown-none

    # x86_64
    x86_64-apple-darwin
    x86_64-pc-windows-gnu
    x86_64-pc-windows-msvc
    x86_64-unknown-linux-gnu
    # x86_64 X32 ABI
    x86_64-unknown-linux-gnux32

    # aarch64
    aarch64-linux-android
    aarch64-pc-windows-msvc
    aarch64-unknown-freebsd
    aarch64-unknown-linux-gnu
    # aarch64 always support lse
    aarch64-apple-darwin
    # aarch64 big endian
    aarch64_be-unknown-linux-gnu
    # aarch64 ILP32 ABI
    aarch64-unknown-linux-gnu_ilp32
    # aarch64 ILP32 ABI big endian
    aarch64_be-unknown-linux-gnu_ilp32

    # riscv32 with atomic
    riscv32imac-unknown-none-elf
    riscv32imc-esp-espidf

    # other tier 1 targets
    i686-pc-windows-gnu
    i686-pc-windows-msvc
    i686-unknown-linux-gnu

    # other tier 2 targets we run tests on CI
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
known_cfgs=(
    docsrs
    qemu
    portable_atomic_unsafe_assume_single_core
    portable_atomic_s_mode
    portable_atomic_disable_fiq
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
    RUSTFLAGS="${RUSTFLAGS:-} ${check_cfg:-}" \
        x cargo "$@"
    echo
}

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
rustc_minor_version="${rustc_version#*.}"
rustc_minor_version="${rustc_minor_version%%.*}"
base_args=(${pre_args[@]+"${pre_args[@]}"} hack build)
nightly=''
if [[ "${rustc_version}" == *"nightly"* ]] || [[ "${rustc_version}" == *"dev"* ]]; then
    nightly=1
    rustup ${pre_args[@]+"${pre_args[@]}"} component add rust-src &>/dev/null
    # -Z check-cfg requires 1.63.0-nightly
    if [[ "${rustc_minor_version}" -gt 62 ]]; then
        # TODO: handle key-value cfg from build script as --check-cfg=values(name, "value1", "value2", ... "valueN")
        # shellcheck disable=SC2207
        known_cfgs+=($(grep -E 'cargo:rustc-cfg=' build.rs portable-atomic-util/build.rs | sed -E 's/^.*cargo:rustc-cfg=//' | sed -E 's/(=\\)?".*$//' | LC_ALL=C sort -u))
        check_cfg="-Z unstable-options --check-cfg=names($(IFS=',' && echo "${known_cfgs[*]}")) --check-cfg=values(target_pointer_width,\"128\") --check-cfg=values(feature,\"cargo-clippy\")"
        rustup ${pre_args[@]+"${pre_args[@]}"} component add clippy &>/dev/null
        base_args=(${pre_args[@]+"${pre_args[@]}"} hack clippy -Z check-cfg="names,values,output,features")
    fi
fi

has_asm=''
# asm requires 1.59
if [[ "${rustc_minor_version}" -gt 58 ]] || [[ -n "${nightly}" ]]; then
    has_asm='1'
fi

build() {
    local target="$1"
    shift
    local args=("${base_args[@]}")
    local target_rustflags="${RUSTFLAGS:-}"
    if ! grep <<<"${rustc_target_list}" -Eq "^${target}$" || [[ -f "target-specs/${target}.json" ]]; then
        if [[ ! -f "target-specs/${target}.json" ]]; then
            echo "target '${target}' not available on ${rustc_version} (skipped all checks)"
            return 0
        fi
        local target_flags=(--target "$(pwd)/target-specs/${target}.json")
    else
        local target_flags=(--target "${target}")
    fi
    args+=("${target_flags[@]}")
    if grep <<<"${rustup_target_list}" -Eq "^${target}( |$)"; then
        x rustup ${pre_args[@]+"${pre_args[@]}"} target add "${target}" &>/dev/null
    elif [[ -n "${nightly}" ]]; then
        case "${target}" in
            *-none* | *-cuda* | avr-* | *-esp-espidf) args+=(-Z build-std="core,alloc") ;;
            *) args+=(-Z build-std) ;;
        esac
    else
        echo "target '${target}' requires nightly compiler (skipped all checks)"
        return 0
    fi
    if [[ "${target}" == "avr-"* ]]; then
        # https://github.com/rust-lang/rust/issues/88252
        target_rustflags="${target_rustflags} -C opt-level=s"
    fi
    cfgs=$(RUSTC_BOOTSTRAP=1 rustc ${pre_args[@]+"${pre_args[@]}"} --print cfg "${target_flags[@]}")
    has_atomic_cas='1'
    # target_has_atomic changed in 1.40.0-nightly: https://github.com/rust-lang/rust/pull/65214
    if [[ "${rustc_minor_version}" -gt 39 ]]; then
        if ! grep <<<"${cfgs}" -q 'target_has_atomic='; then
            has_atomic_cas=''
        fi
    else
        if ! grep <<<"${cfgs}" -q 'target_has_atomic="cas"'; then
            has_atomic_cas=''
        fi
    fi
    if [[ "${target}" == "riscv"* ]] && [[ -z "${has_atomic_cas}" ]] && [[ -z "${has_asm}" ]]; then
        # RISC-V without A-extension requires asm to implement atomics.
        echo "target '${target}' requires asm to implement atomics (skipped all checks)"
        return 0
    fi

    # paste! on statements requires 1.45
    if [[ "${rustc_minor_version}" -gt 44 ]]; then
        if [[ -n "${has_atomic_cas}" ]]; then
            RUSTFLAGS="${target_rustflags}" \
                x_cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
        else
            # target without CAS requires asm to implement CAS.
            if [[ -n "${has_asm}" ]]; then
                case "${target}" in
                    avr-* | msp430-*) # always single-core
                        RUSTFLAGS="${target_rustflags}" \
                            x_cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
                        ;;
                    bpf*) ;; # TODO
                    *)
                        RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core" \
                            x_cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
                        case "${target}" in
                            thumbv[4-5]t* | armv[4-5]t*)
                                RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core --cfg portable_atomic_disable_fiq" \
                                    x_cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
                                ;;
                            riscv*)
                                RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core --cfg portable_atomic_s_mode" \
                                    x_cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
                                ;;
                        esac
                        ;;
                esac
            else
                echo "target '${target}' requires asm to implement atomic CAS (skipped API check)"
            fi
        fi
    fi

    args+=(
        --workspace --ignore-private
        --no-dev-deps --feature-powerset --depth 2 --optional-deps
    )
    case "${target}" in
        x86_64* | aarch64* | arm64*) ;;
        # outline-atomics feature only affects x86_64 and aarch64.
        *) args+=(--exclude-features "outline-atomics") ;;
    esac
    case "${target}" in
        *-none* | *-cuda* | avr-* | *-esp-espidf)
            args+=(--exclude-features "std")
            if [[ -z "${has_atomic_cas}" ]]; then
                if [[ -n "${has_asm}" ]]; then
                    case "${target}" in
                        avr-* | msp430-*) ;;                            # always single-core
                        bpf*) args+=(--exclude portable-atomic-util) ;; # TODO, Arc can't be used here yet
                        *)
                            RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core" \
                                x_cargo "${args[@]}" --target-dir target/assume-single-core "$@"
                            case "${target}" in
                                thumbv[4-5]t* | armv[4-5]t*)
                                    RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core --cfg portable_atomic_disable_fiq" \
                                        x_cargo "${args[@]}" --target-dir target/assume-single-core-disable-fiq "$@"
                                    ;;
                                riscv*)
                                    RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core --cfg portable_atomic_s_mode" \
                                        x_cargo "${args[@]}" --target-dir target/assume-single-core-s-mode "$@"
                                    ;;
                            esac
                            ;;
                    esac
                else
                    echo "target '${target}' requires asm to implement atomic CAS (skipped build with --cfg portable_atomic_unsafe_assume_single_core)"
                fi
                # portable-atomic-util uses atomic CAS, so doesn't work on
                # this target without portable_atomic_unsafe_assume_single_core cfg.
                args+=(--exclude portable-atomic-util)
            fi
            ;;
    esac
    RUSTFLAGS="${target_rustflags}" \
        x_cargo "${args[@]}" "$@"
    case "${target}" in
        x86_64*)
            # macOS is skipped because it is +cmpxchg16b by default
            case "${target}" in
                *-darwin) ;;
                *)
                    RUSTFLAGS="${target_rustflags} -C target-feature=+cmpxchg16b" \
                        x_cargo "${args[@]}" --target-dir target/cmpxchg16b "$@"
                    ;;
            esac
            ;;
        aarch64* | arm64*)
            # macOS is skipped because it is +lse,+lse2 by default
            case "${target}" in
                *-darwin) ;;
                *)
                    RUSTFLAGS="${target_rustflags} -C target-feature=+lse" \
                        x_cargo "${args[@]}" --target-dir target/lse "$@"
                    RUSTFLAGS="${target_rustflags} -C target-feature=+lse,+lse2" \
                        x_cargo "${args[@]}" --target-dir target/lse2 "$@"
                    ;;
            esac
            ;;
        powerpc64-*)
            # powerpc64le- (little-endian) is skipped because it is pwr8 by default
            RUSTFLAGS="${target_rustflags} -C target-cpu=pwr8" \
                x_cargo "${args[@]}" --target-dir target/pwr8 "$@"
            ;;
        powerpc64le-*)
            # powerpc64- (big-endian) is skipped because it is pre-pwr8 by default
            RUSTFLAGS="${target_rustflags} -C target-cpu=pwr7" \
                x_cargo "${args[@]}" --target-dir target/pwr7 "$@"
            ;;
    esac
}

for target in "${targets[@]}"; do
    build "${target}"
done
