import 'package:flutter_project/db/collections/product_cache.dart';
import 'package:flutter_project/models/paged_result_list.dart';
import 'package:flutter_project/models/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductCache', () {
    group('mapping', () {
      test('fromPagedResultList', () {
        const ids = [1, 2, 3, 4, 5];
        const pageSize = 20;
        const pageNumber = 60;
        const cacheKey = 'pageSize=${pageSize}pageNumber=$pageNumber';
        final List<Product> products = List.generate(
          ids.length,
          (index) => Product(
            id: ids[index],
            title: 'title',
            description: 'description',
            price: ids[index] * 5,
            discountPercentage: 12.12,
            rating: 5.0,
            stock: 12,
            brand: 'brand',
            category: 'category',
            thumbnail: 'thumbnail',
            imageUrls: ['image1', 'image2'],
          ),
        );
        final pagedResult = PagedResultList<Product>(
          pageSize: pageSize,
          pageNumber: pageNumber,
          elements: products,
        );

        final productCache = ProductCache.fromPagedResultList(pagedResult);

        expect(productCache.cacheKey, cacheKey);
        expect(productCache.productIdList, ids);
        bool isExpirationDateAfterNow =
            productCache.expirationDate.isAfter(DateTime.now());
        expect(isExpirationDateAfterNow, true,
            reason: 'Expiration date of productcache is not after now');
      });
    });
  });
}
