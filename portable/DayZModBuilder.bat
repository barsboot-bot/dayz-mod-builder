@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"

set "APP="
if exist "%~dp0app\index.html" set "APP=%~dp0app\index.html"
if exist "%~dp0index.html" set "APP=%~dp0index.html"
if exist "%~dp0..\index.html" set "APP=%~dp0..\index.html"

if not defined APP (
  echo [ERROR] index.html not found
  pause
  exit /b 1
)

echo Launching: %APP%

where msedge >nul 2>&1
if %errorlevel%==0 (
  for %%I in ("%APP%") do set "APPPATH=%%~fI"
  set "URI=file:///%APPPATH:\=/%%"
  start "" msedge --app="%URI%"
  exit /b 0
)

if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" (
  for %%I in ("%APP%") do set "APPPATH=%%~fI"
  set "URI=file:///%APPPATH:\=/%%"
  start "" "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" --app="%URI%"
  exit /b 0
)

if exist "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" (
  for %%I in ("%APP%") do set "APPPATH=%%~fI"
  set "URI=file:///%APPPATH:\=/%%"
  start "" "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" --app="%URI%"
  exit /b 0
)

where chrome >nul 2>&1
if %errorlevel%==0 (
  for %%I in ("%APP%") do set "APPPATH=%%~fI"
  set "URI=file:///%APPPATH:\=/%%"
  start "" chrome --app="%URI%"
  exit /b 0
)

start "" "%APP%"
