import 'dart:convert';

import 'package:flutter_project/apis/products_api.dart';
import 'package:flutter_project/providers/auth_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'products_api_test.mocks.dart';

@GenerateMocks([http.Client, AuthProvider])
void main() {
  setUpAll(() async {
    final authProvider = MockAuthProvider();
    when(authProvider.jwtToken).thenAnswer((_) => '');
    GetIt.I.registerLazySingleton<AuthProvider>(() => authProvider);
  });
  tearDownAll(() async {
    GetIt.I.reset();
  });
  group('ProductsApi', () {
    group('getProductsPaginated', () {
      test('throwsException if response not 200', () {
        // setup client
        final client = MockClient();
        _mockErrorHttpResponse(client);

        final api = ProductsApi(client);
        final response = api.getProductsPaginated();
        expect(response, throwsException);
      });
      test('returns products if response 200', () async {
        // setup mock response
        final mockResponseJsonProducts = List.generate(
          10,
          (index) => {
            'id': index,
            'title': 'iPhone 9',
            'description': 'An apple mobile which is nothing like apple',
            'price': 549,
            'discountPercentage': 12.96,
            'rating': 4.69,
            'stock': 94,
            'brand': 'Apple',
            'category': 'smartphones',
            'thumbnail': '...',
            'images': ['...', '...', '...'],
          },
        );

        final mockResponseJson = {
          'products': mockResponseJsonProducts,
        };

        final mockResponse = jsonEncode(mockResponseJson);

        // setup client
        final client = MockClient();
        when(client.get(any, headers: anyNamed('headers')))
            .thenAnswer((_) async => http.Response(mockResponse, 200));

        final api = ProductsApi(client);
        final products = await api.getProductsPaginated();
        expect(products.length, mockResponseJsonProducts.length);
        for (var i = 0; i < mockResponseJson.length; i++) {
          final product = products[i];
          final jsonProduct = mockResponseJsonProducts[i];
          expect(product.title, jsonProduct['title']);
          expect(product.description, jsonProduct['description']);
          expect(product.price, jsonProduct['price']);
          expect(product.discountPercentage, jsonProduct['discountPercentage']);
          expect(product.rating, jsonProduct['rating']);
          expect(product.stock, jsonProduct['stock']);
          expect(product.brand, jsonProduct['brand']);
          expect(product.category, jsonProduct['category']);
          expect(product.thumbnail, jsonProduct['thumbnail']);
          expect(product.imageUrls, jsonProduct['images']);
        }
      });
    });
  });
}

void _mockErrorHttpResponse(MockClient client) {
  when(
    client.get(
      any,
      headers: anyNamed('headers'),
    ),
  ).thenAnswer(
    (_) async => http.Response('', 401),
  );
}
