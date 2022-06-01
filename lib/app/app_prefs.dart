import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hotel_booking/domain/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../presentaion/resources/language_manager.dart';

const String kPrefsIsLightTheme = "is_light_theme";
const String kPrefsLang = "app_language";
const String kPrefsKeyIsOnBoardingScreenViewed =
    "PREFS_KEY_IS_ONBOARDING_SCREEN_VIEWED";
const String kPrefsUserData = "userData";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  String getAppLanguage() {
    String? language = _sharedPreferences.getString(kPrefsLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.english.getValue();
    }
  }

  Future<void> changeAppLanguage(LanguageType languageTyp) async =>
      await _sharedPreferences.setString(kPrefsLang, languageTyp.getValue());

  Future<Locale> getLocal() async {
    String currentLang = getAppLanguage();
    log("This is the get local " + currentLang);
    if (currentLang == LanguageType.arabic.getValue()) {
      return arabicLocal;
    } else {
      return englishLocal;
    }
  }

  Map<String, dynamic> getUserData() {
    String? userData = _sharedPreferences.getString(kPrefsUserData);
    if (userData != null && userData.isNotEmpty) {
      return json.decode(userData);
    } else {
      return {};
    }
  }

  Future<bool> saveUserData(AuthData authData) async {
    final userData = json.encode({
      "userName": authData.userName,
      "userId": authData.id,
      'token': authData.token,
      'expiryDate':
          DateTime.now().add(const Duration(hours: 5)).toIso8601String(),
    });
    return await _sharedPreferences.setString(kPrefsUserData, userData);
  }

  Future<bool> saveIsOnBoardingScreenViewed() async {
    return await _sharedPreferences.setBool(
        kPrefsKeyIsOnBoardingScreenViewed, true);
  }

  bool getIsOnBoardingScreenViewed() {
    bool? isOnBoardingScreenViewed =
        _sharedPreferences.getBool(kPrefsKeyIsOnBoardingScreenViewed);
    if (isOnBoardingScreenViewed != null) {
      return isOnBoardingScreenViewed;
    } else {
      return false;
    }
  }

  bool getAppThemeMode() {
    bool? isLight = _sharedPreferences.getBool(kPrefsIsLightTheme);
    if (isLight != null) {
      return isLight;
    } else {
      return true;
    }
  }

  Future<void> changeAppTheme() async {
    bool appTheme = getAppThemeMode();
    if (appTheme == true) {
      await _sharedPreferences.setBool(kPrefsIsLightTheme, false);
    } else {
      await _sharedPreferences.setBool(kPrefsIsLightTheme, true);
    }
  }

  Future<void> logout() async {
    await _sharedPreferences.remove(kPrefsUserData);
  }

  Future<bool> removeData({
    required String key,
  }) async {
    return await _sharedPreferences.remove(key);
  }

  bool containsKey({required String key}) {
    return _sharedPreferences.containsKey(key);
  }
}
