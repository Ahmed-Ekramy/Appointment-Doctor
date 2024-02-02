import 'package:appointment/core/failures/failure.dart';
import 'package:appointment/feature/login/domain/entities/login_entity.dart';
import 'package:appointment/feature/login/domain/repositories/login_domain_repo.dart';
import 'package:either_dart/either.dart';

import '../../data/models/user_login_model.dart';

class LoginUseCase{
  LoginDomainRepo loginDomainRepo;
  LoginUseCase(this.loginDomainRepo);
  Future<Either<Failures,LoginEntity>>call(UserLoginModel userLoginModel)=>loginDomainRepo.login( userLoginModel);
}