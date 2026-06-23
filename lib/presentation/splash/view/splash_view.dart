import 'package:event_hub/presentation/auth/login/login_view.dart';
import 'package:event_hub/presentation/home/view/home_view.dart';
import 'package:event_hub/presentation/onboarding/view/onboardeing_view.dart';
import 'package:event_hub/presentation/splash/view_model/cubit/splash_cubit.dart';
import 'package:event_hub/presentation/splash/view_model/states/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashGoHome) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeView()),
          );
        }

        if (state is SplashGoLogin) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginView()),
          );
        }

        if (state is SplashGoOnboarding) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const OnboardeingView()),
          );
        }
      },
      child: Scaffold(
        body: Center(child: Image.asset("assets/images/event_hub_logo.png")),
      ),
    );
  }
}
