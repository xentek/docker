FROM alpine:3.11
LABEL maintainer="eric.marden@gmail.com"

RUN mkdir -p /opt

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk update \
    && apk upgrade

RUN apk add --no-cache \
      autoconf \
      bash \
      binutils-gold \
      build-base \
      bzip2 \
      ca-certificates \
      coreutils \
      curl \
      curl-dev \
      db-dev \
      g++ \
      gcc \
      gdbm-dev \
      git@edge \
      gmp-dev \
      gnupg \
      imagemagick-dev \
      libc-dev \
      libevent-dev \
      libffi-dev \
      libgcc \
      libgcrypt-dev \
      libstdc++ \
      libxml2-dev \
      libxslt-dev \
      linux-headers \
      make \
      musl-dev \
      pcre-dev \
      procps \
      python3 \
      readline-dev \
      tar \
      tzdata \
      wget \
      xz \
      yaml-dev \
      zlib-dev

COPY opt /opt/bin

CMD ["/bin/sh"]
