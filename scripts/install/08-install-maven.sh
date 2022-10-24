#!/usr/bin/env bash

set +x
set -e

mkdir /opt/maven
maven_download_url="https://repo1.maven.org/maven2/org/apache/maven/apache-maven/$MAVEN_VERSION/apache-maven-${MAVEN_VERSION}-bin.tar.gz"
echo "Downloading [$maven_download_url]..."
curl -fL $maven_download_url | tar zxv -C /opt/maven --strip-components=1

ln -s /home/maven/.m2 /root/.m2
