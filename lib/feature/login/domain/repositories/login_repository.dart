import 'package:dartz/dartz.dart';

import '../../data/models/login_response_model.dart';

abstract class LoginRepository {
  Future<Either<String, LoginResponseModel>> login({
    required String email,
    required String password,
  });
}
