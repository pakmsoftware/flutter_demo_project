import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/products/product_list_view.dart';
import 'package:flutter_project/widgets/products/search_bar.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // search bar
        SearchBar(),
        // scrollable list
        Expanded(
          child: ProductListView(),
        ),
      ],
    );
  }
}
