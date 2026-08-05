import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:ecommerce_project/screens/login_screen.dart';
import 'package:ecommerce_project/widgets/splash_custom_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: _SplashBody(),
      duration: 5000,
      splashIconSize: MediaQuery.of(context).size.height,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      // backgroundColor: Colors.transparent,
      nextScreen:  LoginScreen(),
    );
  }
}

class _SplashBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.5,
          colors: [AppColors.onPrimaryContainer, AppColors.onSurface],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          ShaderMask(
            shaderCallback: (Rect bounds) => const LinearGradient(
              colors: [AppColors.primary, AppColors.inversePrimary],
              begin: AlignmentGeometry.bottomCenter,
              end: AlignmentGeometry.center,
            ).createShader(bounds),
            child: Text('AURA', style: AppTextStyles.headlineLarge),
          ),
          Text('HERITAGE & PRECISION', style: AppTextStyles.bodyMedium),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  right: 40,
                  child: SplashCustomImg(img: 'assets/images/ring.png'),
                ),
                Positioned(
                  bottom: 40,
                  left: 40,
                  child: SplashCustomImg(
                    img: 'assets/images/shield.png',
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Divider(
            color: AppColors.onBackground,
            indent: 100,
            endIndent: 100,
          ),
          Text(
            'INITIALIZING GALLERY',
            style: AppTextStyles.wLabelLarge,
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}

