import 'package:flutter/material.dart';

class GradientScreenContainer extends StatelessWidget {
  final Widget child;
  const GradientScreenContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.teal,
            Colors.teal.shade500,
            Colors.teal.shade900,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: child,
    );
  }
}
