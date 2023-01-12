#!/bin/sh

if [ $# -ne 1 -o ! -f "$1" ]; then
    echo "usage: ${0##*/} FILE" >&2
    exit 1
fi

file -i "$(dirname "$1")"/* \
    | awk -F ': *' -v f="$1" '
        $2 ~ "^image" {
            files[cnt++] = $1;
            if ($1 == f)
                n = cnt;
        }
        END {
            for (i = 0; i < cnt; i++)
                print files[i] | "sxiv -i -n " n;
        }'
