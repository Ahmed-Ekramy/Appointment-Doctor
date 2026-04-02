import '../models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<void> login(LoginModel loginModel);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<void> login(LoginModel loginModel) async {
    // TODO: Implement API call using Dio or Http
    await Future.delayed(const Duration(seconds: 2));
  }
}
