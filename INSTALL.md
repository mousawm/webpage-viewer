# Install "Web Page Viewer" for PowerPoint

Download the manifest: https://mousawm.github.io/webpage-viewer/manifest.xml
(right-click → Save link as… → keep the name `manifest.xml`).

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
