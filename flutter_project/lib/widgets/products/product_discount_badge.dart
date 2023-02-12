import 'package:flutter/material.dart';

class ProductDiscountBadge extends StatelessWidget {
  final double discount;
  const ProductDiscountBadge(this.discount, {super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 100.2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red.shade700,
        ),
        padding: const EdgeInsets.all(5),
        child: Text('-${discount.toStringAsFixed(0)}%'),
      ),
    );
  }
}
