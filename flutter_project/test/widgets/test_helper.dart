import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class TestHelper {
  static Future<void> pumpMaterialAppWidget({
    required WidgetTester widgetTester,
    required Widget homeWidget,
  }) async {
    await widgetTester.pumpWidget(
      MaterialApp(home: Scaffold(body: homeWidget)),
    );
    await widgetTester.pumpAndSettle();
  }
}
