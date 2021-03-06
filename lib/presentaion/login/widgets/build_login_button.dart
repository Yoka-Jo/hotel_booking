import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resources/strings_manager.dart';
import '../cubit/login_cubit.dart';

class BuildLogInButton extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  BuildLogInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(
              LoginCubit.get(context).areInputsValid
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
            ),
          ),
      onPressed: LoginCubit.get(context).areInputsValid
          ? () => context.read<LoginCubit>().login(context)
          : null,
      child: Text(
        AppStrings.signIn.tr(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
