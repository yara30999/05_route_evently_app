import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../app/app_prefs.dart';
import '../../app/di.dart';
import '../01_introduction_screen/view/intoduction_view.dart';
import '../02_onboarding_screen/view/onboarding_view.dart';
import '../03_auth_screen/view/forgot_password_view.dart';
import '../03_auth_screen/view/login_view.dart';
import '../03_auth_screen/view/register_view.dart';
import '../04_home_screen/view/home_view.dart';
import '../05_create_event_screen/view/create_event_view.dart';

class Routes {
  static const String introductionRoute = "/";
  static const String onboardingRoute = "/onboarding_route";
  static const String registerRoute = "/register_route";
  static const String loginRoute = "/login_route";
  static const String forgotPasswordRoute = "/forgot_password_route";
  static const String homeRoute = "/home_route";
  static const String createEventRoute = "/create_event_route";
}

class RouteGenerator {
  static AppPreferences appPreferences = instance();

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.introductionRoute:
        return MaterialPageRoute(builder: (_) => const IntroductionView());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.createEventRoute:
        return MaterialPageRoute(builder: (_) => const CreateEventView());
      default:
        return unDefinedRoute();
    }
  }

  static List<Route<dynamic>> generateInitialRoutes(String initialRouteName) {
    if (appPreferences.isOnboardingSeen()) {
      return [MaterialPageRoute(builder: (_) => const HomeView())];
    } else {
      return [MaterialPageRoute(builder: (_) => const IntroductionView())];
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(context.tr('no_route_found')),
        ),
        body: Center(
          child: Text(context.tr('no_route_found')),
        ),
      ),
    );
  }
}
