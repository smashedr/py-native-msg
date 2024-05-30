#define MyAppName "CSSNR Native Client"
#define MyAppVersion "0.1"
#define MyAppPublisher "CSSNR"
#define MyAppURL "https://cssnr.github.io/"
#define MyAppExeName "client.exe"

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
DefaultDirName={localappdata}\com.cssnr.extension.python
DisableDirPage=yes
DisableProgramGroupPage=yes
DefaultGroupName={#MyAppName}
OutputBaseFilename=installer
OutputDir=.\dist\
PrivilegesRequired=lowest
SetupIconFile=favicon.ico
SolidCompression=yes
UninstallDisplayIcon={app}\{#MyAppExeName}
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "dist\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "resources\manifest-chrome.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "resources\manifest-firefox.json"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
