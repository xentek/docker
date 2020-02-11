#!/usr/bin/env sh
set -ex
apk add --no-cache \
    ruby \
    ruby-dev \
    ruby-irb \
    ruby-json \
    ruby-libs \
    ruby-minitest \
    ruby-rake

mkdir -p /usr/local/etc
touch /usr/local/etc/gemrc
echo "---\ngem: --no-document" > /usr/local/etc/gemrc
gem install bundler --no-document
