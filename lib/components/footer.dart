import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/strings.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'footer', [
      div(classes: 'container', [
        div(classes: 'footer-top', [
          // Brand info
          div(classes: 'footer-brand', [
            div(classes: 'footer-logo-row', [
              img(
                src: 'images/logo.png',
                alt: 'Quiet Thanks Logo',
                classes: 'brand-icon',
              ),
              span([Component.text(AppStrings.appName)]),
            ]),
            p(classes: 'footer-tagline', [Component.text(AppStrings.tagline)]),
          ]),

          // Links
          div(classes: 'footer-links', [
            a(href: '#desktop', classes: 'footer-link', [
              Component.text('Desktop · Soon'),
            ]),
            a(href: '#faq', classes: 'footer-link', [Component.text('FAQ')]),
            a(href: AppStrings.supportMailto, classes: 'footer-link', [
              Component.text('Contact'),
            ]),
            a(href: '#features', classes: 'footer-link', [
              Component.text(AppStrings.navFeatures),
            ]),
            a(href: AppStrings.privacyPolicyUrl, classes: 'footer-link', [
              Component.text(AppStrings.navPrivacy),
            ]),
            a(
              href: AppStrings.playStoreUrl,
              target: Target.blank,
              attributes: {'rel': 'noopener noreferrer'},
              classes: 'footer-link',
              [Component.text('Google Play')],
            ),
          ]),
        ]),

        // Bottom row
        div(classes: 'footer-bottom', [
          p([Component.text(AppStrings.copyright)]),
          p(classes: 'developer-tag', [
            Component.text('Crafted with intention by '),
            a(
              href: AppStrings.authorUrl,
              target: Target.blank,
              attributes: {'rel': 'noopener noreferrer'},
              [Component.text(AppStrings.authorName)],
            ),
          ]),
        ]),
      ]),
    ]);
  }
}
