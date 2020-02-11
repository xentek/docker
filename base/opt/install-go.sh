#!/usr/bin/env sh
set -ex

apk add --no-cache \
    go@community

mkdir -p /usr/lib/go/src
