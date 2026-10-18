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

When the slide show starts, the add-in makes itself active, so your first click works in the page instead of only selecting the box. The clicker's next/previous buttons keep changing slides. While the add-in is active, keys that only PowerPoint understands (Esc to end the show, B/W for a black or white screen, a slide number + Enter) don't reach PowerPoint. Right-click the slide outside the box instead: PowerPoint's menu there has **End Show** and **Screen → Black Screen**. To turn this off, untick **Activate the page when the slide show starts** on the setup screen.

For typing in the page during the slide show, open the setup screen (hover the box in edit view and click ⚙) and tick **Keep keyboard on the page during the slide show**. While it is ticked, the clicker's next/previous buttons won't change slides. Untick it to get them back. Nothing extra is shown during the slide show.

Also handled: Space, Enter and N for next; Backspace and P for previous; Home and End for first and last slide.

Typing into a text box on the embedded page during the slide show needs that option ticked.

To change the address, hover over the box in edit view and click ⚙. The button is hidden during the slide show.

## Diagnostics
If the page looks blurry, press **D** (in edit view or during the slide show) or click **Show diagnostics** on the setup screen. It shows which browser engine PowerPoint is using and the pixel density it gives the add-in, which side has keyboard focus and the last key the add-in received. Press **D** again to hide it.

## Good to know
- Only `https://` pages work. Some sites (Google, Microsoft sign-in, banks) don't allow embedding and appear blank.
- The address is saved inside your .pptx, so don't put passwords or tokens in it.
- Boxes showing the same site usually share one login, but some sites block this.

## About
The add-in is a single static page ([index.html](index.html)) with no server and no tracking.
It stores only the address you enter, inside your presentation file.
