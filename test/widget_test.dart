import 'package:flutter_test/flutter_test.dart';
import 'package:persona_application/main.dart';

void main() {
  testWidgets('myapp has a title', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final titleFinder = find.text('Persona');

    expect(titleFinder, findsOneWidget);
  });
}
