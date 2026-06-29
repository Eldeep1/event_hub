import 'package:event_hub/domain/repository/auth_repo.dart';
import 'package:event_hub/domain/repository/splash_repo.dart';
import 'package:event_hub/presentation/auth/view_model/states/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  final SplashRepo splashRepo;

  AuthCubit({required this.authRepository, required this.splashRepo})
    : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    final hasAccount = await authRepository.hasCredentials();
    if (!hasAccount) {
      emit(AuthFailure('account_not_found'));
      return;
    }

    final isValid = await authRepository.validateCredentials(
      email: email,
      password: password,
    );
    if (!isValid) {
      emit(AuthFailure('invalid_credentials'));
      return;
    }

    await splashRepo.setLoggedIn(true);
    emit(AuthSuccess());
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    await authRepository.saveCredentials(email: email, password: password);
    await splashRepo.setLoggedIn(true);
    emit(AuthSuccess());
  }
}
