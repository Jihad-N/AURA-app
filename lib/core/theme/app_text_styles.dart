import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle displayLarge = TextStyle(
    fontFamily: 'EB Garamond',
    fontSize: 40,
    fontWeight: FontWeight.w500,
    height: 56 / 48,
    color: AppColors.inverseSurface,
  );
  static const TextStyle wHeadlineMedium = TextStyle(
    fontFamily: 'EB Garamond',
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 40 / 32,
    color: AppColors.onPrimary,
  );
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: 'EB Garamond',
    fontSize: 40,
    fontWeight: FontWeight.w500,
    height: 40 / 32,
    color: AppColors.primary,
  );
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: 'EB Garamond',
    fontSize: 36,
    fontWeight: FontWeight.w500,
    height: 40 / 32,
    color: AppColors.darkPrimary,
  );
  static const TextStyle headlineSmall = TextStyle(
    fontFamily: 'EB Garamond',
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: 28 / 22,
    color: AppColors.darkPrimary,
  );
  static const TextStyle blackHeadingSmall = TextStyle(
    fontFamily: 'EB Garamond',
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 28 / 22,
    color: AppColors.inverseSurface,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: 'Hanken Grotesk',
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 28 / 22,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'Hanken Grotesk',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: 'Hanken Grotesk',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    color: AppColors.textSecondary,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: 'Hanken Grotesk',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
    letterSpacing: 0.6,
    color: AppColors.textSecondary,
  );

  static const TextStyle wLabelLarge = TextStyle(
    fontFamily: 'Hanken Grotesk',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
    letterSpacing: 0.6,
    color: AppColors.background,
  );

  static const TextStyle bLabelLarge = TextStyle(
    fontFamily: 'Hanken Grotesk',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
    letterSpacing: 0.6,
    color: AppColors.inverseSurface,
  );

  static const TextStyle bLabelMedium = TextStyle(
    fontFamily: 'Hanken Grotesk',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
    letterSpacing: 0.6,
    color: AppColors.inverseSurface,
  );
  static const TextStyle bLabelSmall = TextStyle(
    fontFamily: 'Hanken Grotesk',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 16 / 10,
    letterSpacing: 0.6,
    color: AppColors.inverseSurface,
  );
  static const TextStyle link = TextStyle(
    fontFamily: 'Hanken Grotesk',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
    letterSpacing: 0.6,
    color: AppColors.darkPrimary,
    decoration: TextDecoration.underline,
  );
}
