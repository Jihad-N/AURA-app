class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final double discount;
  final int stock;
  final String category;
  final String thumbnail;
  final bool isFavorite;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.stock,
    required this.category,
    required this.thumbnail,
    required this.isFavorite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"] ,
      discount: json["discount"],
      stock: json["stock"],
      category: json["category"],
      thumbnail: json["thumbnail"],
      isFavorite: json["isFavorite"] ?? false,
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