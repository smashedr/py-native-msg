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

Installing is not straight forward, use the installer for your operating system from
a [release](https://github.com/smashedr/python-native-messaging/releases/latest).

## Building

> [!CAUTION]
> Build Information is OUT OF DATE! See [build.yaml](.github%2Fworkflows%2Fbuild.yaml) for more details.  
> The App is only built for Windows. Linux and macOS use the python file with a shebang line for better performance.

### App

```shell
python -m pip install pyinstaller
pyinstaller --noconfirm py-native-msg.spec
python manifest.py
```

### Windows Install

Make sure to build the [App](#app) first.

```shell
iscc.exe install-win.iss
```

### Linux Install

```shell
bash install-linux.sh
```

- Firefox: `~/.mozilla/native-messaging-hosts`
- Chromium: `~/.config/chromium/NativeMessagingHosts`
- Google Chrome: `~/.config/google-chrome/NativeMessagingHosts`

### MacOS Install

> [!NOTE]  
> macOS must be manually installed until an installer is created, manifest files can be generated.

```shell
python manifest.py
```

Manifest files must be renamed to: `com.cssnr.extension.python.json`

Manifest key `path` must be set to the absolute path to the `client.py` location.

Manifest files must be placed in specific directories:

- Firefox: `~/Library/Application Support/Mozilla/NativeMessagingHosts`
- Chromium: `~/Library/Application Support/Chromium/NativeMessagingHosts`
- Google Chrome: `~/Library/Application Support/Google/Chrome/NativeMessagingHosts`

If the `client` location is not writable by the user, a writable `log.txt`
must be created at that location due to the current logging configuration in the [client.py](src%2Fclient.py).

The `client.py` must be executable by the user with Python installed and working.
