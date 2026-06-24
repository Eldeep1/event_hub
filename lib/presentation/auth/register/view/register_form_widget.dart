import 'package:flutter/material.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person),
            hintText: 'Full Name',
          ),
        ),
        const SizedBox(height: 19),
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
            hintText: 'Your password',
            prefixIcon: Icon(Icons.lock),
            suffixIcon: Icon(Icons.visibility_off),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 19),

        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Confirm Password',
            border: OutlineInputBorder(),
            hintText: 'Confirm password',
            prefixIcon: Icon(Icons.lock),
            suffixIcon: Icon(Icons.visibility_off),
          ),
          obscureText: true,
        ),
      ],
    );
  }
}
