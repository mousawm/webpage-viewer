@echo off
rem Installs Web Page Viewer for PowerPoint on this Windows user account.
rem The manifest is registered in the registry instead of a shared folder, so a
rem presentation does not depend on where the manifest lives on each device.
rem Registers for Office 2016/2019/2021/365 (16.0) and Office 2013 (15.0).
setlocal
set "ID=7c1f0b2e-5d3a-4a8e-9b61-2f4d8e6a9c10"
set "DIR=%LOCALAPPDATA%\WebPageViewer"
set "SRC=https://mousawm.github.io/webpage-viewer/manifest.xml"
echo Installing Web Page Viewer...
if not exist "%DIR%" mkdir "%DIR%"

if exist "%~dp0manifest.xml" (
  echo Using manifest.xml next to this file.
  copy /y "%~dp0manifest.xml" "%DIR%\manifest.xml" >nul
) else (
  echo Downloading the manifest...
  curl -fsSL -o "%DIR%\manifest.xml" "%SRC%" 2>nul || powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol='Tls12'; Invoke-WebRequest -UseBasicParsing '%SRC%' -OutFile '%DIR%\manifest.xml'"
)
if not exist "%DIR%\manifest.xml" (
  echo Could not get the manifest. Put manifest.xml next to this file and run it again.
  pause
  exit /b 1
)

reg add "HKCU\Software\Microsoft\Office\16.0\WEF\Developer" /v "%ID%" /t REG_SZ /d "%DIR%\manifest.xml" /f >nul
if errorlevel 1 (
  echo Could not register the add-in.
  pause
  exit /b 1
)
reg add "HKCU\Software\Microsoft\Office\15.0\WEF\Developer" /v "%ID%" /t REG_SZ /d "%DIR%\manifest.xml" /f >nul

echo.
echo Web Page Viewer is installed.
echo Close all Office apps, open PowerPoint, then use
echo Insert - My Add-ins - MY ADD-INS tab - Developer Add-ins - Web Page Viewer.
pause
