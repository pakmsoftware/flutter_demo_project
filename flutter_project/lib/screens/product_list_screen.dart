import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/products/product_list.dart';
import 'package:flutter_project/widgets/products/sign_out_button.dart';

class ProductListScreen extends StatelessWidget {
  static const routeName = 'product-list';
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
        actions: [
          SignOutButton(),
        ],
      ),
      body: const ProductList(),
    );
  }
}
