import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/dashboard/traitWidget/trait_widget.dart';

abstract class TraitWidgetFactory extends StatelessWidget {
  TraitWidgetFactory({Key? key}) : super(key: key);

  factory TraitWidgetFactory.createBigFiveTraits(List<double> values) {
    return TraitWidget(
        title: "Big 5 Personality Traits",
        values: values.isEmpty ? [0,0,0,0,0] : values,
        labels: [
          "Openness",
          "Conscientiousness",
          "Extroversion",
          "Agreeableness",
          "Neuroticism"
        ]);
  }

  factory TraitWidgetFactory.createMyersTraits(List<double> values) {
    return TraitWidget(
        title: "Myers-Briggs Personality Traits",
        values: values.isEmpty ? [0,0,0,0,0,0,0,0] : values,
        labels: [
          "Extrovert",
          "Sensing",
          "Thinking",
          "Judging",
          "Introvert",
          "Intuition",
          "Feeling",
          "Perception"
        ]);
  }

  factory TraitWidgetFactory.createSixteenPfTraits() {
    return TraitWidget(title: "Sixteen Personality Factors", values: [
      3,
      2,
      3,
      4,
      1,
      2,
      4,
      2,
      3.5,
      4.5,
      1,
      2.5,
      3,
      1.5,
      4,
      2.5
    ], labels: [
      "Warm",
      "Thinker",
      "Stable",
      "Dominant",
      "Enthusiastic",
      "Conscientious",
      "Bold",
      "Tender",
      "Suspicious",
      "Imaginative",
      "Shrewd",
      "Apprehensive",
      "Experimenting",
      "Self-Sufficient",
      "Controlled",
      "Tense"
    ]);
  }
}
