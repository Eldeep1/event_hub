import 'package:easy_localization/easy_localization.dart';
import 'package:event_hub/domain/repository/auth_repo.dart';
import 'package:event_hub/domain/repository/splash_repo.dart';
import 'package:event_hub/presentation/auth/register/view/register_form_widget.dart';
import 'package:event_hub/presentation/auth/view_model/cubit/auth_cubit.dart';
import 'package:event_hub/presentation/auth/view_model/states/auth_state.dart';
import 'package:event_hub/presentation/auth/widgets/auth_buttons_widget.dart';
import 'package:event_hub/presentation/auth/widgets/auth_footer_widget.dart';
import 'package:event_hub/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            appBar: AppBar(backgroundColor: Colors.transparent),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        RegisterFormWidget(
                          nameController: _nameController,
                          emailController: _emailController,
                          passwordController: _passwordController,
                          confirmPasswordController: _confirmPasswordController,
                        ),
                        const SizedBox(height: 40),
                        AuthButtonsWidget(
                          mainButtonText: context.tr('sign_up'),
                          onMainButtonPressed: () {
                            final email = _emailController.text.trim();
                            final password = _passwordController.text.trim();
                            final confirmPassword = _confirmPasswordController
                                .text
                                .trim();

                            if (email.isEmpty ||
                                password.isEmpty ||
                                confirmPassword.isEmpty) {
                              _showMessage(
                                context.tr('please_fill_all_fields'),
                              );
                              return;
                            }

                            if (password != confirmPassword) {
                              _showMessage(
                                context.tr('passwords_do_not_match'),
                              );
                              return;
                            }

                            context.read<AuthCubit>().register(
                              email: email,
                              password: password,
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        AuthFooterWidget(
                          text: context.tr('already_have_account'),
                          buttonText: context.tr('sign_in'),
                          onButtonPressed: () {
                            Navigator.pop(context);
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
