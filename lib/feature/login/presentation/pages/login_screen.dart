import 'package:appointment/core/theming/app_colors.dart';
import 'package:appointment/core/theming/app_text.dart';
import 'package:appointment/feature/login/presentation/manager/login_cubit.dart';
import 'package:appointment/feature/login/presentation/widgets/email_password_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/route.dart';
import '../../../../core/shard_widget/app_text_form_field.dart';
import '../../../../core/shard_widget/custom_button.dart';
import '../manager/login_state.dart';
import '../widgets/already_have_an_account.dart';
import '../widgets/terms_conditions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0.h, horizontal: 32.w),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: inter24w700(),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                style: inter14w400(),
              ),
              SizedBox(
                height: 36.h,
              ),
              const EmailAndPassword(),
              SizedBox(
                height: 25.h,
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  'Forgot Password?',
                  textAlign: TextAlign.right,
                  style: inter12w400(),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    Navigator.pushNamed(context, Routes.home);
                  } else if (state is LoginFailure) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        icon: const Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 32,
                        ),
                        content: Text(state.error,
                            style: inter14w500().copyWith(color: Colors.blue)),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Got it', style: inter14w500()),
                          ),
                        ],
                      ),
                    );
                    //////////////
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(
                            color: ColorManager.mainBlue),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    onPressed: () {
                      if (LoginCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        LoginCubit.get(context).login();
                      }
                    },
                  );
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              const TermsAndConditionsText(),
              SizedBox(
                height: 60.h,
              ),
              const AlreadyHaveAnAccount()
            ],
          ),
        ),
      )),
    );
  }
}
