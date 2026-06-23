import 'package:event_hub/presentation/auth/login/login_view.dart';
import 'package:event_hub/presentation/onboarding/view/onboarding_page.dart';
import 'package:event_hub/presentation/onboarding/view_model/onboarding_cubit.dart';
import 'package:event_hub/presentation/onboarding/view_model/onboarding_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardeingView extends StatelessWidget {
  const OnboardeingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(OnboardingInitialState()),
      child: BlocListener<OnboardingCubit, OnboardingStates>(
        listener: (context, state) {
          if (state is OnboardingSkipState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginView()),
            );
          }
        },
        child: BlocBuilder<OnboardingCubit, OnboardingStates>(
          builder: (context, state) {
            final cubit = context.read<OnboardingCubit>();
            final item = cubit.getCurrentItem();

            return Scaffold(
              body: OnboardingPage(
                imagePath: item.imagePath,
                title: item.title,
                description: item.description,
                currentPage: cubit.currentIndex,
                onSkip: () => cubit.skipClicked(),
                onNext: () => cubit.nextClicked(),
              ),
            );
          },
        ),
      ),
    );
  }
}
