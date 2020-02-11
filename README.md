# :whale: docker

Docker Containers for fun and profit (Alpine Based)

---

## xentek/base

This container pre-installs common build tools and utilities, as well as install
scripts for various language runtimes used by the other containers.

    FROM xentek/base:3.11

## xentek/go

This container installs go v1.13.x runtime.

    docker pull xentek/go:latest

## xentek/node

This container installs node v12.15.x runtime.

    docker pull xentek/node:latest

## xentek/python

This contianer installs python v3.8.x runtime.

    docker pull xentek/python:latest
