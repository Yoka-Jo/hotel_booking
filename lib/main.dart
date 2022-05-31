import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hotel_booking/app/dependency_injection.dart';
import 'package:hotel_booking/app/my_app.dart';
import 'package:hotel_booking/presentaion/resources/language_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
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
