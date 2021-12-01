import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';

class TraitDescription extends StatelessWidget {
  const TraitDescription(
      {Key? key,
      required this.title,
      required this.values,
      required this.labels})
      : super(key: key);

  final String title;
  final List<double> values;
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 40),
                Container(
                    height: 190,
                    child: RadarChart(
                      maxValue: 10,
                      values: this.values,
                      labels: this.labels,
                      labelWidth: 100,
                      textScaleFactor: 0.065,
                      fillColor: Colors.green,
                      maxHeight: 140,
                      maxWidth: 140,
                    )),
                SizedBox(height: 20),
                Text(this.title,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
                SizedBox(height: 20),
                Expanded(
                    child: SingleChildScrollView(
                        child: Text(this.title)))
              ],
            )));
  }
}
