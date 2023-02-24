import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/app/dependency_injection.dart';
import 'package:hotel_booking/app/my_app.dart';
import 'package:hotel_booking/presentaion/resources/cubit/change_theme_cubit.dart';
import 'package:hotel_booking/presentaion/resources/localization/cubit/change_language_cubit.dart';
import 'package:hotel_booking/presentaion/resources/localization/language_manager.dart';
import 'firebase_options.dart';
import 'presentaion/common/components/show_toast.dart';

void notificationToast(RemoteMessage message) =>
    showToast(message.notification?.body ?? "", ToastState.success);

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async =>
    notificationToast(message);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'HotelBooking',
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ChangeThemeCubit(),
        ),
        BlocProvider(
          create: (_) => ChangeLanguageCubit(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [
          arabicLocal,
          englishLocal,
        ],
        path: assetPathLocalizations,
        child: MyApp(),
      ),
    ),
  );
}
