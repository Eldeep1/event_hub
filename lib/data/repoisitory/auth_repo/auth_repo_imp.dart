import 'package:event_hub/data/data_source/local/auth_local_data_source.dart';
import 'package:event_hub/domain/repository/auth_repo.dart';

class AuthRepoImp extends AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepoImp({required this.localDataSource});

  @override
  Future<bool> hasCredentials() async {
    return await localDataSource.hasCredentials();
  }

  @override
  Future<bool> validateCredentials({
    required String email,
    required String password,
  }) async {
    return await localDataSource.validateCredentials(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> saveCredentials({
    required String email,
    required String password,
  }) async {
    await localDataSource.saveCredentials(email: email, password: password);
  }
}
