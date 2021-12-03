import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';

class MyRadarChart extends StatelessWidget {
  const MyRadarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadarChart(
      maxValue: 5,
      values: [6, 4, 6, 8, 2],
      labels: [
        "Openness",
        "Conscientious",
        "Extroversion",
        "Agreeableness",
        "Neuroticism"
      ],
      labelWidth: 45,
      textScaleFactor: 0.06,
      fillColor: Colors.lightGreen,
      maxHeight: 180,
      maxWidth: 165,
    );
  }
}
