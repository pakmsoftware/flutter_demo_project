import 'dart:developer';

import 'package:flutter_project/apis/products_api.dart';
import 'package:flutter_project/db/collections/product_cache.dart';
import 'package:flutter_project/db/repositories/product_cache_repository.dart';
import 'package:flutter_project/db/repositories/product_repository.dart';
import 'package:flutter_project/models/paged_result_list.dart';
import 'package:flutter_project/models/product.dart';
import 'package:flutter_project/utils/cache_helper.dart';
import '../db/collections/product.dart' as isar;

class ProductService {
  final ProductsApi _productsApi;
  final ProductCacheRepository _productCacheRepository;
  final ProductRepository _productRepository;

  ProductService(
    this._productsApi,
    this._productCacheRepository,
    this._productRepository,
  );

  Future<PagedResultList<Product>> getProductsPaginated({
    int pageSize = 10,
    int pageNumber = 0,
    bool useCache = true,
  }) async {
    try {
      int skip = pageNumber * pageSize;
      final cacheKey = CacheHelper.getCacheKey(pageSize, skip);
      if (useCache) {
        // firstly try to get results from cache and return if cache contains it
        final cachedResults =
            await _getProductsFromCache(pageSize, skip, cacheKey);
        if (cachedResults != null) {
          return PagedResultList<Product>(
            pageSize: pageSize,
            pageNumber: skip,
            elements: cachedResults,
          );
        }
      }

      // else get results from API
      final apiResults = await _productsApi.getProductsPaginated(
        pageSize: pageSize,
        skip: skip,
      );
      final pagedResult = PagedResultList<Product>(
        pageSize: pageSize,
        pageNumber: pageNumber,
        elements: apiResults,
      );

      // update cache
      if (useCache) _updateCache(pagedResult);

      // return api_results
      return pagedResult;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<Product>?> _getProductsFromCache(
      int pageSize, int skip, String cacheKey) async {
    final productCache =
        await _productCacheRepository.getProductCache(cacheKey);
    if (productCache == null) return null;

    // else check products from isar db
    final products =
        await _productRepository.getProductsByIds(productCache.productIdList);
    if (products.isEmpty) return null;

    // else return cached products
    final productList = products.map((e) => Product.fromIsar(e)).toList();
    log('Found ${productList.length} products from Isar cache');
    return productList;
  }

  Future _updateCache(
    PagedResultList<Product> apiResults,
  ) async {
    final cacheResult = await _productCacheRepository.updateProductCache(
      ProductCache.fromPagedResultList(apiResults),
    );
    if (!cacheResult) return;

    // update cached product list
    final isarProducts =
        apiResults.elements.map((e) => isar.Product.fromInternal(e)).toList();
    await _productRepository.insertProducts(isarProducts);
    log('Updated cache with products');
  }
}
