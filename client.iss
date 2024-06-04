#define MyAppName "Native Messaging Client"
#define MyAppPublisher "CSSNR"
#define MyAppURL "https://cssnr.github.io/"
#define MyAppExeName "client.exe"
#define MyAppFolder "org.cssnr.extension.python"
#ifndef MyAppVersion
#define MyAppVersion "0.1"
#endif

[Setup]
AppId={{14C1A0BA-BD81-473B-8179-5AF0FA126E5E}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
Compression=lzma
DefaultDirName={localappdata}\{#MyAppFolder}
;DisableDirPage=yes
DisableProgramGroupPage=yes
DefaultGroupName={#MyAppName}
InfoBeforeFile=INSTALL.md
OutputBaseFilename=install-win
OutputDir=out
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
SetupIconFile=src\favicon.ico
SolidCompression=yes
UninstallDisplayIcon={app}\{#MyAppExeName}
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
;Source: "dist\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\client\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs
Source: "dist\manifest-chrome.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\manifest-firefox.json"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"

[Registry]
Root: HKCU; Subkey: "Software\Google\Chrome\NativeMessagingHosts\{#MyAppFolder}"; ValueType: string; ValueData: "{app}\manifest-chrome.json"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\Chromium\NativeMessagingHosts\{#MyAppFolder}"; ValueType: string; ValueData: "{app}\manifest-chrome.json"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\Microsoft\Edge\NativeMessagingHosts\{#MyAppFolder}"; ValueType: string; ValueData: "{app}\manifest-chrome.json"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\Mozilla\NativeMessagingHosts\{#MyAppFolder}"; ValueType: string; ValueData: "{app}\manifest-firefox.json"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\Waterfox\NativeMessagingHosts\{#MyAppFolder}"; ValueType: string; ValueData: "{app}\manifest-firefox.json"; Flags: uninsdeletekey

[UninstallDelete]
Type: files; Name: "{app}\log.txt"
