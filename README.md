# Web Page Viewer – PowerPoint add-in

Shows a live web page inside a slide, interactive during the slide show.

## 1. Host the `site` folder (once, by the person sharing)
Upload the contents of `site/` (index.html + assets/) to any **HTTPS** static host,
e.g. GitHub Pages, Netlify (drag & drop), Azure Static Web Apps, or your company web server.
No server code is needed.

## 2. Point the manifest at it
```
.\set-host.ps1 https://yourname.github.io/webpage-viewer
```
(or edit `manifest.xml` and replace every `https://YOUR-HOST.example.com`).
Open `<your address>/index.html` in a browser to check it loads (you'll see the URL prompt).

## 3. Install for people

**Microsoft 365 organisation (easiest, everyone gets it)**
Admin center → Settings → Integrated apps → Upload custom apps → Office Add-in → upload `manifest.xml`.

**Single user, shared folder (Windows)**
1. Put `manifest.xml` in a folder and share it (e.g. `C:\AddinCatalog`).
2. PowerPoint → File → Options → Trust Center → Trust Center Settings → Trusted Add-in Catalogs
   → add the folder path, tick "Show in Menu", OK, restart PowerPoint.
3. Insert → My Add-ins → SHARED FOLDER → Web Page Viewer → Add.

**PowerPoint on the web**
Insert → Add-ins → My Add-ins → Manage My Add-ins → Upload My Add-in → choose `manifest.xml`.

## Using it
Insert → My Add-ins → Web Page Viewer, type an https URL, **Show page**.
Hover the box and click ⚙ to change the address (hidden in the slide show).

## Notes
* Only `https://` pages. Sites that forbid embedding (X-Frame-Options / CSP) show blank.
* The address is saved inside the .pptx; don't put secrets in it.
* Logins are shared between boxes via the browser's cookies, subject to third-party-cookie rules.
