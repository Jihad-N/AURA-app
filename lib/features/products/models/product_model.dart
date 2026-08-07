class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final double discount;
  final int stock;
  final String category;
  final String thumbnail;
   bool isFavorite;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.stock,
    required this.category,
    required this.thumbnail,
     this.isFavorite =false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final dynamic rawName = json['name'] ?? json['title'];
    final dynamic rawDiscount = json['discount'] ?? json['discountPercentage'];

    return ProductModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: rawName?.toString() ?? 'Product',
      description: json['description']?.toString() ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discount: (rawDiscount as num?)?.toDouble() ?? 0.0,
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      category: json['category']?.toString() ?? 'unknown',
      thumbnail: json['thumbnail']?.toString() ?? '',
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "price": price,
      "discount": discount,
      "stock": stock,
      "category": category,
      "thumbnail": thumbnail,
      "isFavorite": isFavorite,
    };
  }
}
