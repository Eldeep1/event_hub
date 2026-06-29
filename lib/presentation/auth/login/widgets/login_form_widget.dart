import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('sign_in'),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration:  InputDecoration(
            labelText: context.tr('email'),
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
            hintText: 'abc@example.com',
          ),
        ),
        const SizedBox(height: 19),
        TextFormField(
          decoration:  InputDecoration(
            labelText: context.tr('password'),
            border: OutlineInputBorder(),
            hintText: context.tr('password_hint'),
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
             Text(context.tr('remember_me')),
            Spacer(),
            TextButton(
              onPressed: () {},
              child:  Text(
                context.tr('forgot_password'),
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
