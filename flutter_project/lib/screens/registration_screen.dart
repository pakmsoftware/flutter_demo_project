import 'package:flutter/material.dart';
import 'package:flutter_project/screens/product_list_screen.dart';
import 'package:flutter_project/widgets/auth/register_form.dart';
import 'package:flutter_project/widgets/gradient_screen_container.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../providers/auth_provider.dart';

class RegistrationScreen extends StatelessWidget with GetItMixin {
  static const routeName = 'registration';
  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLogged = watchOnly((AuthProvider a) {
      return a.isLoggedIn;
    });
    if (isLogged) return const ProductListScreen();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Register'),
      ),
      body: GradientScreenContainer(
        child: SingleChildScrollView(
          child: RegisterForm(),
        ),
      ),
    );
  }
}
