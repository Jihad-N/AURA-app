import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:ecommerce_project/core/theme/size_config.dart';
import 'package:ecommerce_project/features/home/widgets/custom_dark_txt_btn.dart';
import 'package:ecommerce_project/shared/widgets/aura_logo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<String> _images = [
    'assets/images/home-page-img.png',
     'assets/images/ring.png',
    'assets/images/bg-Image (1).png',
  ];
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.background,
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: _images.length,
              options: CarouselOptions(
                height: 320,
                viewportFraction: 0.65, // تحديد نسبة العرض من الشاشة
                enlargeCenterPage: true, // تكبير الأوسط
                enlargeFactor: 0.25, // مقدار التكبير
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                bool isSelected = _currentIndex == index;

                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: context.screenWidth * 0.80,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          image: DecorationImage(
                            image: AssetImage(_images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.inverseSurface.withValues(
                              alpha: 0.25,
                            ),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 24,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'HERITAGE COLLECTION',
                                  style: AppTextStyles.wLabelLarge,
                                ),
                                Text(
                                  'The Essence of Time',
                                  style: AppTextStyles.wHeadlineMedium,
                                ),
                                AnimatedOpacity(
                                  opacity: isSelected ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 300),
                                  child: CustomDarkTxtBtn(
                                    txt: 'DISCOVER COLLECTION',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

      // body: SingleChildScrollView(
      //   child: Container(
      //     padding: EdgeInsets.all(24),
      //     height: MediaQuery.of(context).size.height,
      //     width: MediaQuery.of(context).size.width,
      //     color: AppColors.background,
      //     child: Column(
      //       children: [
      //         Container(
      //           width: context.screenWidth*0.80,
      //           height: 400,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(28),
      //             image: DecorationImage(image: AssetImage('assets/images/home-page-img.png'),fit: BoxFit.cover),

      //           ),
      //           child: Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.end,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text('HERITAGE COLLECTION',style: AppTextStyles.wLabelLarge,),
      //                 Text('The Essence of Time',style: AppTextStyles.wHeadlineMedium,),
      //                 CustomDarkTxtBtn(txt: 'DISCOVER COLLECTION', onPressed: (){})
      //               ],
      //             ),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
//     );
//   }
// }
