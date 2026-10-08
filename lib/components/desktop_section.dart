import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/strings.dart';

/// Desktop artwork is a concept, not an available release.
class DesktopSection extends StatelessComponent {
  const DesktopSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'desktop', classes: 'section desktop-section', [
      div(classes: 'container', [
        div(classes: 'desktop-card', [
          div(classes: 'desktop-intro', [
            span(classes: 'desktop-coming-badge', [
              span(
                classes: 'badge-dot',
                attributes: {'aria-hidden': 'true'},
                [],
              ),
              Component.text('THE NEXT CHAPTER · COMING SOON'),
            ]),
            h2(classes: 'desktop-title', [
              Component.text('A bigger home for'),
              span([Component.text('your quiet moments.')]),
            ]),
            p(classes: 'desktop-description', [
              Component.text(
                'A little pause between the tabs. A place for the good, right on your desktop. Quiet Thanks is coming to macOS, Windows, and Linux.',
              ),
            ]),
          ]),
          div(classes: 'desktop-concept', [
            div(
              classes: 'desktop-window',
              attributes: {
                'role': 'group',
                'aria-label':
                    'Illustrative desktop journal concept; final design may change',
              },
              [
                div(classes: 'desktop-window-bar', [
                  div(
                    classes: 'desktop-window-dots',
                    attributes: {'aria-hidden': 'true'},
                    [span([]), span([]), span([])],
                  ),
                  span([Component.text('Quiet Thanks')]),
                  span(classes: 'desktop-preview-label', [
                    Component.text('DESIGN CONCEPT'),
                  ]),
                ]),
                div(classes: 'desktop-window-body', [
                  div(
                    classes: 'desktop-concept-sidebar',
                    attributes: {'aria-hidden': 'true'},
                    [
                      div(classes: 'concept-brand', [
                        img(
                          src: 'images/logo.png',
                          alt: '',
                          attributes: {'width': '32', 'height': '32'},
                        ),
                        span([Component.text('Quiet Thanks')]),
                      ]),
                      span(classes: 'concept-sidebar-active', [
                        Component.text('◉  Today'),
                      ]),
                      span([Component.text('◷  Memories')]),
                      span([Component.text('✦  Reflections')]),
                      div(classes: 'concept-sidebar-bottom', [
                        Component.text('Small moments.\nMeaningful days.'),
                      ]),
                    ],
                  ),
                  div(classes: 'desktop-concept-journal', [
                    span(classes: 'concept-eyebrow', [
                      Component.text('YOUR DAILY PAUSE'),
                    ]),
                    h3([Component.text('What felt good today?')]),
                    p(classes: 'concept-subtitle', [
                      Component.text(
                        'It doesn’t have to be a big thing. Just something worth keeping.',
                      ),
                    ]),
                    div(classes: 'concept-journal-layout', [
                      div(classes: 'concept-entry-list', [
                        for (final moment in [
                          'Sunlight through the window.',
                          'A conversation that stayed with me.',
                          'Making a little time for myself.',
                        ])
                          div(classes: 'concept-note', [
                            span(
                              attributes: {'aria-hidden': 'true'},
                              [Component.text('✦')],
                            ),
                            Component.text(moment),
                          ]),
                      ]),
                      div(classes: 'concept-prompt', [
                        span(
                          attributes: {'aria-hidden': 'true'},
                          [Component.text('✧')],
                        ),
                        span(classes: 'concept-prompt-label', [
                          Component.text('A QUIET NUDGE'),
                        ]),
                        p([
                          Component.text(
                            'Sometimes the smallest moments leave the most light.',
                          ),
                        ]),
                      ]),
                    ]),
                    div(classes: 'concept-bottom', [
                      Component.text('A moment worth keeping.'),
                    ]),
                  ]),
                ]),
              ],
            ),
            p(classes: 'desktop-concept-caption', [
              Component.text(
                'A glimpse of what’s next. Concept preview — final design may change.',
              ),
            ]),
          ]),
          div(classes: 'desktop-release', [
            div(classes: 'desktop-platforms', [
              for (final platform in ['macOS', 'Windows', 'Linux'])
                div(classes: 'desktop-platform', [
                  div(
                    classes: 'desktop-platform-icon',
                    attributes: {'aria-hidden': 'true'},
                    [RawText(_icon(platform))],
                  ),
                  span(classes: 'desktop-platform-name', [
                    Component.text(platform),
                  ]),
                  span(classes: 'desktop-platform-status', [
                    Component.text('Coming soon'),
                  ]),
                ]),
            ]),
            div(classes: 'desktop-available', [
              span([Component.text('The good is already here on Android.')]),
              a(
                href: AppStrings.playStoreUrl,
                target: Target.blank,
                attributes: {'rel': 'noopener noreferrer'},
                classes: 'desktop-android-link',
                [
                  Component.text('Get it on Google Play'),
                  span(
                    attributes: {'aria-hidden': 'true'},
                    [Component.text(' ↗')],
                  ),
                ],
              ),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  String _icon(String platform) {
    if (platform == 'Windows') {
      return '<svg width="26" height="26" viewBox="0 0 24 24" fill="currentColor"><path d="M3 3h8v8H3zM13 3h8v8h-8zM3 13h8v8H3zM13 13h8v8h-8z"/></svg>';
    }
    if (platform == 'macOS') {
      return '<svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"><rect x="3" y="3" width="18" height="18" rx="4"/><path d="M13 3l-2 11h3v7M7 8v2m10-2v2M7 16c2 2 7 2 10 0"/></svg>';
    }
    return '<svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M8 10V7a4 4 0 018 0v3c0 3 3 4 3 7 0 3-3 4-7 4s-7-1-7-4c0-3 3-4 3-7Z"/><path d="M9 19l-4 2m10-2l4 2M10 11l2 2 2-2"/><circle cx="10" cy="8" r=".7" fill="currentColor"/><circle cx="14" cy="8" r=".7" fill="currentColor"/></svg>';
  }
}
