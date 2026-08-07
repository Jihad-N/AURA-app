import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/features/favorite/screens/favorites_manager.dart';
import 'package:ecommerce_project/features/products/widgets/product_card.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  //  void addToFavorateList(var value) {
  @override
  Widget build(BuildContext context) {
    final favList = FavoritesManager.favoritesList;

    return Scaffold(
      body: favList.isEmpty
          ? const Center(child: Text('Favourite list is empty'))
          : GridView.builder(
              itemCount: favList.length,
              itemBuilder: (BuildContext context, int index) {
                final product = favList[index];
                final isFav = FavoritesManager.favoritesList.any(
                  (item) => item.id == product.id,
                );
                return ProductCard(
                  image: product.thumbnail,
                  title: product.name,
                  price: product.price,
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    size: 16,
                    color: isFav ? Colors.red : AppColors.inverseSurface,
                  ),
                  onFavPressed: () {
                    setState(() {
                      if (isFav) {
                        FavoritesManager.favoritesList.removeWhere(
                          (item) => item.id == product.id,
                        );
                      } else {
                        FavoritesManager.favoritesList.add(product);
                      }
                    });
                  },
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
            ),
    );
  }
}
