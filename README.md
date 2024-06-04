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

Download and run the installer for your operating system from the latest
[release](https://github.com/smashedr/python-native-messaging/releases/latest).

## Building

### Windows

> [!NOTE]  
> The Windows installer uses [Inno Setup](https://jrsoftware.org/isinfo.php)
> which must be manually installed.

Build the App:

```shell
python -m pip install pyinstaller
pyinstaller --noconfirm client.spec
python manifest.py
```

Create the Installer:

```shell
iscc.exe client.iss
```

### Linux

```shell
python manifest.py
bash build-linux.sh
```

### MacOS

> [!NOTE]  
> The macOS installer uses [Packages](http://s.sudre.free.fr/Software/Packages/about.html)
> which must be manually installed.

Build the App:

```shell
python -m pip install pyinstaller
pyinstaller --noconfirm client.spec
python manifest.py
```

Create the Package:

```shell
bash build-mac.sh
```

## More Info

Windows requires corresponding registry entries for the manifest files (see location links below).

Windows and macOS requires packaging the app with `pyinstaller` to bundle python.

Manifest files must be renamed to `org.cssnr.extension.python.json` on Linux and macOS.

Manifest key `path` must be set to the absolute path to the `client` location.

Manifest files must be placed in specific directories:

- Firefox: https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Native_manifests#manifest_location
- Chrome: https://developer.chrome.com/docs/extensions/develop/concepts/native-messaging#native-messaging-host-location

If the `client` location is not writable by the user and a writable `log.txt`
must be created at that location due to the current logging configuration in the [client.py](src%2Fclient.py).

The `client.py` must be executable by the user with Python installed and working.
