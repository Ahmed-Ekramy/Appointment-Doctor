import '../../domain/repositories/login_repository.dart';
import '../datasources/login_remote_data_source.dart';
import '../models/login_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    final loginModel = LoginModel(
      email: email,
      password: password,
    );
    return await remoteDataSource.login(loginModel);
  }
}
