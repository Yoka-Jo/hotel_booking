import 'package:flutter/material.dart';
import 'package:hotel_booking/app/app_prefs.dart';

class AutoAuthentication with ChangeNotifier {
  // ignore: unused_field
  final AppPreferences _appPrefs;
  // Timer? _authTimer;
  AutoAuthentication(this._appPrefs);
  // bool isLoggedIn = true;

  // Future<bool> tryAutoLogin(BuildContext context) async {
  //   if (!_appPrefs.containsKey(key: kPrefsUserData)) {
  //     return false;
  //   }
  //   final extractedUserData = json
  //       .decode(_appPrefs.getData(key: kPrefsUserData)) as Map<String, dynamic>;
  //   log(extractedUserData.toString());
  //   final expiryDate =
  //       DateTime.parse(extractedUserData['expiryDate'].toString());

  //   if (expiryDate.isBefore(DateTime.now())) {
  //     return false;
  //   }
  //   return true;
  // }

  // void logout(BuildContext context) async {
  //   if (_authTimer != null) {
  //     _authTimer?.cancel();
  //     _authTimer = null;
  //   }
  //   await _appPrefs.removeData(key: kPrefsUserData);
  //   isLoggedIn = false;
  //   notifyListeners();
  //   // Navigator.of(context).pushReplacementNamed(Routes.authTypeRoute);
  // }

  // void autoLogout({required BuildContext context, DateTime? expiryDate}) {
  //   if (_authTimer != null) {
  //     _authTimer!.cancel();
  //   }
  //   expiryDate ??= DateTime.now().add(const Duration(seconds: 10));
  //   final timeToExpiry = expiryDate.difference(DateTime.now()).inSeconds;
  //   _authTimer = Timer(Duration(seconds: timeToExpiry), () => logout(context));
  // }
}
