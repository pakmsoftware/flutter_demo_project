import 'package:flutter/foundation.dart';
import 'package:flutter_project/models/paged_result_list.dart';
import 'package:flutter_project/models/product.dart';
import 'package:flutter_project/services/product_service.dart';
import 'package:flutter_project/utils/configuration.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _productService;

  ProductProvider(this._productService);

  Product? _selectedProduct;
  Product? get selectedProduct => _selectedProduct;

  bool _isSearching = false;
  bool get isSearching => _isSearching;

  PagedResultList<Product>? _currentPageList;
  PagedResultList<Product> get currentPageList =>
      _currentPageList ??
      PagedResultList(
        pageSize: Configuration.defaultPageSize,
        pageNumber: Configuration.defaultPageNumber,
        elements: [],
      );

  List<Product> _allResults = [];
  List<Product> get allProducts => _allResults;

  void getProducts(
    int pageNumber, [
    int pageSize = Configuration.defaultPageSize,
  ]) async {
    _isSearching = true;
    notifyListeners();

    _isSearching = false;
    notifyListeners();
  }
}
