import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/strings.dart';

class FeaturesSection extends StatelessComponent {
  const FeaturesSection({super.key});

  String _getFeatureSvg(String icon) {
    switch (icon) {
      case 'gratitude':
        return '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"></path></svg>''';
      case 'camera':
        return '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><circle cx="8.5" cy="8.5" r="1.5"></circle><polyline points="21 15 16 10 5 21"></polyline></svg>''';
      case 'mood':
        return '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><path d="M8 14s1.5 2 4 2 4-2 4-2"></path><line x1="9" y1="9" x2="9.01" y2="9"></line><line x1="15" y1="9" x2="15.01" y2="9"></line></svg>''';
      case 'mic':
        return '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 1a3 3 0 0 0-3 3v8a3 3 0 0 0 6 0V4a3 3 0 0 0-3-3z"></path><path d="M19 10v2a7 7 0 0 1-14 0v-2"></path><line x1="12" y1="19" x2="12" y2="23"></line><line x1="8" y1="23" x2="16" y2="23"></line></svg>''';
      case 'calendar':
        return '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>''';
      case 'insights':
        return '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>''';
      default:
        return '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>''';
    }
  }

  @override
  Component build(BuildContext context) {
    return section(id: 'features', classes: 'section features-section', [
      div(classes: 'container', [
        // Section Header
        div(classes: 'section-header features-header', [
          span(classes: 'section-tag', [
            Component.text(AppStrings.featuresTag),
          ]),
          h2(classes: 'section-title', [
            Component.text(AppStrings.featuresHeading),
          ]),
          p(classes: 'section-subtitle', [
            Component.text(
              'A few thoughtful tools to help you notice, remember, and reflect.',
            ),
          ]),
        ]),

        // Features Grid (3x2)
        div(
          classes: 'features-grid',
          [0, 2, 1, 3, 4, 5].asMap().entries.map((entry) {
            final item = AppStrings.featuresList[entry.value];
            return div(
              classes:
                  'feature-card ${entry.key < 2 ? 'feature-card-lead' : ''}',
              [
                span(
                  classes: 'feature-number',
                  attributes: {'aria-hidden': 'true'},
                  [Component.text('0${entry.key + 1}')],
                ),
                div(classes: 'feature-icon-box', [
                  RawText(_getFeatureSvg(item['icon'] ?? '')),
                ]),
                h3(classes: 'feature-card-title', [
                  Component.text(item['title']!),
                ]),
                p(classes: 'feature-card-desc', [
                  Component.text(item['desc']!),
                ]),
                if (entry.key == 0)
                  div(classes: 'journal-example', [
                    div(classes: 'example-caption', [
                      Component.text('A DAY, IN LITTLE MOMENTS'),
                      span([Component.text('Example')]),
                    ]),
                    for (final moment in [
                      'A slow morning.',
                      'A kind conversation.',
                      'A little time outside.',
                    ])
                      div(classes: 'example-entry', [
                        span(
                          classes: 'example-entry-dot',
                          attributes: {'aria-hidden': 'true'},
                          [],
                        ),
                        Component.text(moment),
                        span(
                          classes: 'example-entry-mark',
                          attributes: {'aria-hidden': 'true'},
                          [Component.text('✦')],
                        ),
                      ]),
                  ]),
                if (entry.key == 1)
                  div(classes: 'mood-example', [
                    span(classes: 'example-caption', [
                      Component.text('A GENTLE CHECK-IN'),
                    ]),
                    div(
                      classes: 'mood-faces',
                      attributes: {'aria-hidden': 'true'},
                      [
                        for (final face in ['☀', '☺', '◡', '☁', '☂'])
                          span([Component.text(face)]),
                      ],
                    ),
                    p([Component.text('A little room for every feeling.')]),
                  ]),
              ],
            );
          }).toList(),
        ),
      ]),
    ]);
  }
}
