abstract class AuthRepository {
  Future<bool> hasCredentials();
  Future<bool> validateCredentials({
    required String email,
    required String password,
  });
  Future<void> saveCredentials({
    required String email,
    required String password,
  });
}
