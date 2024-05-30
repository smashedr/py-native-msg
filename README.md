# Python Native Messaging

A Python Native Messaging client for Web Extensions on Windows, Linux and macOS.

Documentation:

- Mozilla: https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Native_messaging
- Google: https://developer.chrome.com/docs/extensions/develop/concepts/native-messaging

Examples:

- Mozilla: https://github.com/mdn/webextensions-examples/tree/main/native-messaging
- Google: https://github.com/GoogleChrome/chrome-extensions-samples/tree/main/api-samples/nativeMessaging
- Third Party: https://github.com/alexmarcoo/open-in-native-client

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

Installing is not straight forward, use the installer for your operating system from a [release](https://github.com/smashedr/python-native-messaging/releases/latest).

For more information see [Building](#building) section or the Documentation/Examples above.

## Building

The application is built using GitHub Actions, see [build.yaml](.github%2Fworkflows%2Fbuild.yaml) for more details.

### App

```shell
python -m pip install pyinstaller
pyinstaller py-native-msg.spec
```

### Windows Install

```shell
iscc.exe install-win.iss
```

### Linux Install

Manifest files must be renamed to: `com.cssnr.extension.python.json.json`

Manifest key `path` must be set to the absolute path to the `client` location.

Manifest files must be placed in specific directories:

- Firefox: `~/.mozilla/native-messaging-hosts`
- Chromium: `~/.config/chromium/NativeMessagingHosts`
- Google Chrome: `~/.config/google-chrome/NativeMessagingHosts`

If the `client` location is not writable by the user, a writable `log.txt` 
must be created at that location due to the current logging configuration in the app.

### MacOS Install

Everything from [Linux Install](#linux-install) applies, except:

Manifest files must be placed in specific directories:

- Firefox: `~/Library/Application Support/Mozilla/NativeMessagingHosts`
- Chromium: `~/Library/Application Support/Chromium/NativeMessagingHosts`
- Google Chrome: `~/Library/Application Support/Google/Chrome/NativeMessagingHosts`
