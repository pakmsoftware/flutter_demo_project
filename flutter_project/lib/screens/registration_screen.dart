import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/auth/register_form.dart';
import 'package:flutter_project/widgets/gradient_screen_container.dart';

class RegistrationScreen extends StatelessWidget {
  static const routeName = 'registration';
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Register'),
      ),
      body: const GradientScreenContainer(
        child: SingleChildScrollView(
          child: RegisterForm(),
        ),
      ),
    );
  }
}
