#define MyAppName "Auto Organizer"
#define MyAppVersion "v2.0.4"
#define MyAppPublisher "Eyad Elshaer"
#define MyAppExeName "Auto Organizer.exe"

[Setup]
AppId={{F7A76D84-5448-4E79-8F1B-EC8768B9610D}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputDir=installer
OutputBaseFilename=AutoOrganizerSetup
SetupIconFile=icons\icon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=x64
PrivilegesRequired=admin
PrivilegesRequiredOverridesAllowed=commandline dialog
AppVerName={#MyAppName} {#MyAppVersion}
AppSupportURL=https://github.com/EyadElshaer/Auto-Organize
UninstallDisplayIcon={app}\{#MyAppExeName}
UninstallDisplayName={#MyAppName}
AppMutex=AutoOrganizerAppMutex_{#MyAppVersion}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
UpdateFound=An older version of {#MyAppName} was found. Would you like to update to version {#MyAppVersion}?
UpdateYes=Yes, update now
UpdateNo=No, cancel installation
DowngradeFound=You are about to install version {#MyAppVersion} but a newer version is already installed ({oldversion}). Would you like to downgrade?
DowngradeYes=Yes, downgrade to version {#MyAppVersion}
DowngradeNo=No, keep the current version
UpToDate=You are up to date! Version {oldversion} is already installed.

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "defenderexclusion"; Description: "Add Windows Defender exclusion"; GroupDescription: "Security:"; Flags: unchecked

[Files]
Source: "dist\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "icons\*"; DestDir: "{app}\icons"; Flags: ignoreversion recursesubdirs
Source: "version.txt"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Registry]
Root: HKCU; Subkey: "Software\{#MyAppName}"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\{#MyAppName}"; ValueType: string; ValueName: "InstallPath"; ValueData: "{app}"
Root: HKCU; Subkey: "Software\{#MyAppName}"; ValueType: string; ValueName: "Version"; ValueData: "{#MyAppVersion}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent runascurrentuser

[Code]
procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode: Integer;
begin
  if CurStep = ssInstall then
  begin
    // Terminate running instance before installation
    Exec('taskkill.exe', '/F /IM "{#MyAppExeName}"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
  end;

  if CurStep = ssPostInstall then
  begin
    // Add Windows Defender exclusion if the user selected that option
    if WizardIsTaskSelected('defenderexclusion') then
    begin
      Exec(ExpandConstant('powershell.exe'),
           ExpandConstant('-Command "Add-MpPreference -ExclusionPath ''{app}'' -ErrorAction SilentlyContinue"'),
           '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
      Log('Added Windows Defender exclusion for: ' + ExpandConstant('{app}'));
    end;
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  ResultCode: Integer;
begin
  if CurUninstallStep = usUninstall then
  begin
    // Terminate running instance before uninstallation
    Exec('taskkill.exe', '/F /IM "{#MyAppExeName}"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
  end;
end;
