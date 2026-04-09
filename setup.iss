; Inno Setup Script for Swayam Software
; Generated for building a Windows installer

#define MyAppName "Swayam Software"
#define MyAppVersion "1.0"
#define MyAppPublisher "Swayam Software"
#define MyAppExeName "Swayam_Software.exe"

[Setup]
AppId={{A1B2C3D4-E5F6-7890-ABCD-SWAYAM000001}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName=C:\Swayam_Software
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=target\installer
OutputBaseFilename=Swayam_Software_Setup
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
UninstallDisplayIcon={app}\newapp-icon.ico
SetupIconFile=newapp-icon.ico
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
; Main application exe (fat JAR wrapped by Launch4j)
Source: "target\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion

; Bundled JRE (created via jlink - minimal runtime)
Source: "target\jre-bundle\*"; DestDir: "{app}\jre"; Flags: ignoreversion recursesubdirs createallsubdirs

; App icon
Source: "newapp-icon.ico"; DestDir: "{app}"; Flags: ignoreversion

; SQL schema for first-time DB setup
Source: "target\classes\db\schema.sql"; DestDir: "{app}\db"; Flags: ignoreversion
Source: "target\classes\db\migration\*"; DestDir: "{app}\db\migration"; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist

[Dirs]
; Create the data directory the app uses
Name: "C:\Retail_POS_Files"; Permissions: users-full
Name: "C:\Retail_POS_Files\Config_Files"; Permissions: users-full

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"; IconFilename: "{app}\newapp-icon.ico"
Name: "{group}\Uninstall {#MyAppName}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"; IconFilename: "{app}\newapp-icon.ico"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
; Clean up generated files in app directory (not user data in Retail_POS_Files)
Type: filesandordirs; Name: "{app}\jre"
