import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/routes/route.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_validator.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/login_cubit.dart';
import '../widgets/login_header.dart';
import '../widgets/remember_me_and_forgot.dart';
import '../widgets/sign_up_text.dart';
import '../widgets/social_login_section.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.loginResponseModel.message!),
                      backgroundColor: Colors.greenAccent,
                    ),
                );
                Navigator.pushNamedAndRemoveUntil(context, Routes.layout, (route) => false);
              } else if (state is LoginError) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              } else if (state is LoginLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                );
              }
              return null;
            },

            builder: (context, state) {
              var cubit = LoginCubit.get(context);

              return Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LoginHeader(),
                    SizedBox(height: 36.h),
                    CustomTextFormField(
                      borderRadius: 16.r,
                      controller: cubit.emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: AppValidators.email,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      borderRadius: 16.r,
                      controller: cubit.passwordController,
                      hintText: 'Password',
                      obscureText: cubit.isPasswordVisible,
                      suffixIcon: InkWell(
                        onTap: () {
                          cubit.changeVisibility();
                        },
                        child: Icon(
                          cubit.isPasswordVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                      validator: AppValidators.password,
                    ),
                    SizedBox(height: 16.h),
                    RememberMeAndForgot(
                      rememberMe: cubit.rememberMe,
                      onChanged: (value) {
                        cubit.changeRememberMe();
                      },
                    ),
                    SizedBox(height: 32.h),
                    CustomButton(
                      text: 'Login',
                      backgroundColor: AppColors.primary,
                      textColor: AppColors.backgroundWhite,
                      width: double.infinity,
                      height: 52,
                      radius: 16,
                      onPressed: () {
                        cubit.login();
                      },
                    ),
                    SizedBox(height: 46.h),
                    const SocialLoginSection(),
                    SizedBox(height: 24.h),
                    const SignUpText(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
