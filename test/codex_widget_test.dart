

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:persona_application/codex/codex.dart';
import 'package:persona_application/codex/health_card.dart';
import 'package:persona_application/codex/testCard/test_card.dart';

void main() {
  testWidgets("codex Widget_with_text", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Codex()));
    final res = find.descendant(
        of: find.text("Personality Tests"), matching: find.byType(RichText));
    expect(res, findsOneWidget);
  });

  testWidgets("codex Widget_with_rows", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Codex()));
    final res = find.byType(Row);
    expect(res, findsWidgets);
  });
  testWidgets("codex widget_with_test_cards", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Codex()));
    final res = find.byType(TestCard);
    expect(res, findsWidgets);
  });
  testWidgets("codex widget_with_health_cards", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Codex()));
    final res = find.byType(HealthCard);
    expect(res, findsWidgets);
  });
}