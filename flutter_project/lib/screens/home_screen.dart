import 'package:flutter/material.dart';
import 'package:flutter_project/providers/auth_provider.dart';
import 'package:flutter_project/providers/product_provider.dart';
import 'package:flutter_project/screens/login_screen.dart';
import 'package:flutter_project/screens/product_list_screen.dart';
import 'package:flutter_project/widgets/spinner.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../models/user.dart';

class HomeScreen extends StatelessWidget with GetItMixin {
  static const routeName = 'home';
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLogged = watchOnly((AuthProvider a) {
      return a.isLoggedIn;
    });
    return Scaffold(
      body: FutureBuilder<User?>(
        future: get<AuthProvider>().initializeOnStartup(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Spinner();
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return const LoginScreen();
          }
          return _buildLoginOrProductsScreen(isLogged);
        },
      ),
    );
  }

  Widget _buildLoginOrProductsScreen(bool isLogged) {
    if (isLogged) {
      get<ProductProvider>().getProducts(0);
      return const ProductListScreen();
    }
    return const LoginScreen();
  }
}
