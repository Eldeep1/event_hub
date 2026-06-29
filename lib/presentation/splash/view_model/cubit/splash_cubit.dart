import 'package:event_hub/domain/repository/splash_repo.dart';
import 'package:event_hub/presentation/splash/view_model/states/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashRepo splashRepo;

  SplashCubit(this.splashRepo) : super(SplashInitial());
  Future<void> checkStartup() async {
    emit(SplashLoading());

    final onboardingDone = await splashRepo.isOnboardingCompleted();

    if (!onboardingDone) {
      await Future.delayed(const Duration(seconds: 2));
      emit(SplashGoOnboarding());
      return;
    }

    final loggedIn = await splashRepo.isLoggedIn();

    await Future.delayed(const Duration(seconds: 2));

    if (loggedIn) {
      emit(SplashGoHome());
    } else {
      emit(SplashGoLogin());
    }
  }
}
