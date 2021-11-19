import 'package:flutter/material.dart';
import 'package:persona_application/settings/settings_page.dart';
import 'package:persona_application/tests/tests_page.dart';
import 'package:persona_application/widgets/app_bar.dart';

import '../dashboard/dashboard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent and used by the build method of the
  // State. Fields in a Widget subclass are always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Tests(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100), child: MyAppBar()),
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
                  icon: Icon(Icons.quiz_sharp), label: "Tests"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ]));
  }
}
