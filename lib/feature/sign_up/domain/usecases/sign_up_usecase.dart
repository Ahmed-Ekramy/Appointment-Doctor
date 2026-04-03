import 'package:dartz/dartz.dart';

import '../../data/models/sign_up_response_model.dart';
import '../repositories/sign_up_repository.dart';

class SignUpUseCase {
  final SignUpRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<String, SignUpResponseModel>> call({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
    required String confirmPassword,
  }) {
    return repository.signUp(
      name: name,
      email: email,
      phone: phone,
      gender: gender,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
