#!/usr/bin/env sh
set -ex
apk add --no-cache \
    python3 \
    python3-dev \
    gmp \
    yaml \
    py3-asn1 \
    py3-asn1crypto \
    py3-bcrypt \
    py3-cffi \
    py3-cparser \
    py3-cryptography \
    py3-idna \
    py3-ipaddress \
    py3-jinja2 \
    py3-markupsafe \
    py3-paramiko \
    py3-pynacl \
    py3-six \
    py3-yaml

ln -s /usr/bin/pip3 /usr/bin/pip
ln -sf /usr/bin/python3 /usr/bin/python
pip install --upgrade pip setuptools
