#!/usr/bin/env bash

set -e

APP_NAME="org.cssnr.extension.python"
DEST="dist"

echo "DEST: ${DEST}"
ls -lah "${DEST}"

touch "${DEST}/log.txt"

mkdir -p "${DEST}/firefox"
mkdir -p "${DEST}/chrome"

cp -f "${DEST}/manifest-firefox.json" "${DEST}/firefox/${APP_NAME}.json"
cp -f "${DEST}/manifest-chrome.json" "${DEST}/chrome/${APP_NAME}.json"

packagesbuild client.pkgproj
mkdir -p out
mv "build/${APP_NAME}.pkg" "out/install-macos.pkg"
