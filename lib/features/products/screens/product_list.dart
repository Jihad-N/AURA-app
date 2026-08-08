import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/features/favorite/screens/favorites_manager.dart';
import 'package:ecommerce_project/features/products/models/product_model.dart';
import 'package:ecommerce_project/features/products/screens/product_detail.dart';
import 'package:ecommerce_project/features/products/services/product_services.dart';
import 'package:ecommerce_project/features/products/widgets/product_card.dart';
import 'package:ecommerce_project/shared/widgets/custom_bottom_nav_bar.dart';
import 'package:ecommerce_project/shared/widgets/custom_simple_app_bar.dart';
import 'package:ecommerce_project/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<List<ProductModel>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = ProductServices().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleCustomAppBar(),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.background,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 300,
                      child: CustomTextFormField(
                        hintText: 'Search',
                        isObsecureText: false,
                        icon: Icon(Icons.search),
                        controller: TextEditingController(),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.outlineVariant,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(Icons.tune),
                    ),
                  ],
                ),
              ),
              FutureBuilder<List<ProductModel>>(
                future: _productsFuture,
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error : ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No Products Available '));
                  }
                  final List<ProductModel> products = snapshot.data;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.78,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      final isFav = FavoritesManager.favoritesList.any(
                        (item) => item.id == product.id,
                      );
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetail(product: product,)));
                        },
                        child: ProductCard(
                          image: product.thumbnail,
                          title: product.name,
                          price: product.price,
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            size: 16,
                            color: isFav
                                ? Colors.red
                                : AppColors.inverseSurface,
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
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
