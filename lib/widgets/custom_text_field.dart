import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.isObsecureText,
    required this.icon,
    required this.onChanged,
  });
  final String hintText;
  final bool isObsecureText;
  final Icon icon;
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 4),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'field is required';
          }
          return null;
        },
        onChanged: onChanged,
        obscureText: isObsecureText,
        // style: mediumBlackText,
        decoration: InputDecoration(
          prefixIcon: icon,
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: AppTextStyles.bodyMedium,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
