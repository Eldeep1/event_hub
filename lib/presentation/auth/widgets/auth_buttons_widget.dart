import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AuthButtonsWidget extends StatelessWidget {
  const AuthButtonsWidget({
    super.key,
    required this.mainButtonText,
    required this.onMainButtonPressed,
  });

  final String mainButtonText;
  final VoidCallback onMainButtonPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: onMainButtonPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5669FF),
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 12,
            ),
            child: Text(
              mainButtonText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text("OR", style: TextStyle(fontSize: 16, color: Colors.grey[600])),
          const SizedBox(height: 8),
          SocialLoginButton(
            buttonText: context.tr('sign_in_google'),
            imagePath: 'assets/images/google_logo.png',
            onPressed: () {},
          ),
          const SizedBox(height: 19),
          SocialLoginButton(
            buttonText: context.tr('sign_in_facebook'),
            imagePath: 'assets/images/facebook_logo.png',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.buttonText,
    required this.imagePath,
    required this.onPressed,
  });
  final String imagePath;
  final String buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 24),
              const SizedBox(width: 8),
              Text(buttonText, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
