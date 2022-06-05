import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/presentaion/forgot_password/cubit/forgot_password_cubit.dart';
import '../../resources/strings_manager.dart';

class BuildSubmitForgotPasswordButton extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  BuildSubmitForgotPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(
              ForgotPasswordCubit.get(context).isInputValid
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
            ),
          ),
      onPressed: ForgotPasswordCubit.get(context).isInputValid
          ? () =>
              context.read<ForgotPasswordCubit>().submitForgotPassword(context)
          : null,
      child: Text(
        AppStrings.submit.tr(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
