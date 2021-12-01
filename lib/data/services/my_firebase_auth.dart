import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/widgets/home_page.dart';

class MyFireBaseAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUserEmailandPassword(String email, String password,
      String nickName, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      _firestore
          .collection('User')
          .doc(userCredential.user!.uid)
          .set({'nickname': nickName, 'email': email, 'password': password});
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage()));
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
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MyHomePage()));
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
