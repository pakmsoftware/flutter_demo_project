import 'package:flutter/material.dart';

import '../../utils/validator.dart';
import 'login_text_input.dart';

class ConfirmPasswordInput extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;
  const ConfirmPasswordInput(
      {required this.controller, required this.passwordController, super.key});

  @override
  Widget build(BuildContext context) {
    return LoginTextInput(
      controller: controller,
      iconData: Icons.password,
      validationFn: Validator.validatePassword,
      validationFnExtra: (input, password) =>
          Validator.validateConfirmPassword(input, password),
      validationFnExtraArg: passwordController,
      keyboardType: TextInputType.visiblePassword,
      maxLength: 50,
      isObscure: true,
      labelText: 'Confirm password',
    );
  }
}
