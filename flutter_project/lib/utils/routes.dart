import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/screens/login_screen.dart';
import 'package:flutter_project/screens/product_list_screen.dart';
import 'package:flutter_project/screens/registration_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext ctx)> allRoutes = {
    LoginScreen.routeName: (ctx) => const LoginScreen(),
    RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
    HomeScreen.routeName: (ctx) => HomeScreen(),
    ProductListScreen.routeName: (ctx) => const ProductListScreen(),
  };
}
