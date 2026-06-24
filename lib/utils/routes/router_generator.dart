import 'package:event_hub/presentation/auth/login/login_view.dart';
import 'package:event_hub/presentation/auth/register/view/register_view.dart';
import 'package:event_hub/presentation/bottom_navigation/view/bottom_nav_view.dart';
import 'package:event_hub/presentation/event_details/view/event_details_view.dart';
import 'package:event_hub/presentation/onboarding/view/onboardeing_view.dart';
import 'package:event_hub/presentation/splash/view/splash_view.dart';
import 'package:event_hub/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';

class RouterGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case AppRoutes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardeingView());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case AppRoutes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) =>  BottomNavView());
        case AppRoutes.eventDetailsScreen:
        return MaterialPageRoute(builder: (_) =>  EventDetailsView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}