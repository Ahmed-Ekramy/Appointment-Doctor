import '../models/sign_up_model.dart';

abstract class SignUpRemoteDataSource {
  Future<void> signUp(SignUpModel signUpModel);
}

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  @override
  Future<void> signUp(SignUpModel signUpModel) async {

  }
}
