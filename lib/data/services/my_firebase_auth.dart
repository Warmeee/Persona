import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFireBaseAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUserEmailandPassword(String email, String password,
      String nickName, BuildContext context) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      _auth.currentUser!.updateDisplayName(nickName);
      /*_firestore
          .collection('Tests')
          .doc(userCredential.user!.displayName)
          .set({"scores": 0});*/
    } on FirebaseAuthException catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(error.message!),
            actions: <Widget>[
              TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          );
        },
      );
    }
  }

  Future<void> signInEmailandPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(error.message!),
            actions: <Widget>[
              TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          );
        },
      );
    }
  }
}
