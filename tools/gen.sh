#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -CeEuo pipefail
IFS=$'\n\t'
trap -- 's=$?; printf >&2 "%s\n" "${0##*/}:${LINENO}: \`${BASH_COMMAND}\` exit with ${s}"; exit ${s}' ERR
cd -- "$(dirname -- "$0")"/..

# Run code generators.
#
# USAGE:
#    ./tools/gen.sh

set -x

./tools/target_spec.sh

cargo run --manifest-path tools/codegen/Cargo.toml
