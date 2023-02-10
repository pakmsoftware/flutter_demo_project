import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/auth/login_text_input.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helper.dart';

class TestInputHelper {
  // test if login text inputs have correct icon and label text
  // and if they use LoginTextInput widget
  static void testLoginTextInput({
    required Widget inputWidget,
    required IconData expectedIcon,
    required String expectedLabel,
  }) {
    testWidgets('contains proper label', (widgetTester) async {
      await TestHelper.pumpMaterialAppWidget(
        widgetTester: widgetTester,
        homeWidget: inputWidget,
      );
      expect(find.text(expectedLabel), findsOneWidget);
    });
    testWidgets('contains proper icon', (widgetTester) async {
      await TestHelper.pumpMaterialAppWidget(
        widgetTester: widgetTester,
        homeWidget: inputWidget,
      );
      expect(find.byIcon(expectedIcon), findsOneWidget);
    });

    testWidgets('contains LoginTextInput', (widgetTester) async {
      await TestHelper.pumpMaterialAppWidget(
        widgetTester: widgetTester,
        homeWidget: inputWidget,
      );
      expect(find.byType(LoginTextInput), findsOneWidget);
    });
  }
}
