# Install "Web Page Viewer" for PowerPoint

Download the manifest: https://mousawm.github.io/webpage-viewer/manifest.xml
(right-click → Save link as… → keep the name `manifest.xml`).

## Windows: one-click install (recommended)
1. Download [install-windows.cmd](https://mousawm.github.io/webpage-viewer/install-windows.cmd) and double-click it.
   No admin rights needed.
2. Restart PowerPoint.
3. Insert → My Add-ins → Developer Add-ins → Web Page Viewer.

Do this once on each device. It registers the add-in for your Windows account, so a
presentation made on one device opens on another without a shared folder.
To remove it, run [uninstall-windows.cmd](https://mousawm.github.io/webpage-viewer/uninstall-windows.cmd).

If Windows blocks the file, open **Command Prompt** and paste this instead (one line):

```
mkdir "%LOCALAPPDATA%\WebPageViewer" & curl -fsSL -o "%LOCALAPPDATA%\WebPageViewer\manifest.xml" https://mousawm.github.io/webpage-viewer/manifest.xml && reg add "HKCU\Software\Microsoft\Office\16.0\WEF\Developer" /v 7c1f0b2e-5d3a-4a8e-9b61-2f4d8e6a9c10 /t REG_SZ /d "%LOCALAPPDATA%\WebPageViewer\manifest.xml" /f
```

For Office 2013, run it again with `16.0` changed to `15.0`.

Works with PowerPoint 2013, 2016, 2019, 2021 and Microsoft 365. Older Office versions show
add-ins using Internet Explorer 11, so modern websites may not display correctly inside
the box there even though the add-in itself runs.

Slides inserted from a shared folder keep pointing to that folder. Delete those boxes
and insert the add-in again once after installing this way.

## A. Microsoft 365 admin (everyone gets it)
Admin center → Settings → Integrated apps → Upload custom apps → Office Add-in → upload manifest.xml → assign users.
Users find it under Insert → My Add-ins → Admin Managed (can take up to 24 h).

## B. Just you, PowerPoint on the web
Insert → Add-ins → My Add-ins → Manage My Add-ins → Upload My Add-in → choose manifest.xml.

## C. PowerPoint desktop (Windows), shared folder
1. Put manifest.xml in a network-shared folder, e.g. \server\addins.
2. File → Options → Trust Center → Trust Center Settings → Trusted Add-in Catalogs.
3. Paste the folder path → Add catalog → tick "Show in Menu" → OK → restart PowerPoint.
4. Insert → My Add-ins → SHARED FOLDER → Web Page Viewer → Add.

## Using it
Insert → My Add-ins → Web Page Viewer → type an https:// address → Show page.
Start the slide show (F5): the page stays live and clickable.
Hover the box in edit view and click ⚙ to change the address (hidden in the slide show).

## Good to know
- https:// only. Some sites (Google, Microsoft sign-in, banks) refuse to be embedded and show blank.
- The address is saved inside the .pptx — don't put passwords or tokens in it.
- Files from email/downloads open in Protected View: click Enable Editing first.
