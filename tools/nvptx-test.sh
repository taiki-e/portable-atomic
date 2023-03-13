#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"/..

# shellcheck disable=SC2154
trap 's=$?; echo >&2 "$0: Error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}' ERR
trap -- 'exit 0' SIGINT

# USAGE:
#    ./tools/nvptx-test.sh [+toolchain] [cargo_options]...

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
if [[ "${1:-}" == "+"* ]]; then
    pre_args+=("$1")
    shift
fi

target=nvptx64-nvidia-cuda
test_dir=tests/nvptx

target_rustflags="${RUSTFLAGS:-}"
rm -f target/"${target}"/release/deps/nvptx_test-*

cd "${test_dir}"
RUSTFLAGS="${target_rustflags} -C target-feature=+sm_70" \
    x_cargo ${pre_args[@]+"${pre_args[@]}"} rustc --target "${target}" "$@" --lib --release -- --emit=asm
x_cargo ${pre_args[@]+"${pre_args[@]}"} run -- target/"${target}"/release/deps/nvptx_test-*
