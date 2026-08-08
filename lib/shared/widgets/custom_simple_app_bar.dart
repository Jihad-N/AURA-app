import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/shared/widgets/aura_logo.dart';
import 'package:flutter/material.dart';

class SimpleCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final List<Widget>? actions;
  const SimpleCustomAppBar({super.key, this.actions});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
      title: AuraLogo(),
      centerTitle: true,
      actions: actions,
    );
  }
}
