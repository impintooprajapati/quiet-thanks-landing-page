import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class PrivacyQuoteSection extends StatelessComponent {
  const PrivacyQuoteSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'quote-section', [
      div(classes: 'container', [
        div(classes: 'quote-card', [
          blockquote(classes: 'quote-statement', [
            Component.text('“Your thoughts belong to you — and '),
            span([Component.text('only you')]),
            Component.text('.”'),
          ]),
          div(classes: 'quote-subpoints', [
            span([Component.text('No cloud account.')]),
            span(classes: 'quote-dot', [Component.text('•')]),
            span([Component.text('No tracking.')]),
            span(classes: 'quote-dot', [Component.text('•')]),
            span([Component.text('No distractions.')]),
            span(classes: 'quote-dot', [Component.text('•')]),
            span([Component.text('Just a quiet place for gratitude.')]),
          ]),
        ]),
      ]),
    ]);
  }
}
