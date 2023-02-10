import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/auth/name_input.dart';
import 'package:flutter_project/widgets/auth/password_input.dart';
import 'package:flutter_project/widgets/auth/register_form.dart';
import 'package:flutter_project/widgets/auth/sign_button.dart';
import 'package:flutter_project/widgets/auth/username_input.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helper.dart';
import 'test_input_helper.dart';

void main() {
  group('RegisterForm', () {
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
    group('First NameInput', () {
      TestInputHelper.testLoginTextInput(
        inputWidget: NameInput(
          controller: TextEditingController(),
          labelText: 'First Name',
        ),
        expectedIcon: Icons.info,
        expectedLabel: 'First Name',
      );
    });
    group('Last NameInput', () {
      TestInputHelper.testLoginTextInput(
        inputWidget: NameInput(
          controller: TextEditingController(),
          labelText: 'Last Name',
        ),
        expectedIcon: Icons.info,
        expectedLabel: 'Last Name',
      );
    });

    // check if login form contains all necessary inputs
    testWidgets(
      'contains login/password/names inputs and SignButton',
      (widgetTester) async {
        // init form
        await TestHelper.pumpMaterialAppWidget(
          widgetTester: widgetTester,
          homeWidget: const RegisterForm(),
        );

        // find inputs
        final userName = find.byType(UserNameInput);
        final password = find.byType(PasswordInput);
        final nameInput = find.byType(NameInput);
        final firstNameInput = find.text('First Name');
        final lastNameInput = find.text('Last Name');
        final signButton = find.byType(SignButton);
        final signButtonText = find.text('Sign Up');

        // assert
        expect(userName, findsOneWidget);
        expect(password, findsOneWidget);

        // 2x NameInput should be found for first and last name
        expect(nameInput, findsNWidgets(2));
        expect(firstNameInput, findsOneWidget);
        expect(lastNameInput, findsOneWidget);

        expect(signButton, findsOneWidget);
        expect(signButtonText, findsOneWidget);
      },
    );

    testWidgets(
      'does not contain any sign in button',
      (widgetTester) async {
        // init form
        await TestHelper.pumpMaterialAppWidget(
          widgetTester: widgetTester,
          homeWidget: const RegisterForm(),
        );

        // find inputs
        final signInButton = find.text('Sign In');

        // assert
        expect(signInButton, findsNothing);
      },
    );
  });
}
