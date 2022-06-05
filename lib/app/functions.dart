import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../presentaion/resources/language_manager.dart';

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isPasswordValid(String password) => password.length >= 6;

ui.TextDirection getTextDirection(BuildContext context) {
  return context.locale == englishLocal
      ? ui.TextDirection.ltr
      : ui.TextDirection.rtl;
}

bool isLightTheme(context) => Theme.of(context).brightness == Brightness.light;
