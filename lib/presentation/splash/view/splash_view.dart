import 'package:event_hub/presentation/splash/view_model/cubit/splash_cubit.dart';
import 'package:event_hub/presentation/splash/view_model/states/splash_state.dart';
import 'package:event_hub/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashGoHome) {
          
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.homeScreen,
          );
        }

        if (state is SplashGoLogin) {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.loginScreen,
          );
        }

        if (state is SplashGoOnboarding) {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.onboardingScreen,
          );
        }
      },
      child: Scaffold(
        body: Center(child: Image.asset("assets/images/event_hub_logo.png")),
      ),
    );
  }
}
