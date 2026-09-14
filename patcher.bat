@echo off
setlocal
set "WINDOW_NAME=%~1"

if not "%WINDOW_NAME%"=="" (
    taskkill /FI "WINDOWTITLE eq %WINDOW_NAME%*" /F /T >nul 2>&1
)

timeout /t 2 /nobreak >nul

if exist "Daydream.exe.new" (
    move /y "Daydream.exe.new" "Daydream.exe" >nul
)

if exist "Daydream.pck.new" (
    move /y "Daydream.pck.new" "Daydream.pck" >nul
)

start "" "Daydream.exe"

exit