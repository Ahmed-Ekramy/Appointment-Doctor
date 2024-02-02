import 'package:appointment/core/failures/failure.dart';
import 'package:appointment/feature/login/data/models/login_model.dart';
import 'package:appointment/feature/login/data/models/user_login_model.dart';
import 'package:either_dart/either.dart';

abstract class LoginDto{
  Future<Either<Failures,LoginModel>>login(UserLoginModel userLoginModel);
}