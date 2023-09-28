import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscureText, this.suffixIcon,
  });
  final String labelText;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 24),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "This field is required";
          } else {
            return null;
          }
        },
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText ?? false,
        
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: CustomTextStyles.poppins500style18,
          suffixIcon: suffixIcon,
          border: getBorderStyle(),
          enabledBorder: getBorderStyle(),
          focusedBorder: getBorderStyle(),
        ),
      ),
    );
  }
}

OutlineInputBorder getBorderStyle() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: AppColors.grey));
}
