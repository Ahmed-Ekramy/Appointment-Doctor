import 'package:dartz/dartz.dart';

import '../../domain/repositories/sign_up_repository.dart';
import '../datasources/sign_up_remote_data_source.dart';
import '../models/sign_up_model.dart';
import '../models/sign_up_response_model.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDataSource remoteDataSource;

  SignUpRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<String, SignUpResponseModel>> signUp({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
    required String confirmPassword,
  })=> remoteDataSource.signUp(SignUpModel(
    name: name,
    email: email,
    phone: phone,
    gender: gender,
    password: password,
    confirmPassword: confirmPassword,
  ));

}
