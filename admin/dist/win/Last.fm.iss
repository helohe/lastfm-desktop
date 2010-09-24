; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[CustomMessages]
Version=2.0.0.17


[Setup]
OutputBaseFilename=Last.fm-0.0.0.0
VersionInfoVersion=2.0.0
VersionInfoTextVersion=2.0.0
AppName=Last.fm
AppVerName=Last.fm {cm:Version}
VersionInfoDescription=Last.fm Installer
AppPublisher=Last.fm
AppPublisherURL=http://www.last.fm
AppSupportURL=http://www.last.fm
AppUpdatesURL=http://www.last.fm
AppCopyright=Copyright 2010 Last.fm Ltd. (C)
DefaultDirName={pf}\Last.fm
UsePreviousAppDir=yes
DefaultGroupName=Last.fm
OutputDir=.
AllowNoIcons=yes
Compression=lzma
SolidCompression=yes
DisableReadyPage=yes
DirExistsWarning=no
DisableFinishedPage=no
ShowLanguageDialog=yes
WizardImageFile=wizard.bmp
WizardSmallImageFile=wizard_small.bmp
SetupIconFile=installer.ico
WizardImageBackColor=$ffffff
WizardImageStretch=no
AppMutex=Lastfm-F396D8C8-9595-4f48-A319-48DCB827AD8F, Audioscrobbler-7BC5FBA0-A70A-406e-A50B-235D5AFE67FB

; This should stay the same across versions for the installer to treat it as the same program.
; It will then work to install however many updates and then run the uninstall script for
; the first version.
AppId=LastFM

[Types]
Name: "full"; Description: "Full installation"
Name: "compact"; Description: "Compact installation (just the scrobbler)"

[Components]
Name: Radio; Description: "Radio"; Types: full
Name: Audioscrobbler; Description: "Audioscrobbler"; Flags: fixed; Types: full compact
Name: Unicorn; Description: "Application Library"; Flags: fixed; Types: full compact
Name: LibLastfm; Description: "API Library"; Flags: fixed; Types: full compact
Name: Qt; Description: "Qt Libraries"; Flags: fixed; Types: full compact

[Languages]
; The first string is an internal code that we can set to whatever we feel like
Name: "en"; MessagesFile: "compiler:Default.isl"
;Name: "fr"; MessagesFile: "..\res\French-15-5.1.11.isl"
;Name: "it"; MessagesFile: "..\res\Italian-14-5.1.11.isl"
;Name: "de"; MessagesFile: "..\res\German-2-5.1.11.isl"
;Name: "es"; MessagesFile: "..\res\SpanishStd-5-5.1.11.isl"
;Name: "pt"; MessagesFile: "..\res\BrazilianPortuguese-16-5.1.11.isl"
;Name: "pl"; MessagesFile: "..\res\Polish-8-5.1.11.isl"
;Name: "ru"; MessagesFile: "..\res\Russian-19-5.1.11.isl"
;Name: "jp"; MessagesFile: "..\res\Japanese-5-5.1.11.isl"
;Name: "cn"; MessagesFile: "..\res\ChineseSimp-12-5.1.11.isl"
;Name: "tr"; MessagesFile: "..\res\Turkish-3-5.1.11.isl"
;Name: "sv"; MessagesFile: "..\res\Swedish-10-5.1.12.isl"


