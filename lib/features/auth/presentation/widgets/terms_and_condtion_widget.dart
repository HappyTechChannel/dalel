import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class TermsAndConidtionWidget extends StatelessWidget {
  const TermsAndConidtionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomChechBox(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: AppStrings.iHaveAgreeToOur,
                  style: CustomTextStyles.pacifico400style12),
              TextSpan(
                  text: AppStrings.termsAndCondition,
                  style: CustomTextStyles.pacifico400style12
                      .copyWith(decoration: TextDecoration.underline)),
            ],
          ),
        ),
      ],
    );
  }
}

