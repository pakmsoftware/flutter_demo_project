import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/auth/password_input.dart';
import 'package:flutter_project/widgets/auth/register_navigation_button.dart';
import 'package:flutter_project/widgets/auth/sign_button.dart';
import 'package:flutter_project/widgets/auth/username_input.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // username
              UserNameInput(controller: userNameController),
              const SizedBox(height: 8),
              // password
              PasswordInput(controller: passwordController),
              // button to navigate to registration screen
              const Align(
                alignment: Alignment.centerRight,
                child: RegisterNavigationButton(),
              ),
              SignButton(
                text: 'Sign In',
                onClickFn: () => _signIn(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() {
    // bloc login event
  }
}
