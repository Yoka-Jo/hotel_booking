import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resources/strings_manager.dart';
import '../cubit/reset_password_cubit.dart';

class BuildResetPasswordButton extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  BuildResetPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(
              ResetPasswordCubit.get(context).areInputsValid
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
            ),
          ),
      onPressed: ResetPasswordCubit.get(context).areInputsValid
          ? () => context.read<ResetPasswordCubit>().resetPassword(context)
          : null,
      child: Text(
        AppStrings.reset.tr(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
