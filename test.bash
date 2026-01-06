#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2025 Ayumu Saito
# SPDX-License-Identifier: BSD-3-Clause

set -eu

ng(){ echo "${1}行目が違うよ" >&2; exit 1; }

out="$(seq 5 | ./numscale)"
expected=$'0.000\n0.250\n0.500\n0.750\n1.000'
[ "$out" = "$expected" ] || ng "$LINENO"

out="$(printf "0\n2\n" | ./numscale -z)"
expected=$'-1.000\n1.000'
[ "$out" = "$expected" ] || ng "$LINENO"

out="$(seq 5 | ./numscale -p 1)"
expected=$'0.0\n0.2\n0.5\n0.8\n1.0'
[ "$out" = "$expected" ] || ng "$LINENO"

! echo "あ" | ./numscale >/dev/null 2>&1 || ng "$LINENO"

! echo "" | ./numscale >/dev/null 2>&1 || ng "$LINENO"

echo OK
