import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/codex/testCard/test_card.dart';

abstract class TestCardFactory extends StatelessWidget {
  const TestCardFactory({Key? key}) : super(key: key);

  factory TestCardFactory.createBigFive(BuildContext context) {
    return TestCard(
        title: "Big Five",
        //surveyKit: SurveyKitFactory.createBigFiveSurvey(context),
        image: DecorationImage(
            image: AssetImage(
                'assets/images/bigFive.png')));
  }

  factory TestCardFactory.createRorschach(BuildContext context) {
    return TestCard(
        title: "Rorschach",
        //surveyKit: SurveyKitFactory.createRorschachSurvey(context),
        image: DecorationImage(
            image: AssetImage('assets/images/rorschach.jpg')));
  }

  factory TestCardFactory.createMyersBriggs(BuildContext context) {
    return TestCard(
        title: "Myers Briggs",
        //surveyKit: SurveyKitFactory.createMyersSurvey(context),
        image: DecorationImage(
            image: AssetImage(
                'assets/images/myersBriggs.jpg')));
  }

  factory TestCardFactory.createSixteenPf(BuildContext context) {
    return TestCard(
        title: "16 PF",
        //surveyKit: SurveyKitFactory.createSixTeenPfSurvey(context),
        image: DecorationImage(
            image: AssetImage('assets/images/16pf.jpg')));
  }
}
