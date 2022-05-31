import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/domain/models/models.dart';
import 'package:hotel_booking/presentaion/auth_type/view/auth_type_screen.dart';
import 'package:hotel_booking/presentaion/login/view/login_screen.dart';
import 'package:hotel_booking/presentaion/main/main_screen.dart';
import 'package:hotel_booking/presentaion/map/views/map_screen.dart';
import 'package:hotel_booking/presentaion/onboarding/onboarding_screen.dart';
import 'package:hotel_booking/presentaion/place_details/view/place_details_screen.dart';
import 'package:hotel_booking/presentaion/resources/strings_manager.dart';
import 'package:hotel_booking/presentaion/signup/view/signup_screen.dart';
import 'package:hotel_booking/presentaion/splash/splash_screen.dart';

import '../../app/dependency_injection.dart';
import '../login/viewmodel/cubit/login_cubit.dart';
import '../main/pages/home/viewmodel/cubit/home_cubit.dart';
import '../signup/viewmodel/cubit/signup_cubit.dart';

class Routes {
  static const String splashRoute = "/splash";
  static const String loginRoute = "/login";
  static const String authTypeRoute = "/auth-type";
  static const String signupRoute = "/signup";
  static const String onboardingRoute = "/onboarding";
  static const String mainRoute = "/main";
  static const String placeDetailsRoute = "/place-details";
  static const String mapRoute = "/map";
}

class RoutesGenerator {
  static Route getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        {
          return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
      case Routes.onboardingRoute:
        {
          return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
        }
      case Routes.loginRoute:
        {
          initLoginModule();
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) => instance<LoginCubit>(),
              child: const LogInScreen(),
            ),
          );
        }
      case Routes.signupRoute:
        {
          initSignUpModule();
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) => instance<SignUpCubit>(),
              child: const SignUpScreen(),
            ),
          );
        }
      case Routes.authTypeRoute:
        {
          return MaterialPageRoute(builder: (_) => const AuthTypeScreen());
        }
      case Routes.mainRoute:
        {
          initHomeModule();
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => instance<HomeCubit>(),
                    child: const MainScreen(),
                  ));
        }
      case Routes.placeDetailsRoute:
        {
          final hotelData = settings.arguments as HotelData;
          return MaterialPageRoute(
            builder: (_) => PlaceDetailsScreen(
              hotelData: hotelData,
            ),
          );
        }
      case Routes.mapRoute:
        {
          final location = settings.arguments as Location;
          return MaterialPageRoute(
              builder: (_) => MapScreen(
                    longitude: location.longitude,
                    latitude: location.latitude,
                  ));
        }
      default:
        return unDefinedRoute();
    }
  }

  static Route unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(
                child: const Text(
                  AppStrings.noRouteFound,
                ).tr(),
              ),
            ));
  }
}
