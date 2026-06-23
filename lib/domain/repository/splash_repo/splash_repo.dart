abstract class SplashRepo {
  Future<bool> isOnboardingCompleted();
  Future<void> setOnboardingCompleted();
  Future<bool> isLoggedIn();
}
