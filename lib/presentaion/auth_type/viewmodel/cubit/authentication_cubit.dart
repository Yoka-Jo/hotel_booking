import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/app/app_prefs.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this._appPrefs) : super(AuthenticationInitial());
  static AuthenticationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final AppPreferences _appPrefs;
  Timer? _authTimer;
  bool isLoggedIn = true;

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

  void logout() async {
    if (_authTimer != null) {
      _authTimer?.cancel();
      _authTimer = null;
    }
    await _appPrefs.removeData(key: kPrefsUserData);
    log("this is from logout.");
    isLoggedIn = false;
    emit(AuthenticationUserLogOut());
  }

  void autoLogout([DateTime? expiryDate]) {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    expiryDate ??= DateTime.now().add(const Duration(seconds: 10));
    final timeToExpiry = expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
