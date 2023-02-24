import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/presentaion/resources/cubit/change_theme_cubit.dart';

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
  @override
  void initState() {
    super.initState();
    isEnabled = ChangeThemeCubit.get(context).themeMode == ThemeMode.light;
  }

  bool isEnabled = false;
  @override
  Widget build(BuildContext context) {
    context.locale;
    return SwitchListTile.adaptive(
      value: isEnabled,
      activeColor: AppColors.primary,
      onChanged: changeTheme,
      title: Text(
        isEnabled ? AppStrings.lightMode.tr() : AppStrings.darkMode.tr(),
      ),
    );
  }

  Future<void> changeTheme(bool value) async {
    ChangeThemeCubit.get(context).changeTheme(isLight: value).then((themeMode) {
      setState(() {
        isEnabled = themeMode == ThemeMode.light;
      });
    });
  }
}
