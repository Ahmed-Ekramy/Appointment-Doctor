import 'package:dartz/dartz.dart';

import '../../domain/repositories/login_repository.dart';
import '../datasources/login_remote_data_source.dart';
import '../models/login_model.dart';
import '../models/login_response_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<String, LoginResponseModel>> login({
    required String email,
    required String password,
  }) => remoteDataSource.login(LoginModel(email: email, password: password));
}
