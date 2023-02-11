import 'package:flutter_project/apis/dummy_json_api.dart';

import '../models/product.dart';

class ProductsApi extends DummyJsonApi {
  ProductsApi(super.httpClient);

  @override
  String get collectionName => 'products';

  Future<List<Product>> getProductsPaginated({
    int pageSize = 10,
    int skip = 0,
  }) async {
    final jsonResponse =
        await getObjectsPaginated(pageSize: pageSize, skip: skip);
    final mappedResponse =
        jsonResponse.map((e) => Product.fromJson(e)).toList();
    return mappedResponse;
  }
}
