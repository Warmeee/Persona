import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/tests/test_card.dart';

class Tests extends StatelessWidget {
  const Tests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 30),
      Row(
        children: [
          TestCard.createBigFive(context),
          TestCard.createMyersBriggs(context)
        ],
      ),
      SizedBox(height: 20),
      Row(
        children: [
          TestCard.createRorschach(context),
          TestCard.createSixteenPf(context)
        ],
      )
    ]);
  }
}
