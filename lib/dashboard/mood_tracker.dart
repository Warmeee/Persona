import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../charts/bar_chart.dart';

class MoodWidget extends StatelessWidget {
  const MoodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            child: Card(
                margin: EdgeInsets.all(12),
                shadowColor: Colors.grey,
                elevation: 7,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.yellow, Color(0xff56ab2f)]),
                    ),
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            //Title
                            Text("Mood Tracker",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18))
                          ]),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          height: 246,
                          child: VerticalBarLabelChart.withSampleData())
                    ]))));
  }
}
