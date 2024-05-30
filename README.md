# Python Native Messaging

A Python Native Messaging client for Web Extensions on Windows, Linux and macOS.

Documentation:

- Mozilla: https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Native_messaging
- Google: https://developer.chrome.com/docs/extensions/develop/concepts/native-messaging

Examples:

- Mozilla: https://github.com/mdn/webextensions-examples/tree/main/native-messaging
- Google: https://github.com/GoogleChrome/chrome-extensions-samples/tree/main/api-samples/nativeMessaging

## Browsers

Tested and working in the following browsers:

- Firefox
- Waterfox
- Edge
- Chrome
- Chromium
- Brave
- Opera
- Vivaldi
- Ghost

## Installing

Installing is not straight forward, use the installer for your operating system from a [release](/releases/latest).

For more information see the resources above or check the [resources](resources) directory.

## Building

The application is built using GitHub Actions, see [build.yaml](.github%2Fworkflows%2Fbuild.yaml) for more details.

### App

```shell
python -m pip install pyinstaller
pyinstaller py-native-msg.spec
```

### Windows Installer

```shell
iscc.exe installer-win.iss
```
