import 'package:ecommerce_project/core/routes/app_routes.dart';
import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppColors.darkPrimary,
      unselectedItemColor: AppColors.textSecondary,
      items: [
        BottomNavigationBarItem(label: 'home', icon: Icon(Icons.home_outlined)),
        BottomNavigationBarItem(
          label: 'cart',
          icon: Icon(Icons.shopping_bag_outlined),
        ),
        BottomNavigationBarItem(
          label: 'favourite',
          icon: Icon(Icons.favorite_border),
        ),
        BottomNavigationBarItem(
          label: 'profile',
          icon: Icon(Icons.person_2_outlined),
        ),
      ],
      onTap: (int index) {
        if (index == currentIndex) return;
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, AppRoutes.home);
            break;
          case 1:
            Navigator.pushReplacementNamed(context, AppRoutes.home);
            break;
          case 2:
            Navigator.pushReplacementNamed(context, AppRoutes.home);
            break;
          case 3:
            Navigator.pushReplacementNamed(context, AppRoutes.home);
            break;
        }
      },
    );
  }
}