import 'package:easy_localization/easy_localization.dart';
import 'package:event_hub/domain/repository/auth_repo.dart';
import 'package:event_hub/domain/repository/splash_repo.dart';
import 'package:event_hub/presentation/auth/view_model/cubit/auth_cubit.dart';
import 'package:event_hub/presentation/auth/view_model/states/auth_state.dart';
import 'package:event_hub/presentation/auth/widgets/auth_buttons_widget.dart';
import 'package:event_hub/presentation/auth/login/widgets/login_form_widget.dart';
import 'package:event_hub/presentation/auth/login/widgets/login_header.dart';
import 'package:event_hub/presentation/auth/widgets/auth_footer_widget.dart';
import 'package:event_hub/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(
        authRepository: RepositoryProvider.of<AuthRepository>(context),
        splashRepo: RepositoryProvider.of<SplashRepo>(context),
      ),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
          }

          if (state is AuthFailure) {
            _showMessage(context.tr(state.messageKey));
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;
          return Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 70),
                        const LoginHeader(),
                        const SizedBox(height: 12),
                        LoginFormWidget(
                          emailController: _emailController,
                          passwordController: _passwordController,
                        ),
                        const SizedBox(height: 36),
                        AuthButtonsWidget(
                          mainButtonText: context.tr('sign_in'),
                          onMainButtonPressed: () {
                            final email = _emailController.text.trim();
                            final password = _passwordController.text.trim();
                            if (email.isEmpty || password.isEmpty) {
                              _showMessage(
                                context.tr('please_fill_all_fields'),
                              );
                              return;
                            }
                            context.read<AuthCubit>().login(
                              email: email,
                              password: password,
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
                if (isLoading)
                  const Positioned.fill(
                    child: ColoredBox(
                      color: Colors.black38,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
