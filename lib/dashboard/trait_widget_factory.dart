import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/dashboard/trait_widget.dart';

abstract class TraitWidgetFactory extends StatelessWidget {
  TraitWidgetFactory({Key? key}) : super(key: key);

  factory TraitWidgetFactory.createBigFiveTraits() {
    return TraitWidget(title: "Big 5 Personality Traits", values: [
      6,
      4,
      6,
      8,
      2
    ], labels: [
      "Openness",
      "Conscientiousness",
      "Extroversion",
      "Agreeableness",
      "Neuroticism"
    ]);
  }

  factory TraitWidgetFactory.createMyersTraits() {
    return TraitWidget(title: "Myers-Briggs Personality Traits", values: [
      6,
      4,
      6,
      8,
      2,
      7,
      4,
      9
    ], labels: [
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
      6,
      4,
      6,
      8,
      2,
      4,
      8,
      4,
      7,
      9,
      1,
      5,
      6,
      3,
      8,
      5
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
