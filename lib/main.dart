import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hotel_booking/app/dependency_injection.dart';
import 'package:hotel_booking/app/my_app.dart';
import 'package:hotel_booking/presentaion/resources/language_manager.dart';
import 'firebase_options.dart';
import 'presentaion/common/components/show_toast.dart';

void notificationToast(RemoteMessage message) =>
    showToast(message.notification?.body ?? "", ToastState.success);

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async =>
    notificationToast(message);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var token = await FirebaseMessaging.instance.getToken();
  log(token ?? "");

  //! Notification while app is running
  FirebaseMessaging.onMessage.listen((message) => notificationToast(message));
  //! Notification when app opens after pressing notification
  FirebaseMessaging.onMessageOpenedApp
      .listen((message) => notificationToast(message));
  //! Notification appears when the app is in background
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  //! Make this app subscribe to all topic so i can send message to all users by api
  FirebaseMessaging.instance.subscribeToTopic("all");

  runApp(
    EasyLocalization(
      child: Phoenix(
        child: MyApp(),
      ),
      supportedLocales: const [
        arabicLocal,
        englishLocal,
      ],
      path: assetPathLocalizations,
    ),
  );
}
