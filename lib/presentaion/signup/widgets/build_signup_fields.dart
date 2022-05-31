import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/presentaion/signup/viewmodel/cubit/signup_cubit.dart';

import '../../common/components/build_text_from_field.dart';
import '../../resources/strings_manager.dart';

class BuildSignUpFields extends StatelessWidget {
  const BuildSignUpFields({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final cubit = SignUpCubit.get(context);
    return Column(
      children: [
        BuildTextFormField(
          label: AppStrings.fullName.tr(),
          controller: nameController,
          errorText: cubit.errorName,
        ),
        const SizedBox(
          height: 20.0,
        ),
        BuildTextFormField(
          label: AppStrings.email.tr(),
          controller: emailController,
          errorText: cubit.errorEmail,
        ),
        const SizedBox(
          height: 20.0,
        ),
        BuildTextFormField(
          label: AppStrings.password.tr(),
          controller: passwordController,
          errorText: cubit.errorPassword,
        ),
      ],
    );
  }
}
