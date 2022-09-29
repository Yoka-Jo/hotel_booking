import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/presentaion/common/components/build_auth_image.dart';
import 'package:hotel_booking/presentaion/common/state_renderer/state_renderer_impl.dart';
import 'package:hotel_booking/presentaion/login/widgets/build_login_button.dart';
import 'package:hotel_booking/presentaion/resources/assets_manager.dart';
import 'package:hotel_booking/presentaion/resources/strings_manager.dart';
import 'package:sizer/sizer.dart';
import '../../../app/app_prefs.dart';
import '../../../app/dependency_injection.dart';
import '../../resources/routes_manager.dart';
import '../cubit/login_cubit.dart';
import '../widgets/build_forget_password.dart';
import '../widgets/build_login_fields.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final AppPreferences _appPrefs = instance<AppPreferences>();
  final TextEditingController _emailEditingcontroller = TextEditingController();
  final TextEditingController _passwordEditingcontroller =
      TextEditingController();

  void _bind() {
    _emailEditingcontroller.addListener(() {
      context.read<LoginCubit>().setEmail(_emailEditingcontroller.text);
    });
    _passwordEditingcontroller.addListener(() {
      context.read<LoginCubit>().setPassword(_passwordEditingcontroller.text);
    });
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LogInSuccessfullyState) {
          await _appPrefs.saveUserData(state.authData.data!);
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.mainRoute,
              (route) => true,
            );
          });
        }
      },
      builder: (context, state) {
        return LoginCubit.get(context)
            .currentState
            .getScreenWidget(context, _getContentWidget(context), () {});
      },
    );
  }

  Scaffold _getContentWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BuildAuthImage(imagePath: ImageAssets.personImage),
              Text(
                AppStrings.welcomeBadk,
                style: Theme.of(context).textTheme.titleLarge,
              ).tr(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.6.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BuildLogInFields(
                      emailController: _emailEditingcontroller,
                      passwordController: _passwordEditingcontroller,
                    ),
                    SizedBox(
                      height: 1.25.h,
                    ),
                    const BuildForgetPassword(),
                    SizedBox(
                      height: 4.5.h,
                    ),
                    BuildLogInButton(),
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
    _emailEditingcontroller.dispose();
    _passwordEditingcontroller.dispose();
    super.dispose();
  }
}
