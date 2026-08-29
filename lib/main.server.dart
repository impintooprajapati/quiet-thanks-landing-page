library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'constants/strings.dart';
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  runApp(Document(
    title: '${AppStrings.appName} — ${AppStrings.tagline}',
    meta: {
      'description': AppStrings.heroSubtitle,
      'keywords':
          'gratitude journal, private journal, offline diary, mental wellness, habit tracker, mood tracking, quiet thanks',
      'author': AppStrings.authorName,
      'viewport': 'width=device-width, initial-scale=1.0',
      'theme-color': '#09120D',
      'og:title': '${AppStrings.appName} — Private Daily Gratitude Journal',
      'og:description':
          'Focus on the good. One quiet moment at a time. 100% offline, encrypted, and distraction-free.',
      'og:image': 'images/logo.png',
      'og:type': 'website',
      'twitter:card': 'summary_large_image',
      'twitter:title': '${AppStrings.appName} — Private Daily Gratitude Journal',
      'twitter:description': AppStrings.tagline,
      'twitter:image': 'images/logo.png',
    },
    head: [
      link(rel: 'icon', href: 'favicon.png', type: 'image/png'),
      link(rel: 'apple-touch-icon', href: 'images/logo.png'),
      link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
      link(
        rel: 'preconnect',
        href: 'https://fonts.gstatic.com',
        attributes: {'crossorigin': 'anonymous'},
      ),
      link(
        rel: 'stylesheet',
        href:
            'https://fonts.googleapis.com/css2?family=Newsreader:ital,opsz,wght@1,6..72,400;1,6..72,500&family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap',
      ),
      link(rel: 'stylesheet', href: 'styles.css'),
      script(src: 'interactions.js', attributes: {'defer': 'true'}),
    ],
    body: const App(),
  ));
}
