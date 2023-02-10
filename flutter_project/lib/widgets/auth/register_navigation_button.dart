import 'package:flutter/material.dart';

import '../../screens/registration_screen.dart';

class RegisterNavigationButton extends StatelessWidget {
  const RegisterNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pushNamed(
        RegistrationScreen.routeName,
      ),
      child: const Text('No account? Register instead'),
    );
  }
}
