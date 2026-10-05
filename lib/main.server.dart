library;

import 'dart:convert';

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'constants/seo.dart';
import 'constants/strings.dart';
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  final graph = {
    '@context': 'https://schema.org',
    '@graph': [
      {
        '@type': 'WebSite',
        '@id': '${SiteSeo.home}#website',
        'name': AppStrings.appName,
        'url': SiteSeo.home,
        'inLanguage': 'en',
      },
      {
        '@type': 'WebPage',
        '@id': '${SiteSeo.home}#webpage',
        'url': SiteSeo.home,
        'name': SiteSeo.title,
        'description': SiteSeo.description,
        'isPartOf': {'@id': '${SiteSeo.home}#website'},
        'about': {'@id': '${SiteSeo.home}#app'},
        'inLanguage': 'en',
      },
      {
        '@type': 'SoftwareApplication',
        '@id': '${SiteSeo.home}#app',
        'name': AppStrings.appName,
        'url': SiteSeo.home,
        'description': SiteSeo.description,
        'operatingSystem': 'Android',
        'applicationCategory': 'LifestyleApplication',
        'downloadUrl': AppStrings.playStoreUrl,
        'installUrl': AppStrings.playStoreUrl,
        'image': SiteSeo.image,
        'screenshot': '${SiteSeo.origin}/images/screen-daily.webp',
        'author': {
          '@type': 'Person',
          'name': AppStrings.authorName,
          'url': AppStrings.authorUrl,
        },
        // Only verified product facts: no invented ratings or pricing.
        'featureList': AppStrings.featuresList
            .map((item) => item['title'])
            .toList(),
      },
    ],
  };

  runApp(
    Document(
      lang: 'en',
      title: SiteSeo.title,
      meta: {
        'description': SiteSeo.description,
        'author': AppStrings.authorName,
        'theme-color': '#101a16',
        'robots': 'index, follow, max-image-preview:large',
        'twitter:card': 'summary_large_image',
        'twitter:title': SiteSeo.title,
        'twitter:description': SiteSeo.description,
        'twitter:image': SiteSeo.image,
        'twitter:image:alt': SiteSeo.imageAlt,
      },
      head: [
        link(rel: 'canonical', href: SiteSeo.home),
        for (final entry in {
          'og:title': SiteSeo.title,
          'og:description': SiteSeo.description,
          'og:url': SiteSeo.home,
          'og:site_name': AppStrings.appName,
          'og:type': 'website',
          'og:locale': 'en_US',
          'og:image': SiteSeo.image,
          'og:image:width': '1200',
          'og:image:height': '630',
          'og:image:type': 'image/jpeg',
          'og:image:alt': SiteSeo.imageAlt,
        }.entries)
          Component.element(
            tag: 'meta',
            attributes: {'property': entry.key, 'content': entry.value},
          ),
        Component.element(
          tag: 'script',
          attributes: {'type': 'application/ld+json'},
          children: [RawText(jsonEncode(graph))],
        ),
        link(rel: 'icon', href: 'favicon.png', type: 'image/png'),
        link(rel: 'apple-touch-icon', href: 'images/logo.png'),
        link(
          rel: 'preload',
          href: 'images/screen-daily.webp',
          attributes: {
            'as': 'image',
            'type': 'image/webp',
            'fetchpriority': 'high',
          },
        ),
        link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
        link(
          rel: 'preconnect',
          href: 'https://fonts.gstatic.com',
          attributes: {'crossorigin': 'anonymous'},
        ),
        link(
          rel: 'stylesheet',
          href:
              'https://fonts.googleapis.com/css2?family=Newsreader:ital,opsz,wght@1,6..72,400&family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap',
        ),
        link(rel: 'stylesheet', href: 'styles.css'),
        script(src: 'interactions.js', attributes: {'defer': 'true'}),
      ],
      body: const App(),
    ),
  );
}
