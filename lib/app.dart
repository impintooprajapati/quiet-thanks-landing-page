import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/cta_section.dart';
import 'components/desktop_section.dart';
import 'components/features_section.dart';
import 'components/footer.dart';
import 'components/faq_section.dart';
import 'components/hero_section.dart';
import 'components/how_it_works_section.dart';
import 'components/navbar.dart';
import 'components/privacy_section.dart';
import 'components/problem_section.dart';
import 'components/screenshot_gallery.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'site-wrapper', [
      a(href: '#main-content', classes: 'skip-link', [
        Component.text('Skip to content'),
      ]),
      const Navbar(),
      main_(
        id: 'main-content',
        attributes: {'tabindex': '-1'},
        [
          const HeroSection(),
          const ProblemSection(),
          const FeaturesSection(),
          const HowItWorksSection(),
          const ScreenshotGallery(),
          const PrivacySection(),
          const DesktopSection(),
          const FaqSection(),
          const CtaSection(),
        ],
      ),
      const Footer(),
    ]);
  }
}
