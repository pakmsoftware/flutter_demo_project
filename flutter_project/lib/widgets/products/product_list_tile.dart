import 'package:flutter/material.dart';
import 'package:flutter_project/screens/product_details_screen.dart';

import '../../models/product.dart';

class ProductListTile extends StatelessWidget {
  final Product product;
  const ProductListTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        child: Image.network(
          product.imageUrls[0],
          fit: BoxFit.cover,
        ),
      ),
      title: Text(product.title),
      trailing: Text('${product.price} \$'),
      onTap: () => _goToDetailsScreen(context),
    );
  }

  void _goToDetailsScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ProductDetailsScreen.routeName);
  }
}
