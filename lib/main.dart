import 'dart:developer';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hotel_booking/app/dependency_injection.dart';
import 'package:hotel_booking/app/my_app.dart';
import 'package:hotel_booking/presentaion/resources/language_manager.dart';
import 'presentaion/common/components/show_toast.dart';

void notificationToast(RemoteMessage message) =>
    showToast(message.notification?.body ?? "", ToastState.success);

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async =>
    notificationToast(message);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  await initAppModule();

  var token = await FirebaseMessaging.instance.getToken();
  log("This is my token");
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
        child: DevicePreview(
          enabled: kDebugMode,
          builder: (context) => MyApp(), // Wrap your app
        ),
      ),
      supportedLocales: const [
        arabicLocal,
        englishLocal,
      ],
      path: assetPathLocalizations,
    ),
  );
}
