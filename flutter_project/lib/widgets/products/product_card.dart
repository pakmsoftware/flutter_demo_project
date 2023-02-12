import 'package:flutter/material.dart';
import 'package:flutter_project/models/product.dart';
import 'package:flutter_project/widgets/products/product_basic_info.dart';
import 'package:flutter_project/widgets/products/product_image_slider.dart';
import 'package:flutter_project/widgets/products/product_rating.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              ProductImageSlider(
                imageUrls: product.imageUrls,
              ),
              ProductRating(product.rating),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ProductBasicInfo(product),
          ),
        ],
      ),
    );
  }
}
