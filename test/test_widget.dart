
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:persona_application/charts/bar_chart.dart';
import 'package:persona_application/codex/codex_page.dart';
import 'package:persona_application/dashboard/dashboard.dart';
import 'package:persona_application/dashboard/mood_tracker.dart';
import 'package:persona_application/dashboard/traitWidget/trait_widget_factory.dart';
import 'package:persona_application/data/services/my_firebase_auth.dart';
import 'package:persona_application/data/sign_in_up/sign_in.dart';
import 'package:persona_application/data/sign_in_up/widgets/login_text_field.dart';
import 'package:persona_application/data/sign_in_up/widgets/sign_in_widget.dart';
import 'package:persona_application/main.dart';
import 'package:persona_application/widgets/app_bar.dart';

import 'package:persona_application/main.dart' as app;
import 'package:persona_application/widgets/home_page.dart';
void main(){


    testWidgets("test widget", (WidgetTester tester) async {
      await tester.pumpWidget(Codex());




    });


}