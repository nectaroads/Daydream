@echo off
setlocal enableextensions
cd /d "%~dp0"

set "WINDOW_NAME=%~1"

if not "%WINDOW_NAME%"=="" (
    taskkill /FI "WINDOWTITLE eq %WINDOW_NAME%*" /F /T >nul 2>&1
)

timeout /t 3 /nobreak >nul

if exist "aLogin.exe.tmp" (
    del /f /q "aLogin.exe" >nul 2>&1
    move /y "aLogin.exe.tmp" "aLogin.exe"
)

if exist "aLogin.pck.tmp" (
    del /f /q "aLogin.pck" >nul 2>&1
    move /y "aLogin.pck.tmp" "aLogin.pck"
)

start "" "%~dp0aLogin.exe"

exit