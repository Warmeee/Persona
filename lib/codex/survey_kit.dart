import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/data/model/test_request_model.dart';
import 'package:persona_application/data/services/my_firebase_store.dart';
import 'package:survey_kit/survey_kit.dart';

//ValueNotifier<int> valueTest = ValueNotifier<int>(-1);

class SurveyKitFactory extends SurveyKit {
  SurveyKitFactory(BuildContext context)
      : super(
            task:  getBigFiveTask(),
            themeData: getThemeData(context),
            onResult: (SurveyResult result) async {
              TestRequestModel requestModel =
                  TestRequestModel(mentalDisorders: []);

              for (StepResult answer in result.results) {
                requestModel.mentalDisorders!.add(answer.results.first.result);
              }
              bool response =
                  await MyFireBaseStore().addStore(requestModel);
              //valueTest.value = response ? 0 : 1;
            }
            );

  factory SurveyKitFactory.createBigFiveSurvey(BuildContext context) {
    return SurveyKitFactory(context);
  }

  factory SurveyKitFactory.createMyersSurvey(BuildContext context) {
    return SurveyKitFactory(context);
  }

  factory SurveyKitFactory.createRorschachSurvey(BuildContext context) {
    return SurveyKitFactory(context);
  }

  factory SurveyKitFactory.createSixTeenPfSurvey(BuildContext context) {
    return SurveyKitFactory(context);
  }

  static Task getSampleOrderedTask() {
    //Survey Steps and Questions
    //Survey
    var task = OrderedTask(
      id: TaskIdentifier(),
      steps: [
        InstructionStep(
          title: 'Welcome to the Persona Personality Survey',
          text: 'Get ready for the questions!',
          buttonText: 'Let\'s go!',
        ),
        QuestionStep(
          title: 'How old are you?',
          answerFormat: IntegerAnswerFormat(
            defaultValue: 25,
            hint: 'Please enter your age',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'Medication?',
          text: 'Are you using any medication',
          answerFormat: BooleanAnswerFormat(
            positiveAnswer: 'Yes',
            negativeAnswer: 'No',
            result: BooleanResult.POSITIVE,
          ),
        ),
        QuestionStep(
          title: 'Tell us about you',
          text:
              'Tell us about yourself and why you want to know your personality.',
          answerFormat: TextAnswerFormat(
            maxLines: 5,
            validationRegEx: "^(?!\s*\$).+",
          ),
        ),
        QuestionStep(
          title: 'Select your average happiness level in the last month.',
          answerFormat: ScaleAnswerFormat(
            step: 1,
            minimumValue: 1,
            maximumValue: 5,
            defaultValue: 3,
            minimumValueDescription: '1',
            maximumValueDescription: '5',
          ),
        ),
        QuestionStep(
          title: 'Known mental disorders',
          text: 'Do you have any mental disorders that we should be aware of?',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Anxiety', value: 'Anxiety'),
              TextChoice(text: 'Depression', value: 'Depression'),
              TextChoice(text: 'Autism', value: 'Autism'),
              TextChoice(text: 'Schizophrenia', value: 'Schizophrenia'),
            ],
          ),
        ),
        QuestionStep(
          title: 'Done?',
          text: 'We are done, do you mind to tell us more about yourself?',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Yes', value: 'Yes'),
              TextChoice(text: 'No', value: 'No'),
            ],
            defaultSelection: TextChoice(text: 'No', value: 'No'),
          ),
        ),
        QuestionStep(
          title: 'When did you feel sad the last time?',
          answerFormat: TimeAnswerFormat(
            defaultValue: TimeOfDay(
              hour: 12,
              minute: 0,
            ),
          ),
        ),
        QuestionStep(
          title: 'When was your last holiday?',
          answerFormat: DateAnswerFormat(
            minDate: DateTime.utc(1970),
            defaultDate: DateTime.now(),
            maxDate: DateTime.now(),
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
    return task;
  }

  static Task getBigFiveTask() {
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
          text: '1)I try not to draw attention to myself ',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '2)I lose my belongings ',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '3)I make sure my work is finished on time',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '4)I make plans and stick to them',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '5)I rarely notice my emotional reactions.',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '6)I waste my time in leisure things',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '7)Feel that I’m unable to deal with things.',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '8)I know how to get things done',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '9)I often Break my promises.',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '10)Put little time and effort into my work',
          answerFormat: MultipleChoiceAnswerFormat(
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
          text: '11)I have a vivid imagination.',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '12)I think about why people do the things they do.',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '13)I like trying out new hobbies.',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '14)I spend time seeking out new experiences.',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '15)I like thinking about the mysteries of the universe.',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '16)I am full of new ideas.',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '17)I always look at the bright side of life.',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '18)I enjoy wild life of fantasy.',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Disagree', value: '0'),
              TextChoice(text: 'Neither disagree nor agree', value: '0.5'),
              TextChoice(text: 'Agree', value: '1'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '19)I see beauty in things that other might not notice.',
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
          answerFormat: MultipleChoiceAnswerFormat(
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
    return task;
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
