import 'dart:ui';

import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SplashCustomImg extends StatelessWidget {
  final String img;
  const SplashCustomImg({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          SizedBox(
          width: 150,
          height: 200,
          child: Image.asset(img, fit: BoxFit.cover),
        ),
        Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 1.0,
                    sigmaY: 1,
                  ),
                  // Needs a child (even a transparent Container) to dictate bounds
                  child: Container(
                    color: AppColors.onBackground.withValues(alpha: 0.4),
                  ),
                ),
              ),
        ]
      ),
    );
  }
}
