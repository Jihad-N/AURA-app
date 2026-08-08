import 'dart:convert';

import 'package:ecommerce_project/features/products/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  var baseUrl = Uri.parse('https://dummyjson.com');
  var url = Uri.parse('https://dummyjson.com/products');

  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List products = (json['products'] ?? []) as List;

      return products
          .map(
            (product) => ProductModel.fromJson(product as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<ProductModel?> createProduct(ProductModel product) async {
    final url = Uri.parse('$baseUrl/products');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(product.toJson()),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return ProductModel.fromJson(
          responseData,
        ); 
      } else {
        throw Exception('Prosses Failed: ${response.statusCode}');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
