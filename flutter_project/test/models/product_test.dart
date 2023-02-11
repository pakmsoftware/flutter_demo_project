import 'package:flutter_project/models/product.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_project/db/collections/product.dart' as isar;

void main() {
  group('Prouct', () {
    test(
      'correct mapping from Json',
      () {
        final isarProduct = isar.Product(
          id: 12,
          title: 'title',
          description: 'description',
          price: 27.60,
          discountPercentage: 20.0,
          rating: 4.5,
          stock: 20,
          brand: 'brand',
          category: 'category',
          thumbnail: 'thumbnail',
          imageUrls: ['sada', 'adasd'],
        );

        final mappedProduct = Product.fromIsar(isarProduct);
        expect(mappedProduct.id, isarProduct.id);
        expect(mappedProduct.title, isarProduct.title);
        expect(mappedProduct.description, isarProduct.description);
        expect(mappedProduct.price, isarProduct.price);
        expect(
            mappedProduct.discountPercentage, isarProduct.discountPercentage);
        expect(mappedProduct.rating, isarProduct.rating);
        expect(mappedProduct.stock, isarProduct.stock);
        expect(mappedProduct.brand, isarProduct.brand);
        expect(mappedProduct.category, isarProduct.category);
        for (var i = 0; i < mappedProduct.imageUrls.length; i++) {
          final imageUrl = mappedProduct.imageUrls[i];
          final jsonImageUrl = isarProduct.imageUrls[i];
          expect(imageUrl, jsonImageUrl);
        }
      },
    );

    test(
      'correct mapping from Isar',
      () {
        final Map<String, dynamic> json = {
          'id': 1,
          'title': 'iPhone 9',
          'description': 'An apple mobile which is nothing like apple',
          'price': 549,
          'discountPercentage': 12.96,
          'rating': 4.69,
          'stock': 94,
          'brand': 'Apple',
          'category': 'smartphones',
          'thumbnail': '...',
          'images': ['http://image.pl', '232', 'asdasdas'],
        };

        final mappedProduct = Product.fromJson(json);
        expect(mappedProduct.id, json['id']);
        expect(mappedProduct.title, json['title']);
        expect(mappedProduct.description, json['description']);
        expect(mappedProduct.price, json['price']);
        expect(mappedProduct.discountPercentage, json['discountPercentage']);
        expect(mappedProduct.rating, json['rating']);
        expect(mappedProduct.stock, json['stock']);
        expect(mappedProduct.brand, json['brand']);
        expect(mappedProduct.category, json['category']);
        for (var i = 0; i < mappedProduct.imageUrls.length; i++) {
          final imageUrl = mappedProduct.imageUrls[i];
          final jsonImageUrl = json['images'][i];
          expect(imageUrl, jsonImageUrl);
        }
      },
    );
  });
}
