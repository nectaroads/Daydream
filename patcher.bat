@echo off
setlocal enableextensions
cd /d "%~dp0"

set "WINDOW_NAME=%~1"

if not "%WINDOW_NAME%"=="" (
    taskkill /FI "WINDOWTITLE eq %WINDOW_NAME%*" /F /T >nul 2>&1
)

timeout /t 3 /nobreak >nul

if exist "Daydream.exe.tmp" (
    del /f /q "Daydream.exe" >nul 2>&1
    move /y "Daydream.exe.tmp" "Daydream.exe"
)

if exist "Daydream.pck.tmp" (
    del /f /q "Daydream.pck" >nul 2>&1
    move /y "Daydream.pck.tmp" "Daydream.pck"
)

start "" "%~dp0Daydream.exe"

exit