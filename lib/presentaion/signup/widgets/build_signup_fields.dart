import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/components/build_text_from_field.dart';
import '../../resources/strings_manager.dart';
import '../cubit/signup_cubit.dart';

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
          textInputAction: TextInputAction.next,
          label: AppStrings.fullName.tr(),
          controller: nameController,
          errorText: cubit.errorName,
        ),
        SizedBox(
          height: 18.h,
        ),
        BuildTextFormField(
          textInputAction: TextInputAction.next,
          label: AppStrings.email.tr(),
          controller: emailController,
          errorText: cubit.errorEmail,
        ),
        SizedBox(
          height: 18.h,
        ),
        BuildTextFormField(
          textInputAction: TextInputAction.next,
          label: AppStrings.password.tr(),
          controller: passwordController,
          errorText: cubit.errorPassword,
        ),
      ],
    );
  }
}
