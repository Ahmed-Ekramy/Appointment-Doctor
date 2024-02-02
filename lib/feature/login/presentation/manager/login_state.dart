import 'package:appointment/feature/login/domain/entities/login_entity.dart';

import '../../data/models/login_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccessState extends LoginState {
 final LoginEntity loginEntity;
  LoginSuccessState(this.loginEntity);
}
class LoginFailure extends LoginState {
 final String error;

  LoginFailure(this.error);
}
