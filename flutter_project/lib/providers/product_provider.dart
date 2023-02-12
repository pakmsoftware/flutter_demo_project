import 'package:flutter/foundation.dart';
import 'package:flutter_project/models/paged_result_list.dart';
import 'package:flutter_project/models/product.dart';
import 'package:flutter_project/services/product_service.dart';
import 'package:flutter_project/utils/configuration.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _productService;

  ProductProvider(this._productService);

  // for details screen
  Product? _selectedProduct;
  Product? get selectedProduct => _selectedProduct;

  // for circula progress indicator
  bool _isSearching = false;
  bool get isSearching => _isSearching;

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
  final List<Product> _allResults = [];
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
    } catch (e) {
      _isSearching = false;
      notifyListeners();
      rethrow;
    }
  }
}
