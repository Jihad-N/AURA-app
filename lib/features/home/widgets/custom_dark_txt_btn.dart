import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:ecommerce_project/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomDarkTxtBtn extends StatelessWidget {
  final String txt;
  final void Function() onPressed;
  const CustomDarkTxtBtn({
    super.key,
    required this.txt,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        gradient: btnGradient,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(txt, style: AppTextStyles.bLabelSmall),
      ),
    );
  }
}
