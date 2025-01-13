import 'package:flutter/material.dart';
import '../01_introduction_screen/view/intoduction_view.dart';
import '../02_auth_screen/view/forgot_password_view.dart';
import '../02_auth_screen/view/login_view.dart';
import '../02_auth_screen/view/register_view.dart';
import '../03_home_screen/view/home_view.dart';
import '../04_create_event_screen/view/create_event_view.dart';

class Routes {
  static const String introductionRoute = "/";
  static const String registerRoute = "/register_route";
  static const String loginRoute = "/login_route";
  static const String forgotPasswordRoute = "/forgot_password_route";
  static const String homeRoute = "/home_route";
  static const String createEventRoute = "/create_event_route";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.introductionRoute:
        return MaterialPageRoute(builder: (_) => const IntroductionView());
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

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('S.current.noRouteFound'),
              ),
              body: const Center(child: Text('S.current.noRouteFound')),
            ));
  }
}
