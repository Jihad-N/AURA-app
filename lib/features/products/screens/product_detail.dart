import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:ecommerce_project/features/favorite/screens/favorites_manager.dart';
import 'package:ecommerce_project/features/products/models/product_model.dart';
import 'package:ecommerce_project/shared/widgets/custom_simple_app_bar.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel product;
  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final isFav = FavoritesManager.favoritesList.any(
      (item) => item.id == widget.product.id,
    );
    return Scaffold(
      appBar: SimpleCustomAppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (isFav) {
                  FavoritesManager.favoritesList.removeWhere(
                    (item) => item.id == widget.product.id,
                  );
                } else {
                  FavoritesManager.favoritesList.add(widget.product);
                }
              });
            },
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              size: 20,
              color: isFav ? Colors.red : AppColors.inverseSurface,
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors.background,
        width: double.infinity,
        padding: EdgeInsets.only(right: 16, left: 16),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                Image.network(widget.product.thumbnail),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.product.name,
                        style: AppTextStyles.headlineSmall,
                        softWrap: true,
                      ),
                    ),
                    Text(
                      '\$ ${widget.product.price}',
                      style: AppTextStyles.bLabelMedium,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  widget.product.description,
                  softWrap: true,
                  style: AppTextStyles.bodyMedium,
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  child: Text('Add to Chart', style: AppTextStyles.bLabelSmall),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
