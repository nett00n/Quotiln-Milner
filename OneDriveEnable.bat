@ECHO OFF
ECHO This script is made for enable OneDrive from Windows 10 after uninstalling with Quotlin-Milner

REM Disable OneDrive sync:
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive /v DisableFileSyncNGSC  /t REG_DWORD /d 0 /f

REM Remove OneDrive form Explorer:
REG ADD HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6} /v System.IsPinnedToNameSpaceTree /d 1 /f
REG ADD HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6} /v System.IsPinnedToNameSpaceTree /d 1 /f
