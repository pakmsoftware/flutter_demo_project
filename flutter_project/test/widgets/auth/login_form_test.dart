import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/auth/login_form.dart';
import 'package:flutter_project/widgets/auth/name_input.dart';
import 'package:flutter_project/widgets/auth/password_input.dart';
import 'package:flutter_project/widgets/auth/register_navigation_button.dart';
import 'package:flutter_project/widgets/auth/sign_button.dart';
import 'package:flutter_project/widgets/auth/username_input.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helper.dart';
import 'test_input_helper.dart';

void main() {
  group('LoginForm', () {
    group(
      'RegisterNavigationButton',
      () {
        testWidgets(
          'contains correct text',
          (widgetTester) async {
            await TestHelper.pumpMaterialAppWidget(
              widgetTester: widgetTester,
              homeWidget: const RegisterNavigationButton(),
            );
            final finder = find.text('No account? Register instead');
            expect(
              finder,
              findsOneWidget,
            );
          },
        );
      },
    );
    group('UserNameInput', () {
      TestInputHelper.testLoginTextInput(
        inputWidget: UserNameInput(controller: TextEditingController()),
        expectedIcon: Icons.account_circle,
        expectedLabel: 'username',
      );
    });
    group('PasswordInput', () {
      TestInputHelper.testLoginTextInput(
        inputWidget: PasswordInput(controller: TextEditingController()),
        expectedIcon: Icons.password,
        expectedLabel: 'password',
      );
    });

    // check if login form contains all necessary inputs
    testWidgets(
      'contains login/password inputs and SignButton',
      (widgetTester) async {
        // init form
        await TestHelper.pumpMaterialAppWidget(
          widgetTester: widgetTester,
          homeWidget: const LoginForm(),
        );

        // find inputs
        final userName = find.byType(UserNameInput);
        final password = find.byType(PasswordInput);
        final signButton = find.byType(SignButton);
        final signButtonText = find.text('Sign In');

        // assert
        expect(userName, findsOneWidget);
        expect(password, findsOneWidget);
        expect(signButton, findsOneWidget);
        expect(signButtonText, findsOneWidget);
      },
    );

    testWidgets(
      'does not contain any name inputs',
      (widgetTester) async {
        // init form
        await TestHelper.pumpMaterialAppWidget(
          widgetTester: widgetTester,
          homeWidget: const LoginForm(),
        );

        // find inputs
        final nameInput = find.byType(NameInput);

        // assert
        expect(nameInput, findsNothing);
      },
    );
  });
}
