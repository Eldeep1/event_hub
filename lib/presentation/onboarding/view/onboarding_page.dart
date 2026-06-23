import 'package:event_hub/presentation/onboarding/view/widgets/onboarding_bottom_container.dart';
import 'package:event_hub/presentation/onboarding/view/widgets/onboarding_image_widget.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final int currentPage;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.currentPage,
    required this.onSkip,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          onboardingImageWidget(imagePath),
          onboardingBottomContainer(title: title, description: description, currentPage: currentPage, onSkip: onSkip, onNext: onNext)
        ],
      ),
    );
  }
}
