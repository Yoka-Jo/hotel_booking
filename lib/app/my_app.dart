import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking/presentaion/resources/cubit/change_theme_cubit.dart';
import 'package:hotel_booking/presentaion/resources/routes_manager.dart';
import 'package:hotel_booking/presentaion/resources/theme_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import '../presentaion/common/state_renderer/cubit/flow_state_cubit.dart';
import '../presentaion/resources/localization/cubit/change_language_cubit.dart';

class MyApp extends StatefulWidget {
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;
  const MyApp._internal();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void didChangeDependencies() {
    Future.wait([
      ChangeThemeCubit.get(context).initTheme(),
      ChangeLanguageCubit.get(context).initLanguage().then(
            (locale) => context.setLocale(locale),
          ),
    ]);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider(
        create: (context) => FlowStateCubit(),
        child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
          builder: (context, state) {
            return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
              builder: (context, state) {
                return MaterialApp(
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  debugShowCheckedModeBanner: false,
                  theme:
                      ChangeThemeCubit.get(context).themeMode == ThemeMode.light
                          ? getLightTheme()
                          : getDarkTheme(),
                  onGenerateRoute: RoutesGenerator.getRoutes,
                  initialRoute: Routes.splashRoute,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
