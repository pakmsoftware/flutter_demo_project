import 'package:flutter/material.dart';
import 'package:flutter_project/providers/product_provider.dart';
import 'package:get_it/get_it.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // delete cached products and search again
        GetIt.instance<ProductProvider>().refreshResults();
      },
      icon: const Icon(Icons.restart_alt),
    );
  }
}
