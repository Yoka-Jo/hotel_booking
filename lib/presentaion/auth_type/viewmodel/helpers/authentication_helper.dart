import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hotel_booking/app/app_prefs.dart';

class AuthenticationHelper {
  AuthenticationHelper(this._appPrefs);
  final AppPreferences _appPrefs;
  Timer? _authTimer;

  Future<bool> tryAutoLogin() async {
    if (!_appPrefs.containsKey(key: kPrefsUserData)) {
      return false;
    }
    final extractedUserData = _appPrefs.getUserData();
    final expiryDate =
        DateTime.parse(extractedUserData['expiryDate'].toString());
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    return true;
  }

  void logout(BuildContext context) async {
    if (_authTimer != null) {
      _authTimer?.cancel();
      _authTimer = null;
    }
    await _appPrefs.removeData(key: kPrefsUserData);
    Phoenix.rebirth(context);
  }

  void autoLogout(BuildContext context) {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final extractedUserData = _appPrefs.getUserData();
    final expiryDate =
        DateTime.parse(extractedUserData['expiryDate'].toString());
    final timeToExpiry = expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), () => logout(context));
  }
}
