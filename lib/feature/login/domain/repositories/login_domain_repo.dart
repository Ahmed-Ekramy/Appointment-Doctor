import 'package:appointment/feature/login/domain/entities/login_entity.dart';
import 'package:either_dart/either.dart';
import '../../../../core/failures/failure.dart';
import '../../data/models/user_login_model.dart';
abstract class LoginDomainRepo{
  Future<Either<Failures,LoginEntity>>login(UserLoginModel userLoginModel);
}