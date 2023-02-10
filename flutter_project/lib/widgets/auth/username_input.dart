import 'package:flutter/material.dart';

import '../../utils/validator.dart';
import 'login_text_input.dart';

class UserNameInput extends StatelessWidget {
  final TextEditingController controller;
  const UserNameInput({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return LoginTextInput(
      controller: controller,
      iconData: Icons.account_circle,
      validationFn: Validator.validateUserName,
      keyboardType: TextInputType.name,
      maxLength: 20,
      isObscure: false,
      labelText: 'username',
    );
  }
}
