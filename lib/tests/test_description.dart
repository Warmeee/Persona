import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestInfo extends StatelessWidget {
  const TestInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 30),
                Container(
                    height: 260,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/commons/0/0c/Wiki-grafik_peats-de_big_five_ENG.png')))),
                SizedBox(height: 10),
                Text("Big 5 Personality Traits",
                    style:
                    TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
                SizedBox(height: 20),
                Expanded(
                    child: SingleChildScrollView(
                        child: Text(
                            "The five basic personality traits is a theory developed in 1949 by D. W. Fiske (1949) and later expanded upon by other researchers including Norman (1967), Smith (1967), Goldberg (1981), and McCrae & Costa (1987)." +
                                " Researchers had spent years before trying to pin down character traits as a way of analysing people’s behaviour. At one point, Gordon Allport found over 4000 traits. Even when this was reduced to 16 it was seen as too complicated. This is where the five big personality traits began. ",
                            style: TextStyle(fontSize: 16))))
              ],
            )));
  }
}
