import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:persona_application/codex/testCard/Scores.dart';

void main() {
  test("test_scores_toJson", () {
    TestModel model = new TestModel();
    model.scores = [66, 77, 88, 99, 100];
    expect(model.toJson(), {
      'scores': [66.0, 77.0, 88.0, 99.0, 100.0]
    });
  });

  test("test_scores_fromJson", () {
    final scores = {
      "scores": [55.0, 66.0, 77.0, 88.0]
    };
    final model = TestModel.fromJson(scores);
    expect(model.scores, [55.0, 66.0, 77.0, 88.0]);
  });
}
