import 'package:flutter/material.dart';
import 'package:flutter_project/providers/auth_provider.dart';
import 'package:flutter_project/screens/login_screen.dart';
import 'package:flutter_project/widgets/auth/login_form.dart';
import 'package:flutter_project/widgets/auth/logo_text.dart';
import 'package:flutter_project/widgets/gradient_screen_container.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../apis/products_api_test.mocks.dart';
import '../widgets/test_helper.dart';

@GenerateMocks([AuthProvider])
void main() {
  setUpAll(() {
    final mockProvider = MockAuthProvider();
    when(mockProvider.isSubmitting).thenAnswer((realInvocation) => false);
    when(mockProvider.errorMessage).thenAnswer((realInvocation) => null);
    GetIt.I.registerLazySingleton<AuthProvider>(() => mockProvider);
  });
  tearDownAll(() {
    GetIt.I.reset();
  });
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
