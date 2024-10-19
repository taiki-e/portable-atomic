#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# shellcheck disable=SC2154
trap 's=$?; echo >&2 "$0: Error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}' ERR
trap -- 'exit 1' SIGINT

x_cargo_build() {
    local target="$1"
    shift
    case "${target}" in
        # TODO: unknown argument '-fuse-ld=lld'
        aarch64-apple-darwin) ;;
        *)
            local target_lower="${target//-/_}"
            local target_lower="${target_lower//./_}"
            local target_upper
            target_upper="$(tr '[:lower:]' '[:upper:]' <<<"${target_lower}")"
            export "CARGO_TARGET_${target_upper}_LINKER"=rust-lld
            ;;
    esac
    set -x
    (
        cargo build --target "${target}" "$@"
    )
}

set -x
x_cargo_build aarch64-unknown-linux-gnu -r
x_cargo_build aarch64-unknown-linux-gnu -r -Z build-std=core
# undefined symbol: __libc_start_main
# x_cargo_build aarch64-unknown-linux-musl -r
# x_cargo_build aarch64-unknown-linux-musl -r -Z build-std=core
x_cargo_build aarch64-linux-android -r
x_cargo_build aarch64-linux-android -r -Z build-std=core
x_cargo_build aarch64-apple-darwin -r
x_cargo_build aarch64-apple-darwin -r -Z build-std=core
x_cargo_build aarch64-unknown-freebsd -r -Z build-std=core
# unable to find library -lcompiler_rt
# x_cargo_build aarch64-unknown-openbsd -r -Z build-std=core
# unable to find library -lzircon
# x_cargo_build aarch64-unknown-fuchsia -r
# x_cargo_build aarch64-unknown-fuchsia -r -Z build-std=core
# undefined symbol: mainCRTStartup
# x_cargo_build aarch64-pc-windows-msvc -r
# x_cargo_build aarch64-pc-windows-msvc -r -Z build-std=core
# x_cargo_build aarch64-pc-windows-gnullvm -r -Z build-std=core
