

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:persona_application/codex/health_description.dart';
import 'package:persona_application/dashboard/dashboard.dart';
import 'package:persona_application/dashboard/moodWidget/MoodData.dart';
import 'package:persona_application/dashboard/moodWidget/mood_widget.dart';
import 'package:persona_application/dashboard/moodWidget/mood_widget_view.dart';
import 'package:persona_application/dashboard/traitWidget/trait_description_text.dart';
import 'package:persona_application/dashboard/traitWidget/trait_widget.dart';
import 'package:persona_application/dashboard/traitWidget/trait_widget_factory.dart';
import 'package:persona_application/data/sign_in_up/sign_in.dart';
import 'package:persona_application/data/sign_in_up/widgets/login_text_field.dart';
import 'package:persona_application/data/sign_in_up/widgets/mytab_view.dart';
import 'package:persona_application/data/sign_in_up/widgets/sign_in_widget.dart';
import 'package:persona_application/data/sign_in_up/widgets/sign_up_widget.dart';
import 'package:persona_application/main.dart' as app;
import 'package:persona_application/widgets/home_page.dart';
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