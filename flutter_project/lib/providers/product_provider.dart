import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_project/models/paged_result_list.dart';
import 'package:flutter_project/models/product.dart';
import 'package:flutter_project/models/token_expired_exception.dart';
import 'package:flutter_project/providers/auth_provider.dart';
import 'package:flutter_project/services/product_service.dart';
import 'package:flutter_project/utils/configuration.dart';
import 'package:get_it/get_it.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _productService;

  ProductProvider(this._productService);

  // for details screen
  Product? _selectedProduct;
  Product get selectedProduct => _selectedProduct!;

  // for circula progress indicator
  bool _isSearching = false;
  bool get isSearching => _isSearching;

  bool _isRefreshingData = false;
  bool get isRefreshingData => _isRefreshingData;

  // current page
  PagedResultList<Product>? _currentPageList;
  PagedResultList<Product> get currentPageList =>
      _currentPageList ??
      PagedResultList(
        pageSize: Configuration.defaultPageSize,
        pageNumber: Configuration.defaultPageNumber,
        elements: [],
      );
  bool get hasMorePages => _currentPageList?.hasMorePages ?? false;

  // all products
  List<Product> _allResults = [];
  List<Product> get allProducts => _allResults;

  void getProducts(
    int pageNumber, [
    int pageSize = Configuration.defaultPageSize,
  ]) async {
    _isSearching = true;
    notifyListeners();

    try {
      final pageResults = await _productService.getProductsPaginated(
        pageNumber: pageNumber,
        pageSize: pageSize,
      );
      _allResults.addAll(pageResults.elements);
      _currentPageList = pageResults;
      _isSearching = false;
      notifyListeners();
    } on TokenExpiredException catch (_) {
      log('Caught token expired exception');
      GetIt.instance<AuthProvider>().logout();
    } catch (e) {
      _isSearching = false;
      notifyListeners();
    }
  }

  void refreshResults() async {
    _isRefreshingData = true;
    notifyListeners();

    _allResults = [];
    _currentPageList = null;
    _selectedProduct = null;
    final results = await _productService.refreshResults();
    _currentPageList = results;
    _allResults.addAll(results.elements);

    _isRefreshingData = false;
    notifyListeners();
  }

  void setSelectedProduct(Product product) {
    _selectedProduct = product;
    notifyListeners();
  }
}
