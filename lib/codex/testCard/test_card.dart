import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/codex/survey_kit_factory.dart';
import 'package:persona_application/codex/testCard/test_card_factory.dart';
import 'package:persona_application/codex/testCard/test_description.dart';
import 'package:survey_kit/survey_kit.dart';

class TestCard extends StatelessWidget implements TestCardFactory {
  const TestCard({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  final String title;
  final DecorationImage image;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        width: 180,
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 7.0,
            child: Column(
              children: [
                SizedBox(height: 5),
                Text(
                  this.title,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: 5),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return TestDescription(
                            title: this.title, image: this.image);
                      }));
                    },
                    child: Container(
                        height: 100,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            image: this.image))),
                SizedBox(height: 5),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return getSurvey(this.title, context);
                          }));
                        },
                        child: Container(
                            width: 175.0,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                            ),
                            child: Center(
                              child: Text(
                                'Start',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Quicksand'),
                              ),
                            ))))
              ],
            ),
            margin: EdgeInsets.fromLTRB(20.0, 0.0, 20, 10.0)));
  }

  static SurveyKit getSurvey(String title, BuildContext context) {
    switch (title) {
      case "Big Five":
        return SurveyKitFactory.createBigFiveSurvey(context);
      case "Myers Briggs":
        return SurveyKitFactory.createMyersSurvey(context);
      case "Rorschach":
        return SurveyKitFactory.createRorschachSurvey(context);
      default:
        return SurveyKitFactory.createBigFiveSurvey(context);
    }
  }
}
