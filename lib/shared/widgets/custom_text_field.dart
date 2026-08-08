import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.isObsecureText,
    required this.icon,
    this.onChanged,
    this.sufIcon,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
    required this.controller,
    this.fillColor = Colors.white, this.keyboardtype,
  });
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hintText;
  final bool isObsecureText;
  final Icon icon;
  final Icon? sufIcon;
  final AutovalidateMode? autoValidateMode;
  final Function(String)? onChanged;
  final Color? fillColor;
  final TextInputType? keyboardtype;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 4),
      child: TextFormField(
        keyboardType: keyboardtype,
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        obscureText: isObsecureText,
        autovalidateMode: autoValidateMode,
        decoration: InputDecoration(
          prefixIcon: icon,
          suffixIcon: sufIcon,
          filled: true,
          fillColor: fillColor,
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
