@echo off
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0DayZModBuilder_WinForms.ps1"
if errorlevel 1 pause
