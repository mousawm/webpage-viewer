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

To change the address, hover over the box in edit view and click ⚙. The button is hidden during the slide show.

## Good to know
- Only `https://` pages work. Some sites (Google, Microsoft sign-in, banks) don't allow embedding and appear blank.
- The address is saved inside your .pptx, so don't put passwords or tokens in it.
- Boxes showing the same site usually share one login, but some sites block this.

## About
The add-in is a single static page ([index.html](index.html)) with no server and no tracking.
It stores only the address you enter, inside your presentation file.
