import 'package:flutter_project/models/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Prouct', () {
    test(
      'correct mapping from Json',
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
