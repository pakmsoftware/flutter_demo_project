import 'package:flutter/material.dart';
import 'package:flutter_project/providers/auth_provider.dart';
import 'package:flutter_project/widgets/auth/confirm_password_input.dart';
import 'package:flutter_project/widgets/auth/input_space_divider.dart';
import 'package:flutter_project/widgets/auth/name_input.dart';
import 'package:flutter_project/widgets/auth/password_input.dart';
import 'package:flutter_project/widgets/auth/sign_button.dart';
import 'package:flutter_project/widgets/auth/username_input.dart';
import 'package:flutter_project/widgets/spinner.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class RegisterForm extends StatefulWidget with GetItStatefulWidgetMixin {
  RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> with GetItStateMixin {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late bool isSubmitting;

  @override
  void initState() {
    super.initState();
    isSubmitting = watchOnly((AuthProvider a) => a.isSubmitting);
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();

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
            mainAxisSize: MainAxisSize.min,
            children: [
              // username
              UserNameInput(controller: userNameController),
              const InputSpaceDivider(),
              // password
              PasswordInput(controller: passwordController),
              const InputSpaceDivider(),
              // confirm password
              ConfirmPasswordInput(
                controller: confirmPasswordController,
                passwordInput: passwordController.text.trim(),
              ),
              const InputSpaceDivider(),

              //first name
              NameInput(
                controller: firstNameController,
                labelText: 'First Name',
              ),
              const InputSpaceDivider(),

              //last name
              NameInput(
                controller: lastNameController,
                labelText: 'Last Name',
              ),
              const InputSpaceDivider(),

              // button to navigate to registration screen
              isSubmitting
                  ? const Spinner()
                  : SignButton(
                      text: 'Sign Up',
                      onClickFn: () => _register(),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() {
    // validate form
    if (!formKey.currentState!.validate()) return;

    // provider register event
    GetIt.instance<AuthProvider>().register(
      username: userNameController.text.trim(),
      password: passwordController.text.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
    );
  }
}
