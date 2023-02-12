import 'package:flutter/material.dart';
import 'package:flutter_project/providers/product_provider.dart';
import 'package:flutter_project/widgets/products/product_card.dart';
import 'package:get_it/get_it.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = 'product=details';
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedProduct = GetIt.instance<ProductProvider>().selectedProduct;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedProduct.title),
        centerTitle: true,
      ),
      body: ProductCard(selectedProduct),
    );
  }
}
