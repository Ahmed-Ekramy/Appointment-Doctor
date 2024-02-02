import 'package:appointment/core/failures/failure.dart';
import 'package:appointment/feature/login/data/data_sources/login_dto.dart';
import 'package:appointment/feature/login/data/models/user_login_model.dart';
import 'package:appointment/feature/login/domain/repositories/login_domain_repo.dart';
import 'package:either_dart/either.dart';

import '../models/login_model.dart';

class LoginDataRepo extends LoginDomainRepo {
  LoginDto loginDto;

  LoginDataRepo(this.loginDto);

  @override
  Future<Either<Failures, LoginModel>> login(UserLoginModel userLoginModel) =>
      loginDto.login(userLoginModel);
}
