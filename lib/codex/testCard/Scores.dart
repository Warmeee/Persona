import 'dart:core';

class TestModel {
  TestModel({
    this.scores,
    //this.sadTime,
  });

  double? happinessLevel;
  List<double>? scores;

  //String? sadTime;
  //DateTime? lastHoliday;

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        scores: List<double>.from(json["scores"].map((x) => x)),
        //sadTime: json["sadTime"],
      );

  Map<String, dynamic> toJson() => {
        "scores": List<dynamic>.from(scores!.map((x) => x)),
        //"sadTime": sadTime,
        //"lastHoliday": lastHoliday,
      };
}
