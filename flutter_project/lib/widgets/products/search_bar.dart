import 'package:flutter/material.dart';
import 'package:flutter_project/providers/product_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class SearchBar extends StatelessWidget with GetItMixin {
  SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final provider = get<ProductProvider>();
    final isRefreshing = watchOnly((ProductProvider p) => p.isRefreshingData);
    if (isRefreshing) controller.clear();
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'Search...',
      ),
      onChanged: (value) {
        // call search function from provider
        provider.searchByQuery(value);
      },
    );
  }
}
