import 'package:flutter_project/apis/dummy_json_api.dart';
import 'package:flutter_project/models/paged_result_list.dart';

import '../models/product.dart';

class ProductsApi extends DummyJsonApi {
  @override
  String get collectionName => 'products';

  Future<PagedResultList<Product>> getProductsPaginated({
    int pageSize = 10,
    int skip = 0,
  }) async {
    final jsonResponse =
        await getObjectsPaginated(pageSize: pageSize, skip: skip);
    final mappedResponse =
        jsonResponse.map((e) => Product.fromJson(e)).toList();
    return PagedResultList<Product>(
      pageSize: pageSize,
      skip: skip,
      elements: mappedResponse,
    );
  }
}
