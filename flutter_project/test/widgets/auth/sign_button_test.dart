import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/auth/sign_button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helper.dart';

void main() {
  group('SignButton', () {
    testWidgets('contains proper text', (widgetTester) async {
      const expectedText = 'test';
      await TestHelper.pumpMaterialAppWidget(
        widgetTester: widgetTester,
        homeWidget: SignButton(
          text: expectedText,
          onClickFn: () {},
        ),
      );
      expect(find.text(expectedText), findsOneWidget);
    });

    testWidgets('is ElevatedButton', (widgetTester) async {
      const expectedText = 'test';
      await TestHelper.pumpMaterialAppWidget(
        widgetTester: widgetTester,
        homeWidget: SignButton(
          text: expectedText,
          onClickFn: () {},
        ),
      );
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}
