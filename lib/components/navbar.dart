import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/strings.dart';

// Static markup; interactions.js owns the mobile disclosure state.
class Navbar extends StatelessComponent {
  const Navbar({super.key});

  @override
  Component build(BuildContext context) {
    return header(classes: 'navbar-wrapper', [
      div(classes: 'container navbar-inner', [
        // Brand logo & title
        a(href: '#', classes: 'brand-link', [
          img(
            src: 'images/logo.png',
            alt: 'Quiet Thanks App Logo',
            classes: 'brand-icon',
          ),
          span([Component.text(AppStrings.appName)]),
        ]),

        // Desktop nav links
        nav(
          classes: 'nav-links-desktop',
          attributes: {'aria-label': 'Main navigation'},
          [
            a(href: '#features', classes: 'nav-link', [
              Component.text(AppStrings.navFeatures),
            ]),
            a(href: '#privacy', classes: 'nav-link', [
              Component.text(AppStrings.navPrivacy),
            ]),
            a(href: '#how-it-works', classes: 'nav-link', [
              Component.text(AppStrings.navHowItWorks),
            ]),
            a(href: '#screenshots', classes: 'nav-link', [
              Component.text(AppStrings.navScreenshots),
            ]),
            a(
              href: AppStrings.playStoreUrl,
              target: Target.blank,
              attributes: {'rel': 'noopener noreferrer'},
              classes: 'btn-primary nav-cta-btn',
              [
                span([Component.text(AppStrings.navGetApp)]),
                // Play store small arrow icon
                RawText(
                  '''<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="7" y1="17" x2="17" y2="7"></line><polyline points="7 7 17 7 17 17"></polyline></svg>''',
                ),
              ],
            ),
          ],
        ),

        // Mobile Hamburger button
        button(
          type: ButtonType.button,
          classes: 'mobile-menu-btn',
          attributes: {
            'aria-label': 'Open navigation',
            'aria-expanded': 'false',
            'aria-controls': 'mobile-navigation',
          },
          [
            RawText(
              '<span class="menu-line"></span><span class="menu-line"></span>',
            ),
          ],
        ),
      ]),

      // Mobile Drawer Menu
      nav(
        id: 'mobile-navigation',
        classes: 'mobile-drawer',
        attributes: {'aria-label': 'Mobile navigation', 'inert': ''},
        [
          a(href: '#features', classes: 'nav-link', [
            Component.text(AppStrings.navFeatures),
          ]),
          a(href: '#privacy', classes: 'nav-link', [
            Component.text(AppStrings.navPrivacy),
          ]),
          a(href: '#how-it-works', classes: 'nav-link', [
            Component.text(AppStrings.navHowItWorks),
          ]),
          a(href: '#screenshots', classes: 'nav-link', [
            Component.text(AppStrings.navScreenshots),
          ]),
          a(
            href: AppStrings.playStoreUrl,
            target: Target.blank,
            attributes: {'rel': 'noopener noreferrer'},
            classes: 'btn-primary',
            [
              span([Component.text(AppStrings.ctaGetQuietThanks)]),
              RawText(
                '''<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="7" y1="17" x2="17" y2="7"></line><polyline points="7 7 17 7 17 17"></polyline></svg>''',
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
