import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/presentaion/resources/routes_manager.dart';

import '../../../../../app/app_prefs.dart';
import '../../../../../app/dependency_injection.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/strings_manager.dart';

class BuildLogoutButton extends StatelessWidget {
  final AppPreferences _appPrefs = instance<AppPreferences>();
  BuildLogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(AppColors.red)),
        onPressed: () => logout(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.logout.tr(),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.white),
            ),
            const Icon(
              Icons.logout,
              size: 25.0,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logout(context) async {
    await _appPrefs.logout();
    Navigator.of(context).pushReplacementNamed(Routes.authTypeRoute);
  }
}
