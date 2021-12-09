

import 'package:flutter_test/flutter_test.dart';
import 'package:persona_application/codex/health_card.dart';


void main(){
  test("test_anxiety_image",(){
    var image=HealthCard.resolveImage("Anxiety");
    expect(image.toString().contains("anxiety"),true);
  });


  test("test_depression_image",(){
    var image=HealthCard.resolveImage("Depression");
    expect(image.toString().contains("depression"),true);
  });


  test("test_bipolarity_image",() {
    var image=HealthCard.resolveImage("Bipolarity");
    expect(image.toString().contains("bipolarity"),true);
  });


  test("test_other_image",() {
    var image=HealthCard.resolveImage("other");
    expect(image.toString().contains("anxiety"),true);
  });


}