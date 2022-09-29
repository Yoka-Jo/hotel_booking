import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/app/app_prefs.dart';
import 'package:hotel_booking/app/dependency_injection.dart';
import 'package:hotel_booking/presentaion/resources/routes_manager.dart';
import 'package:hotel_booking/presentaion/resources/theme_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import '../presentaion/common/state_renderer/cubit/flow_state_cubit.dart';

class MyApp extends StatefulWidget {
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;
  const MyApp._internal();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPrefs = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    _appPrefs.getLocal(context).then((locale) => {context.setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => BlocProvider(
        create: (context) => FlowStateCubit(),
        child: MaterialApp(
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: _appPrefs.getAppThemeMode() ? getLightTheme() : getDarkTheme(),
          onGenerateRoute: RoutesGenerator.getRoutes,
          initialRoute: Routes.splashRoute,
        ),
      ),
    );
  }
}
