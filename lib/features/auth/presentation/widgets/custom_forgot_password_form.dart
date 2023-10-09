import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForgotPasswrodForm extends StatelessWidget {
  const CustomForgotPasswrodForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          showToast("Check Your Email To Reset Your Password");
          customReplacementNavigate(context, "/signIn");
        } else if (state is ResetPasswordFailureState) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: authCubit.forgotPasswordFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: AppStrings.emailAddress,
                  onChanged: (email) {
                    authCubit.emailAddress = email;
                  },
                ),
                const SizedBox(height: 129),
                state is ResetPasswordLoadingState
                    ? CircularProgressIndicator(color: AppColors.primaryColor)
                    : CustomBtn(
                        onPressed: () async {
                          if (authCubit.forgotPasswordFormKey.currentState!
                              .validate()) {
                            await authCubit.resetPasswordWithLink();
                          }
                        },
                        text: AppStrings.sendResetPasswordLink),
              ],
            ),
          ),
        );
      },
    );
  }
}
