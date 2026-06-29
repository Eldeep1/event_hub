import 'package:easy_localization/easy_localization.dart';
import 'package:event_hub/presentation/auth/widgets/auth_buttons_widget.dart';
import 'package:event_hub/presentation/auth/login/widgets/login_form_widget.dart';
import 'package:event_hub/presentation/auth/login/widgets/login_header.dart';
import 'package:event_hub/presentation/auth/widgets/auth_footer_widget.dart';
import 'package:event_hub/utils/routes/app_routes.dart';
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
                mainButtonText: context.tr('sign_in'),
                onMainButtonPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.homeScreen,
                  );
                },
              ),
              const SizedBox(height: 32),
              AuthFooterWidget(
                text: context.tr('no_account'),
                buttonText: context.tr('sign_up'),
                onButtonPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.registerScreen,
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
