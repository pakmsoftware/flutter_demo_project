import 'dart:developer';

import 'package:flutter_project/db/collections/product.dart';
import 'package:flutter_project/db/repositories/isar_repository.dart';
import 'package:isar/isar.dart';

class ProductRepository extends IsarRepository {
  Future<List<Product>> getProductsByIds(List<int> ids) async {
    try {
      final db = await isar;
      final products = await db.products.getAll(ids);
      return products.map((e) => e!).toList();
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  // insert/update products from api for cache (productcache)
  Future<bool> insertProducts(List<Product> products) async {
    try {
      final db = await isar;
      await db.writeTxn(() async {
        await db.products.putAll(products);
      });
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  // delete all data during logout
  Future<bool> deleteAllProducts() async {
    try {
      final db = await isar;
      await db.products.where().deleteAll();
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
