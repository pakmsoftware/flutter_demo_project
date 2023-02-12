import 'package:flutter/material.dart';

class LoginTextInput extends StatelessWidget {
  final TextEditingController controller;
  final IconData iconData;
  final String? Function(String?) validationFn;
  final String? Function(String?, String?)? validationFnExtra;
  final TextEditingController? validationFnExtraArg;
  final TextInputType keyboardType;
  final int maxLength;
  final bool isObscure;
  final String? labelText;
  const LoginTextInput({
    required this.controller,
    required this.iconData,
    required this.validationFn,
    required this.keyboardType,
    required this.maxLength,
    required this.isObscure,
    this.validationFnExtra,
    this.validationFnExtraArg,
    this.labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (input) => validationFnExtra == null
          ? validationFn(input)
          : validationFnExtra!(input, validationFnExtraArg!.text),
      decoration: InputDecoration(
        prefixIcon: Icon(iconData),
        counterText: '',
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        fillColor: Colors.teal.shade800,
        //filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      maxLines: 1,
      keyboardType: keyboardType,
      maxLength: maxLength,
      obscureText: isObscure,
    );
  }
}
