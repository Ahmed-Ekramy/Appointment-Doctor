import 'package:appointment/core/routing/route.dart';
import 'package:flutter/material.dart';
import '../../onboarding_screen.dart';

class AppRouter {
 static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) {
            return const OnBoardingScreen();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No route defined"),
              ),
            );
          },
        );
    }
  }
}
