import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HealthDescription extends StatelessWidget {
  const HealthDescription({Key? key, required this.title, required this.image})
      : super(key: key);

  final String title;
  final DecorationImage image;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 30),
                Container(
                    height: 260, decoration: BoxDecoration(image: this.image)),
                SizedBox(height: 10),
                Text(this.title,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
                SizedBox(height: 20),
                Expanded(
                    child: SingleChildScrollView(
                        child: Text(resolveDescription(this.title),
                            style: TextStyle(fontSize: 16))))
              ],
            )));
  }

  static String resolveDescription(String title) {
    switch (title) {
      case "Anxiety":
        return anxiety;
      case "Depression":
        return depression;
      case "Bipolarity":
        return bipolarity;
      default:
        return "";
    }
  }

  static String anxiety = "Anxiety is a feeling of fear, dread, and uneasiness."
      " It might cause you to sweat, feel restless and tense, "
      "and have a rapid heartbeat. It can be a normal reaction to "
      "stress. For example, you might feel anxious when faced with a "
      "difficult problem at work, before taking a test, or before "
      "making an important decision. It can help you to cope. The "
      "anxiety may give you a boost of energy or help you focus. But "
      "for people with anxiety disorders, the fear is not temporary "
      "and can be overwhelming.";

  static String depression = 'Depression (major depressive disorder) is a'
      ' common and serious medical illness that negatively affects how you feel'
      ', the way you think and how you act. Fortunately, it is also treatable. '
      'Depression causes feelings of sadness and/or a loss of interest in '
      'activities you once enjoyed. It can lead to a variety of emotional and '
      'physical problems and can decrease your ability to function at work and '
      'at home.';

  static String bipolarity =
      'Bipolar disorder, formerly called manic depression'
      ', is a mental health condition that causes extreme mood swings that '
      'include emotional highs (mania or hypomania) and lows (depression).'
      'When you become depressed, you may feel sad or hopeless and lose '
      'interest or pleasure in most activities. When your mood shifts to '
      'mania or hypomania (less extreme than mania), you may feel euphoric,'
      ' full of energy or unusually irritable. These mood swings can affect '
      'sleep, energy, activity, judgment, behavior and the ability to think clearly.'
      'Episodes of mood swings may occur rarely or multiple times a year.'
      ' While most people will experience some emotional symptoms between '
      'episodes, some may not experience any.'
      'Although bipolar disorder is a lifelong condition, you can manage'
      ' your mood swings and other symptoms by following a treatment plan.'
      ' In most cases, bipolar disorder is treated with medications and '
      'psychological counseling (psychotherapy).';
}
