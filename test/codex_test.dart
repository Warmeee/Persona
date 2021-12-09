import 'package:flutter_test/flutter_test.dart';
import 'package:persona_application/codex/health_card.dart';

void main() {
  test("test_health_card_anxiety", () {
    final anxiety_image = HealthCard.resolveImage("Anxiety");
    expect(anxiety_image.toString().contains("anxiety.jpg"), true);
  });
  test("test_health_card_depression", () {
    final title = "Depression";
    final depression_image = HealthCard.resolveImage(title);
    expect(depression_image.toString().contains(title.toLowerCase()), true);
  });
  test("test_health_card_bipolarity", () {
    final title = "Bipolarity";
    final bipolarity_image = HealthCard.resolveImage(title);
    expect(bipolarity_image.toString().contains(title.toLowerCase()), true);
  });

  //test health card default message
  test("test_health_card_default", () {
    final title = "default";
    final default_image = HealthCard.resolveImage(title);
    //default image is anxiety
    expect(default_image.toString().contains("anxiety.jpg"), true);
  });
}
