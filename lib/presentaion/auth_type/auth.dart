// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/http_exception.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Auth with ChangeNotifier {
//   String _token;
//   DateTime _expiryDate;
//   String _userId;

//   String get userId {
//     return _userId;
//   }

//   bool get isAuth {
//     return token != null;
//   }

//   String get token {
//     if (_expiryDate != null &&
//         _expiryDate.isAfter(DateTime.now()) &&
//         _token != null) {
//       return _token;
//     }
//     return null;
//   }

//   Future<void> _authentication(
//       String email, String password, String urlSegment) async {
//     final url =
//         'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyA1Vg5_lRejVN_bH6hLlrE_6BUQo39ISOI';
//     try {
//       final response = await http.post(
//         url,
//         body: json.encode(
//           {'email': email, 'password': password, 'returnSecureToken': true},
//         ),
//       );
//       final responseData = json.decode(response.body);
//       if (responseData['error'] != null) {
//         throw HttpException(responseData['error']['message']);
//       }
//       _userId = responseData['localId'];
//       _token = responseData['idToken'];
//       _expiryDate = DateTime.now().add(
//         Duration(
//           seconds: int.parse(responseData['expiresIn']),
//         ),
//       );
//       notifyListeners();
//       final prefs = await SharedPreferences.getInstance();
//       final userData = json.encode({
//         'token': _token,
//         'userId': _userId,
//         'expiryDate': _expiryDate.toIso8601String()
//       });
//       prefs.setString('userData', userData);
//     } catch (error) {
//       throw error;
//     }
//   }

//   Future<void> signUp(String email, String password) async {
//     return _authentication(email, password, 'signUP');
//   }

//   Future<void> logIn(String email, String password) async {
//     return _authentication(email, password, 'signInWithPassword');
//   }

//   void logOut() {
//     _token = null;
//     _userId = null;
//     _expiryDate = null;
//     notifyListeners();
//   }

//   Future<bool> tryAutoLogin() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (!prefs.containsKey('userData')) {
//       return false;
//     }
//     final extractedUserData = json.decode(prefs.getString('userData')) as Map<String, Object>;
//     final expiryDate =   DateTime.parse(extractedUserData['expiryDate']);

//     if (expiryDate.isBefore(DateTime.now())) {
//       return false;
//     }
//     _token = extractedUserData['token'];
//     _userId = extractedUserData['userId'];
//     _expiryDate = expiryDate;
//     notifyListeners();
//     return true;
//   }
// }
