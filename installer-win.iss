#define MyAppName "CSSNR Native Client"
#define MyAppVersion "0.1"
#define MyAppPublisher "CSSNR"
#define MyAppURL "https://cssnr.github.io/"
#define MyAppExeName "client.exe"
#define MyAppFolder "com.cssnr.extension.python"

[Setup]
AppId={{451A067A-06E7-4979-92EB-745C1E14AD5F}
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
InfoBeforeFile=C:\Users\Shane\IdeaProjects\python-native-messaging\README.md
OutputBaseFilename=install-win
OutputDir=out
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
SetupIconFile=favicon.ico
SolidCompression=yes
UninstallDisplayIcon={app}\{#MyAppExeName}
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "dist\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "manifest-chrome.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "manifest-firefox.json"; DestDir: "{app}"; Flags: ignoreversion

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
