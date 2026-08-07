
import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/shared/widgets/aura_logo.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      leading: Padding(
        padding: const EdgeInsets.all(6.0),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.onBackground,
          child: Icon(Icons.person, color: AppColors.primary),
        ),
      ),
      title: AuraLogo(),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.notifications_none, color: AppColors.darkPrimary),
        ),
      ],
    );
  }
}
