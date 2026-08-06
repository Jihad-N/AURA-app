import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:ecommerce_project/features/home/widgets/home_carousel.dart';
import 'package:ecommerce_project/features/products/models/product_model.dart';
import 'package:ecommerce_project/shared/widgets/aura_logo.dart';
import 'package:ecommerce_project/shared/widgets/custom_icon_btn_outlined.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_project/features/products/services/product_services.dart';

const apiK =
    'sk-8fhT7E9zlZZN2ym9wIyxWANM6T1VNTOIy1sUAm7grxQUGAxXcSc64v4bR_iLavYi' +
    'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCsQLvmHm2Kuh3+Wdt8WCepUl5ZPUOWkdC+b2l23JEltDo4sCq+8N3f3Hw59A1tGvY3HUm+zJWBk7uzEVP+kXIRqMTBZOqWHTO+6kcQ8bsdD9bXV0ZCRi5ZOECm+71lybz+37AxNhEIDr6kBfXApEzH9l+wGQuU5CQGfMB3zsiOWwIDAQAB';

class CollectionItem {
  final String title;
  final String img;

  CollectionItem({required this.title, required this.img});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late Future<List<ProductModel>> _productsFuture;
  final List<String> _images = [
    'assets/images/home-page-img.png',
    'assets/images/ring.png',
    'assets/images/bg-Image (1).png',
  ];

  final List<CollectionItem> _collections = [
    CollectionItem(title: 'Watches', img: 'assets/images/Watches.png'),
    CollectionItem(title: 'Rings', img: 'assets/images/Rings.png'),
    CollectionItem(title: 'Nexklaces', img: 'assets/images/Necklaces.png'),
    CollectionItem(title: 'Earings', img: 'assets/images/earrings.png'),
  ];
  @override
  void initState() {
    _productsFuture = ProductServices().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.onBackground,
            child: Icon(Icons.person, color: AppColors.primary),
          ),
        ),
        title: AuraLogo(),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications_none, color: AppColors.darkPrimary),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: AppColors.background,
          child: Column(
            children: [
              HomeCarousel(
                images: _images,
                currentIndex: _currentIndex,
                onPageChanged: (index) => setState(() => _currentIndex = index),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Collections', style: AppTextStyles.bLabelMedium),
                      ],
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _collections.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = _collections[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 8.0,
                              left: 8.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomIconBtnOutlined(img: item.img),
                                SizedBox(height: 10),
                                Text(
                                  item.title,
                                  style: AppTextStyles.bodyLarge,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    FutureBuilder<List<ProductModel>>(
                      future: _productsFuture,
                      builder: (context, AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error : ${snapshot.error}'),
                          );
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(child: Text('No Products Available '));
                        }
                        final List<ProductModel> products = snapshot.data;
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 12,
                                mainAxisExtent: 12,
                              ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return ProductCard(image: product.thumbnail, title: product.name, price: product.price);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  const ProductCard({super.key, required this.image, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160, 
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  color: AppColors.surfaceContainerHighest,
                  child: Image.asset(
                    image ,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 16,
                      color: AppColors.inverseSurface,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

           Text(
            title,
            style: AppTextStyles.bLabelLarge,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$price',
                    style: AppTextStyles.bLabelSmall
                    ),
                  const SizedBox(width: 4),
                  // Text(
                  //   'was \$87.5',
                  //   style: TextStyle(
                  //     fontSize: 10,
                  //     color: Colors.grey[500],
                  //     decoration: TextDecoration.lineThrough,
                  //   ),
                  // ),
                ],
              ),
              
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: Color(0xFF00B074),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    size: 14,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
