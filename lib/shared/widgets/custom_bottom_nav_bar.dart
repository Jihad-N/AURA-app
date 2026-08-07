import 'package:ecommerce_project/core/routes/app_routes.dart';
import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  const CustomBottomNavBar({super.key, required this.currentIndex});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      selectedItemColor: AppColors.darkPrimary,
      unselectedItemColor: AppColors.textSecondary,
      items: [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home_outlined)),
        BottomNavigationBarItem(
          label: 'Cart',
          icon: Icon(Icons.shopping_bag_outlined),
          activeIcon: Icon(Icons.shopping_bag),
        ),
        BottomNavigationBarItem(
          label: 'Favourites',
          icon: Icon(Icons.favorite_border),
          activeIcon: Icon(Icons.favorite)
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.person_2_outlined),
          activeIcon: Icon(Icons.person_2)
        ),
      ],
      onTap: (int index) {
        if (index == widget.currentIndex) return;
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, AppRoutes.home);
            break;
          case 1:
            Navigator.pushReplacementNamed(context, AppRoutes.cart);
            break;
          case 2:
            Navigator.pushReplacementNamed(context, AppRoutes.favorite).then((_){
              setState(() {});
            });
            break;
          case 3:
            Navigator.pushReplacementNamed(context, AppRoutes.home);
            break;
        }
      },
    );
  }
}