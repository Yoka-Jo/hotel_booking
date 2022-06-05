import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:hotel_booking/presentaion/common/components/build_text_from_field.dart';
import 'package:hotel_booking/presentaion/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:hotel_booking/presentaion/resources/strings_manager.dart';

class BuildForgotPasswordInputField extends StatelessWidget {
  final TextEditingController emailController;
  const BuildForgotPasswordInputField({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ForgotPasswordCubit.get(context);
    return BuildTextFormField(
      label: AppStrings.email.tr(),
      controller: emailController,
      errorText: cubit.errorEmail,
    );
  }
}
