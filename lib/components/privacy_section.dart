import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/strings.dart';

class PrivacySection extends StatelessComponent {
  const PrivacySection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'privacy', classes: 'section privacy-section', [
      div(classes: 'container', [
        div(classes: 'privacy-container', [
          // Left side: Headings and Lock card
          div(classes: 'privacy-intro-box', [
            span(classes: 'section-tag', [text(AppStrings.privacyTag)]),
            h2(classes: 'privacy-heading', [text(AppStrings.privacyHeading)]),
            p(classes: 'privacy-subheading', [text(AppStrings.privacySubheading)]),
            p(classes: 'privacy-desc', [text(AppStrings.privacyDescription)]),

            // Highlight lock card
            div(classes: 'privacy-lock-card', [
              div(classes: 'privacy-lock-icon', [
                raw('''<svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>'''),
              ]),
              div([
                h4(classes: 'privacy-lock-title', [
                  text('Zero Cloud Vulnerability'),
                ]),
                p(classes: 'privacy-lock-desc', [
                  text('Your entries are stored locally with AES-encrypted storage.'),
                ]),
              ]),
            ]),

            // Link to dedicated privacy page
            a(
              href: AppStrings.privacyPolicyUrl,
              classes: 'privacy-policy-link',
              [
                span([text('Read Full Privacy Policy')]),
                raw('''<svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>'''),
              ],
            ),
          ]),

          // Right side: 8 Privacy Points Grid
          div(
            classes: 'privacy-grid',
            AppStrings.privacyPoints.map((point) {
              return div(classes: 'privacy-pill', [
                div(classes: 'privacy-check', [
                  raw('''<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>'''),
                ]),
                span(classes: 'privacy-pill-text', [text(point)]),
              ]);
            }).toList(),
          ),
        ]),
      ]),
    ]);
  }
}
