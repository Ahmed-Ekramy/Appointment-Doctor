import 'package:dartz/dartz.dart';
import 'package:doc/core/api/api_consumer.dart';

import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/login_model.dart';
import '../models/login_response_model.dart';

abstract class LoginRemoteDataSource {
  Future<Either<String, LoginResponseModel>> login(LoginModel loginModel);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  ApiConsumer apiConsumer;

  LoginRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<Either<String, LoginResponseModel>> login(
    LoginModel loginModel,
  ) async {
    try {
      var response = await apiConsumer.post(
        EndPoint.login,
        isFromData: true,
        data: loginModel.toJson(),
      );
      final loginResponse = LoginResponseModel.fromJson(response);
      return Right(loginResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.message ?? "Something went wrong");
    }
  }
}
