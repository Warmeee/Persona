import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:persona_application/codex/test_card_factory.dart';
import 'package:persona_application/codex/test_description.dart';
import 'package:persona_application/data/model/test_request_model.dart';
import 'package:persona_application/data/services/my_firebase_store.dart';
import 'package:survey_kit/survey_kit.dart';

class TestCard extends StatelessWidget implements TestCardFactory {
  const TestCard({
    Key? key,
    required this.title,
    required this.image,
    //required this.surveyKit,
  }) : super(key: key);

  final String title;
  final DecorationImage image;

  //final SurveyKit surveyKit;

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
              children: <Widget>[
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
                            return FutureBuilder<Task>(
                                future: getBigFiveTask(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                          ConnectionState.done &&
                                      snapshot.hasData &&
                                      snapshot.data != null) {
                                    final task = snapshot.data!;
                                    return SurveyKit(
                                        onResult: (SurveyResult result) {
                                          for (StepResult answer
                                              in result.results) {
                                            List? l = answer.results.first.result;
                                            print("\n");
                                            //print(answer.results.first.result);
                                          }

                                          List<int> list = [8, 6, 5, 34, 3];

                                          FirebaseFirestore.instance
                                              .collection("Tests")
                                              .add({"values": list})
                                              .then((value) =>
                                                  print("Test Added"))
                                              .catchError((error) => print(
                                                  "Failed to add test: $error"));
                                        },
                                        task: task,
                                        themeData: getThemeData(context));
                                  }
                                  return CircularProgressIndicator.adaptive();
                                });
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

  Future<Task> getBigFiveTask() {
    var task = OrderedTask(
      id: TaskIdentifier(),
      steps: [
        InstructionStep(
          title: 'Welcome to the Persona Personality Survey',
          text: 'Get ready for the questions!',
          buttonText: 'Let\'s go!',
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '1) I try not to draw attention to myself ',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '2) I lose my belongings ',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '3) I make sure my work is finished on time',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '4) I make plans and stick to them',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '5) I rarely notice my emotional reactions.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '6) I waste my time in leisure things',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '7) Feel that I’m unable to deal with things.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '8) I know how to get things done',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '9) I often Break my promises.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '10) I put little time and effort into my work',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),
        //

        //Experince
        QuestionStep(
          title: 'Open to experience',
          text: '11) I have a vivid imagination.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '12) I think about why people do the things they do.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '13) I like trying out new hobbies.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '14) I spend time seeking out new experiences.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '15) I like thinking about the mysteries of the universe.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '16) I am full of new ideas.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '17) I always look at the bright side of life.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '18) I enjoy wild life of fantasy.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '19) I see beauty in things that other might not notice.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '20)I am attach to conventional ways.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        // Agree
        QuestionStep(
          title: 'Agreeableness',
          text: '21)I am concerned about others.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '22)It is important to me to be of service to others.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '23)I sympathize with the homeless.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '24)I am helpful to the people around me.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '25)Take advantage of others. ',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '26)Am not interested in other peoples problems',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '27)Try not to think about the needy. ',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '28)Feel sympathy for those who are worse off than myself.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '29)I insult people.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '30)I question the wisdom of my elders.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        //Ext
        QuestionStep(
          title: 'Extraversion',
          text: '31)I would enjoy attending a large party.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Extraversion',
          text: '32)Being around lots of people energizes me.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Extraversion',
          text: '33)It is easy for me to talk to strangers.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Extraversion',
          text: '34)I avoid being alone.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Extraversion',
          text: '35)I seek adventure.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Extraversion',
          text: '36)Avoid contacts with others.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Extraversion',
          text: '37)I find it difficult to approach others.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Extraversion',
          text: '38)Talk to a lot of different people at parties.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Extraversion',
          text: '39)I spend most of money on travelling.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Extraversion',
          text: '40)I can make a speech publicly.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        //Negative
        QuestionStep(
          title: 'Negative emotionality',
          text: '41) I enjoy being there for people when they are feeling sad',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text: '42)I believe people should be punished for their mistakes',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text:
              '43)I forgive others’ mistakes, even when they harm me personally.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text: '44)Wise people make me uncomfortable',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text: '45)I lose my tamper more often',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text: '46)I cheat to get ahead',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text: '47)I yell and insult people',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text: '48)I enjoy being reckless',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text: '49)I fear for worst',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text: '50)I dislike myself',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        CompletionStep(
          stepIdentifier: StepIdentifier(id: '321'),
          text: 'Thanks for taking the survey!',
          title: 'Done!',
          buttonText: 'Submit survey',
        ),
      ],
    );
    return Future.value(task);
  }

  static ThemeData getThemeData(BuildContext context) {
    return ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey, //text highlight color
        ).copyWith(
          onPrimary: Colors.white,
        ),
        //Cancel and Next button text color (green)
        primaryColor: Colors.green,
        backgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.green, //back button
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.green,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            //backgroundColor:
            //MaterialStateProperty.resolveWith((states) => Colors.grey),
            //color when hovered over with cursor
            //overlayColor:
            //MaterialStateProperty.resolveWith((states) => Colors.white),
            minimumSize: MaterialStateProperty.all(
              const Size(150.0, 60.0),
            ),
            //Next Button side(border) color
            side: MaterialStateProperty.resolveWith(
              (Set<MaterialState> state) {
                if (state.contains(MaterialState.disabled)) {
                  //Border Color depending on button state
                  return const BorderSide(color: Colors.grey);
                }
                return const BorderSide(color: Colors.green //active
                    );
              },
            ),
            // Button Shape
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            textStyle: MaterialStateProperty.resolveWith(
              (Set<MaterialState> state) {
                //Text Color depending on button state
                if (state.contains(MaterialState.disabled)) {
                  return Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Colors.grey);
                }
                return Theme.of(context).textTheme.button?.copyWith(
                      color: Colors.red,
                    );
              },
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle:
                MaterialStateProperty.resolveWith((Set<MaterialState> state) {
              if (state.contains(MaterialState.disabled)) {
                return Theme.of(context)
                    .textTheme
                    .button
                    ?.copyWith(color: Colors.grey);
              }
              return Theme.of(context).textTheme.button?.copyWith(
                    color: Colors.green,
                  );
            }),
          ),
        ));
  }
}
