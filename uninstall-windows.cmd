@echo off
rem Removes Web Page Viewer installed by install-windows.cmd.
reg delete "HKCU\Software\Microsoft\Office\16.0\WEF\Developer" /v "7c1f0b2e-5d3a-4a8e-9b61-2f4d8e6a9c10" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Office\15.0\WEF\Developer" /v "7c1f0b2e-5d3a-4a8e-9b61-2f4d8e6a9c10" /f >nul 2>&1
if exist "%LOCALAPPDATA%\WebPageViewer" rmdir /s /q "%LOCALAPPDATA%\WebPageViewer"
echo Web Page Viewer is removed. Restart PowerPoint.
pause
