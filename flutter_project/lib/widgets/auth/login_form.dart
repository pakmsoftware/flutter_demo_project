import 'package:flutter/material.dart';
import 'package:flutter_project/providers/auth_provider.dart';
import 'package:flutter_project/utils/error_helper.dart';
import 'package:flutter_project/widgets/auth/password_input.dart';
import 'package:flutter_project/widgets/auth/register_navigation_button.dart';
import 'package:flutter_project/widgets/auth/sign_button.dart';
import 'package:flutter_project/widgets/auth/username_input.dart';
import 'package:flutter_project/widgets/spinner.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import 'input_space_divider.dart';

class LoginForm extends StatefulWidget with GetItStatefulWidgetMixin {
  LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with GetItStateMixin {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late bool isSubmitting;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isSubmitting = watchOnly((AuthProvider a) => a.isSubmitting);
    errorMessage = watchOnly((AuthProvider a) => a.errorMessage);
    return Card(
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 8,
          left: 8,
          right: 8,
          top: 16,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // username
              UserNameInput(controller: userNameController),
              const InputSpaceDivider(),
              // password
              PasswordInput(controller: passwordController),
              // button to navigate to registration screen
              const Align(
                alignment: Alignment.centerRight,
                child: RegisterNavigationButton(),
              ),
              isSubmitting
                  ? const Spinner()
                  : SignButton(
                      text: 'Sign In',
                      onClickFn: () => _signIn(),
                    ),
              if (errorMessage != null)
                const Text(ErrorHelper.defaultErrorText),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() {
    // validate form
    if (!formKey.currentState!.validate()) return;

    // provider login event
    get<AuthProvider>().login(
      userNameController.text.trim(),
      passwordController.text.trim(),
    );
  }
}
