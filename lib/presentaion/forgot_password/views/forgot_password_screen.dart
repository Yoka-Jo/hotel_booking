import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/app/app_prefs.dart';
import 'package:hotel_booking/presentaion/common/components/show_toast.dart';
import 'package:hotel_booking/presentaion/common/state_renderer/state_renderer_impl.dart';
import 'package:hotel_booking/presentaion/forgot_password/widgets/build_submit_forgot_password_button.dart';
import 'package:hotel_booking/presentaion/resources/strings_manager.dart';
import '../../../app/dependency_injection.dart';
import '../cubit/forgot_password_cubit.dart';
import '../widgets/build_forgot_password_input_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final AppPreferences _appPrefs = instance<AppPreferences>();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      context.read<ForgotPasswordCubit>().setEmail(_emailController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
      log(state.toString());
      if (state is ForgetPasswordSuccsessfullyState) {
        showToast(AppStrings.resetLinkHasBeenSent.tr(), ToastState.success);
        _appPrefs.saveForgotPasswordData(state.forgotPassword);
      }
    }, builder: (context, state) {
      log("i'm rebuilding cuz of validation");
      return ForgotPasswordCubit.get(context)
          .currentState
          .getScreenWidget(context, _getContentWidget(context), () {});
    });
  }

  Widget _getContentWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BuildForgotPasswordInputField(
              emailController: _emailController,
            ),
            const SizedBox(
              height: 30.0,
            ),
            BuildSubmitForgotPasswordButton()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
