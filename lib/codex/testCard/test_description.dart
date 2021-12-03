import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/codex/survey_kit_factory.dart';

class TestDescription extends StatelessWidget {
  const TestDescription({Key? key, required this.title, required this.image})
      : super(key: key);

  final String title;
  final DecorationImage image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 30),
                Container(
                    height: 260, decoration: BoxDecoration(image: this.image)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(this.title,
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                    ElevatedButton(
                      child: Text("Start"),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SurveyKitFactory.createBigFiveSurvey(context);
                        }));
                      },
                    )
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                    child: SingleChildScrollView(
                        child: Text(resolveDescription(this.title),
                            style: TextStyle(fontSize: 16))))
              ],
            )));
  }

  String resolveDescription(String type) {
    switch (type) {
      case "Big Five":
        {
          return _bigFiveDescription;
        }
      case "Myers Briggs":
        {
          return _myersBriggsDescription;
        }
      case "16 PF":
        {
          return _sixTeenPfDescription;
        }
      default:
        {
          return "Default Text";
        }
    }
  }

  static String _bigFiveDescription = "The five basic personality traits is a "
      "theory developed in 1949 by D. W. Fiske (1949) and later expanded upon "
      "by other researchers including Norman (1967), Smith (1967), "
      "Goldberg (1981), and McCrae & Costa (1987). Researchers had spent years"
      " before trying to pin down character traits"
      " as a way of analysing people’s behaviour. At one point, Gordon "
      "Allport found over 4000 traits. Even when this was reduced to 16 it "
      "was seen as too complicated. This is where the five big personality "
      "traits began. ";

  static String _myersBriggsDescription = "In personality typology, the "
      "Myers–Briggs Type Indicator (MBTI) is an introspective self-report "
      "questionnaire indicating differing psychological preferences in how "
      "people perceive the world and make decisions. The test attempts"
      " to assign four categories: introversion or extraversion, sensing or"
      " intuition, thinking or feeling, judging or perceiving. One letter from"
      " each category is taken to produce a four-letter test result, such as"
      " INFJ or ENFP.";

  static String _sixTeenPfDescription = "The Sixteen Personality Factor"
      " Questionnaire (16PF) is a self-report personality test developed over "
      "several decades of empirical research by Raymond B. Cattell, Maurice "
      "Tatsuoka and Herbert Eber. The 16PF provides a measure of normal "
      "personality and can also be used by psychologists, and other mental "
      "health professionals, as a clinical instrument to help diagnose "
      "psychiatric disorders, and help with prognosis and therapy planning. "
      "The 16PF can also provide information relevant to the clinical and "
      "counseling process, such as an individual’s capacity for insight, "
      "self-esteem, cognitive style, internalization of standards, openness to "
      "change, capacity for empathy, level of interpersonal trust, quality of "
      "attachments, interpersonal needs, attitude toward authority, reaction"
      " toward dynamics of power, frustration tolerance, and coping style. Thus,"
      " the 16PF instrument provides clinicians with a normal-range measurement"
      " of anxiety, adjustment, emotional stability and behavioral problems."
      " Clinicians can use 16PF results to identify effective strategies for"
      " establishing a working alliance, to develop a therapeutic plan, and to"
      " select effective therapeutic interventions or modes of treatment. "
      "It can also be used within other areas of psychology, such as career "
      "and occupational selection.";
}
