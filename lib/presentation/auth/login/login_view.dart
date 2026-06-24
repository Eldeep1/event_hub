import 'package:event_hub/presentation/auth/register/view/register_view.dart';
import 'package:event_hub/presentation/auth/widgets/auth_buttons_widget.dart';
import 'package:event_hub/presentation/auth/login/widgets/login_form_widget.dart';
import 'package:event_hub/presentation/auth/login/widgets/login_header.dart';
import 'package:event_hub/presentation/auth/widgets/auth_footer_widget.dart';
import 'package:event_hub/presentation/bottom_navigation/view/bottom_nav_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LoginHeader(),
              const SizedBox(height: 12),
              const LoginFormWidget(),
              const SizedBox(height: 36),
              AuthButtonsWidget(
                mainButtonText: "Sign In",
                onMainButtonPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  BottomNavView()),
                  );
                },
              ),
              const SizedBox(height: 32),
              AuthFooterWidget(
                text: "Don't have an account?",
                buttonText: "Sign Up",
                onButtonPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterView()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
