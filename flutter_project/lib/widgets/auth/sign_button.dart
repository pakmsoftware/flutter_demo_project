import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  final String text;
  final void Function() onClickFn;
  const SignButton({required this.text, required this.onClickFn, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onClickFn(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: const Size(200, 40),
      ),
      child: Text(text),
    );
  }
}
