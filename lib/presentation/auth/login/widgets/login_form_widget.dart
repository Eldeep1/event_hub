import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginFormWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginFormWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('sign_in'),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: context.tr('email'),
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.email),
            hintText: 'abc@example.com',
          ),
        ),
        const SizedBox(height: 19),
        TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
            labelText: context.tr('password'),
            border: const OutlineInputBorder(),
            hintText: context.tr('password_hint'),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: const Icon(Icons.visibility_off),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Switch(value: true, onChanged: (value) {}),
            const SizedBox(width: 8),
            Text(context.tr('remember_me')),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                context.tr('forgot_password'),
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
