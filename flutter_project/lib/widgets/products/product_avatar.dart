import 'package:flutter/material.dart';

class ProductAvatar extends StatelessWidget {
  final String imageUrl;
  const ProductAvatar(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundImage: NetworkImage(imageUrl),
      radius: 22,
    );
  }
}
