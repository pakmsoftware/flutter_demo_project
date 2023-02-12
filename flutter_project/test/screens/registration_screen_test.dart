import 'package:flutter/material.dart';
import 'package:flutter_project/screens/registration_screen.dart';
import 'package:flutter_project/widgets/auth/logo_text.dart';
import 'package:flutter_project/widgets/auth/register_form.dart';
import 'package:flutter_project/widgets/gradient_screen_container.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widgets/test_helper.dart';

void main() {
  group('RegistrationScreen', () {
    testWidgets('contains proper app bar', (widgetTester) async {
      await TestHelper.pumpMaterialAppWidget(
        widgetTester: widgetTester,
        homeWidget: const RegistrationScreen(),
      );

      final appBar = find.byType(AppBar);
      final appBarTitle = find.text('Register');

      expect(appBar, findsOneWidget);
      expect(appBarTitle, findsOneWidget);
    });

    testWidgets('contains GradientScreenContainer', (widgetTester) async {
      await TestHelper.pumpMaterialAppWidget(
        widgetTester: widgetTester,
        homeWidget: const RegistrationScreen(),
      );

      final finder = find.byType(GradientScreenContainer);
      expect(finder, findsOneWidget);
    });

    testWidgets('contains RegisterForm', (widgetTester) async {
      await TestHelper.pumpMaterialAppWidget(
        widgetTester: widgetTester,
        homeWidget: const RegistrationScreen(),
      );

      final finder = find.byType(RegisterForm);
      expect(finder, findsOneWidget);
    });

    testWidgets('does not contain LogoText', (widgetTester) async {
      await TestHelper.pumpMaterialAppWidget(
        widgetTester: widgetTester,
        homeWidget: const RegistrationScreen(),
      );

      final finder = find.byType(LogoText);
      expect(finder, findsNothing);
    });
  });
}
