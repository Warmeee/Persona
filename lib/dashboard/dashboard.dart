import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:persona_application/dashboard/mood_tracker.dart';
import 'package:persona_application/dashboard/personality_traits.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
          Container(
              padding: EdgeInsets.all(0),
              height: 250,
              width: 350,
              child: ListView(
                  clipBehavior: Clip.none,
                  physics: PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    TraitWidget.createBigFiveTraits(),
                    TraitWidget.createMyersTraits(),
                    TraitWidget.createBigFiveTraits(),
                    TraitWidget.createMyersTraits()
                  ])),
          MoodWidget()
    ]));
  }
}
