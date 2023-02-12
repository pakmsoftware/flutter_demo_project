import 'package:flutter/material.dart';
import 'package:flutter_project/extensions/double_extension.dart';
import 'package:flutter_project/providers/product_provider.dart';
import 'package:flutter_project/screens/product_details_screen.dart';
import 'package:get_it/get_it.dart';

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
      trailing: Text(product.price.toPriceDollarString()),
      onTap: () => _goToDetailsScreen(context),
    );
  }

  void _goToDetailsScreen(BuildContext context) {
    GetIt.instance<ProductProvider>().setSelectedProduct(product);
    Navigator.of(context).pushNamed(ProductDetailsScreen.routeName);
  }
}
