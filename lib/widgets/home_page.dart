import 'package:flutter/material.dart';
import 'package:persona_application/codex/codex_page.dart';
import 'package:persona_application/data/my_shared_preferences.dart';
import 'package:persona_application/data/sing_in_up/sign_in.dart';
import 'package:persona_application/settings/settings_page.dart';

import '../dashboard/dashboard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Codex(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: AppBar(
                  title: Text('Persona'),
                  actions: [
                    IconButton(
                      onPressed: () async {
                        //await MySharedPreferences().removeSharedToken();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignIn(),
                          ),
                        );
                      },
                      icon: Icon(Icons.logout),
                    ),
                  ],
                )),
            body: _widgetOptions.elementAt(_selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard_rounded), label: "Dashboard"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.book_rounded), label: "Codex"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "Settings"),
                ]));
  }
}
