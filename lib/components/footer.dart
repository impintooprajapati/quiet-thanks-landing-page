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
              span([text(AppStrings.appName)]),
            ]),
            p(classes: 'footer-tagline', [
              text(AppStrings.tagline),
            ]),
          ]),

          // Links
          div(classes: 'footer-links', [
            a(href: '#features', classes: 'footer-link', [text(AppStrings.navFeatures)]),
            a(
              href: AppStrings.privacyPolicyUrl,
              classes: 'footer-link',
              [text(AppStrings.navPrivacy)],
            ),
            a(
              href: AppStrings.playStoreUrl,
              target: Target.blank,
              classes: 'footer-link',
              [text('Google Play')],
            ),
          ]),
        ]),

        // Bottom row
        div(classes: 'footer-bottom', [
          p([text(AppStrings.copyright)]),
          p(classes: 'developer-tag', [
            text('Crafted with intention by '),
            a(
              href: AppStrings.authorUrl,
              target: Target.blank,
              [text(AppStrings.authorName)],
            ),
          ]),
        ]),
      ]),
    ]);
  }
}
