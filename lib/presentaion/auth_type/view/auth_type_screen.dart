import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/app/functions.dart';
import 'package:hotel_booking/presentaion/common/components/build_auth_image.dart';
import 'package:sizer/sizer.dart';
import '../../../app/app_prefs.dart';
import '../../../app/dependency_injection.dart';
import '../../common/helpers/dynamic_link_helper.dart';
import '../../resources/assets_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';

class AuthTypeScreen extends StatefulWidget {
  const AuthTypeScreen({Key? key}) : super(key: key);

  @override
  State<AuthTypeScreen> createState() => _AuthTypeScreenState();
}

class _AuthTypeScreenState extends State<AuthTypeScreen>
    with WidgetsBindingObserver {
  final DynamicLinkHelper _dynamicLinkHelper = DynamicLinkHelper();
  late Timer _timerLink;
  final AppPreferences _appPrefs = instance<AppPreferences>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _timerLink = Timer(
        const Duration(milliseconds: 1000),
        () async {
          await _dynamicLinkHelper.retrieveDynamicLink(context);
        },
      );
    }
  }

  @override
  void didChangeDependencies() {
    _appPrefs.getLocal(context).then((locale) => {context.setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: 12.h,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: AppStrings.authTypeScreenTitle.tr().split("|")[0],
                  style: Theme.of(context).textTheme.titleLarge,
                  children: [
                    TextSpan(
                        text: AppStrings.authTypeScreenTitle.tr().split("|")[1],
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.red)),
                    TextSpan(
                        text: AppStrings.authTypeScreenTitle.tr().split("|")[2],
                        style: Theme.of(context).textTheme.titleLarge)
                  ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: const BuildAuthImage(imagePath: ImageAssets.travelImage),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.signupRoute);
              },
              child: Text(
                AppStrings.createAccount,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: getCreateButtonTextColor(context),
                    ),
              ).tr(),
            ),
            SizedBox(
              height: 3.2.h,
            ),
            ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.grey),
                  ),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.loginRoute);
              },
              child: Text(
                AppStrings.signIn.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getCreateButtonTextColor(context) {
    return isLightTheme(context) ? Colors.white : Colors.black;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timerLink.cancel();
    super.dispose();
  }
}
