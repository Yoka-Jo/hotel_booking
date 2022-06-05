import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../resources/colors_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';

class BuildHaveAccount extends StatelessWidget {
  const BuildHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).popAndPushNamed(Routes.loginRoute);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: RichText(
          text: TextSpan(
            text: AppStrings.haveAccoun.tr().split("|")[0],
            style: Theme.of(context).textTheme.displaySmall,
            children: [
              TextSpan(
                  text: AppStrings.haveAccoun.tr().split("|")[1],
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
