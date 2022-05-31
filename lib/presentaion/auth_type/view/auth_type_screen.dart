import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/app/functions.dart';
import '../../resources/assets_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';

class AuthTypeScreen extends StatelessWidget {
  const AuthTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(
              height: 124,
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
            const SizedBox(
              height: 52,
            ),
            SvgPicture.asset(ImageAssets.travelImage),
            const SizedBox(
              height: 50,
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
            const SizedBox(
              height: 20,
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
}
