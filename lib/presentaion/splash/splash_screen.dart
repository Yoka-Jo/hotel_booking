import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/app/app_prefs.dart';

import '../../app/dependency_injection.dart';
import '../auth_type/viewmodel/helpers/authentication_helper.dart';
import '../resources/assets_manager.dart';
import '../resources/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  final AppPreferences _appPrefs = instance<AppPreferences>();
  final AuthenticationHelper _auth = instance<AuthenticationHelper>();

  void _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  void _goNext() async {
    bool isOnBoardingScreenViewed = _appPrefs.getIsOnBoardingScreenViewed();
    if (isOnBoardingScreenViewed) {
      if (await _auth.tryAutoLogin()) {
        if (!mounted) return;
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.mainRoute,
          (route) => false,
        );
      } else {
        if (!mounted) return;
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.authTypeRoute,
          (route) => false,
        );
      }
    } else {
      Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(ImageAssets.splashLogo),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
