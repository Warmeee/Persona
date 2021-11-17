import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';

class TraitWidget extends StatelessWidget {
  TraitWidget(
      {Key? key,
      required this.title,
      required this.values,
      required this.labels})
      : super(key: key);

  final String title;
  final List<double> values;
  final List<String> labels;

  factory TraitWidget.createBigFiveTraits() {
    return TraitWidget(title: "Big 5 Personality Traits", values: [
      6,
      4,
      6,
      8,
      2
    ], labels: [
      "Openness",
      "Conscientiousness",
      "Extroversion",
      "Agreeableness",
      "Neuroticism"
    ]);
  }

  factory TraitWidget.createMyersTraits() {
    return TraitWidget(title: "Myers-Briggs Personality Traits", values: [
      6,
      4,
      6,
      8,
      2,
      7,
      4,
      9
    ], labels: [
      "Extrovert",
      "Sensing",
      "Thinking",
      "Judging",
      "Introvert",
      "Intuition",
      "Feeling",
      "Perception"
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            margin: EdgeInsets.fromLTRB(8, 15, 6, 5),
            shadowColor: Colors.grey,
            elevation: 7,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Container(
                alignment: Alignment.center,
                height: 260,
                width: 335,
                padding: EdgeInsets.fromLTRB(8, 5, 0, 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 5),
                            Text(this.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18))
                          ]),
                      SizedBox(height: 5),
                      RadarChart(
                        maxValue: 10,
                        values: this.values,
                        labels: this.labels,
                        labelWidth: 100,
                        textScaleFactor: 0.065,
                        fillColor: Colors.green,
                        maxHeight: 170,
                        maxWidth: 170,
                      ),
                    ]))));
  }
}
