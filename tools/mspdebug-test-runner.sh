#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -CeEuo pipefail
IFS=$'\n\t'

mspdebug -n sim <<EOF | tee -- .msp430.stdout &
simio add console serial
prog $1
run
EOF
mspdebug_pid=$!

# Inspired by mgba-test-runner.
code=1
while true; do
    if grep -Fq 'Tests finished successfully' .msp430.stdout; then
        code=0
        break
    fi
    sleep 0.2
done

kill "${mspdebug_pid}"
rm -- .msp430.stdout
exit "${code}"
