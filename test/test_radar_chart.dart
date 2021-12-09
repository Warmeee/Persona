

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:persona_application/dashboard/charts/radar_chart.dart';

void main() {
  testWidgets("test radar chart", (WidgetTester tester) async {
    await tester.pumpWidget(
        MyRadarChart(values: [1, 2, 3], labels: ["hello", "world", "radar"]));
    final labelFinder = find.text("Openness");
    expect(labelFinder, findsNothing);
  });
}