import 'package:flutter/material.dart';
import 'package:persona_application/codex/health_description.dart';

class HealthCard extends StatelessWidget {
  const HealthCard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        height: 150,
        width: 140,
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 7.0,
            child: Column(children: [
              SizedBox(height: 5),
              Text(
                this.title,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 5),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HealthDescription(
                        title: this.title,
                        image: resolveImage(this.title),
                      );
                    }));
                  },
                  child: Container(
                      height: 80,
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          image: resolveImage(this.title))))
            ])));
  }

  static DecorationImage resolveImage(String title) {
    switch (title) {
      case "Anxiety":
        return DecorationImage(
            image: AssetImage('assets/images/anxiety.jpg'));
      case "Depression":
        return DecorationImage(
            image: AssetImage('assets/images/depression.jpg'));
      case "Bipolarity":
        return DecorationImage(
            image: AssetImage('assets/images/bipolarity.jpg'));
      default:
        return DecorationImage(
            image: AssetImage('assets/images/anxiety.jpg'));
    }
  }
}
