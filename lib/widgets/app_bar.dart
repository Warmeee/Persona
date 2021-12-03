import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/data/services/my_firebase_auth.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          child: IconButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            icon: Icon(Icons.login),
          ),
          padding: EdgeInsets.fromLTRB(0, 26, 10, 0),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      flexibleSpace: Container(
          padding: EdgeInsets.fromLTRB(10, 45, 0, 0),
          alignment: Alignment.centerLeft,
          child: Row(children: [
            Icon(Icons.person_pin, size: 50, color: Colors.white),
            SizedBox(width: 10),
            Text(
                "Hi, " +
                    FirebaseAuth.instance.currentUser!.displayName.toString() +
                    "!",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w300))
          ])),
    );
  }
}
