import 'package:flutter/material.dart';

import '../../utils/validator.dart';
import 'login_text_input.dart';

class ConfirmPassword extends StatelessWidget {
  final TextEditingController controller;
  final String passwordInput;
  const ConfirmPassword(
      {required this.controller, required this.passwordInput, super.key});

  @override
  Widget build(BuildContext context) {
    return LoginTextInput(
      controller: controller,
      iconData: Icons.password,
      validationFn: Validator.validatePassword,
      validationFnExtra: Validator.validateConfirmPassword,
      validationFnExtraArg: passwordInput,
      keyboardType: TextInputType.visiblePassword,
      maxLength: 50,
      isObscure: true,
    );
  }
}
