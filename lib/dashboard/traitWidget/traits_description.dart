import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_charts/multi_charts.dart';

class TraitDescription extends StatelessWidget {
  const TraitDescription(
      {Key? key,
      required this.title,
      required this.values,
      required this.labels})
      : super(key: key);

  final String title;
  final List<double> values;
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    if (title == "Big 5 Personality Traits") {
      return Scaffold(
          body: Container(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(height: 40),
                  Container(
                      height: 190,
                      child: RadarChart(
                        maxValue: 10,
                        values: this.values,
                        labels: this.labels,
                        labelWidth: 100,
                        textScaleFactor: 0.065,
                        fillColor: Colors.green,
                        maxHeight: 140,
                        maxWidth: 140,
                      )),
                  SizedBox(height: 20),
                  Text(this.title,
                      style: GoogleFonts.roboto(
                          fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left),
                  SizedBox(height: 20),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Openness: " + values[0].toString() + "/10",
                              style: GoogleFonts.roboto(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),
                            Text("If you scored high on openness, you might:",
                                style: GoogleFonts.roboto(
                                    fontSize: 19, fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text("-Enjoy trying new things",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Be more creative",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Have a good imagination",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 15),
                            Text(
                                "A high score on openness can mean you have broad "
                                "interests. You may enjoy solving problems "
                                "with new methods and find it easy to think "
                                "about things in different ways. Being open "
                                "to new ideas may help you adjust easily to change."
                                "Just make sure to keep an eye out for any "
                                "situations where you might need to establish "
                                "boundaries, whether that be with family members "
                                "or your work-life balance.",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                                overflow: TextOverflow.visible),
                            SizedBox(height: 10),
                            Text("A low openness score might mean you::",
                                style: GoogleFonts.roboto(
                                    fontSize: 19, fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text("-Prefer to do things in a familiar way",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Avoid change",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Are more tradition in your thinking",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 15),
                            Text(
                                "A low openness score can mean you consider "
                                "concepts in straightforward ways. Others "
                                "are likely see you as being grounded and "
                                "down-to-earth.",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                                overflow: TextOverflow.visible),
                            SizedBox(height: 15),
                            Text(
                              "Conscientiousness: " +
                                  values[1].toString() +
                                  "/10",
                              style: GoogleFonts.roboto(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),
                            Text(
                                "If you scored high on conscientiousness, you might:",
                                style: GoogleFonts.roboto(
                                    fontSize: 19, fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text("-Keep things in order",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Come prepared to school or work",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Are goal-driven",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Are persistent",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 15),
                            Text(
                                "If you are a conscientious person, you might "
                                "follow a regular schedule and have a knack"
                                "for keeping track of details. You likely "
                                "deliberate over options and work hard to "
                                "achieve your goals. Coworkers and friends"
                                " might see you as a reliable, fair person."
                                "You may tend to micromanage situations or tasks."
                                " You might also be cautious or difficult to please.",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                                overflow: TextOverflow.visible),
                            SizedBox(height: 15),
                            Text(
                                "A low score on conscientiousness might mean you:",
                                style: GoogleFonts.roboto(
                                    fontSize: 19, fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text("-Are less organized",
                                style: GoogleFonts.roboto(
                                    fontSize: 19, fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text("-Take things as they come",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Complete tasks in a less structured way",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Finish things at the last minute",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 15),
                            Text(
                                "A low conscientiousness score might mean you "
                                "prefer a setting without structure. You may"
                                " prefer doing things at your own pace to "
                                "working on a deadline. This might make you"
                                " appear unreliable to others.",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                                overflow: TextOverflow.visible),
                            SizedBox(height: 15),
                            Text(
                              "Extroversion: " + values[2].toString() + "/10",
                              style: GoogleFonts.roboto(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),
                            Text("A high extroversion score might mean you:",
                                style: GoogleFonts.roboto(
                                    fontSize: 19, fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text("-Seek excitement or adventure",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Make friends easily",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Speak without thinking",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Enjoy being active with others",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 15),
                            Text(
                                "If you scored high on extroversion, you might "
                                "consider yourself an extrovert. You might "
                                "enjoy attention and feel recharged after "
                                "spending time with friends. You likely feel"
                                " your best when in a large group of people."
                                "On the other hand, you may have trouble spending"
                                " long periods of time alone.",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                                overflow: TextOverflow.visible),
                            SizedBox(height: 15),
                            Text("A low extroversion score can mean you:",
                                style: GoogleFonts.roboto(
                                    fontSize: 19, fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text(
                                "-Have a hard time making small talk or introducing yourself",
                                style: GoogleFonts.roboto(
                                    fontSize: 19, fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text("-Feel worn out after socializing",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Avoid large groups",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Are more reserved",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 15),
                            Text(
                                "A low extroversion score can mean you prefer to "
                                "spend time alone or with a small group of "
                                "close friends. You might also be a more "
                                "private person when it comes to sharing "
                                "details about your life. This might come "
                                "across as standoffish to others.",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                                overflow: TextOverflow.visible),
                            SizedBox(height: 15),
                            Text(
                              "Agreeableness: " + values[2].toString() + "/10",
                              style: GoogleFonts.roboto(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),
                            Text(
                                "A high score in agreeableness might mean you:",
                                style: GoogleFonts.roboto(
                                    fontSize: 19, fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text("-Are always ready to help out",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Are caring and honest",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Are interested in the people around you",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Believe the best about others",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 15),
                            Text(
                                "If you score high in agreeableness, you you’re"
                                " helpful and cooperative. Your loved ones "
                                "may often turn to you for help. People might"
                                " see you as trustworthy. You may be the "
                                "person others seek when they’re trying to "
                                "resolve a disagreement."
                                "In some situations, you might a little too "
                                "trusting or willing to compromise. Try to "
                                "balance your knack for pleasing others "
                                "with self-advocacy.",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                                overflow: TextOverflow.visible),
                            SizedBox(height: 15),
                            Text("A low agreeableness score might mean you:",
                                style: GoogleFonts.roboto(
                                    fontSize: 19, fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text("-Are stubborn",
                                style: GoogleFonts.roboto(
                                    fontSize: 19, fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text("-Find it difficult to forgive mistakes",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Are self-centered",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Have less compassion for others",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 15),
                            Text(
                                "A low agreeableness score may mean you tend hold"
                                " grudges. You might also be less sympathetic"
                                " with others. But you are also likely avoid "
                                "the pitfalls of comparing yourself to others "
                                "or caring about what others think of you.",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                                overflow: TextOverflow.visible),
                            SizedBox(height: 15),
                            Text(
                              "Neuroticism: " + values[2].toString() + "/10",
                              style: GoogleFonts.roboto(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),
                            Text("A high score in neuroticism can mean you:",
                                style: GoogleFonts.roboto(
                                    fontSize: 19, fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text("-Often feel vulnerable or insecure",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Get stressed easily",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Struggle with difficult situations",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Have mood swings",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 15),
                            Text(
                                "If you score high on neuroticism, you may blame "
                                "yourself when things go wrong. You might also"
                                " get frustrated with yourself easily, "
                                "especially if you make a mistake. Chances "
                                "are, you’re also prone to worrying."
                                "But you’re likely also more introspective than "
                                "others, which helps you to examine and "
                                "understand your feelings.",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                                overflow: TextOverflow.visible),
                            SizedBox(height: 15),
                            Text("If you score low on neuroticism, you likely:",
                                style: GoogleFonts.roboto(
                                    fontSize: 19, fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text("-Keep calm in stressful situations",
                                style: GoogleFonts.roboto(
                                    fontSize: 19, fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text("-Are more optimistic",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Worry less",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text("-Have a more stable mood",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 15),
                            Text(
                                "A low neuroticism score can mean you’re confident"
                                ". You may have more resilience and find it "
                                "easy to keep calm under stress. Relaxation "
                                "might also come more easily to you. Try to "
                                "keep in mind that this might not be as easy "
                                "for those around you, so be patient.",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                                overflow: TextOverflow.visible),
                            SizedBox(height: 15),
                          ])),
                ],
              ))));
    } else {
      return Scaffold(body:Align(alignment: Alignment.center, child: Text("In Development", style: GoogleFonts.roboto(fontSize: 25),),));
    }
  }
}
