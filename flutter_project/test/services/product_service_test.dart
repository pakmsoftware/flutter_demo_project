import 'package:flutter_project/apis/products_api.dart';
import 'package:flutter_project/db/collections/product.dart';
import 'package:flutter_project/db/collections/product_cache.dart';
import 'package:flutter_project/db/repositories/product_cache_repository.dart';
import 'package:flutter_project/db/repositories/product_repository.dart';
import 'package:flutter_project/services/product_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_service_test.mocks.dart';

@GenerateMocks([ProductsApi, ProductCacheRepository, ProductRepository])
void main() {
  group('ProductService', () {
    group('getProductsPaginated', () {
      test('returns Products from cache if available', () async {
        const expectedPageSize = 10;
        const expectedPageNumber = 0;
        // setup mocks
        final mockProductsApi = MockProductsApi();
        final mockProductCacheRepo = MockProductCacheRepository();
        final mockProductRepo = MockProductRepository();

        // mock caching get operations
        when(mockProductCacheRepo.getProductCache(any)).thenAnswer(
          (_) async => _productCacheData,
        );

        when(mockProductRepo.getProductsByIds(any)).thenAnswer(
          (_) async => _cacheProducts,
        );
        // init service
        final service = ProductService(
          mockProductsApi,
          mockProductCacheRepo,
          mockProductRepo,
        );

        // act
        final result = await service.getProductsPaginated(
          useCache: true,
          pageSize: expectedPageSize,
          pageNumber: expectedPageNumber,
        );

        // verify api wasn't called if data returned from cache
        verifyNever(
          mockProductsApi.getProductsPaginated(
            pageSize: anyNamed('pageSize'),
            skip: anyNamed('skip'),
          ),
        );

        // check response data
        expect(result.elements.length, _cacheProducts.length);
        expect(result.pageNumber, expectedPageNumber);
        expect(result.pageSize, expectedPageSize);
        // check returned products
        for (var i = 0; i < result.elements.length; i++) {
          final returnedProduct = result.elements[i];
          final expectedProduct = _cacheProducts[i];
          expect(returnedProduct.id, expectedProduct.id);
          expect(returnedProduct.title, expectedProduct.title);
          expect(returnedProduct.description, expectedProduct.description);
          expect(returnedProduct.price, expectedProduct.price);
          expect(returnedProduct.discountPercentage,
              expectedProduct.discountPercentage);
          expect(returnedProduct.rating, expectedProduct.rating);
          expect(returnedProduct.stock, expectedProduct.stock);
          expect(returnedProduct.brand, expectedProduct.brand);
          expect(returnedProduct.category, expectedProduct.category);
          expect(returnedProduct.thumbnail, expectedProduct.thumbnail);
          expect(returnedProduct.imageUrls, expectedProduct.imageUrls);
        }
      });
    });
  });
}

ProductCache get _productCacheData => ProductCache(
      cacheKey: 'pageSize=10pageNumber=0',
      productIdList: [1, 2, 3],
      expirationDate: DateTime.now().add(
        const Duration(days: 1),
      ),
    );

List<Product> get _cacheProducts => List.generate(
      3,
      (index) => Product(
        id: index + 1,
        title: 'title',
        description: 'description',
        price: 12.0,
        discountPercentage: 10,
        rating: 4.5,
        stock: 32,
        brand: 'brand',
        category: 'category',
        thumbnail: 'thumbnail',
        imageUrls: ['1', '2', '3'],
      ),
    );
