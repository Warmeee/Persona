

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:persona_application/codex/health_card.dart';
import 'package:persona_application/codex/health_description.dart';

void main() {
  testWidgets("test_health_description_anxiety", (WidgetTester tester) async {
    await tester.pumpWidget(new HealthDescription(
        title: "Anxiety", image: HealthCard.resolveImage("Anxiety")));
    final res = find.descendant(
        of: find.text("Anxiety"), matching: find.byType(RichText));
    expect(res, findsOneWidget);
  });


  testWidgets(
      "test_health_description_depression", (WidgetTester tester) async {
    await tester.pumpWidget(new HealthDescription(
        title: "Depression", image: HealthCard.resolveImage("Depression")));
    final res = find.descendant(
        of: find.text("Depression"), matching: find.byType(RichText));
    expect(res, findsOneWidget);
  });

  testWidgets(
      "test_health_description_bipolarity", (WidgetTester tester) async {
    await tester.pumpWidget(new HealthDescription(title: "Bipolarity", image:
    HealthCard.resolveImage("Bipolarity")));
    final res = find.descendant(
        of: find.text("Bipolarity"), matching: find.byType(RichText));
    expect(res, findsOneWidget);
  });

  testWidgets("test_health_description_empty", (WidgetTester tester) async {
    await tester.pumpWidget(
        new HealthDescription(title: "", image: HealthCard.resolveImage("")));
    final res = find.descendant(
        of: find.text(""), matching: find.byType(RichText));
    expect(res, findsWidgets);
  });
}