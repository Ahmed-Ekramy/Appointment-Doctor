import 'package:appointment/core/api/api_constant.dart';
import 'package:appointment/core/failures/failure.dart';
import 'package:appointment/feature/login/data/data_sources/login_dto.dart';
import 'package:appointment/feature/login/data/models/login_model.dart';
import 'package:appointment/feature/login/data/models/user_login_model.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class LoginRemoteDto extends LoginDto {
  Dio dio = Dio();

  @override
  Future<Either<Failures, LoginModel>> login(UserLoginModel userLoginModel) async {
    try{
      var response = await dio.post(
          "${ApiConstant.baseUrl}${ApiConstant.loginEndPoint}", data: {
        "email": userLoginModel.email,
        "password": userLoginModel.password
      });
     LoginModel loginModel=LoginModel();
     return Right(loginModel);
    }catch(e){
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
