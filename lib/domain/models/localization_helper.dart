import 'package:flutter/material.dart';
//-------------------------------------
import './app_localization.dart';
//-------------------------------

extension Translate on String {
  /// This method gets the translation of given translation id
  /// based on the current language of the app.
  String translate(BuildContext context) {
    AppLocalization? appLocalization = AppLocalization.of(context);
    return appLocalization!.translate(this) ?? "";
  }
}

extension AppLanguage on BuildContext {
  /// returns current language code.
  String get langCode {
    Locale appLocale = Localizations.localeOf(this);
    return appLocale.languageCode;
  }
}
