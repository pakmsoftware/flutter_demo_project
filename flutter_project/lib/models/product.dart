import '../db/collections/product.dart' as isar;

class Product {
  final int id;
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

  factory Product.fromJson(Map<String, dynamic> json) {
    List<String> images =
        (json['images'] as List<dynamic>).map((e) => e.toString()).toList();
    final price = _mapNumber(json['price']);
    final rating = _mapNumber(json['rating']);
    final discount = _mapNumber(json['discountPercentage']);
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: price,
      discountPercentage: discount,
      rating: rating,
      stock: json['stock'],
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      imageUrls: images,
    );
  }

  static double _mapNumber(dynamic numValue) {
    final intValue = int.tryParse(numValue.toString());
    if (intValue != null) return intValue.toDouble();

    return numValue as double;
  }

  factory Product.fromIsar(isar.Product dbProduct) {
    return Product(
      id: dbProduct.id,
      title: dbProduct.title,
      description: dbProduct.description,
      price: dbProduct.price,
      discountPercentage: dbProduct.discountPercentage,
      rating: dbProduct.rating,
      stock: dbProduct.stock,
      brand: dbProduct.brand,
      category: dbProduct.category,
      thumbnail: dbProduct.thumbnail,
      imageUrls: dbProduct.imageUrls,
    );
  }
}
