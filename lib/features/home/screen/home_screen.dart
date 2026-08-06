import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:ecommerce_project/features/home/widgets/home_carousel.dart';
import 'package:ecommerce_project/features/products/models/product_model.dart';
import 'package:ecommerce_project/features/products/widgets/product_card.dart';
import 'package:ecommerce_project/shared/widgets/aura_logo.dart';
import 'package:ecommerce_project/shared/widgets/custom_bottom_nav_bar.dart';
import 'package:ecommerce_project/shared/widgets/custom_icon_btn_outlined.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_project/features/products/services/product_services.dart';

const apiK =
    'sk-8fhT7E9zlZZN2ym9wIyxWANM6T1VNTOIy1sUAm7grxQUGAxXcSc64v4bR_iLavYi'
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
    'assets/images/earing.png',
  ];

  final List<CollectionItem> _collections = [
    CollectionItem(title: 'Watches', img: 'assets/images/Watches.png'),
    CollectionItem(title: 'Rings', img: 'assets/images/Rings.png'),
    CollectionItem(title: 'Nexklaces', img: 'assets/images/Necklaces.png'),
    CollectionItem(title: 'Earings', img: 'assets/images/earrings.png'),
  ];
  @override
  void initState() {
    super.initState();
    _productsFuture = ProductServices().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0),
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
                            return ProductCard(
                              image: product.thumbnail,
                              title: product.name,
                              price: product.price,
                            );
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
