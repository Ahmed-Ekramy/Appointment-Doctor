import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;
  bool rememberMe = false;

  void changeVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(VisibilityState());
  }

  void changeRememberMe() {
    rememberMe = !rememberMe;
    emit(RememberMeState());
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      try {
        await loginUseCase.execute(
          email: emailController.text,
          password: passwordController.text,
        );
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
