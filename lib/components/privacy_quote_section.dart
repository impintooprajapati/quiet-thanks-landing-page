import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/strings.dart';

class PrivacyQuoteSection extends StatelessComponent {
  const PrivacyQuoteSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'quote-section', [
      div(classes: 'container', [
        div(classes: 'quote-card', [
          blockquote(classes: 'quote-statement', [
            text('“Your thoughts belong to you — and '),
            span([text('only you')]),
            text('.”'),
          ]),
          div(classes: 'quote-subpoints', [
            span([text('No cloud account.')]),
            span(classes: 'quote-dot', [text('•')]),
            span([text('No tracking.')]),
            span(classes: 'quote-dot', [text('•')]),
            span([text('No distractions.')]),
            span(classes: 'quote-dot', [text('•')]),
            span([text('Just a quiet place for gratitude.')]),
          ]),
        ]),
      ]),
    ]);
  }
}
