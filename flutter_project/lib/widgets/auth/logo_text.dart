import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Flutter Demo Project',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
