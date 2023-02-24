import 'package:flutter/material.dart';

enum LanguageType { english, arabic }

const String arabic = "ar_EG";
const String english = "en_US";
const String assetPathLocalizations = "assets/translations";

const Locale arabicLocal = Locale("ar", "EG");
const Locale englishLocal = Locale("en", "US");

extension LanguageTypExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.arabic:
        return arabic;
      case LanguageType.english:
        return english;
    }
  }
}
