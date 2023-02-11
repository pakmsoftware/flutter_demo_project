import 'package:flutter_project/db/collections/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/models/product.dart' as internal;

void main() {
  group('Product', () {
    group('mapping', () {
      test('fromInternal', () {
        final internalModel = internal.Product(
          id: 12,
          title: 'product',
          description: 'description',
          price: 21.12,
          discountPercentage: 12.00,
          rating: 4.5,
          stock: 20,
          brand: 'adidas',
          category: 'sport',
          thumbnail: 'thumbnail',
          imageUrls: [
            'image1',
            'image2',
          ],
        );
        final dbModel = Product.fromInternal(internalModel);

        expect(dbModel.id, internalModel.id);
        expect(dbModel.title, internalModel.title);
        expect(dbModel.description, internalModel.description);
        expect(dbModel.price, internalModel.price);
        expect(dbModel.discountPercentage, internalModel.discountPercentage);
        expect(dbModel.rating, internalModel.rating);
        expect(dbModel.stock, internalModel.stock);
        expect(dbModel.brand, internalModel.brand);
        expect(dbModel.category, internalModel.category);
        expect(dbModel.thumbnail, internalModel.thumbnail);
        expect(dbModel.imageUrls, internalModel.imageUrls);
      });
    });
  });
}
