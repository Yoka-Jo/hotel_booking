import 'dart:convert';
import 'package:hotel_booking/domain/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String kPrefsIsLightTheme = "is_light_theme";
const String kPrefsLang = "app_language";
const String kPrefsKeyIsOnBoardingScreenViewed =
    "PREFS_KEY_IS_ONBOARDING_SCREEN_VIEWED";
const String kPrefsUserData = "userData";
const String kPrefsForgotPasswordData = "forgot_password_data";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

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

  Future<bool> saveForgotPasswordData(ForgotPassword forgotPassword) async {
    final userData = json.encode({
      "userId": forgotPassword.id,
      'token': forgotPassword.token,
    });
    return await _sharedPreferences.setString(
        kPrefsForgotPasswordData, userData);
  }

  Map<String, dynamic> getForgotPasswordData() {
    String? forgotPasswordData =
        _sharedPreferences.getString(kPrefsForgotPasswordData);
    if (forgotPasswordData != null && forgotPasswordData.isNotEmpty) {
      return json.decode(forgotPasswordData);
    } else {
      return {};
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
