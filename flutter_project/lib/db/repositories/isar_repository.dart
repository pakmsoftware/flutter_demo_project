import 'package:flutter_project/db/collections/product.dart';
import 'package:flutter_project/db/collections/product_cache.dart';
import 'package:isar/isar.dart';

import '../collections/user.dart';

abstract class IsarRepository {
  late Future<Isar> isar;
  IsarRepository() {
    isar = _initIsarDb();
  }

  Future<Isar> _initIsarDb() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          UserSchema,
          ProductSchema,
          ProductCacheSchema,
        ],
        inspector: true,
      );
    }
    // else
    return Future.value(Isar.getInstance());
  }
}
