import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:ecommerce_project/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  final double? radius;
  final void Function() onPressed;
  const CustomButton({super.key, required this.txt, this.radius = 12, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        gradient: btnGradient,
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(txt, style: AppTextStyles.wLabelLarge),
            Icon(Icons.arrow_forward, color: AppColors.background),
          ],
        ),
      ),
    );
  }
}
