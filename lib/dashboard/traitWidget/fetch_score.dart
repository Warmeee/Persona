import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:persona_application/dashboard/traitWidget/trait_widget_factory.dart';

class GetScore extends StatelessWidget {

  //TODO currently not used

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Tests');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(FirebaseAuth.instance.currentUser!.displayName!).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          List<dynamic> list = snapshot.data!.get("scores");
          List<double> scores = list.cast<double>();
          return TraitWidgetFactory.createBigFiveTraits(scores);
          /*
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text("scores: ${data['full_name']}");*/
        }
        return Text("loading");
      },
    );
  }
}
