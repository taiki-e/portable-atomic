#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -CeEuo pipefail
IFS=$'\n\t'

bin="$1"
stdout='.mspdebug.stdout'

rm -f -- ./"${stdout}"
touch -- ./"${stdout}"

tail -s0 -f "${stdout}" &
tail_pid=$!

mspdebug -n sim &>>"${stdout}" <<EOF &
simio add console serial
prog ${bin}
run
EOF
mspdebug_pid=$!

cleanup() {
    kill "${mspdebug_pid}"
    kill "${tail_pid}"
    rm -- "${stdout}"
    exit "${code}"
}

code=1
trap -- 'printf >&2 "%s\n" "${0##*/}: trapped SIGINT"; cleanup' SIGINT

# Inspired by mgba-test-runner.
while true; do
    if grep -Fq 'panicked' "${stdout}"; then
        code=101
        break
    fi
    if grep -Fq 'Tests finished successfully' "${stdout}"; then
        code=0
        break
    fi
    sleep 0.1
done

cleanup
