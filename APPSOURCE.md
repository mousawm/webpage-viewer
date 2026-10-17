# Publishing "Web Page Viewer" on Microsoft AppSource

Once approved, anyone can install the add-in from **Insert → Add-ins** in PowerPoint
(Windows, Mac, web). A .pptx that uses it then offers to load it on any device, with no
`manifest.xml` to share. The store is the only route that works across organisations.

This is a checklist, not a guarantee of approval. Microsoft's current requirements are at
<https://learn.microsoft.com/partner-center/marketplace-offers/submit-to-appsource-via-partner-center>
and the validation policies at
<https://learn.microsoft.com/legal/marketplace/certification-policies> (section 1120, Office add-ins).

## 1. Before you submit

- [ ] **Partner Center account.** Enrol in the Commercial Marketplace program at
      <https://partner.microsoft.com/dashboard/account/v3/enrollment/introduction/marketplace>.
      Free for individuals and companies; identity verification can take days.
- [ ] **Publisher name.** `ProviderName` in `manifest.xml` is currently "Web Page Viewer".
      It should match the publisher display name on your Partner Center account. Change it
      before submitting.
- [ ] **Keep the site online.** The add-in runs from <https://mousawm.github.io/webpage-viewer/>.
      Microsoft reviews the manifest, but users always load the live page, so the URLs in the
      manifest (`SourceLocation`, icons, `SupportUrl`) must keep working. Don't rename or
      move them after approval.
- [ ] **Merge this branch** so `privacy.html`, `terms.html` and `support.html` are live on
      GitHub Pages, and open each URL to confirm:
  - <https://mousawm.github.io/webpage-viewer/privacy.html>
  - <https://mousawm.github.io/webpage-viewer/terms.html>
  - <https://mousawm.github.io/webpage-viewer/support.html>
- [ ] **Validate the manifest** from a machine with internet access:
      `npx office-addin-manifest validate manifest.xml`
      (This could not be run from the development sandbox, so it is untested.)
- [ ] **Test in each host** you list: PowerPoint on Windows, Mac and the web. Check
      edit view, slide show (F5), saving and reopening the file, and a file sent to
      another account.
- [ ] **Screenshots**: 1 to 5 PNGs, 1366×768, of the real add-in in PowerPoint (setup
      screen; a page on a slide; the slide show). Take them yourself; the store rejects
      mock-ups.

## 2. Create the offer

Partner Center → Marketplace offers → New offer → **Office Add-in**.

| Field | Suggested value |
|---|---|
| Offer alias | Web Page Viewer |
| Manifest | Upload `manifest.xml` |
| Categories | Productivity |
| Search title | Web Page Viewer |
| Summary (≤100 chars) | Show a live, clickable web page inside a PowerPoint slide, including in slide show. |
| Privacy policy URL | https://mousawm.github.io/webpage-viewer/privacy.html |
| Terms of use URL | https://mousawm.github.io/webpage-viewer/terms.html |
| Support URL | https://mousawm.github.io/webpage-viewer/support.html |
| Pricing | Free |
| Markets | All (or as you choose) |

**Description** (adapt as needed):

> Web Page Viewer puts a live web page on a PowerPoint slide. Insert it, type an https
> address, and resize the box like any other object. When you press F5 the page stays live and
> clickable, so you can scroll, follow links and use menus during your talk instead of
> switching windows.
>
> • Works with dashboards, Power BI and Grafana embeds, YouTube embeds, wikis and your own pages
> • Page address is stored in the presentation file, so it travels with your .pptx
> • Clicker and keyboard slide control keep working in slide show
> • No account, no tracking, no server
>
> Note: some sites (for example Google sign-in and most banks) forbid being shown inside another
> page and will appear blank. Only https addresses are supported.

## 3. Notes for the certification reviewer

Paste this into the "Notes for certification" box:

> No sign-in or test account is needed. In PowerPoint, Insert → Add-ins → Web Page Viewer.
> Enter https://en.wikipedia.org and click Show page. The page appears in the box. Press F5
> to start the slide show; the page stays live and clickable. Hover the box in edit view and
> click the gear to change the address. The add-in stores only the address you type, inside
> the presentation. Sites that refuse embedding (e.g. google.com) appear blank by design;
> the setup screen says so.

## 4. Expect questions about

- **Showing arbitrary third-party sites.** The add-in intentionally loads whatever https page
  the user types in an iframe. Say plainly in the listing and notes that the user chooses the
  page, and that nothing is collected. If the review flags it, the likeliest fixes are
  clearer on-screen wording or blocking `http://` addresses (the code already prefers https).
- **Permissions.** The manifest requests `Restricted`, the lowest level; keep it that way.
- **Updates.** Changing `index.html` takes effect immediately for all users but must keep
  meeting the policies. Changes to the manifest need a new submission.
- **Review time.** Typically a few business days, longer on first submission.

## 5. After approval

Update `README.md` and `INSTALL.md` to point people at the store listing instead of
`manifest.xml`, and keep the manifest download as a fallback for organisations that
sideload.
