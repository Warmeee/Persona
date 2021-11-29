import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/codex/survey_kit.dart';
import 'package:persona_application/codex/test_card.dart';
import 'package:persona_application/codex/test_card_factory.dart';

import 'health_card.dart';

class Codex extends StatelessWidget {
  const Codex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        SizedBox(height: 15),
        Row(children: [
          SizedBox(width: 20),
          Text("Personality Tests",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
        ]),
        SizedBox(height: 15),
        Row(
          children: [
            TestCardFactory.createBigFive(context),
            TestCardFactory.createMyersBriggs(context)
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            TestCardFactory.createRorschach(context),
            TestCardFactory.createSixteenPf(context)
          ],
        ),
        SizedBox(height: 10),
        Row(children: [
          SizedBox(width: 20),
          Text(
            "Mental Health",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )
        ]),
        // SizedBox(height: 10,),
        Container(
            padding: EdgeInsets.fromLTRB(15, 10, 20, 0),
            height: 130,
            //width: 350,
            child: ListView(
                clipBehavior: Clip.none,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  HealthCard(
                    title: 'Anxiety',
                  ),
                  HealthCard(title: 'Depression'),
                  HealthCard(
                    title: 'Bipolarity',
                  ),
                ]))
      ]),
    );
  }
}
