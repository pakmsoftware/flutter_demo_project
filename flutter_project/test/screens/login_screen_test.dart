import 'package:flutter/material.dart';
import 'package:flutter_project/screens/login_screen.dart';
import 'package:flutter_project/widgets/auth/login_form.dart';
import 'package:flutter_project/widgets/auth/logo_text.dart';
import 'package:flutter_project/widgets/gradient_screen_container.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widgets/test_helper.dart';

void main() {
  group('LoginScreen', () {
    testWidgets('does not contain app bar', (widgetTester) async {
      await TestHelper.pumpMaterialAppWidget(
        widgetTester: widgetTester,
        homeWidget: const LoginScreen(),
      );

      final finder = find.byType(AppBar);
      expect(finder, findsNothing);
    });

    testWidgets('contains GradientScreenContainer', (widgetTester) async {
      await TestHelper.pumpMaterialAppWidget(
        widgetTester: widgetTester,
        homeWidget: const LoginScreen(),
      );

      final finder = find.byType(GradientScreenContainer);
      expect(finder, findsOneWidget);
    });

    testWidgets('contains LoginForm', (widgetTester) async {
      await TestHelper.pumpMaterialAppWidget(
        widgetTester: widgetTester,
        homeWidget: const LoginScreen(),
      );

      final finder = find.byType(LoginForm);
      expect(finder, findsOneWidget);
    });

    testWidgets('contains LogoText', (widgetTester) async {
      await TestHelper.pumpMaterialAppWidget(
        widgetTester: widgetTester,
        homeWidget: const LoginScreen(),
      );

      final finder = find.byType(LogoText);
      expect(finder, findsOneWidget);
    });
  });
}
