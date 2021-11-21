import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/tests/test_card_factory.dart';

class Tests extends StatelessWidget {
  const Tests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(child:Column(children: [
      SizedBox(height: 30),
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
      )
    ]));
  }
}
