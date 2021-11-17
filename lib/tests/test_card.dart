import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/tests/survey_kit.dart';
import 'package:persona_application/tests/test_card_design.dart';
import 'package:survey_kit/survey_kit.dart';

class TestCard extends StatelessWidget {
  const TestCard(
      {Key? key,
      required this.title,
      required this.image,
      required this.surveyKit})
      : super(key: key);

  final String title;
  final DecorationImage image;
  final SurveyKit surveyKit;

  factory TestCard.createBigFive(BuildContext context) {
    return TestCard(
        title: "Big Five",
        surveyKit: MySurveyKit.createBigFiveSurvey(context),
        image: DecorationImage(
            image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/0/0c/Wiki-grafik_peats-de_big_five_ENG.png')));
  }

  factory TestCard.createRorschach(BuildContext context) {
    return TestCard(
        title: "Rorschach",
        surveyKit: MySurveyKit.createRorschachSurvey(context),
        image: DecorationImage(
            image: NetworkImage('https://i.imgur.com/qrH47K2.jpg')));
  }

  factory TestCard.createMyersBriggs(BuildContext context) {
    return TestCard(
        title: "Myers Briggs",
        surveyKit: MySurveyKit.createMyersSurvey(context),
        image: DecorationImage(
            image: NetworkImage(
                'https://en.islcollective.com/preview/201704//b2/short-myers-briggs-personality-test-fun-activities-games_97966_4.jpg')));
  }

  factory TestCard.createSixteenPf(BuildContext context) {
    return TestCard(
        title: "16 PF",
        surveyKit: MySurveyKit.createSixTeenPfSurvey(context),
        image: DecorationImage(
            image: NetworkImage(
                'https://www.mbaskool.com/2019_images/stories/mar_images/16-pf.jpg')));
  }

  @override
  Widget build(BuildContext context) {
    return TestCardDesign(title: title, image: image, surveyKit: surveyKit);
  }
}
