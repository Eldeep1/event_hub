abstract class SplashRepo {
  Future<bool> isOnboardingCompleted();
  Future<bool> isLoggedIn();
  Future<void> setOnboardingCompleted();
  Future<void> setLoggedIn(bool loggedIn);
}
