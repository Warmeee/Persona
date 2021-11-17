import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class VerticalBarLabelChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  VerticalBarLabelChart(this.seriesList, {this.animate = false});

  /// Creates a [BarChart] with sample data and no transition.
  factory VerticalBarLabelChart.withSampleData() {
    return VerticalBarLabelChart(
      _createSampleData(),
      animate: true,
    );
  }

  // [BarLabelDecorator] will automatically position the label
  // inside the bar if the label will fit. If the label will not fit,
  // it will draw outside of the bar.
  // Labels can always display inside or outside using [LabelPosition].
  //
  // Text style for inside / outside can be controlled independently by setting
  // [insideLabelStyleSpec] and [outsideLabelStyleSpec].
  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(30)),
      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator: new charts.BarLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      domainAxis: new charts.OrdinalAxisSpec(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<Mood, String>> _createSampleData() {
    final data = [
      new Mood('Mon', 5),
      new Mood('Tue', 60),
      new Mood('Wed', 30),
      new Mood('Thu', 60),
      new Mood('Fri', 90),
      new Mood('Sat', 80),
      new Mood('Sun', 50),
    ];

    return [
      new charts.Series<Mood, String>(
          id: 'mood',
          domainFn: (Mood mood, _) => mood.day,
          measureFn: (Mood mood, _) => mood.mood,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault.darker.darker,
          data: data,
          // Text of the bar label.
          labelAccessorFn: (Mood mood, _) => mood.mood.toString() + "%")
    ];
  }
}

/// Ordinal data type.
class Mood {
  final String day;
  final int mood;

  Mood(this.day, this.mood);
}
