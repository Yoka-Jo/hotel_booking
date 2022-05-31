import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/presentaion/signup/viewmodel/cubit/signup_cubit.dart';

import '../../resources/strings_manager.dart';

class BuildSignUpButton extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  BuildSignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = SignUpCubit.get(context);
    return ElevatedButton(
      onPressed: cubit.areInputsValid ? () => cubit.signUp(context) : null,
      child: Text(
        AppStrings.signUp.tr(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
