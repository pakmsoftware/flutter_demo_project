import 'package:flutter/material.dart';
import 'package:flutter_project/extensions/double_extension.dart';
import 'package:flutter_project/widgets/products/product_discount_badge.dart';
import 'package:flutter_project/widgets/products/product_rating.dart';

import '../../models/product.dart';

class ProductBasicInfo extends StatelessWidget {
  final Product product;
  const ProductBasicInfo(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product.category} > ${product.brand}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                ),
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            //const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    ProductDiscountBadge(product.discountPercentage),
                    Text(
                      product.price.toPriceDollarString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${product.stock} available',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Divider(thickness: 2, indent: 10, endIndent: 10, height: 24),
        Text(product.description),
      ],
    );
  }
}
