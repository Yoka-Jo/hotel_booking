import 'package:flutter/material.dart';

enum LanguageTyp { english, arabic }

const String arabic = "ar";
const String english = "en";
const String assetPathLocalizations = "assets/translations";

const Locale arabicLocal = Locale("ar", "EG");
const Locale englishLocal = Locale("en", "US");

extension LanguageTypExtension on LanguageTyp {
  String getValue() {
    switch (this) {
      case LanguageTyp.arabic:
        return arabic;
      case LanguageTyp.english:
        return english;
    }
  }
}
