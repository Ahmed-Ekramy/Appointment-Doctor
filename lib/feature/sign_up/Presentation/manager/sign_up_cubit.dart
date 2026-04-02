import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../domain/usecases/sign_up_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {

  SignUpCubit() : super(SignUpInitial());

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(SignUpVisibilityState());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(SignUpVisibilityState());
  }

  void validateForm() {
    emit(SignUpValidationChanged());
  }

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      emit(SignUpLoading());
      try {
        // await signUpUseCase.execute(
        //   name: nameController.text,
        //   email: emailController.text,
        //   phone: phoneController.text,
        //   password: passwordController.text,
        //   confirmPassword: confirmPasswordController.text,
        // );
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpError(e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
