@ECHO OFF
ECHO This script is made for disable and remove OneDrive from Windows 10

SETLOCAL

REM Check architecture:
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT

REM Check Windows version:
for /f "tokens=2 delims=[]" %%i in ('ver') do SET VERSION=%%i
for /f "tokens=2-3 delims=. " %%i in ("%VERSION%") do SET VERSION=%%i.%%j

if "%VERSION%" == "5.00" (
    ECHO Your system is Windows 2000. It's not supported by this script.
    EXIT /b 1)
if "%VERSION%" == "5.0" (
    ECHO Your system is Windows 2000. It's not supported by this script.
    EXIT /b 1)
if "%VERSION%" == "5.1" (
    ECHO Your system is Windows XP. It's not supported by this script.
    EXIT /b 1)
if "%VERSION%" == "5.2" (
    ECHO Your system is Windows Server 2003. It's not supported by this script.
    EXIT /b 1)
if "%VERSION%" == "6.0" (
    ECHO Your system is Windows Vista. It's not supported by this script.
    EXIT /b 1)
if "%VERSION%" == "6.1" (
    ECHO Your system is Windows 7. It's not supported by this script.
    EXIT /b 1)
if "%VERSION%" == "6.2" (
    ECHO Your system is Windows 8. It's not supported by this script.
    EXIT /b 1)
if "%VERSION%" == "6.3" (
    ECHO Your system is Windows 8.1. It's not supported by this script.
    EXIT /b 1)

REM Print system info:
if "%VERSION%" == "6.4" ECHO Your system is Windows 10 %OSArchitecture%. Now we can start.
if "%VERSION%" == "10.0" ECHO Your system is Windows 10 %OSArchitecture%. Now we can start.

REM kill OneDrive process:
taskkill /f /im OneDrive.exe

REM Disable OneDrive sync:
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive /v DisableFileSyncNGSC  /t REG_DWORD /d 1 /f

REM Remove OneDrive form Explorer:
REG ADD HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6} /v System.IsPinnedToNameSpaceTree /d 0 /f
REG ADD HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6} /v System.IsPinnedToNameSpaceTree /d 0 /f

REM Uninstall OneDrive:
if %OSArchitecture%==32BIT %SystemRoot%\System32\OneDriveSetup.exe /uninstall
if %OSArchitecture%==64BIT %SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall

ENDLOCAL