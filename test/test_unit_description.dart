

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:persona_application/tests/test_description.dart';

void main(){
  test("test description", ()
  {
    TestDescription description = new TestDescription(
        title: "hello world", image: DecorationImage(
        image: AssetImage(
            'assets/images/bigFive.png')));
    String ans = description.resolveDescription("type");
    expect(ans, "Default Text");
  });
}