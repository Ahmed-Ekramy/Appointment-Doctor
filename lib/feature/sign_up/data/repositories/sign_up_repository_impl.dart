import '../../domain/repositories/sign_up_repository.dart';
import '../datasources/sign_up_remote_data_source.dart';
import '../models/sign_up_model.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDataSource remoteDataSource;

  SignUpRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    final signUpModel = SignUpModel(
      name: name,
      email: email,
      phone: phone,
      password: password,
      confirmPassword: confirmPassword,
    );
    return await remoteDataSource.signUp(signUpModel);
  }
}
