import 'package:flutter/material.dart';
import 'package:interview_task/app/router/router_constant.dart';
import 'package:interview_task/src/presentation/view/auth/login_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Splash
      /* case RouterConstant.splashRoute:
        return MaterialPageRoute<SplashView>(builder: (_) => const SplashView()); */

      // Login
      case RouterConstant.loginRoute:
        return MaterialPageRoute<LoginView>(builder: (_) => const LoginView());
      // Bottom Nav Screen

      // Business Travel Routing
      default:
        return MaterialPageRoute<Scaffold>(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
