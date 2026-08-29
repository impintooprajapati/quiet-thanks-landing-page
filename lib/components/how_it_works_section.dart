import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/strings.dart';

class HowItWorksSection extends StatelessComponent {
  const HowItWorksSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'how-it-works', classes: 'section', [
      div(classes: 'container', [
        div(classes: 'section-header', [
          span(classes: 'section-tag', [text(AppStrings.howItWorksTag)]),
          h2(classes: 'section-title', [text(AppStrings.howItWorksHeading)]),
        ]),

        div(
          classes: 'how-it-works-steps',
          AppStrings.steps.map((step) {
            return div(classes: 'step-card', [
              span(classes: 'step-badge', [text(step['step']!)]),
              h3(classes: 'step-title', [text(step['title']!)]),
              p(classes: 'step-desc', [text(step['desc']!)]),
            ]);
          }).toList(),
        ),
      ]),
    ]);
  }
}
