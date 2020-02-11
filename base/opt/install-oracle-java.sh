#!/usr/bin/env sh

JAVA_VERSION_MAJOR=8
JAVA_VERSION_MINOR=202
JAVA_VERSION_BUILD=08
JAVA_VERSION_HASH=1961070e4c9b4e26a04e7f5a083f551e
JAVA_PACKAGE=jdk
JAVA_HOME=/opt/jdk
PATH=${PATH}:/opt/jdk/bin
GLIBC_REPO=https://github.com/sgerrand/alpine-pkg-glibc
GLIBC_VERSION=2.28-r0
LANG=C.UTF-8

set -ex

[[ ${JAVA_VERSION_MAJOR} != 7 ]] || ( echo >&2 'Oracle no longer publishes JAVA7 packages' && exit 1 )

for pkg in glibc-${GLIBC_VERSION} glibc-bin-${GLIBC_VERSION} glibc-i18n-${GLIBC_VERSION}; do
    curl -sSL ${GLIBC_REPO}/releases/download/${GLIBC_VERSION}/${pkg}.apk -o /tmp/${pkg}.apk
done

apk add --allow-untrusted /tmp/*.apk
rm -v /tmp/*.apk
( /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 C.UTF-8 || true )

echo "export LANG=C.UTF-8" > /etc/profile.d/locale.sh
/usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib

curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" -o /tmp/java.tar.gz http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_VERSION_HASH}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz
    
JAVA_PACKAGE_SHA256=$(curl -sSL https://www.oracle.com/webfolder/s/digest/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}checksum.html | grep -E "${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64\.tar\.gz" | grep -Eo '(sha256: )[^<]+' | cut -d: -f2 | xargs)
echo "${JAVA_PACKAGE_SHA256}  /tmp/java.tar.gz" > /tmp/java.tar.gz.sha256
sha256sum -c /tmp/java.tar.gz.sha256

gunzip /tmp/java.tar.gz
tar -C /opt -xf /tmp/java.tar
ln -s /opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /opt/jdk
sed -i s/#networkaddress.cache.ttl=-1/networkaddress.cache.ttl=10/ $JAVA_HOME/jre/lib/security/java.security && \
rm -rf /opt/jdk/*src.zip \
    /opt/jdk/lib/missioncontrol \
    /opt/jdk/lib/visualvm \
    /opt/jdk/lib/*javafx* \
    /opt/jdk/jre/plugin \
    /opt/jdk/jre/bin/javaws \
    /opt/jdk/jre/bin/jjs \
    /opt/jdk/jre/bin/orbd \
    /opt/jdk/jre/bin/pack200 \
    /opt/jdk/jre/bin/policytool \
    /opt/jdk/jre/bin/rmid \
    /opt/jdk/jre/bin/rmiregistry \
    /opt/jdk/jre/bin/servertool \
    /opt/jdk/jre/bin/tnameserv \
    /opt/jdk/jre/bin/unpack200 \
    /opt/jdk/jre/lib/javaws.jar \
    /opt/jdk/jre/lib/deploy* \
    /opt/jdk/jre/lib/desktop \
    /opt/jdk/jre/lib/*javafx* \
    /opt/jdk/jre/lib/*jfx* \
    /opt/jdk/jre/lib/amd64/libdecora_sse.so \
    /opt/jdk/jre/lib/amd64/libprism_*.so \
    /opt/jdk/jre/lib/amd64/libfxplugins.so \
    /opt/jdk/jre/lib/amd64/libglass.so \
    /opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
    /opt/jdk/jre/lib/amd64/libjavafx*.so \
    /opt/jdk/jre/lib/amd64/libjfx*.so \
    /opt/jdk/jre/lib/ext/jfxrt.jar \
    /opt/jdk/jre/lib/ext/nashorn.jar \
    /opt/jdk/jre/lib/oblique-fonts \
    /opt/jdk/jre/lib/plugin.jar