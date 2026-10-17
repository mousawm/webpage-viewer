@echo off
rem Installs Web Page Viewer for PowerPoint on this Windows user account.
rem The manifest is registered in the registry instead of a shared folder, so a
rem presentation does not depend on where the manifest lives on each device.
setlocal
set "ID=7c1f0b2e-5d3a-4a8e-9b61-2f4d8e6a9c10"
set "DIR=%LOCALAPPDATA%\WebPageViewer"
set "SRC=https://mousawm.github.io/webpage-viewer/manifest.xml"
if not exist "%DIR%" mkdir "%DIR%"

if exist "%~dp0manifest.xml" (
  copy /y "%~dp0manifest.xml" "%DIR%\manifest.xml" >nul
) else (
  curl -fsSL -o "%DIR%\manifest.xml" "%SRC%"
  if errorlevel 1 (
    echo Could not download the manifest. Put manifest.xml next to this file and run it again.
    pause
    exit /b 1
  )
)

reg add "HKCU\Software\Microsoft\Office\16.0\WEF\Developer" /v "%ID%" /t REG_SZ /d "%DIR%\manifest.xml" /f >nul
if errorlevel 1 (
  echo Could not register the add-in.
  pause
  exit /b 1
)

echo Web Page Viewer is installed.
echo Restart PowerPoint, then use Insert - My Add-ins - Developer Add-ins - Web Page Viewer.
pause
