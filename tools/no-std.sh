#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"/..

trap -- 'exit 0' SIGINT

default_targets=(
    # armv4t
    thumbv4t-none-eabi
    # armv6-m
    thumbv6m-none-eabi
    # armv7-m
    thumbv7em-none-eabi
    thumbv7em-none-eabihf
    thumbv7m-none-eabi
    # armv8-m
    thumbv8m.base-none-eabi
    thumbv8m.main-none-eabi
    thumbv8m.main-none-eabihf
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
nightly=''
if [[ "${rustc_version}" == *"nightly"* ]] || [[ "${rustc_version}" == *"dev"* ]]; then
    nightly=1
    rustup ${pre_args[@]+"${pre_args[@]}"} component add rust-src &>/dev/null
fi

x() {
    local cmd="$1"
    shift
    (
        set -x
        "${cmd}" "$@"
    )
}
run() {
    local target="$1"
    shift
    local args=()
    if ! grep <<<"${rustc_target_list}" -Eq "^${target}$"; then
        echo "target '${target}' not available on ${rustc_version}"
        return 0
    fi
    case "${target}" in
        thumbv4t* | armv4t*)
            # TODO: run tests on CI (investigate mgba-test-runner in https://github.com/agbrs/agb)
            if type -P mgba; then
                args+=(${pre_args[@]+"${pre_args[@]}"} run)
            else
                args+=(${pre_args[@]+"${pre_args[@]}"} build)
            fi
            ;;
        *) args+=(${pre_args[@]+"${pre_args[@]}"} run) ;;
    esac
    if grep <<<"${rustup_target_list}" -Eq "^${target}( |$)"; then
        x rustup ${pre_args[@]+"${pre_args[@]}"} target add "${target}" &>/dev/null
    elif [[ -n "${nightly}" ]]; then
        args+=(-Z build-std="core,alloc")
    else
        echo "target '${target}' requires nightly compiler"
        return 0
    fi
    args+=(--target "${target}")

    case "${target}" in
        thumbv4t* | armv4t*)
            (
                cd tests/gba
                RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-Tlinker.ld --cfg portable_atomic_unsafe_assume_single_core -C target-feature=+atomics-32" \
                    x cargo "${args[@]}" "$@"
                RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-Tlinker.ld --cfg portable_atomic_unsafe_assume_single_core -C target-feature=+atomics-32" \
                    x cargo "${args[@]}" --release "$@"
            )
            ;;
        thumbv6m*)
            (
                cd tests/cortex-m
                RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-Tlink.x --cfg portable_atomic_unsafe_assume_single_core" \
                    x cargo "${args[@]}" "$@"
                RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-Tlink.x --cfg portable_atomic_unsafe_assume_single_core" \
                    x cargo "${args[@]}" --release "$@"
            )
            ;;
        thumb*)
            (
                cd tests/cortex-m
                RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-Tlink.x" \
                    x cargo "${args[@]}" "$@"
                RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-Tlink.x" \
                    x cargo "${args[@]}" --release "$@"
            )
            ;;
        *)
            echo "unrecognized target '${target}'"
            exit 1
            ;;
    esac
}

for target in "${targets[@]}"; do
    run "${target}"
done
