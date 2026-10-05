"""Check the generated static site's SEO contract before deployment (stdlib only)."""
import json
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import urlparse
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1] / 'build' / 'jaspr'
ORIGIN = 'https://quiethanks.impintooprajapati.in'


class Page(HTMLParser):
    def __init__(self, path):
        super().__init__()
        self.tags = []
        self.schemas = []
        self.in_schema = False
        self.feed(path.read_text())

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        self.tags.append((tag, attrs))
        if tag == 'script' and attrs.get('type') == 'application/ld+json':
            self.in_schema = True

    def handle_endtag(self, tag):
        if tag == 'script':
            self.in_schema = False

    def handle_data(self, data):
        if self.in_schema:
            self.schemas.append(json.loads(data))

    def find(self, tag, **attrs):
        return [a for t, a in self.tags if t == tag and all(a.get(k) == v for k, v in attrs.items())]


def check_page(filename, canonical):
    page = Page(ROOT / filename)
    assert page.find('html', lang='en'), f'{filename}: missing language'
    assert len(page.find('h1')) == 1, f'{filename}: expected one h1'
    assert len(page.find('main')) == 1, f'{filename}: expected one main landmark'
    assert len(page.find('title')) == 1, f'{filename}: expected one title'
    assert len(page.find('meta', name='viewport')) == 1, f'{filename}: duplicate viewport'
    assert len(page.find('meta', name='description')) == 1
    canonicals = page.find('link', rel='canonical')
    assert len(canonicals) == 1 and canonicals[0]['href'] == canonical
    assert page.find('meta', property='og:url')[0]['content'] == canonical
    assert not page.find('meta', name='og:title'), 'OG must use property, not name'
    for attr, value in [('property', 'og:image'), ('name', 'twitter:image')]:
        url = page.find('meta', **{attr: value})[0]['content']
        assert url.startswith(ORIGIN + '/'), f'{filename}: non-production share URL'
        assert (ROOT / urlparse(url).path.lstrip('/')).is_file()
    assert 'noindex' not in page.find('meta', name='robots')[0]['content']
    for image in page.find('img'):
        assert 'alt' in image, f'{filename}: missing image alternative'
        assert (ROOT / image['src'].lstrip('/')).is_file(), image['src']
    for link in page.find('a'):
        href = link.get('href', '')
        if href.startswith('#'):
            assert not href[1:] or any(a.get('id') == href[1:] for _, a in page.tags), href
    print(f'PASS {filename}: metadata, canonical, landmarks, images, and anchors')
    return page


home = check_page('index.html', ORIGIN + '/')
check_page('privacy.html', ORIGIN + '/privacy')
assert len(home.find('details')) == 5, 'FAQ must be present in static HTML'
assert len(home.schemas) == 1
assert {node['@type'] for node in home.schemas[0]['@graph']} == {'WebSite', 'WebPage', 'SoftwareApplication'}
app = next(node for node in home.schemas[0]['@graph'] if node['@type'] == 'SoftwareApplication')
assert app['operatingSystem'] == 'Android'
assert app['downloadUrl'].startswith('https://play.google.com/store/apps/details?id=')
assert 'aggregateRating' not in app and 'offers' not in app, 'Do not invent ratings or prices'
urls = {node.text for node in ET.parse(ROOT / 'sitemap.xml').iter('{http://www.sitemaps.org/schemas/sitemap/0.9}loc')}
assert urls == {ORIGIN + '/', ORIGIN + '/privacy'}
assert f'Sitemap: {ORIGIN}/sitemap.xml' in (ROOT / 'robots.txt').read_text()
assert 'Disallow: /' not in (ROOT / 'robots.txt').read_text()
print('PASS structured data, static FAQ content, sitemap, and robots.txt')

missing = Page(ROOT / '404.html')
assert missing.find('meta', name='robots')[0]['content'] == 'noindex, follow'
print('PASS dedicated 404 page prevents Cloudflare SPA fallback for missing URLs')
