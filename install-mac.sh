#!/usr/bin/env bash

set -e

APP_NAME="org.cssnr.extension.python"
DEST="dist"

echo "DEST: ${DEST}"
ls -lah "${DEST}"

touch "${DEST}/log.txt"

mkdir "${DEST}/firefox"
mkdir "${DEST}/chrome"

mv "${DEST}/manifest-firefox.json" "${DEST}/firefox/${APP_NAME}.json"
mv "${DEST}/manifest-chrome.json" "${DEST}/chrome/${APP_NAME}.json"

packagesbuild client.pkgproj
mkdir out
mv "build/hls-downloader-client.pkg" "out/install-macos.pkg"
