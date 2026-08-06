import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:ecommerce_project/core/theme/size_config.dart';
import 'package:ecommerce_project/features/home/widgets/custom_dark_txt_btn.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatelessWidget {
  final List<String> images;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;

  const HomeCarousel({
    Key? key,
    required this.images,
    required this.currentIndex,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      options: CarouselOptions(
        height: 320,
        viewportFraction: 0.65,
        enlargeCenterPage: true,
        enlargeFactor: 0.25,
        enableInfiniteScroll: true,
        onPageChanged: (index, reason) {
          onPageChanged(index);
        },
      ),
      itemBuilder: (context, index, realIndex) {
        final bool isSelected = currentIndex == index;

        return Column(
          children: [
            Expanded(
              child: Container(
                width: context.screenWidth * 0.80,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  image: DecorationImage(
                    image: AssetImage(images[index]),
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
    );
  }
}
