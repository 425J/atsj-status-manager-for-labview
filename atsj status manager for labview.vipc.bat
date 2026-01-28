@echo off
setlocal

rem VI Package Configuration (VIPC) file path
set "VIPC=%~dpn0"

rem LabVIEW version
set "LV=24.3 (64-bit)"
rem VIPM File Handler path
set "VIPM=C:\Program Files\JKI\VI Package Manager\support\VIPM File Handler.exe"
rem VIPM Settings path
set "CFG=C:\ProgramData\JKI\VIPM\Settings.ini"

if not exist "%VIPM%" goto :error
if not exist "%CFG%" goto :error

echo Start VIPM File Handler
echo    [93m%VIPM%[0m
echo Apply VI Package Configuration to LabVIEW [33m%LV%[0m
echo    [93m%VIPC%[0m
start "Start VIPM File Handler" "%VIPM%" -- "/command:apply" "/lv_version:%LV%" "/vipc:%VIPC%" "/quiet:TRUE"
goto :EOF

:error
echo [91mError: Make sure that VIPM is installed and that the connection with LabVIEW %LV% has been configured.[0m
exit /B 1