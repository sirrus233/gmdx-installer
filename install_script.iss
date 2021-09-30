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
Source: "7zip\7za.exe"; DestDir: "{tmp}"; Flags: recursesubdirs deleteafterinstall; Components: core
Source: "7z1800\*"; DestDir: "{tmp}\7zhdtp"; Flags: recursesubdirs deleteafterinstall; Components: hdtp
Source: "7z1800\*"; DestDir: "{tmp}\7znv"; Flags: recursesubdirs deleteafterinstall; Components: newvision

[Types]
Name: "full"; Description: "Full Installation"
Name: "custom"; Description: "Custom Installation"; Flags: iscustom

[Components]
Name: "core"; Description: "Base GMDX Files"; Types: full custom; Flags: fixed
Name: "hdtp"; Description: "HDTP Models"; Types: full custom
Name: "newvision"; Description: "New Vision Textures"; Types: full custom

[Run]
Filename: "{tmp}\7zcore\7z.exe"; Parameters: "x {tmp}\GMDXv10InstallArchive.exe -o""{app}"""; StatusMsg: "Extracting core GMDX files..."
Filename: "{tmp}\7zhdtp\7z.exe"; Parameters: "x {tmp}\HDTPInstallArchive.exe -o""{app}"""; StatusMsg: "Extracting HDTP files..."; Flags: skipifdoesntexist
Filename: "{tmp}\7znv\7z.exe"; Parameters: "x {tmp}\NVInstallArchive.exe -o""{app}"""; StatusMsg: "Extracting New Vision files..."; Flags: skipifdoesntexist

[Tasks]
Name: desktopicon; Description: "Create a &desktop icon"; Flags: unchecked

[Icons]
Name: "{commondesktop}\{#SetupSetting("AppName")}"; Filename: "{app}\System\GMDXv10.exe"; Tasks: desktopicon