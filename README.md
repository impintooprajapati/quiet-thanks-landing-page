# Quiet Thanks landing page

Static Jaspr website for the Quiet Thanks Android gratitude journal.
Production: https://quiethanks.impintooprajapati.in/

## Build and verify

```sh
dart pub get
jaspr build
dart analyze
python3 tool/check_site.py
python3 tool/preview.py
```

Open http://127.0.0.1:8090. The preview server supports the same `/privacy`
URL as Cloudflare Pages. Keep the preview on port 8090; Jaspr uses 8089
while generating its static HTML.

## SEO and assets

- Homepage title, description, production URLs, and social image: `lib/constants/seo.dart`.
- JSON-LD: `lib/main.server.dart`; use only factual app details, with no invented prices or ratings.
- Privacy page metadata: `web/privacy.html`.
- Crawl discovery: `web/robots.txt` and `web/sitemap.xml`. Cloudflare Pages serves `privacy.html` at `/privacy`.
- Social card: `web/images/social-preview.jpg` (1200 × 630). The editable source is
  `tool/social-preview.html`. To regenerate, temporarily copy it into the built site,
  open the local page at a 1200 × 630 viewport, and save a JPEG screenshot back to
  the asset path. Do not publish the temporary source page.
- WebP screenshots are resized to 540 × 1212 from the original PNGs, at quality 86.
  Preserve the originals when updating screenshots.
- FAQ content lives in `lib/constants/strings.dart` and renders without JavaScript.

After deployment, submit `https://quiethanks.impintooprajapati.in/sitemap.xml`
in Google Search Console and inspect the homepage. Local build checks do not
verify live indexing or guarantee search rankings or rich results.

Reference: [Google Search Central](https://developers.google.com/search/docs/appearance/structured-data/software-app)
and [Cloudflare route behavior](https://developers.cloudflare.com/pages/configuration/serving-pages/).
