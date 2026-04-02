import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/sign_up_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveSize.init(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Sign up successful!')),
              );
            } else if (state is SignUpError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            var cubit = context.read<SignUpCubit>();
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: Form(
                key: cubit.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Account',
                      style: AppTextStyle.bold24(context).copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                      style: AppTextStyle.regular14(context).copyWith(
                        color: AppColors.grey60,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 36.h),
                    CustomTextFormField(
                      controller: cubit.nameController,
                      hintText: 'Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: cubit.emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: cubit.phoneController,
                      hintText: 'Phone',
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone is required';
                        }
                        if (value.length < 10) {
                          return 'Enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: cubit.passwordController,
                      hintText: 'Password',
                      obscureText: cubit.isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(cubit.isPasswordVisible ? Icons.visibility_off : Icons.visibility),
                        onPressed: cubit.changePasswordVisibility,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: cubit.confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: cubit.isConfirmPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(cubit.isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility),
                        onPressed: cubit.changeConfirmPasswordVisibility,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != cubit.passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 32.h),
                    state is SignUpLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton(
                            text: 'Create Account',
                            backgroundColor: AppColors.primary,
                            textColor: AppColors.backgroundWhite,
                            width: double.infinity,
                            height: 52,
                            radius: 16,
                            onPressed: cubit.signUp,
                          ),
                    SizedBox(height: 24.h),
                    Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: RichText(
                          text: TextSpan(
                            style: AppTextStyle.regular12(context).copyWith(
                              color: AppColors.grey100,
                            ),
                            children: [
                              const TextSpan(text: 'Already have an account yet? '),
                              TextSpan(
                                text: 'Login',
                                style: AppTextStyle.semiBold12(context).copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