[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: checkedonce

; The OnlyBelowVersion flag disables this on Vista as an admin-run installer can't install a quick launch
; icon to the standard user's folder location. Sucks.
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0, 6;


[Files]
; Main files
Source: "..\..\..\_bin\radio.exe"; DestDir: "{app}"; Components: Radio ; Flags: ignoreversion; BeforeInstall: ExitApp('{app}\radio.exe')
Source: "..\..\..\_bin\audioscrobbler.exe"; DestDir: "{app}"; Components: Audioscrobbler ; Flags: ignoreversion; BeforeInstall: ExitApp('{app}\audioscrobbler.exe')

Source: "..\..\..\_bin\iPodScrobbler.exe"; DestDir: "{app}"; Components: Audioscrobbler ; Flags: ignoreversion

;libraries
Source: "..\..\..\_bin\lastfm.dll"; DestDir: "{app}"; Components: LibLastfm; Flags: ignoreversion
Source: "..\..\..\_bin\unicorn.dll"; DestDir: "{app}"; Components: Unicorn; Flags: ignoreversion
Source: "..\..\..\_bin\listener.dll"; DestDir: "{app}"; Components: Unicorn; Flags: ignoreversion

;Visual Studio redistributable packages
Source: "%VSDIR%\VC\redist\x86\Microsoft.VC90.CRT\*"; DestDir: "{app}"; Flags: ignoreversion
Source: "%VSDIR%\VC\redist\x86\Microsoft.VC90.ATL\*"; DestDir: "{app}"; Flags: ignoreversion

; Qt binaries
Source: "%QTDIR%\bin\QtCore4.dll"; DestDir: "{app}"; Components: Qt; Flags: ignoreversion
Source: "%QTDIR%\bin\QtGui4.dll"; DestDir: "{app}"; Components: Qt; Flags: ignoreversion
Source: "%QTDIR%\bin\QtNetwork4.dll"; DestDir: "{app}"; Components: Qt; Flags: ignoreversion
Source: "%QTDIR%\bin\QtXml4.dll"; DestDir: "{app}"; Components: Qt; Flags: ignoreversion
Source: "%QTDIR%\bin\QtSql4.dll"; DestDir: "{app}"; Components: Qt; Flags: ignoreversion
Source: "%QTDIR%\bin\phonon4.dll"; DestDir: "{app}"; Components: Radio; Flags: ignoreversion

;image formats plugins
Source: "%QTDIR%\plugins\imageformats\qjpeg4.dll"; DestDir: "{app}\imageformats"; Components: Qt; Flags: ignoreversion
Source: "%QTDIR%\plugins\imageformats\qgif4.dll"; DestDir: "{app}\imageformats"; Components: Qt; Flags: ignoreversion
Source: "%QTDIR%\plugins\imageformats\qmng4.dll"; DestDir: "{app}\imageformats"; Components: Qt; Flags: ignoreversion

;phonon backend plugin
Source: "%QTDIR%\plugins\phonon_backend\phonon_ds94.dll"; DestDir: "{app}\phonon_backend"; Components: Radio; Flags: ignoreversion

;The stylesheets
Source: "..\..\..\lib\unicorn\unicorn.css"; DestDir: "{app}"; Components: Unicorn; Flags: ignoreversion
Source: "..\..\..\app\audioscrobbler\audioscrobbler.css"; DestDir: "{app}"; Components: Audioscrobbler; Flags: ignoreversion
Source: "..\..\..\app\radio\radio.css"; DestDir: "{app}"; Components: Radio; Flags: ignoreversion

;Some text files
;Source: "..\ChangeLog.txt"; DestDir: "{app}"; Flags: ignoreversion
;Source: "..\COPYING"; DestDir: "{app}"; Flags: ignoreversion

;Source: "..\bin\data\*"; DestDir: "{app}\data"; Flags: ignoreversion recursesubdirs


[Registry]
Root: HKLM; Subkey: "Software\Last.fm\Client"; ValueType: string; ValueName: "Version"; ValueData: "{cm:Version}"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\Last.fm\Client"; ValueType: string; ValueName: "Path"; ValueData: "{app}\audioscrobbler.exe"; Components: Radio; Flags: uninsdeletekey

; Register last.fm protocol only if it isn't already
Root: HKCR; Subkey: "lastfm"; ValueType: string; ValueName: ""; ValueData: "URL:lastfm"; Components: Radio; Flags: uninsdeletekey
Root: HKCR; Subkey: "lastfm"; ValueType: string; ValueName: "URL Protocol"; ValueData: ""; Components: Radio; Flags: uninsdeletekey
Root: HKCR; Subkey: "lastfm\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\radio.exe"" ""%1"""; Components: Radio; Flags: uninsdeletekey
Root: HKCR; Subkey: "lastfm"; ValueType: string; ValueName: "URL Protocol"; ValueData: ""; Components: Radio; Flags: uninsdeletekey

; Register Last.fm in the control panel


; This is just for deleting keys at uninstall
Root: HKCU; Subkey: "Software\Last.fm"; Flags: dontcreatekey uninsdeletekeyifempty
Root: HKLM; Subkey: "Software\Last.fm"; Flags: dontcreatekey uninsdeletekeyifempty
Root: HKCU; Subkey: "Software\Last.fm\Client"; Flags: dontcreatekey uninsdeletekey
Root: HKLM; Subkey: "Software\Last.fm\Client"; Flags: dontcreatekey uninsdeletekey


[INI]
Filename: "{app}\LastFM.url"; Section: "InternetShortcut"; Key: "URL"; String: "http://www.last.fm"


[Icons]
Name: "{group}\Last.fm Radio"; Filename: "{app}\radio.exe"
Name: "{group}\Last.fm Audioscrobbler"; Filename: "{app}\audioscrobbler.exe"
Name: "{group}\Go to www.last.fm"; Filename: "{app}\LastFM.url"
Name: "{group}\{cm:UninstallProgram,Last.fm}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\Last.fm Radio"; Filename: "{app}\radio.exe"; Tasks: desktopicon

; The OnlyBelowVersion flag disables this on Vista as an admin-run installer can't install a quick launch
; icon to the standard user's folder location. Sucks.
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Last.fm"; Filename: "{app}\radio.exe"; OnlyBelowVersion: 0,6; Tasks: quicklaunchicon


[Run]
Filename: "{app}\audioscrobbler.exe"; Flags: nowait runasoriginaluser

; This is the LAST step of uninstallation
[UninstallDelete]
Type: dirifempty; Name: "{app}"

Type: filesandordirs; Name: "{localappdata}\Last.fm\Client"
Type: dirifempty; Name: "{localappdata}\Last.fm"

; This should be possible to delete as we're waiting until all the plugin uninstallers have been run.
Type: files; Name: "{commonappdata}\Last.fm\Client\uninst.bat"
Type: files; Name: "{commonappdata}\Last.fm\Client\uninst2.bat"
Type: filesandordirs; Name: "{commonappdata}\Last.fm\Client"
Type: dirifempty; Name: "{commonappdata}\Last.fm"


; This is the FIRST step of uninstallation
[UninstallRun]
Filename: "{app}\radio.exe"; Parameters: "--exit"
Filename: "{app}\audioscrobbler.exe"; Parameters: "--exit"


[Code]
// Global variables
var g_firstRun: Boolean;

// This must be called before the install and its value stored
function IsUpgrade(): Boolean;
var
  sPrevPath: String;
begin
  sPrevPath := '';
  if not RegQueryStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\LastFM_is1', 'UninstallString', sPrevpath) then
    RegQueryStringValue(HKCU, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\LastFM_is1', 'UninstallString', sPrevpath);
  Result := (sPrevPath <> '');
end;

function InitializeSetup(): Boolean;
begin
  //QuitHelper(True);

  // Need to evaluate and store this before any installation has been done
  g_firstRun := not IsUpgrade();

  // Run setup
  Result := TRUE;
end;

procedure ExitApp(FileName: String);
var
  processExitCode: Integer;
  execOK: Boolean;
begin
  execOK := ExecAsOriginalUser(ExpandConstant(FileName), '--exit', '', SW_SHOW, ewWaitUntilTerminated, processExitCode);
end;


