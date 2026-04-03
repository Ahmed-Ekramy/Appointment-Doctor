import 'package:dartz/dartz.dart';

import '../../data/models/sign_up_response_model.dart';

abstract class SignUpRepository {
  Future<Either<String, SignUpResponseModel>> signUp({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
    required String confirmPassword,
  });
}
