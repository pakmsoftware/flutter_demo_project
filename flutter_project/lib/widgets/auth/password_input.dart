import 'package:flutter/material.dart';

import '../../utils/validator.dart';
import 'login_text_input.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController controller;
  const PasswordInput({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return LoginTextInput(
      controller: controller,
      iconData: Icons.password,
      validationFn: Validator.validatePassword,
      keyboardType: TextInputType.visiblePassword,
      maxLength: 50,
      isObscure: true,
      labelText: 'password',
    );
  }
}
