import 'package:flutter/material.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sign In",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
            hintText: 'abc@example.com',
          ),
        ),
        const SizedBox(height: 19),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
            hintText: 'Enter your password',
            prefixIcon: Icon(Icons.lock),
            suffixIcon: Icon(Icons.visibility_off),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Switch(value: true, onChanged: (value) {}),
            const SizedBox(width: 8),
            const Text("Remember me"),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
