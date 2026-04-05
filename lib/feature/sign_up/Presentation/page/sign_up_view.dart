import '../../../../core/utils/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/route.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_validator.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/sign_up_cubit.dart';
import '../widgets/gender_option_tile.dart';

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
              Future.wait([
                CacheHelper.setData(
                  key: 'token',
                  value: state.signUpResponseModel.data?.token,
                ),
                CacheHelper.setData(
                  key: 'username',
                  value: state.signUpResponseModel.data?.username,
                ),
              ]).then((value) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.greenAccent,
                    content: Text('Sign up successful!'),
                  ),
                );
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.layout, (route) => false);
              });
            } else if (state is SignUpError) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Text(state.error),
                ),
              );
            }
            else if (state is SignUpLoading) {
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
                      style: AppTextStyle.bold24(
                        context,
                      ).copyWith(color: AppColors.primary),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                      style: AppTextStyle.regular14(
                        context,
                      ).copyWith(color: AppColors.grey60, height: 1.5),
                    ),
                    SizedBox(height: 36.h),
                    CustomTextFormField(
                      controller: cubit.nameController,
                      hintText: 'Name',
                      validator: AppValidators.name,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: cubit.emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: AppValidators.email,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: cubit.phoneController,
                      hintText: 'Phone',
                      keyboardType: TextInputType.phone,
                      validator: AppValidators.phone,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: cubit.genderController,
                      hintText: 'Gender',
                      readOnly: true,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(28),
                            ),
                          ),
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.w,
                                vertical: 16.h,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      width: 40.w,
                                      height: 4.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.grey20,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                  Text(
                                    'Select Gender',
                                    style: AppTextStyle.bold18(context),
                                  ),
                                  SizedBox(height: 24.h),
                                  GenderOptionTile(
                                    title: 'Male',
                                    icon: Icons.male_rounded,
                                    isSelected: cubit.selectedGender == 0,
                                    onTap: () {
                                      cubit.changeGender(0);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(height: 12.h),
                                  GenderOptionTile(
                                    title: 'Female',
                                    icon: Icons.female_rounded,
                                    isSelected: cubit.selectedGender == 1,
                                    onTap: () {
                                      cubit.changeGender(1);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(height: 24.h),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      validator: AppValidators.gender,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: cubit.passwordController,
                      hintText: 'Password',
                      obscureText: cubit.isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          cubit.isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: cubit.changePasswordVisibility,
                      ),
                      validator: AppValidators.password,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: cubit.confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: cubit.isConfirmPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          cubit.isConfirmPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: cubit.changeConfirmPasswordVisibility,
                      ),
                      validator: (value) => AppValidators.confirmPassword(
                        value,
                        cubit.passwordController.text,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    CustomButton(
                            text: 'Create Account',
                            backgroundColor: AppColors.primary,
                            textColor: AppColors.backgroundWhite,
                            width: double.infinity,
                            height: 52,
                            radius: 16,
                            onPressed: () {
                              cubit.signUp();
                            },
                          ),
                    SizedBox(height: 24.h),
                    Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: RichText(
                          text: TextSpan(
                            style: AppTextStyle.regular12(
                              context,
                            ).copyWith(color: AppColors.grey100),
                            children: [
                              const TextSpan(
                                text: 'Already have an account yet? ',
                              ),
                              TextSpan(
                                text: 'Login',
                                style: AppTextStyle.semiBold12(
                                  context,
                                ).copyWith(color: AppColors.primary),
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
