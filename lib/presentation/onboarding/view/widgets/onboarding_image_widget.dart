import 'package:flutter/material.dart';

Widget onboardingImageWidget(String imagePath) => Padding(
  padding: const EdgeInsets.only(bottom: 300, right: 55, left: 55),
  child: Image.asset(imagePath, fit: BoxFit.cover),
);
