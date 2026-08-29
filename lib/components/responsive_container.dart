import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class ResponsiveContainer extends StatelessComponent {
  const ResponsiveContainer({
    required this.children,
    this.classes,
    this.id,
    super.key,
  });

  final List<Component> children;
  final String? classes;
  final String? id;

  @override
  Component build(BuildContext context) {
    final classList = ['container', if (classes != null) classes!].join(' ');
    return div(id: id, classes: classList, children);
  }
}
