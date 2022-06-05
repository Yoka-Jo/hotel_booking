import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/domain/models/models.dart';
import 'package:hotel_booking/presentaion/auth_type/view/auth_type_screen.dart';
import 'package:hotel_booking/presentaion/forgot_password/views/forgot_password_screen.dart';
import 'package:hotel_booking/presentaion/login/view/login_screen.dart';
import 'package:hotel_booking/presentaion/main/main_screen.dart';
import 'package:hotel_booking/presentaion/map/views/map_screen.dart';
import 'package:hotel_booking/presentaion/onboarding/onboarding_screen.dart';
import 'package:hotel_booking/presentaion/place_details/view/place_details_screen.dart';
import 'package:hotel_booking/presentaion/resources/strings_manager.dart';
import 'package:hotel_booking/presentaion/signup/view/signup_screen.dart';
import 'package:hotel_booking/presentaion/splash/splash_screen.dart';
import 'package:hotel_booking/presentaion/webview/view/webview_screen.dart';
import '../../app/dependency_injection.dart';
import '../forgot_password/cubit/forgot_password_cubit.dart';
import '../login/cubit/login_cubit.dart';
import '../main/cubit/main_cubit.dart';
import '../reset_password/cubit/reset_password_cubit.dart';
import '../reset_password/views/reset_password_screen.dart';
import '../signup/cubit/signup_cubit.dart';

class Routes {
  static const String splashRoute = "/splash";
  static const String loginRoute = "/login";
  static const String authTypeRoute = "/auth-type";
  static const String signupRoute = "/signup";
  static const String onboardingRoute = "/onboarding";
  static const String mainRoute = "/main";
  static const String placeDetailsRoute = "/place-details";
  static const String mapRoute = "/map";
  static const String webViewRoute = "/web-view";
  static const String forgotPasswordRoute = "/forgot-password";
  static const String resetPasswordRoute = "/reset-password";
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
      case Routes.forgotPasswordRoute:
        {
          initForgotPasswordModule();
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (_) => instance<ForgotPasswordCubit>(),
                    child: const ForgotPasswordScreen(),
                  ));
        }
      case Routes.resetPasswordRoute:
        {
          initResetPasswordModule();
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => instance<ResetPasswordCubit>(),
                    child: const ResetPasswordScreen(),
                  ));
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
            builder: (_) => BlocProvider(
              create: (_) => instance<SignUpCubit>(),
              child: const SignUpScreen(),
            ),
          );
        }
      case Routes.authTypeRoute:
        {
          return MaterialPageRoute(builder: (_) => const AuthTypeScreen());
        }
      case Routes.webViewRoute:
        {
          final String url = settings.arguments as String;
          return MaterialPageRoute(
              builder: (_) => WebViewScreen(
                    url: url,
                  ));
        }
      case Routes.mainRoute:
        {
          initHomeModule();
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => instance<MainCubit>(),
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
