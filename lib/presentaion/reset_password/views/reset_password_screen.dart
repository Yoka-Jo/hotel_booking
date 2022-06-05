import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/app/app_prefs.dart';
import 'package:hotel_booking/presentaion/common/state_renderer/state_renderer_impl.dart';
import 'package:hotel_booking/presentaion/reset_password/widgets/build_reset_password_button.dart';
import 'package:hotel_booking/presentaion/reset_password/widgets/build_reset_password_input_fields.dart';

import '../../../app/dependency_injection.dart';
import '../../resources/routes_manager.dart';
import '../cubit/reset_password_cubit.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final AppPreferences _appPrefs = instance<AppPreferences>();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      context.read<ResetPasswordCubit>().setPassword(_passwordController.text);
    });
    _confirmPasswordController.addListener(() {
      context
          .read<ResetPasswordCubit>()
          .setConfirmPassword(_confirmPasswordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) async {
        if (state is ResetPasswordSuccessfullyState) {
          await _appPrefs.removeData(key: kPrefsForgotPasswordData);
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.authTypeRoute,
                (route) => false,
              );
            },
          );
        }
      },
      builder: (context, state) {
        return ResetPasswordCubit.get(context)
            .currentState
            .getScreenWidget(context, _getContentWidget(context), () {});
      },
    );
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
            BuildResetPasswordInputFields(
              passwordController: _passwordController,
              confirmPasswordController: _confirmPasswordController,
            ),
            const SizedBox(
              height: 30.0,
            ),
            BuildResetPasswordButton()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
