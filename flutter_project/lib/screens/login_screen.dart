import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/auth/login_form.dart';
import 'package:flutter_project/widgets/auth/logo_text.dart';
import 'package:flutter_project/widgets/gradient_screen_container.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final whiteSpace = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: GradientScreenContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: whiteSpace),
              const LogoText(),
              SizedBox(height: whiteSpace),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
