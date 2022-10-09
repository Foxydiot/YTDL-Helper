::====================================================================================
:: Version 2.0
:: Changes:
:: Added curl script to download latest YT-DL if it is not found'
:: Added curl script to download latest FFMPEG if it is not found'
:: Added empty link detection
:: ' requires Windows 10 or newer to work
::====================================================================================
@echo off
title YTDL Helper Script
if exist youtube-dl.exe goto url
if not exist youtube-dl.exe goto nodl

:url
cls
echo.
echo ================================================
echo.
echo. Please enter the Youtube or Soundcloud link
echo.
echo ================================================
set /p url=Input: 
if "%url%" == "" (goto nolink) else (goto ffcheck)

:nodl
cls
echo.
echo ================================================
echo.
echo. The Youtube-DL executable could not be found
echo.
echo ================================================
echo Downloading latest release from https://youtube-dl.org/downloads/latest/youtube-dl.exe
echo.
echo Log:
curl --output youtube-dl.exe -L https://youtube-dl.org/downloads/latest/youtube-dl.exe
timeout 1
goto url

:ffcheck
if exist "%~dp0\ffmpeg\bin\ffmpeg.exe" goto dld
if not exist "%~dp0\ffmpeg\bin\ffmpeg.exe" goto noffmpeg

:noffmpeg
cls
echo.
echo ================================================
echo.
echo. The FFMPEG files could not be found
echo.
echo ================================================
echo Downloading latest release from https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip
echo.
echo Log:
curl --output ffmpeg.zip -L https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip
timeout 1
tar -xf "ffmpeg.zip"
timeout 2 > NUL
powershell.exe -Command Move-Item "ffmpeg*" "ffmpeg"
timeout 2 > NUL
del "ffmpeg\ffmpeg.zip"
timeout 1 > NUL
goto dld

:nolink
cls
echo. ERROR: No link was entered
echo.
echo Press any key to exit...
pause > nul
exit

:dld
cls
echo.
echo ================================================
echo.
echo. Starting download on "%url%"
echo.
echo ================================================
echo Log: 
youtube-dl.exe --ffmpeg-location "%~dp0\ffmpeg\bin" -x --audio-format mp3 --audio-quality 0 %url%
echo.
echo ================================================
echo.
echo Download Complete
echo Downloaded file(s) can be found in "%~dp0"
echo.
choice /M "Would you like to download another file? "
if /I "%errorlevel%" == "2" exit
if /I "%errorlevel%" == "1" goto :url
echo Invalid input...
pause