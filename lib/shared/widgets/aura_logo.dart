import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuraLogo extends StatelessWidget {
  const AuraLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) => const LinearGradient(
        colors: [
          AppColors.primary,
          AppColors.primaryContainer,
          AppColors.darkPrimary,
          AppColors.primaryContainer,
        ],
        begin: AlignmentGeometry.bottomCenter,
        end: AlignmentGeometry.center,
      ).createShader(bounds),
      child: Text('Aura', style: AppTextStyles.headlineMedium),
    );
  }
}
