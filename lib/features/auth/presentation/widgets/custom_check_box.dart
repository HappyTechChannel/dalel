
import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomChechBox extends StatefulWidget {
  const CustomChechBox({super.key});

  @override
  State<CustomChechBox> createState() => _CustomChechBoxState();
}

class _CustomChechBoxState extends State<CustomChechBox> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: value,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: BorderSide(
          color: AppColors.grey,
        ),
        onChanged: (newValue) {
          setState(() {
            value = newValue;
          });
        });
  }
}