# Web Page Viewer for PowerPoint

Show a live, clickable web page inside a slide. It keeps working during the slide show.

## Get it
1. Download the add-in file: [manifest.xml](https://mousawm.github.io/webpage-viewer/manifest.xml)
   (right-click → Save link as…).
2. Install it by following **[INSTALL.md](INSTALL.md)**. It takes about two minutes.

## Use it
1. In PowerPoint, go to **Insert → My Add-ins → Web Page Viewer**.
2. Type an `https://` address and click **Show page**.
3. Resize or move the box like any other object on the slide.
4. Press **F5** to start the slide show. The page stays live and clickable.

## Presentation pointers and clickers
During the slide show the clicker keeps control by default: the pointer's next/previous buttons (PageDown/PageUp, arrow keys) change slides from the first press. You can still scroll, click links and use dropdown menus in the page. After you click in the page, the add-in gives keyboard focus back to the slides after about 4 seconds, or immediately when the mouse leaves the page, so dropdowns have time to open and be used.

For typing or long menus, hover the box and click **Page keys: off** (top right) to keep the keyboard on the page. Click it again (**Page keys: on**) to hand the keys back to the slides.

Also handled: Space, Enter and N for next; Backspace and P for previous; Home and End for first and last slide.

Typing into a text box on the embedded page during the slide show needs **Page keys: on**.

To change the address, hover over the box in edit view and click ⚙. The button is hidden during the slide show.

## Diagnostics
If the page looks blurry, press **D** (in edit view or during the slide show) or click **Show diagnostics** on the setup screen. It shows which browser engine PowerPoint is using and the pixel density it gives the add-in. Press **D** again to hide it.

## Good to know
- Only `https://` pages work. Some sites (Google, Microsoft sign-in, banks) don't allow embedding and appear blank.
- The address is saved inside your .pptx, so don't put passwords or tokens in it.
- Boxes showing the same site usually share one login, but some sites block this.

## About
The add-in is a single static page ([index.html](index.html)) with no server and no tracking.
It stores only the address you enter, inside your presentation file.
