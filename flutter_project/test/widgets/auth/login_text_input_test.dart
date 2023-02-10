import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/auth/login_text_input.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helper.dart';

void main() {
  group('LoginTextInput', () {
    testWidgets('contains TextFormField', (widgetTester) async {
      final controller = TextEditingController();
      await TestHelper.pumpMaterialAppWidget(
        widgetTester: widgetTester,
        homeWidget: LoginTextInput(
          controller: controller,
          iconData: Icons.abc,
          validationFn: (value) => null,
          keyboardType: TextInputType.name,
          maxLength: 20,
          isObscure: false,
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('can type text', (widgetTester) async {
      // arrange
      final controller = TextEditingController();
      const text = 'this is a test text';
      await TestHelper.pumpMaterialAppWidget(
        widgetTester: widgetTester,
        homeWidget: LoginTextInput(
          controller: controller,
          iconData: Icons.abc,
          validationFn: (value) => null,
          keyboardType: TextInputType.name,
          maxLength: 20,
          isObscure: false,
        ),
      );

      // act
      // enter text
      await widgetTester.enterText(find.byType(TextFormField), text);
      await widgetTester.pumpAndSettle();

      // assert
      expect(find.text(text), findsOneWidget);
      expect(controller.text, text);
    });
  });
}
