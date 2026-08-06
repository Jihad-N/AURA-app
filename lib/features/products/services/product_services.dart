import 'dart:convert';

import 'package:ecommerce_project/features/products/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  var url = Uri.parse('https://dummyjson.com/products');
  

  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List products = (json['products'] ?? []) as List;

      return products
          .map((product) => ProductModel.fromJson(product as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
