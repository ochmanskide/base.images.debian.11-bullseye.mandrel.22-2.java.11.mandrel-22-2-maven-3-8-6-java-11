#!/usr/bin/env bash

set +x
set -e

graalvm_version='22.2.0.0-Final'
java_major_version='11'

echo "Effective GRAALVM_VERSION: 22.2.0.0-Final at https://github.com/graalvm/mandrel/releases/download/mandrel-22.2.0.0-Final/mandrel-java11-linux-amd64-22.2.0.0-Final.tar.gz"
graalvm_url="https://github.com/graalvm/mandrel/releases/download/mandrel-${graalvm_version}/mandrel-java${java_major_version}-linux-amd64-${graalvm_version}.tar.gz"
echo "Effective GRAALVM_VERSION: $graalvm_version at $graalvm_url"

GRAALVM_DOWNLOAD_URL=$graalvm_url


echo "#################################################"
echo "Installing GraalVM..."
echo "#################################################"
mkdir $GRAALVM_HOME

echo "Downloading [$GRAALVM_DOWNLOAD_URL]..."
curl -fL "$GRAALVM_DOWNLOAD_URL" | \
 tar zxv -C $GRAALVM_HOME --strip-components=1 \
    --exclude=*/bin/jvisualvm \
    --exclude=*/lib/src.zip \
    --exclude=*/lib/visualvm

export PATH="${JAVA_HOME}/bin:${PATH}"
