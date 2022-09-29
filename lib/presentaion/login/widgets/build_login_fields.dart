import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../common/components/build_text_from_field.dart';
import '../../resources/strings_manager.dart';
import '../cubit/login_cubit.dart';

class BuildLogInFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const BuildLogInFields({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit.get(context);

    return Column(
      children: [
        BuildTextFormField(
          label: AppStrings.email.tr(),
          errorText: cubit.errorEmail,
          controller: emailController,
        ),
        SizedBox(
          height: 3.h,
        ),
        BuildTextFormField(
          label: AppStrings.password.tr(),
          errorText: cubit.errorPassword,
          controller: passwordController,
        ),
      ],
    );
  }
}
