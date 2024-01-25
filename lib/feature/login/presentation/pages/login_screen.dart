import 'package:appointment/core/theming/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shard_widget/app_text_form_field.dart';
import '../../../../core/shard_widget/custom_button.dart';
import '../widgets/already_have_an_account.dart';
import '../widgets/terms_conditions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;

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
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const AppTextFormField(hintText: 'Email'),
                      SizedBox(
                        height: 18.h,
                      ),
                      AppTextFormField(
                          hintText: 'Password',
                          isObscureText: isObscure,
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            child: Icon(
                              isObscure ? Icons.visibility_off : Icons.visibility,
                            ),
                          )),
                    ],
                  )),
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
               const CustomButton(),
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



