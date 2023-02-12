import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_project/extensions/double_extension.dart';

class ProductRating extends StatelessWidget {
  final double rating;
  const ProductRating(this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const Icon(
          Icons.star,
          size: 60,
          color: Colors.amber,
        ),
        Text(
          rating.toRatingString(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
