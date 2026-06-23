import 'package:flutter/material.dart';

Widget onboardingBottomContainer({
  required String title,
  required String description,
  required int currentPage,
  required VoidCallback onSkip,
  required VoidCallback onNext,
}) => Align(
  alignment: Alignment.bottomCenter,
  child: Container(
    height: 320,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
    decoration: const BoxDecoration(
      color: Color(0xFF5669FF),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(48),
        topRight: Radius.circular(48),
      ),
    ),
    child: Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 24),

        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
            height: 1.6,
          ),
        ),

        const Spacer(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            containerButton(onPress: onSkip, title: "Skip"),
            Row(
              children: List.generate(
                3,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentPage == index ? 12 : 8,
                  height: currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color: currentPage == index ? Colors.white : Colors.white38,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            containerButton(onPress: onNext, title: "Next"),
          ],
        ),
      ],
    ),
  ),
);

Widget containerButton({
  required VoidCallback onPress,
  required String title,
}) => TextButton(
  onPressed: onPress,
  child: Text(
    title,
    style: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
);
