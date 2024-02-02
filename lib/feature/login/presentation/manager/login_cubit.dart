import 'package:appointment/feature/login/data/models/user_login_model.dart';
import 'package:appointment/feature/login/domain/use_cases/login_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  static LoginCubit get(context)=>BlocProvider.of(context);
  void login() async {
    UserLoginModel userLoginModel = UserLoginModel(
        email: emailController.text, password: passwordController.text);
    var result = await loginUseCase.call(userLoginModel);
    result.fold((left) => emit(LoginFailure(left.message)), (right) =>
        emit(LoginSuccessState(right)));
  }
}
