import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../../../../app/app_prefs.dart';
import '../../../../../app/dependency_injection.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/strings_manager.dart';

class BuildChangeAppTheme extends StatefulWidget {
  const BuildChangeAppTheme({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildChangeAppTheme> createState() => _BuildChangeAppThemeState();
}

class _BuildChangeAppThemeState extends State<BuildChangeAppTheme> {
  final AppPreferences _appPrefs = instance<AppPreferences>();
  @override
  void initState() {
    super.initState();
    isEnabled = _appPrefs.getAppThemeMode();
  }

  bool isEnabled = false;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: isEnabled,
      activeColor: AppColors.primary,
      onChanged: (value) {
        changeTheme();
      },
      title: Text(
          isEnabled ? AppStrings.lightMode.tr() : AppStrings.darkMode.tr()),
    );
  }

  Future<void> changeTheme() async {
    await _appPrefs.changeAppTheme();
    Phoenix.rebirth(context);
  }
}
