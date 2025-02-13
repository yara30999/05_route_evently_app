import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../app/app_prefs.dart';
import '../../app/di.dart';
import '../../domain/entities/event_entity.dart';
import '../01_introduction_screen/view/intoduction_view.dart';
import '../02_onboarding_screen/view/onboarding_view.dart';
import '../03_auth_screen/view/forgot_password_view.dart';
import '../03_auth_screen/view/login_view.dart';
import '../03_auth_screen/view/register_view.dart';
import '../04_home_screen/view/home_view.dart';
import '../05_create_edit_event_screen/view/create_edit_event_view.dart';
import '../05_create_edit_event_screen/view_model/create_edit_event_provider.dart';
import '../06_pick_location_screen/view/pick_location_view.dart';
import '../07_event_details_screen/view/event_details_view.dart';

class Routes {
  static const String introductionRoute = "/";
  static const String onboardingRoute = "/onboarding_route";
  static const String registerRoute = "/register_route";
  static const String loginRoute = "/login_route";
  static const String forgotPasswordRoute = "/forgot_password_route";
  static const String homeRoute = "/home_route";
  static const String createEditEventRoute = "/create_edit_event_route";
  static const String eventDetailsRoute = "/event_details_route";
  static const String pickLocationRoute = "/pick_location_route";
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
      case Routes.eventDetailsRoute:
        EventEntity eventEntity = settings.arguments as EventEntity;
        return MaterialPageRoute(
            builder: (_) => EventDetailsView(eventEntity: eventEntity));
      case Routes.createEditEventRoute:
        EventEntity? eventEntity = settings.arguments == null
            ? null
            : settings.arguments as EventEntity;
        return MaterialPageRoute(
            builder: (_) => CreateEditEventView(eventEntity: eventEntity));
      case Routes.pickLocationRoute:
        CreateEditEventProvider createEditEventProvider =
            settings.arguments as CreateEditEventProvider;
        return MaterialPageRoute(
            builder: (_) =>
                PickLocationView(provider: createEditEventProvider));
      default:
        return unDefinedRoute();
    }
  }

  static List<Route<dynamic>> generateInitialRoutes(String initialRouteName) {
    if (!appPreferences.isOnboardingSeen()) {
      return [MaterialPageRoute(builder: (_) => const IntroductionView())];
    }
    if (!appPreferences.isUserLoggedIn()) {
      return [MaterialPageRoute(builder: (_) => const LoginView())];
    }
    return [MaterialPageRoute(builder: (_) => const HomeView())];
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
