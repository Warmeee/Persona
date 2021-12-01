import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/data/sign_in_up/sign_in.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignIn(),
              ),
            );
          },
          icon: Icon(Icons.login),
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
              "Hi, User!",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            )
          ])),
    );
  }
}
