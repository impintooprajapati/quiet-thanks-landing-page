import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/strings.dart';

class CtaSection extends StatelessComponent {
  const CtaSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'section cta-section', [
      div(classes: 'container', [
        div(classes: 'cta-box', [
          div(classes: 'cta-copy', [
            span(classes: 'section-tag', [
              Component.text('YOUR NEXT QUIET MOMENT'),
            ]),
            h2(classes: 'cta-title', [
              Component.text(AppStrings.finalCtaHeading),
            ]),
            p(classes: 'cta-text', [Component.text(AppStrings.finalCtaText)]),
          ]),
          div(classes: 'cta-download', [
            img(
              src: 'images/logo.png',
              alt: '',
              attributes: {'width': '64', 'height': '64'},
              classes: 'cta-app-icon',
            ),
            span(classes: 'cta-app-name', [Component.text(AppStrings.appName)]),
            span(classes: 'cta-platform', [
              Component.text('Your private journal for Android'),
            ]),
            a(
              href: AppStrings.playStoreUrl,
              target: Target.blank,
              attributes: {'rel': 'noopener noreferrer'},
              classes: 'play-badge-link',
              [
                RawText(
                  '''<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor"><path d="M3.609 1.814L13.793 12 3.61 22.186a2.38 2.38 0 0 1-.61-1.636V3.45c0-.623.228-1.205.609-1.636zm11.603 11.604l2.257-2.257-11.83-6.83 9.573 9.087zm0-2.836L5.64 1.495l11.83 6.83-2.258 2.257zm1.414 1.418l3.65 2.107a1.69 1.69 0 0 0 1.724 0c.55-.318.55-1.12 0-1.437l-3.65-2.108-1.724 1.438z"/></svg>''',
                ),
                span([Component.text(AppStrings.ctaGetQuietThanks)]),
              ],
            ),
          ]),
        ]),
      ]),
    ]);
  }
}
