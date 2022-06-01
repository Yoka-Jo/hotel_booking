import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking/presentaion/resources/styles_manager.dart';

import 'colors_manager.dart';

ThemeData getAppTheme({required bool isLight}) {
  Color textColor =
      isLight ? AppColors.lightTextColor : AppColors.darkTextColor;
  return ThemeData(
    brightness: isLight ? Brightness.light : Brightness.dark,
    primaryColor: AppColors.primary,
    disabledColor: isLight ? AppColors.grey : Colors.white24,
    splashColor: AppColors.primary,
    scaffoldBackgroundColor: isLight ? Colors.white : Colors.black12,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
      ),
      backgroundColor: isLight ? Colors.white : Colors.black,
      elevation: 0.0,
      foregroundColor: isLight ? Colors.black : Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        fixedSize: const Size(double.infinity, 64),
        primary: AppColors.primary,
        textStyle: TextStyle(color: isLight ? Colors.white : Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0.0,
        fixedSize: const Size(double.infinity, 64),
        side: const BorderSide(color: AppColors.primary, width: 1.5),
        primary: isLight ? Colors.black : Colors.white,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: getBoldStyle(
          color: textColor, fontSize: 24, family: FontFamilies.lato),
      titleMedium: getMediumStyle(color: textColor, fontSize: 24),
      titleSmall: getLightStyle(color: textColor),
      headlineLarge: getBoldStyle(
        color: textColor,
        fontSize: 24,
      ),
      headlineMedium: getBoldStyle(
          color: textColor, fontSize: 16, family: FontFamilies.lato),
      headlineSmall: getRegularStyle(color: textColor, fontSize: 14),
      displayLarge: getMediumStyle(color: textColor, fontSize: 20),
      displayMedium: getRegularStyle(color: textColor, fontSize: 16),
      displaySmall: getSemiBoldStyle(color: textColor, fontSize: 12),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(10.0),
      fillColor: AppColors.grey,
      filled: true,
      errorStyle: getRegularStyle(color: AppColors.red),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
            width: 1.0, color: isLight ? Colors.black : Colors.white),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 1.0, color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              width: 1.0, color: isLight ? Colors.black : Colors.white)),
    ),
  );
}

ThemeData getLightTheme() => getAppTheme(isLight: true);
ThemeData getDarkTheme() => getAppTheme(isLight: false);
