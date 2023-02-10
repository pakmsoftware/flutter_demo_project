import 'package:flutter/material.dart';

import '../../utils/validator.dart';
import 'login_text_input.dart';

class NameInput extends StatelessWidget {
  final TextEditingController controller;
  const NameInput({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return LoginTextInput(
      controller: controller,
      iconData: Icons.info,
      validationFn: Validator.validateName,
      keyboardType: TextInputType.name,
      maxLength: 50,
      isObscure: false,
    );
  }
}
