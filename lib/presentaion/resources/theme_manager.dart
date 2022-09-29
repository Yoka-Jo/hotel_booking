import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking/presentaion/resources/styles_manager.dart';
import 'package:sizer/sizer.dart';

import 'colors_manager.dart';

ThemeData getAppTheme({required bool isLight}) {
  Color textColor =
      isLight ? AppColors.lightTextColor : AppColors.darkTextColor;
  return ThemeData(
    brightness: isLight ? Brightness.light : Brightness.dark,
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.primary),
    primaryColor: AppColors.primary,
    backgroundColor: isLight ? Colors.white : Colors.black,
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
        fixedSize: Size(double.infinity, 10.h),
        backgroundColor: AppColors.primary,
        textStyle: TextStyle(color: isLight ? Colors.white : Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.6.h),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: isLight ? Colors.black : Colors.white,
        elevation: 0.0,
        fixedSize: Size(double.infinity, 10.h),
        side: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: getBoldStyle(
          color: textColor, fontSize: 22.sp, family: FontFamilies.lato),
      titleMedium: getMediumStyle(color: textColor, fontSize: 20.sp),
      titleSmall: getLightStyle(color: textColor),
      headlineLarge: getBoldStyle(
        color: textColor,
        fontSize: 20.sp,
      ),
      headlineMedium: getBoldStyle(
          color: textColor, fontSize: 20.sp, family: FontFamilies.lato),
      headlineSmall: getRegularStyle(color: textColor, fontSize: 11.7.sp),
      displayLarge: getMediumStyle(color: textColor, fontSize: 16.7.sp),
      displayMedium: getRegularStyle(color: textColor, fontSize: 13.3.sp),
      displaySmall: getSemiBoldStyle(color: textColor, fontSize: 10.sp),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isCollapsed: true,
      contentPadding: EdgeInsets.all(2.7.h),
      fillColor: AppColors.grey,
      filled: true,
      errorStyle: getRegularStyle(color: AppColors.red, fontSize: 13.3.sp),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.6.h),
          borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.6.h),
        borderSide: BorderSide(
            width: 1.0, color: isLight ? Colors.black : Colors.white),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.6.h),
        borderSide: const BorderSide(width: 1.0, color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.6.h),
          borderSide: BorderSide(
              width: 1.0, color: isLight ? Colors.black : Colors.white)),
    ),
  );
}

ThemeData getLightTheme() => getAppTheme(isLight: true);
ThemeData getDarkTheme() => getAppTheme(isLight: false);
