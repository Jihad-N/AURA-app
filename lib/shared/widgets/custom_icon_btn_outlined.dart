import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIconBtnOutlined extends StatelessWidget {
  final String img;

  const CustomIconBtnOutlined({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: 75,
        height:75,
        decoration: BoxDecoration(
          color: AppColors.outlineVariant,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.outline),
        ),
        child: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image(image: AssetImage(img))],
          ),
        ),
      ),
    );
  }
}
