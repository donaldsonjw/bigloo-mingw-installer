; -- bigloo.iss --

[Setup]
AppName=Bigloo
AppVersion=3.8a
DefaultDirName=c:\bigloo38a
DefaultGroupName=bigloo
Compression=lzma2
SolidCompression=yes
SourceDir=c:\bigloo
ChangesEnvironment=yes


[Files]
Source: "bin\*"; DestDir: "{app}\bin"
Source: "doc\bigloo-3.8a\*"; DestDir: "{app}\doc\bigloo-3.8a"
Source: "info\*"; DestDir: "{app}\info"
Source: "lib\*"; DestDir: "{app}\lib"
Source: "lib\bigloo\3.8a\*"; DestDir: "{app}\lib\bigloo\3.8a"
Source: "lib\bigloo\3.8a\text\data\*"; DestDir: "{app}\lib\bigloo\3.8a\text\data"
Source: "man\man1\*"; DestDir: "{app}\man\man1"
Source: "C:\MinGW\bin\libgmp-10.dll"; DestDir: "{app}\lib"
Source: "C:\MinGW\bin\libpcre-0.dll"; DestDir: "{app}\lib"
Source: "C:\MinGW\bin\libsqlite3-0.dll"; DestDir: "{app}\lib"
Source: "C:\MinGW\lib\libcrypto.a"; DestDir: "{app}\lib\bigloo\3.8a"
Source: "C:\MinGW\lib\libssl.a"; DestDir: "{app}\lib\bigloo\3.8a"
Source: "C:\MinGW\lib\libsqlite3*"; DestDir: "{app}\lib\bigloo\3.8a"
Source: "C:\MinGW\lib\libpcre*"; DestDir: "{app}\lib\bigloo\3.8a"
Source: "C:\MinGW\lib\libgmp*"; DestDir: "{app}\lib\bigloo\3.8a"

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "BIGLOOLIB"; ValueData: "{app}\lib\bigloo\3.8a"; Flags: uninsdeletevalue;


[Tasks]
Name: modifypath; Description: Add application directory to your environmental path;
[Code]
const
    ModPathName = 'modifypath';
    ModPathType = 'system';

function ModPathDir(): TArrayOfString;
begin
    setArrayLength(Result, 2)
    Result[0] := ExpandConstant('{app}/bin');
    Result[1] := ExpandConstant('{app}/lib');
end;
#include "modpath.iss"