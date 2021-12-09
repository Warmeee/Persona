import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:persona_application/codex/health_card.dart';
import 'package:persona_application/codex/health_description.dart';

void main() {
  testWidgets("test_health_description_anxiety", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: HealthDescription(
            title: "Anxiety", image: HealthCard.resolveImage("Anxiety"))));
    final res = find.descendant(
        of: find.text("Anxiety"), matching: find.byType(RichText));
    expect(res, findsOneWidget);
  });

  testWidgets("test_health_description_depression",
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
            home: HealthDescription(
                title: "Depression",
                image: HealthCard.resolveImage("Depression"))));
        final res = find.descendant(
            of: find.text("Depression"), matching: find.byType(RichText));
        expect(res, findsOneWidget);
      });

  testWidgets("test_health_description_bipolarity",
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home:HealthDescription(
            title: "Bipolarity", image: HealthCard.resolveImage("Bipolarity"))));
        final res = find.descendant(
            of: find.text("Bipolarity"), matching: find.byType(RichText));
        expect(res, findsOneWidget);
      });

  testWidgets("test_health_description_empty", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home:
        HealthDescription(title: "", image: HealthCard.resolveImage(""))));
    final res =
    find.descendant(of: find.text(""), matching: find.byType(RichText));
    expect(res, findsWidgets);
  });

  test("test getDescription Anxiety", () {
    var health = HealthDescription.getDescription("Anxiety");
    expect(HealthDescription.anxiety, health);
  });

  test("test getDescription Depression", () {
    var health = HealthDescription.getDescription("Depression");
    expect(HealthDescription.depression, health);
  });
  test("test getDescription Bipolarity", () {
    var health = HealthDescription.getDescription("Bipolarity");
    expect(HealthDescription.bipolarity, health);
  });

  test("test getDescription Other", () {
    var health = HealthDescription.getDescription("other");
    expect(health, "");
  });
}
