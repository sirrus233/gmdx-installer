[Setup]
; Metadata
AppName=GMDXv10
AppVersion=10.2.0
OutputBaseFilename="GMDX Setup"
WizardStyle=modern
; Directories
SourceDir=src
OutputDir=..\out
#define SteamKey "reg:HKLM64\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 6910,InstallLocation"
#define GOGKey "reg:HKLM32\SOFTWARE\GOG.COM\Games\1207658995,path"
DefaultDirName={{#GOGKey}|{{#SteamKey}|{sd}\Deus Ex}}
; Compression
Compression=lzma2
SolidCompression=no
; Cosmetic
SetupIconFile=graphics\GMDX.ico
WizardImageFile=graphics\GMDXv10Logo.bmp
WizardSmallImageFile=graphics\GMDXv10Logo.bmp
; Flow
DisableWelcomePage=no
DisableProgramGroupPage=yes
LicenseFile=license\cclicense.txt

[Files]
Source: "GMDXv10InstallArchive.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall nocompression; Components: core
Source: "HDTPInstallArchive.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall nocompression; Components: hdtp
Source: "NVInstallArchive.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall nocompression; Components: newvision
Source: "7zip\7za.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall nocompression; Components: core

[Types]
Name: "full"; Description: "Full Installation"
Name: "custom"; Description: "Custom Installation"; Flags: iscustom

[Components]
Name: "core"; Description: "Base GMDX Files"; Types: full custom; Flags: fixed
Name: "hdtp"; Description: "HDTP Models"; Types: full custom
Name: "newvision"; Description: "New Vision Textures"; Types: full custom

[Run]
Filename: "{tmp}\7za.exe"; Parameters: "x {tmp}\GMDXv10InstallArchive.exe -o""{app}"" -y"; StatusMsg: "Extracting core GMDX files..."; Components: core
Filename: "{tmp}\7za.exe"; Parameters: "x {tmp}\HDTPInstallArchive.exe -o""{app}"" -y"; StatusMsg: "Extracting HDTP files..."; Components: hdtp
Filename: "{tmp}\7za.exe"; Parameters: "x {tmp}\NVInstallArchive.exe -o""{app}"" -y"; StatusMsg: "Extracting New Vision files..."; Components: newvision
Filename: "{app}\System\GMDXv10.exe"; Flags: postinstall

[Tasks]
Name: desktop_icon; Description: "Create a &desktop icon"; Flags: unchecked

[Icons]
Name: "{commondesktop}\{#SetupSetting("AppName")}"; Filename: "{app}\System\GMDXv10.exe"; Tasks: desktop_icon