import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/cta_section.dart';
import 'components/features_section.dart';
import 'components/footer.dart';
import 'components/hero_section.dart';
import 'components/how_it_works_section.dart';
import 'components/navbar.dart';
import 'components/privacy_quote_section.dart';
import 'components/privacy_section.dart';
import 'components/problem_section.dart';
import 'components/screenshot_gallery.dart';

@client
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'site-wrapper', [
      const Navbar(),
      main_([
        const HeroSection(),
        const ProblemSection(),
        const FeaturesSection(),
        const PrivacySection(),
        const HowItWorksSection(),
        const ScreenshotGallery(),
        const PrivacyQuoteSection(),
        const CtaSection(),
      ]),
      const Footer(),
    ]);
  }
}
