import 'package:event_hub/presentation/onboarding/view_model/onboarding_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingStates> {
  OnboardingCubit(super.initialState);
  int currentIndex = 0;
  final items = [
    const OnboardingItem(
      imagePath: "assets/images/onboarding_1.png",
      title: "Explore Upcoming and Nearby Events",
      description:
          "Browse nearby events, find curated recommendations, and stay informed about activities happening in your area.",
    ),
    const OnboardingItem(
      imagePath: "assets/images/onboarding_2.png",
      title: "Modern Events Calendar",
      description:
          "Keep your schedule organized with a simple calendar view, reminders, and event details at a glance.",
    ),
    const OnboardingItem(
      imagePath: "assets/images/onboarding_3.png",
      title: "Discover Events on the Map",
      description:
          "Explore event locations using an interactive map to easily find venues, routes, and nearby experiences.",
    ),
  ];

  void nextClicked() {
    if (currentIndex < items.length - 1) {
      currentIndex++;
      emit(OnboardingNextState());
    } else {
      emit(OnboardingSkipState());
    }
  }

  void skipClicked() {
    emit(OnboardingSkipState());
  }

  OnboardingItem getCurrentItem() {
    return items[currentIndex];
  }
}

class OnboardingItem {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}
