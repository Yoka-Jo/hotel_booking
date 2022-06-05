import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/presentaion/resources/routes_manager.dart';

import '../../resources/colors_manager.dart';
import '../../resources/strings_manager.dart';

class BuildForgetPassword extends StatelessWidget {
  const BuildForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.forgotPasswordRoute);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: RichText(
          text: TextSpan(
            text: AppStrings.forgetPassword.tr().split("|")[0],
            style: Theme.of(context).textTheme.displaySmall,
            children: [
              TextSpan(
                  text: AppStrings.forgetPassword.tr().split("|")[1],
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.red))
            ],
          ),
        ),
      ),
    );
  }
}
