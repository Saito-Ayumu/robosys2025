#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2025 Ayumu Saito
# SPDX-License-Identifier: BSD-3-Clause

ng () {
  echo "${1}行目が違うよ" >&2
  res=1
}

res=0

### NORMAL INPUT (min-max) ###
out=$(seq 5 | ./numscale)
expected=$'0.000\n0.250\n0.500\n0.750\n1.000'
[ "${out}" = "${expected}" ] || ng "$LINENO"

### ZSCORE (0 and 2 -> mean=1, std=1 so -1 and 1 exactly) ###
out=$(printf "0\n2\n" | ./numscale -z)
expected=$'-1.000\n1.000'
[ "${out}" = "${expected}" ] || ng "$LINENO"

### STRANGE INPUT (non-number) ###
out=$(printf "1\nあ\n2\n" | ./numscale 2>/dev/null)
[ "$?" = 1 ]       || ng "$LINENO"
[ "${out}" = "" ]  || ng "$LINENO"

### EMPTY (no numbers) ###
out=$(echo | ./numscale 2>/dev/null)
[ "$?" = 1 ]       || ng "$LINENO"
[ "${out}" = "" ]  || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res

