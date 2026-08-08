
import 'package:ecommerce_project/core/routes/app_routes.dart';
import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/shared/widgets/aura_logo.dart';
import 'package:flutter/material.dart';

class SimpleCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleCustomAppBar({
    super.key,
  });
  @override
   Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      leading: IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        },
        icon: Icon(Icons.arrow_back),
      ),
      title: AuraLogo(),
      centerTitle: true,
    );
  }
}
