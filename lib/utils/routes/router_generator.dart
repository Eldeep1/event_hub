import 'package:event_hub/presentation/auth/login/login_view.dart';
import 'package:event_hub/presentation/auth/register/view/register_view.dart';
import 'package:event_hub/presentation/bottom_navigation/view/bottom_nav_view.dart';
import 'package:event_hub/presentation/event_details/view/event_details_view.dart';
import 'package:event_hub/presentation/onboarding/view/onboardeing_view.dart';
import 'package:event_hub/presentation/organizer_profile/view/organizer_profile_view.dart';
import 'package:event_hub/presentation/profile_view/view/profile_view.dart';
import 'package:event_hub/presentation/search_view/view/search_view.dart';
import 'package:event_hub/presentation/splash/view/splash_view.dart';
import 'package:event_hub/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashView(),
        );
      case AppRoutes.onboardingScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OnboardeingView(),
        );
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginView(),
        );
      case AppRoutes.registerScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RegisterView(),
        );
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BottomNavView(),
        );
      case AppRoutes.eventDetailsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => EventDetailsView(),
        );
      case AppRoutes.organizerProfileScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => OrganizerProfileView(),
        );
      case AppRoutes.searchScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SearchView(),
        );
      case AppRoutes.userProfileScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProfileView(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
