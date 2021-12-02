import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:persona_application/dashboard/mood_tracker.dart';
import 'package:persona_application/dashboard/traitWidget/trait_widget_factory.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

/*
  late final StreamSubscription myStream;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  }

  @override
  void initState() {
    myStream = _db
        .collection('agency')
        .doc(globals.agencyId)
        .snapshots()
        .listen((snapshot) =>
            clientFNameController.text = snapshot.data()?['clientFName'] ?? "");
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            Container(
              padding: EdgeInsets.all(0),
              height: 250,
              width: 350,
              child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Tests')
                      .doc(FirebaseAuth.instance.currentUser!.displayName)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return new Text('');
                    } else {
                      try {
                        List<double> bigScores =
                            snapshot.data!.get("bigScores").cast<double>();
                        List<double> myersScores =
                            snapshot.data!.get("myersScores").cast<double>();
                        return ListView(
                            clipBehavior: Clip.none,
                            physics: PageScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: [
                              TraitWidgetFactory.createBigFiveTraits(bigScores),
                              TraitWidgetFactory.createMyersTraits(myersScores),
                              TraitWidgetFactory.createSixteenPfTraits()
                            ]);
                      } catch (e) {
                        print(
                            "A score was not found in database or the format was incorrect");
                      }
                      return ListView(
                          clipBehavior: Clip.none,
                          physics: PageScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            TraitWidgetFactory.createBigFiveTraits([]),
                            TraitWidgetFactory.createMyersTraits([]),
                            TraitWidgetFactory.createSixteenPfTraits()
                          ]);
                    }
                  }),
              /*child: ListView(
                    clipBehavior: Clip.none,
                    physics: PageScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Tests')
                              .doc(FirebaseAuth
                                  .instance.currentUser!.displayName)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return new Text("");
                            } else {
                              try {
                                List<dynamic> list =
                                    snapshot.data!.get("bigScores");
                                List<double> scores = list.cast<double>();
                                if (scores.isNotEmpty) {
                                  return TraitWidgetFactory.createBigFiveTraits(
                                      scores);
                                }
                              } catch (e) {
                                print("No BigScores found in database");
                              }
                              return TraitWidgetFactory.createBigFiveTraits(
                                  [0,0,0,0,0]);
                            }
                          }),
                      //TraitWidgetFactory.createBigFiveTraits([1,2,3,4,5]),
                      TraitWidgetFactory.createMyersTraits(),
                      TraitWidgetFactory.createSixteenPfTraits(),
                      TraitWidgetFactory.createMyersTraits()
                    ])*/
            ),
            MoodWidget()
          ])),
    );
  }
}
