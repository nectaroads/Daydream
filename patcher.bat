@echo off
setlocal enableextensions disabledelayedexpansion
cd /d "%~dp0"
set "DAYDREAM_PATCH_ROOT=%~dp0"
set "DAYDREAM_PATCH_PID=%~1"
set "DAYDREAM_PATCH_MODE=%~2"
powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -WindowStyle Hidden -Command ^
 "$ErrorActionPreference='Stop'; try { $root=[IO.Path]::GetFullPath($env:DAYDREAM_PATCH_ROOT); $gamePid=0; if ($env:DAYDREAM_PATCH_PID) { if (-not [int]::TryParse($env:DAYDREAM_PATCH_PID,[ref]$gamePid) -or $gamePid -le 0) { throw 'Invalid game process ID' }; if (Get-Process -Id $gamePid -ErrorAction SilentlyContinue) { Wait-Process -Id $gamePid -ErrorAction SilentlyContinue } }; foreach ($name in @('aLogin.exe','aLogin.pck')) { $source=Join-Path $root ($name+'.tmp'); $target=Join-Path $root $name; if (-not (Test-Path -LiteralPath $source)) { continue }; $applied=$false; for ($attempt=0; $attempt -lt 30; $attempt++) { try { Move-Item -LiteralPath $source -Destination $target -Force; $applied=$true; break } catch { Start-Sleep -Milliseconds 500 } }; if (-not $applied) { throw ('Cannot replace '+$name+'. Close other game clients and run patcher.bat again.') } }; if ($env:DAYDREAM_PATCH_MODE -ne '--no-restart') { Start-Process -FilePath (Join-Path $root 'aLogin.exe') -WorkingDirectory $root }; exit 0 } catch { $_ | Out-String | Set-Content -LiteralPath (Join-Path $env:DAYDREAM_PATCH_ROOT 'patcher-error.log'); exit 1 }"
exit /b %errorlevel%
