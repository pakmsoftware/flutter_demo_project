import 'package:isar/isar.dart';

import '../../models/product.dart' as internal;

part 'product.g.dart';

@collection
class Product {
  final Id id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  // can be changed to enum
  final String category;
  final String thumbnail;
  // image urls
  final List<String> imageUrls;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.imageUrls,
  });

  factory Product.fromInternal(internal.Product product) {
    return Product(
      id: product.id,
      title: product.title,
      description: product.description,
      price: product.price,
      discountPercentage: product.discountPercentage,
      rating: product.rating,
      stock: product.stock,
      brand: product.brand,
      category: product.category,
      thumbnail: product.thumbnail,
      imageUrls: product.imageUrls,
    );
  }
}
