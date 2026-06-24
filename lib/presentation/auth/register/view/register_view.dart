import 'package:event_hub/presentation/auth/register/view/register_form_widget.dart';
import 'package:event_hub/presentation/auth/widgets/auth_buttons_widget.dart';
import 'package:event_hub/presentation/auth/widgets/auth_footer_widget.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RegisterFormWidget(),

              const SizedBox(height: 40),
              
              AuthButtonsWidget(
                mainButtonText: "Sign Up",
                onMainButtonPressed: () {},
              ),
              const SizedBox(height: 20),
              AuthFooterWidget(
                text: "Already have an account?",
                buttonText: "Sign In",
                onButtonPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
