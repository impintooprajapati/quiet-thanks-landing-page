import 'dart:convert';

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/strings.dart';

// Render the preview data once; the small browser script handles selection.
class ScreenshotGallery extends StatelessComponent {
  const ScreenshotGallery({super.key});

  String _getTabIcon(String id) {
    switch (id) {
      case 'daily':
        return '''<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"></path></svg>''';
      case 'mood':
        return '''<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><path d="M8 14s1.5 2 4 2 4-2 4-2"></path><line x1="9" y1="9" x2="9.01" y2="9"></line><line x1="15" y1="9" x2="15.01" y2="9"></line></svg>''';
      case 'calendar':
        return '''<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>''';
      case 'insights':
        return '''<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline></svg>''';
      case 'privacy':
        return '''<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>''';
      default:
        return '''<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle></svg>''';
    }
  }

  @override
  Component build(BuildContext context) {
    final active = AppStrings.screenshots[0];
    final bullets = (active['bullets'] as List<dynamic>?) ?? [];

    return section(
      id: 'screenshots',
      classes: 'section gallery-section',
      attributes: {'data-screens': jsonEncode(AppStrings.screenshots)},
      [
        div(classes: 'container', [
          // Header
          div(classes: 'section-header', [
            span(classes: 'section-tag', [
              Component.text(AppStrings.screenshotsTag),
            ]),
            h2(classes: 'section-title', [
              Component.text(AppStrings.screenshotsHeading),
            ]),
            p(classes: 'section-subtitle', [
              Component.text(
                'Experience the calm, private space where your thoughts and gratitude live.',
              ),
            ]),
          ]),

          // Interactive Category Filter Tabs
          div(
            classes: 'gallery-tabs',
            AppStrings.screenshots.asMap().entries.map((entry) {
              final idx = entry.key;
              final item = entry.value;
              final isSelected = idx == 0;
              return button(
                type: ButtonType.button,
                classes: 'gallery-tab-btn ${isSelected ? "active" : ""}',
                attributes: {
                  'aria-pressed': isSelected.toString(),
                  'aria-controls': 'preview-content',
                },
                [
                  RawText(_getTabIcon(item['id'] as String? ?? '')),
                  span([Component.text(item['title'] as String)]),
                ],
              );
            }).toList(),
          ),

          // Interactive Feature Spotlight Stage
          div(classes: 'spotlight-stage', [
            // Left: Narrative & Key Bullets
            div(
              id: 'preview-content',
              classes: 'spotlight-content',
              attributes: {'aria-live': 'polite', 'aria-atomic': 'true'},
              [
                div(classes: 'spotlight-badge', [
                  div(classes: 'badge-dot', []),
                  span([
                    Component.text(active['tag'] as String? ?? 'App Feature'),
                  ]),
                ]),
                h3(classes: 'spotlight-title', [
                  Component.text(active['title'] as String),
                ]),
                p(classes: 'spotlight-headline', [
                  Component.text(active['headline'] as String),
                ]),
                p(classes: 'spotlight-desc', [
                  Component.text(active['description'] as String),
                ]),

                // Bullet points
                div(
                  classes: 'spotlight-bullets',
                  bullets.map((bullet) {
                    return div(classes: 'spotlight-bullet-item', [
                      div(classes: 'spotlight-bullet-icon', [
                        RawText(
                          '''<svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>''',
                        ),
                      ]),
                      span(classes: 'spotlight-bullet-text', [
                        Component.text(bullet as String),
                      ]),
                    ]);
                  }).toList(),
                ),

                // CTA & Nav buttons
                div(classes: 'spotlight-actions', [
                  a(
                    href: AppStrings.playStoreUrl,
                    target: Target.blank,
                    attributes: {'rel': 'noopener noreferrer'},
                    classes: 'btn-primary spotlight-cta-btn',
                    [
                      span([Component.text('Explore in App')]),
                      RawText(
                        '''<svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>''',
                      ),
                    ],
                  ),
                  div(classes: 'spotlight-nav-controls', [
                    button(
                      type: ButtonType.button,
                      classes: 'spotlight-nav-arrow',
                      attributes: {'aria-label': 'Previous app screen'},
                      [
                        RawText(
                          '''<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"></polyline></svg>''',
                        ),
                      ],
                    ),
                    span(classes: 'spotlight-step-counter', [
                      Component.text('01 / 0${AppStrings.screenshots.length}'),
                    ]),
                    button(
                      type: ButtonType.button,
                      classes: 'spotlight-nav-arrow',
                      attributes: {'aria-label': 'Next app screen'},
                      [
                        RawText(
                          '''<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>''',
                        ),
                      ],
                    ),
                  ]),
                ]),
              ],
            ),

            // Right: Large Flagship Smartphone Mockup
            div(classes: 'spotlight-mockup-col', [
              div(classes: 'mockup-glow spotlight-glow', []),
              div(classes: 'phone-frame spotlight-phone', [
                div(classes: 'phone-button button-left-vol-up', []),
                div(classes: 'phone-button button-left-vol-down', []),
                div(classes: 'phone-button button-right-power', []),
                div(classes: 'phone-speaker-slit', []),
                div(classes: 'phone-screen-container', [
                  div(classes: 'phone-glass-glare', []),
                  img(
                    src: active['image'] as String,
                    alt: 'Quiet Thanks - ${active['title']}',
                    loading: MediaLoading.lazy,
                    attributes: {
                      'width': '540',
                      'height': '1212',
                      'decoding': 'async',
                    },
                    classes: 'phone-screen-img',
                  ),
                ]),
              ]),
            ]),
          ]),
        ]),
      ],
    );
  }
}
