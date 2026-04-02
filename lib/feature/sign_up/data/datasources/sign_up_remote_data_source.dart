import '../models/sign_up_model.dart';

abstract class SignUpRemoteDataSource {
  Future<void> signUp(SignUpModel signUpModel);
}

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  @override
  Future<void> signUp(SignUpModel signUpModel) async {
    // TODO: Implement API call using Dio or Http
    await Future.delayed(const Duration(seconds: 2));
  }
}
