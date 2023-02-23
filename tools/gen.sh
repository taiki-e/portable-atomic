#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"/..

# shellcheck disable=SC2154
trap 's=$?; echo >&2 "$0: Error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}' ERR

# Run code generators.
#
# USAGE:
#    ./tools/gen.sh

set -x

cargo run --manifest-path tools/codegen/Cargo.toml
