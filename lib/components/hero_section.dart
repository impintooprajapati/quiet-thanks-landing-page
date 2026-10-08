import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/strings.dart';

class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'hero-section', [
      div(classes: 'container', [
        div(classes: 'hero-grid', [
          // Left Column: Copy & Actions
          div(classes: 'hero-copy', [
            // Privacy Badge
            div(classes: 'badge-container', [
              div(classes: 'privacy-badge', [
                div(classes: 'badge-dot', []),
                span([Component.text(AppStrings.heroBadge)]),
              ]),
            ]),

            p(classes: 'hero-eyebrow', [
              Component.text('YOUR PRIVATE GRATITUDE JOURNAL'),
            ]),

            // Main Heading
            h1(classes: 'hero-title', [
              span(classes: 'hero-title-highlight', [
                Component.text(AppStrings.heroTitleLine1),
              ]),
              span(classes: 'hero-title-sub', [
                span(classes: 'hero-title-line', [
                  Component.text('One quiet moment'),
                ]),
                Component.text(' '),
                span(classes: 'hero-title-line', [
                  Component.text('at a time.'),
                ]),
              ]),
            ]),

            // Subtitle
            p(classes: 'hero-subtitle', [
              Component.text(AppStrings.heroSubtitle),
            ]),

            // CTAs
            div(classes: 'hero-actions', [
              a(
                href: AppStrings.playStoreUrl,
                target: Target.blank,
                attributes: {'rel': 'noopener noreferrer'},
                classes: 'btn-primary',
                [
                  RawText(
                    '''<svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M3.609 1.814L13.793 12 3.61 22.186a2.38 2.38 0 0 1-.61-1.636V3.45c0-.623.228-1.205.609-1.636zm11.603 11.604l2.257-2.257-11.83-6.83 9.573 9.087zm0-2.836L5.64 1.495l11.83 6.83-2.258 2.257zm1.414 1.418l3.65 2.107a1.69 1.69 0 0 0 1.724 0c.55-.318.55-1.12 0-1.437l-3.65-2.108-1.724 1.438z"/></svg>''',
                  ),
                  span([Component.text(AppStrings.ctaGetQuietThanks)]),
                ],
              ),
              a(href: '#screenshots', classes: 'btn-secondary', [
                span([Component.text(AppStrings.ctaLearnMore)]),
                RawText(
                  '''<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"></line><polyline points="19 12 12 19 5 12"></polyline></svg>''',
                ),
              ]),
            ]),
            div(classes: 'hero-trust', [
              for (final label in ['Offline', 'No ads', 'No tracking'])
                span([
                  span(
                    attributes: {'aria-hidden': 'true'},
                    [Component.text('✓ ')],
                  ),
                  Component.text(label),
                ]),
            ]),
            p(classes: 'hero-note', [
              Component.text('Available now on Android. No account needed.'),
            ]),
            a(href: '#desktop', classes: 'hero-desktop-link', [
              span(classes: 'hero-desktop-chip', [Component.text('UP NEXT')]),
              Component.text('macOS, Windows & Linux'),
              span(attributes: {'aria-hidden': 'true'}, [Component.text(' ↗')]),
            ]),
          ]),

          // Right Column: Smartphone Mockup
          div(classes: 'mockup-wrapper', [
            div(classes: 'mockup-glow hero-glow', []),
            div(classes: 'hero-stage-label', [
              Component.text('A SPACE THAT’S ONLY YOURS'),
            ]),
            div(classes: 'hero-orbit', attributes: {'aria-hidden': 'true'}, []),
            div(classes: 'phone-frame hero-phone', [
              div(classes: 'phone-button button-left-vol-up', []),
              div(classes: 'phone-button button-left-vol-down', []),
              div(classes: 'phone-button button-right-power', []),
              div(classes: 'phone-speaker-slit', []),
              div(classes: 'phone-screen-container', [
                div(classes: 'phone-glass-glare', []),
                img(
                  src: 'images/screen-daily.webp',
                  attributes: {
                    'width': '540',
                    'height': '1212',
                    'fetchpriority': 'high',
                    'decoding': 'async',
                  },
                  alt:
                      'Daily gratitude entries in the Quiet Thanks Android app',
                  loading: MediaLoading.eager,
                  classes: 'phone-screen-img',
                ),
              ]),
            ]),
            div(classes: 'moment-note', [
              span(classes: 'moment-symbol', [Component.text('✦')]),
              div([
                span(classes: 'moment-label', [
                  Component.text('THE LITTLE THINGS ADD UP'),
                ]),
                p([Component.text('A moment worth keeping.')]),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }
}
