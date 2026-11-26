@echo off
rem Starts the iPad mirror + pen toolbar without installing
start "" powershell.exe -NoProfile -STA -ExecutionPolicy Bypass -WindowStyle Hidden -File "%~dp0Launch.ps1"
