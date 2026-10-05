import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/strings.dart';

class ProblemSection extends StatelessComponent {
  const ProblemSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'intro', classes: 'problem-section', [
      div(classes: 'container', [
        div(classes: 'problem-card', [
          // Zen leaf icon
          div(classes: 'problem-icon-wrapper', [
            RawText(
              '''<svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M11 20A7 7 0 0 1 9.8 6.1C15.5 5 17 4.48 19 2c1 2 2 4.18 2 8 0 5.5-4.78 10-10 10Z"></path><path d="M2 21c0-3 1.85-5.36 5.08-6C9.5 14.52 12 13 13 12"></path></svg>''',
            ),
          ]),
          h2(classes: 'problem-heading', [
            Component.text(AppStrings.problemHeading),
          ]),
          p(classes: 'problem-text', [Component.text(AppStrings.problemText)]),
        ]),
      ]),
    ]);
  }
}
