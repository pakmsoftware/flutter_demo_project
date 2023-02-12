import 'package:flutter/material.dart';
import 'package:flutter_project/models/paged_result_list.dart';
import 'package:flutter_project/providers/product_provider.dart';
import 'package:flutter_project/widgets/products/product_list_tile.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../models/product.dart';
import '../spinner.dart';

class ProductListView extends StatefulWidget with GetItStatefulWidgetMixin {
  ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView>
    with GetItStateMixin {
  late ScrollController scrollController;
  late PagedResultList<Product> currentPageResult;
  late List<Product> products;
  late bool isFetching;
  late bool isRefreshing;

  @override
  void initState() {
    super.initState();
    get<ProductProvider>().getProducts(0);
    scrollController = ScrollController();
    scrollController.addListener(() {
      // at the bottom
      // call get it and fetch more elements
      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0) {
        currentPageResult = GetIt.instance<ProductProvider>().currentPageList;
        if (currentPageResult.hasMorePages) {
          GetIt.instance<ProductProvider>()
              .getProducts(currentPageResult.pageNumber + 1);
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    products = watchOnly((ProductProvider provider) => provider.allProducts);
    isFetching = watchOnly((ProductProvider provider) => provider.isSearching);
    isRefreshing =
        watchOnly((ProductProvider provider) => provider.isRefreshingData);
    if (isRefreshing) return const Spinner();
    return ListView.builder(
      controller: scrollController,
      itemCount: products.length + (isFetching ? 1 : 0),
      itemBuilder: (context, index) {
        //last element is spinner when searching mode
        if (index == products.length) {
          return const Spinner();
        }
        final product = products[index];
        return ProductListTile(product);
      },
    );
  }
}
