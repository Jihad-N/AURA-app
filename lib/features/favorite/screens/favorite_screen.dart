import 'package:ecommerce_project/features/products/models/product_model.dart';
import 'package:ecommerce_project/features/products/widgets/product_card.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<ProductModel> favoritesList = [];

  FavoriteScreen({super.key});

   void addToFavorateList(var value) {
    favoritesList.add(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: favoritesList.length,
        itemBuilder: (BuildContext context, int index) {
          final product = favoritesList[index];
          return ProductCard(
            image: product.thumbnail,
            title: product.name,
            price: product.price,
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
