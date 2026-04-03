import 'package:dartz/dartz.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/sign_up_model.dart';
import '../models/sign_up_response_model.dart';

abstract class SignUpRemoteDataSource {
  Future<Either<String, SignUpResponseModel>> signUp(SignUpModel signUpModel);
}

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  ApiConsumer apiConsumer;

  SignUpRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<Either<String, SignUpResponseModel>> signUp(
    SignUpModel signUpModel,
  ) async {
    try {
      var response = await apiConsumer.post(
        EndPoint.register,
        isFromData: true,
        data: signUpModel.toJson(),
      );
      print("${
         "name: ${signUpModel.name}"
            "email: ${signUpModel.email}"
         "phone: ${signUpModel.phone}"
          "password: ${signUpModel.password}"
          "confirmPassword: ${signUpModel.confirmPassword}"

      }");
      final signUpResponse = SignUpResponseModel.fromJson(response);
      print(signUpResponse.message);
      return Right(signUpResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.message ?? "Something went wrong");
    }
  }
}
