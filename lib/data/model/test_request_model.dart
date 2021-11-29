import 'dart:core';

class TestRequestModel {
  TestRequestModel({
    this.mentalDisorders,
    this.medication,
    this.about,
    this.happinessLevel,
    this.tellAbout,
    this.sadTime,
    this.lastHoliday,
  });

  List<String>? mentalDisorders;
  int? old;
  bool? medication;
  String? about;
  double? happinessLevel;
  bool? tellAbout;
  String? sadTime;
  DateTime? lastHoliday;

  factory TestRequestModel.fromJson(Map<String, dynamic> json) =>
      TestRequestModel(
        medication: json["medication"],
        about: json["about"],
        happinessLevel: json["happinessLevel"],
        mentalDisorders:
            List<String>.from(json["mentalDisorders"].map((x) => x)),
        tellAbout: json["tellAbout"],
        sadTime: json["sadTime"],
        lastHoliday: json["lastHoliday"],
      );

  Map<String, dynamic> toJson() => {
        "mentalDisorders": List<dynamic>.from(mentalDisorders!.map((x) => x)),
        "tellAbout": tellAbout,
        "sadTime": sadTime,
        "lastHoliday": lastHoliday,
      };
}
