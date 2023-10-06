import 'package:dalel/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class ForgotPasswrodImage extends StatelessWidget {
  const ForgotPasswrodImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 235,
        width: 235,
        child: Image.asset(
          Assets.imagesForgotPassword,
        ));
  }
}
