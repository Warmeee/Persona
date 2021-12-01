import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';

class SurveyKitFactory extends SurveyKit {
  SurveyKitFactory(BuildContext context, Task task, dynamic result)
      : super(task: task, themeData: getThemeData(context), onResult: result);

  factory SurveyKitFactory.createBigFiveSurvey(BuildContext context) {
    return SurveyKitFactory(context, getBigFiveTask(), getBigFiveResult());
  }

  factory SurveyKitFactory.createMyersSurvey(BuildContext context) {
    return SurveyKitFactory(context, getTestTask(), getMyersResult());
  }

  factory SurveyKitFactory.createRorschachSurvey(BuildContext context) {
    return SurveyKitFactory(context, getTestTask(), getBigFiveResult());
  }

  factory SurveyKitFactory.createSixTeenPfSurvey(BuildContext context) {
    return SurveyKitFactory(context, getTestTask(), getBigFiveResult());
  }

  static dynamic getBigFiveResult() {
    return (SurveyResult surveyResult) {
      CollectionReference tests =
          FirebaseFirestore.instance.collection("Tests");
      Map<String, Object> test = Map();
      List<int> results = [];
      List<double> scores = [];
      TextChoice answer;

      for (StepResult stepRes in surveyResult.results) {
        for (QuestionResult questRes in stepRes.results) {
          if (questRes.result != null) {
            //if the result is a multiple choice
            //question then TextChoice answer is a List<TextChoice>
            //textChoice.value stores answer and textChoice.text is the text);

            answer = questRes.result;
            print("\nValue: " + answer.value);
            results.add(int.parse(answer.value));
          }
        }
      }
      test["results"] = results;
      int counter = 1;
      double average = 0;
      for (int value in results) {
        average += value;
        print("\nAverage: " + average.toString());
        if (counter % 10 == 0) {
          scores.add(average / 10);
          average = 0;
        }
        counter++;
      }
      test["scores"] = scores;
      test["type"] = "BigFive";

      tests
          .add(test)
          .then((value) => print("Test Added"))
          .catchError((error) => print("Failed to add test: $error"));
    };
  }

  //TODO
  static dynamic getMyersResult() {
    return (SurveyResult result) {
      for (StepResult answer in result.results) {
        for (QuestionResult quest in answer.results) {
          if (quest.result != null) {
            //if the result is a multiple choice
            //question then TextChoice is a List<TextChoice>
            TextChoice textChoice = quest.result;
            print(
                "\nValue: " + textChoice.value + "\nText: " + textChoice.text);
          }
        }
      }
    };
  }

  static Task getTestTask() {
    List<TextChoice> choices = [
      TextChoice(text: 'Strongly Disagree', value: '0'),
      TextChoice(text: 'Disagree', value: '1'),
      TextChoice(text: 'Neutral', value: '2'),
      TextChoice(text: 'Agree', value: '3'),
      TextChoice(text: 'Strongly Agree', value: '4')
    ];
    var task = OrderedTask(
      id: TaskIdentifier(),
      steps: [
        InstructionStep(
          title: 'Welcome to the Persona Personality Survey',
          text: 'Get ready for the questions!',
          buttonText: 'Let\'s go!',
        ),
        QuestionStep(
          isOptional: false,
          title: 'Conscientiousness',
          text: '1) I try not to draw attention to myself ',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),
        QuestionStep(
          title: 'Conscientiousness',
          text: '2) I lose my belongings ',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),
        QuestionStep(
          isOptional: true,
          title: 'Conscientiousness',
          text: '3) I make sure my work is finished on time',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
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
    List<TextChoice> choices = [
      TextChoice(text: 'Strongly Disagree', value: '0'),
      TextChoice(text: 'Disagree', value: '1'),
      TextChoice(text: 'Neutral', value: '2'),
      TextChoice(text: 'Agree', value: '3'),
      TextChoice(text: 'Strongly Agree', value: '4')
    ];
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
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '2) I lose my belongings ',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '3) I make sure my work is finished on time',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '4) I make plans and stick to them',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '5) I rarely notice my emotional reactions.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '6) I waste my time in leisure things',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '7) I feel that I’m unable to deal with things.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '8) I know how to get things done',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '9) I often Break my promises.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Conscientiousness',
          text: '10) Put little time and effort into my work',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),
        //

        //Experince
        QuestionStep(
          title: 'Open to experience',
          text: '11) I have a vivid imagination.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '12) I think about why people do the things they do.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '13) I like trying out new hobbies.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '14) I spend time seeking out new experiences.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '15) I like thinking about the mysteries of the universe.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '16) I am full of new ideas.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '17) I always look at the bright side of life.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '18) I enjoy wild life of fantasy.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '19) I see beauty in things that other might not notice.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Open to experience',
          text: '20) I am attach to conventional ways.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        // Agree
        QuestionStep(
          title: 'Agreeableness',
          text: '21) I am concerned about others.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '22) It is important to me to be of service to others.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '23) I sympathize with the homeless.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '24) I am helpful to the people around me.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '25)Take advantage of others. ',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '26)Am not interested in other peoples problems',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '27)Try not to think about the needy. ',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '28)Feel sympathy for those who are worse off than myself.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '29) I insult people.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Agreeableness',
          text: '30) I question the wisdom of my elders.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        //Ext
        QuestionStep(
          title: 'Extroversion',
          text: '31) I would enjoy attending a large party.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Extroversion',
          text: '32)Being around lots of people energizes me.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Extroversion',
          text: '33) It is easy for me to talk to strangers.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Extroversion',
          text: '34) I avoid being alone.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Extroversion',
          text: '35) I seek adventure.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Extroversion',
          text: '36) Avoid contacts with others.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Extroversion',
          text: '37) I find it difficult to approach others.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Extroversion',
          text: '38) Talk to a lot of different people at parties.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Extroversion',
          text: '39) I spend most of money on travelling.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Extroversion',
          text: '40) I can make a speech publicly.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        //Negative
        QuestionStep(
          title: 'Negative emotionality',
          text: '41) I enjoy being there for people when they are feeling sad',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text: '42) I believe people should be punished for their mistakes',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text:
              '43) I forgive others’ mistakes, even when they harm me personally.',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text: '44)Wise people make me uncomfortable',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text: '45) I lose my tamper more often',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text: '46) I cheat to get ahead',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text: '47) I yell and insult people',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text: '48) I enjoy being reckless',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text: '49) I fear for worst',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
        ),

        QuestionStep(
          title: 'Negative emotionality',
          text: '50) I dislike myself',
          answerFormat: SingleChoiceAnswerFormat(
              textChoices: choices,
              defaultSelection: TextChoice(text: 'Neutral', value: '2')),
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
