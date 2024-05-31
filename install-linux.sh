#!/usr/bin/env bash

set -e

APP_NAME="com.cssnr.extension.python"
SOURCE="dist"
DESTINATION="${APP_NAME}_${GITHUB_REF_NAME:-0.1}"

echo "SOURCE: ${SOURCE}"
ls -lah "${SOURCE}"
echo "dest: ${DESTINATION}"

chrome="${DESTINATION}/etc/opt/chrome/native-messaging-hosts"
chromium="${DESTINATION}/etc/chromium/native-messaging-hosts"
firefox="${DESTINATION}/usr/lib/mozilla/native-messaging-hosts"

mkdir -p "${DESTINATION}/DEBIAN"
mkdir -p "${DESTINATION}/opt/${APP_NAME}"
mkdir -p "${chrome}"
mkdir -p "${chromium}"
mkdir -p "${firefox}"

cp "${SOURCE}/client" "${DESTINATION}/opt/${APP_NAME}/client"
chmod +x "${DESTINATION}/opt/${APP_NAME}/client"
touch "${DESTINATION}/opt/${APP_NAME}/log.txt"

cp "${SOURCE}/manifest-chrome.json" "${chrome}/${APP_NAME}.json"
cp "${SOURCE}/manifest-chrome.json" "${chromium}/${APP_NAME}.json"
cp "${SOURCE}/manifest-firefox.json" "${firefox}/${APP_NAME}.json"

cat <<-EOF > "${DESTINATION}/DEBIAN/control"
Package: ${APP_NAME}
Version: ${GITHUB_REF_NAME:-0.1}
Section: base
Priority: optional
Architecture: i386
Maintainer: CSSNR
Description:  CSSNR Python Native Messaging
 https://github.com/smashedr/python-native-messaging
EOF

echo "Debian: ${DESTINATION}/DEBIAN/control"
cat "${DESTINATION}/DEBIAN/control"

echo "Building: ${DESTINATION}"
dpkg-deb --build "${DESTINATION}"

mkdir out
mv "${DESTINATION}.deb" "out/install-linux.deb"
