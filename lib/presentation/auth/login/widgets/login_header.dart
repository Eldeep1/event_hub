import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Image.asset('assets/images/login_logo.png'),
        const SizedBox(height: 8),
        Text(
          "Event Hub",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}