import 'package:flutter/material.dart';
import 'package:flutter_project/providers/auth_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class SignOutButton extends StatelessWidget with GetItMixin {
  SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ElevatedButton.icon(
        onPressed: () {
          get<AuthProvider>().logout().then((value) {
            if (value != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    value,
                  ),
                ),
              );
              return;
            }
            Navigator.of(context).pushReplacementNamed('/');
          });
        },
        icon: const Icon(Icons.logout),
        label: const Text('Sign Out'),
      ),
    );
  }
}
