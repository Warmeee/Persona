import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';

class SurveyKitFactory extends SurveyKit {
  SurveyKitFactory(BuildContext context)
      : super(
            task: getOrderedTask(),
            themeData: getThemeData(context),
            onResult: (SurveyResult result) {
              print(result.results);
            });

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

  static Task getOrderedTask() {
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
