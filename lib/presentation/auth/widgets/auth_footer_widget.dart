import 'package:flutter/material.dart';

class AuthFooterWidget extends StatelessWidget {
  const AuthFooterWidget({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onButtonPressed,
  });

  final String text;
  final String buttonText;
  final VoidCallback onButtonPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(onPressed: onButtonPressed, child: Text(buttonText)),
      ],
    );
  }
}
