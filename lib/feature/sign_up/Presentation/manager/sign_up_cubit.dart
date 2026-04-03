import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/sign_up_response_model.dart';
import '../../domain/usecases/sign_up_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpCubit(this.signUpUseCase) : super(SignUpInitial()) {
    debugPrint('SignUpCubit initialized with: $signUpUseCase');
  }

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  int? selectedGender;

  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  void changeGender(int value) {
    selectedGender = value;
    genderController.text = value == 0 ? 'Male' : 'Female';
    emit(SignUpVisibilityState()); 
  }

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
      debugPrint('Calling signUpUseCase: $signUpUseCase');
       var response = await signUpUseCase.call(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          gender: selectedGender.toString(),
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
        );
       
       response.fold((l) => emit(SignUpError(l)), (r) => emit(SignUpSuccess(r)));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    genderController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
