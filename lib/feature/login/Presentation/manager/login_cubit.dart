import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPasswordVisible = true;
  bool rememberMe = false;
  LoginCubit() : super(LoginInitial());
  void changeVisibility(){
    isPasswordVisible = !isPasswordVisible;
    emit(VisibilityState());
  }
  void changeRememberMe(){
    rememberMe = !rememberMe;
    emit(RememberMeState());
  }
}
