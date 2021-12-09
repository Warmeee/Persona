


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:persona_application/data/sign_in_up/sign_in.dart';
import 'package:persona_application/data/sign_in_up/widgets/login_text_field.dart';

void main() {


  testWidgets("sign-up_input_test", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home:SignIn()));
    await tester.tap(find.text("Sign-up"));
    await tester.enterText(find.byType(LoginTextFieldPass), "hello");
    expect(find.text("hello"), findsOneWidget);
  });


  testWidgets("sign-up login_text_field", (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home:SignIn()));
    await tester.tap(find.text("Sign-up"));
    expect(find.byType(LoginTextField), findsOneWidget);
  });

  testWidgets("sign-up login_text_field_pass", (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home:SignIn()));
    await tester.tap(find.text("Sign-up"));
    expect(find.byType(LoginTextFieldPass), findsOneWidget);
  });
  testWidgets("sign-up ElevatedButton", (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home:SignIn()));
    await tester.tap(find.text("Sign-up"));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

}