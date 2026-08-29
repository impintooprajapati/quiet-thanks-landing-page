import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/strings.dart';

class Navbar extends StatefulComponent {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _isMenuOpen = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  void _closeMenu() {
    if (_isMenuOpen) {
      setState(() {
        _isMenuOpen = false;
      });
    }
  }

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
          span([text(AppStrings.appName)]),
        ]),

        // Desktop nav links
        nav(classes: 'nav-links-desktop', [
          a(href: '#features', classes: 'nav-link', [text(AppStrings.navFeatures)]),
          a(href: '#privacy', classes: 'nav-link', [text(AppStrings.navPrivacy)]),
          a(href: '#how-it-works', classes: 'nav-link', [text(AppStrings.navHowItWorks)]),
          a(href: '#screenshots', classes: 'nav-link', [text(AppStrings.navScreenshots)]),
          a(
            href: AppStrings.playStoreUrl,
            target: Target.blank,
            classes: 'btn-primary nav-cta-btn',
            [
              span([text(AppStrings.navGetApp)]),
              // Play store small arrow icon
              raw('''<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="7" y1="17" x2="17" y2="7"></line><polyline points="7 7 17 7 17 17"></polyline></svg>'''),
            ],
          ),
        ]),

        // Mobile Hamburger button
        button(
          type: ButtonType.button,
          classes: 'mobile-menu-btn',
          events: {'click': (_) => _toggleMenu()},
          [
            if (!_isMenuOpen)
              raw('''<svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>''')
            else
              raw('''<svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>'''),
          ],
        ),
      ]),

      // Mobile Drawer Menu
      div(
        classes: 'mobile-drawer ${_isMenuOpen ? "open" : ""}',
        [
          a(
            href: '#features',
            classes: 'nav-link',
            events: {'click': (_) => _closeMenu()},
            [text(AppStrings.navFeatures)],
          ),
          a(
            href: '#privacy',
            classes: 'nav-link',
            events: {'click': (_) => _closeMenu()},
            [text(AppStrings.navPrivacy)],
          ),
          a(
            href: '#how-it-works',
            classes: 'nav-link',
            events: {'click': (_) => _closeMenu()},
            [text(AppStrings.navHowItWorks)],
          ),
          a(
            href: '#screenshots',
            classes: 'nav-link',
            events: {'click': (_) => _closeMenu()},
            [text(AppStrings.navScreenshots)],
          ),
          a(
            href: AppStrings.playStoreUrl,
            target: Target.blank,
            classes: 'btn-primary',
            events: {'click': (_) => _closeMenu()},
            [
              span([text(AppStrings.ctaGetQuietThanks)]),
              raw('''<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="7" y1="17" x2="17" y2="7"></line><polyline points="7 7 17 7 17 17"></polyline></svg>'''),
            ],
          ),
        ],
      ),
    ]);
  }
}
