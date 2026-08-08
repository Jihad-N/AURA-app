import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomBtnOutlined extends StatelessWidget {
  final Function() onPressed;
  const CustomBtnOutlined({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 90, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.outlineVariant,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.outline),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Image(image: AssetImage('assets/images/Google-SVG.png')),
            Spacer(),
            Text('Google', style: AppTextStyles.bLabelSmall),
          ],
        ),
      ),
    );
  }
}
