import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/app/app_prefs.dart';
import 'package:hotel_booking/presentaion/common/components/build_auth_image.dart';
import 'package:hotel_booking/presentaion/common/state_renderer/state_renderer_impl.dart';
import 'package:hotel_booking/presentaion/resources/assets_manager.dart';
import 'package:hotel_booking/presentaion/resources/strings_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/dependency_injection.dart';
import '../../resources/routes_manager.dart';
import '../cubit/signup_cubit.dart';
import '../widgets/build_have_account.dart';
import '../widgets/build_signup_button.dart';
import '../widgets/build_signup_fields.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AppPreferences _appPrefs = instance<AppPreferences>();
  final TextEditingController _nameEditingcontroller = TextEditingController();
  final TextEditingController _emailEditingcontroller = TextEditingController();
  final TextEditingController _passwordEditingcontroller =
      TextEditingController();

  void _bind() {
    _nameEditingcontroller.addListener(() {
      context.read<SignUpCubit>().setName(_nameEditingcontroller.text);
    });
    _emailEditingcontroller.addListener(() {
      context.read<SignUpCubit>().setEmail(_emailEditingcontroller.text);
    });
    _passwordEditingcontroller.addListener(() {
      context.read<SignUpCubit>().setPassword(_passwordEditingcontroller.text);
    });
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return SignUpCubit.get(context)
            .currentState
            .getScreenWidget(context, _getContentWidget(context), () {});
      },
      listener: (context, state) async {
        if (state is SignUpSuccessfullyState) {
          await _appPrefs.saveUserData(state.authData.data!);
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.mainRoute, (route) => false);
          });
        }
      },
    );
  }

  Scaffold _getContentWidget(BuildContext context) {
    log(DateTime.now().add(const Duration(hours: 5)).toIso8601String());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BuildAuthImage(imagePath: ImageAssets.spaceImage),
              Text(
                AppStrings.createNewAccount,
                style: Theme.of(context).textTheme.titleLarge,
              ).tr(),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BuildSignUpFields(
                      nameController: _nameEditingcontroller,
                      emailController: _emailEditingcontroller,
                      passwordController: _passwordEditingcontroller,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const BuildHaveAccount(),
                    SizedBox(
                      height: 60.h,
                    ),
                    BuildSignUpButton()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameEditingcontroller.dispose();
    _emailEditingcontroller.dispose();
    _passwordEditingcontroller.dispose();
    super.dispose();
  }
}
