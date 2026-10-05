import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/strings.dart';

class FaqSection extends StatelessComponent {
  const FaqSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'faq', classes: 'section faq-section', [
      div(classes: 'container faq-layout', [
        div(classes: 'faq-intro', [
          span(classes: 'section-tag', [Component.text('A FEW QUIET ANSWERS')]),
          h2(classes: 'section-title', [Component.text('Before you begin.')]),
          p([Component.text('A little clarity for your first quiet moment.')]),
          a(href: AppStrings.supportMailto, classes: 'faq-contact', [
            Component.text('Have another question? Get in touch'),
            span(attributes: {'aria-hidden': 'true'}, [Component.text(' ↗')]),
          ]),
        ]),
        div(classes: 'faq-list', [
          for (final item in AppStrings.faqs)
            details(classes: 'faq-item', [
              summary([
                Component.text(item['question']!),
                span(
                  classes: 'faq-indicator',
                  attributes: {'aria-hidden': 'true'},
                  [Component.text('+')],
                ),
              ]),
              p([Component.text(item['answer']!)]),
            ]),
        ]),
      ]),
    ]);
  }
}
