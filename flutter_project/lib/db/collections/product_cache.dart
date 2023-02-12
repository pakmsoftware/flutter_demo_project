import 'package:flutter_project/models/paged_result_list.dart';
import 'package:flutter_project/utils/cache_helper.dart';
import 'package:isar/isar.dart';

import '../../models/product.dart';

part 'product_cache.g.dart';

@collection
class ProductCache {
  Id id = Isar.autoIncrement;
  // cache key - should contain pageSize and skip
  final String cacheKey;
  final List<int> productIdList;
  final DateTime expirationDate;

  ProductCache({
    required this.cacheKey,
    required this.productIdList,
    required this.expirationDate,
  });

  factory ProductCache.fromPagedResultList(
      PagedResultList<Product> serviceResult) {
    return ProductCache(
      cacheKey: CacheHelper.getCacheKey(
          serviceResult.pageSize, serviceResult.pageNumber),
      productIdList: serviceResult.elements.map((e) => e.id).toList(),
      expirationDate: DateTime.now().add(
        const Duration(hours: 3),
      ),
    );
  }
}
