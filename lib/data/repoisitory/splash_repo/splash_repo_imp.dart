import 'package:event_hub/data/data_source/local/app_preferences.dart';
import 'package:event_hub/domain/repository/splash_repo/splash_repo.dart';
import 'package:event_hub/utils/constants.dart';

class SplashRepoImp extends SplashRepo {
  final AppPreferences preferences;
  SplashRepoImp({required this.preferences});

  @override
  Future<bool> isLoggedIn() async {
    return await preferences.getBool(Constants.loggedIn) ?? false;
  }

  @override
  Future<bool> isOnboardingCompleted() async {
    return await preferences.getBool(Constants.onboardingCompleted) ?? false;
  }

  @override
  Future<void> setOnboardingCompleted() async {
    preferences.saveBool(Constants.onboardingCompleted, true);
  }
}
