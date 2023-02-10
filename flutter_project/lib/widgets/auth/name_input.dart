import 'package:flutter/material.dart';

import '../../utils/validator.dart';
import 'login_text_input.dart';

class NameInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  const NameInput(
      {required this.controller, required this.labelText, super.key});

  @override
  Widget build(BuildContext context) {
    return LoginTextInput(
      controller: controller,
      iconData: Icons.info,
      validationFn: Validator.validateName,
      keyboardType: TextInputType.name,
      maxLength: 50,
      isObscure: false,
      labelText: labelText,
    );
  }
}
