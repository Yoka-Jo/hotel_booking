import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/presentaion/common/state_renderer/state_renderer_impl.dart';
import 'package:hotel_booking/presentaion/login/viewmodel/cubit/login_cubit.dart';
import 'package:hotel_booking/presentaion/resources/assets_manager.dart';
import 'package:hotel_booking/presentaion/resources/strings_manager.dart';
import '../../../app/app_prefs.dart';
import '../../../app/dependency_injection.dart';
import '../../resources/routes_manager.dart';
import '../widgets/build_forget_password.dart';
import '../widgets/build_login_button.dart';
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
      LoginCubit.get(context).setEmail(_emailEditingcontroller.text);
    });
    _passwordEditingcontroller.addListener(() {
      LoginCubit.get(context).setPassword(_passwordEditingcontroller.text);
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
            Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
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
              const SizedBox(height: 130),
              SvgPicture.asset(ImageAssets.personImage),
              const SizedBox(height: 16),
              Text(
                AppStrings.welcomeBadk,
                style: Theme.of(context).textTheme.titleLarge,
              ).tr(),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BuildLogInFields(
                          emailController: _emailEditingcontroller,
                          passwordController: _passwordEditingcontroller),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const BuildForgetPassword(),
                      const SizedBox(
                        height: 30.0,
                      ),
                      BuildLogInButton()
                    ],
                  ),
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
