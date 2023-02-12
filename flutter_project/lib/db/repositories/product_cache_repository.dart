import 'dart:developer';

import 'package:flutter_project/db/collections/product_cache.dart';
import 'package:flutter_project/db/repositories/isar_repository.dart';
import 'package:isar/isar.dart';

class ProductCacheRepository extends IsarRepository {
  Future<ProductCache?> getProductCache(String cacheKey) async {
    try {
      final db = await isar;
      final foundProductCache = await db.productCaches
          .filter()
          .cacheKeyEqualTo(cacheKey)
          .expirationDateGreaterThan(DateTime.now())
          .findAll();
      if (foundProductCache.isEmpty) return null;
      return foundProductCache.first;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  Future<bool> updateProductCache(ProductCache productCache) async {
    try {
      final db = await isar;
      await db.writeTxn(() async {
        // firstly delete current expired cache key
        await db.productCaches
            .filter()
            .cacheKeyEqualTo(productCache.cacheKey)
            .deleteAll();
        // then insert new productcache
        await db.productCaches.put(productCache);
      });
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> deleteAllProductCache() async {
    try {
      final db = await isar;
      await db.writeTxn(() async {
        await db.productCaches.where().deleteAll();
      });
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
