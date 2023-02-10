import 'package:flutter/material.dart';
import 'package:flutter_project/screens/login_screen.dart';
import 'package:flutter_project/screens/registration_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext ctx)> allRoutes = {
    LoginScreen.routeName: (ctx) => const LoginScreen(),
    RegistrationScreen.routeName: (ctx) => const RegistrationScreen(),
  };
}
