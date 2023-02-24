import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:hotel_booking/presentaion/common/components/build_text_from_field.dart';
import 'package:hotel_booking/presentaion/reset_password/cubit/reset_password_cubit.dart';
import 'package:hotel_booking/presentaion/resources/strings_manager.dart';

class BuildResetPasswordInputFields extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  const BuildResetPasswordInputFields({
    Key? key,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ResetPasswordCubit.get(context);
    return Column(
      children: [
        BuildTextFormField(
          textInputAction: TextInputAction.next,
          label: AppStrings.password.tr(),
          controller: passwordController,
          errorText: cubit.errorPassword,
        ),
        const SizedBox(
          height: 20.0,
        ),
        BuildTextFormField(
          textInputAction: TextInputAction.done,
          label: AppStrings.confirmPassword.tr(),
          controller: confirmPasswordController,
          errorText: cubit.errorConfirmPassword,
        ),
      ],
    );
  }
}
