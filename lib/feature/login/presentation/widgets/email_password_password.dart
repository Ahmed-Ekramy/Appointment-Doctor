import 'package:appointment/core/helper/app_regex.dart';
import 'package:appointment/feature/login/presentation/manager/login_cubit.dart';
import 'package:appointment/feature/login/presentation/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shard_widget/app_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({Key? key}) : super(key: key);

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool isObscure = true;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = LoginCubit
        .get(context)
        .passwordController;
  }
  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: LoginCubit
          .get(context)
          .formKey,
      child: Column(
        children: [
        Column(
          children: [
            AppTextFormField(

                hintText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty|| !AppRegex.isEmailValid(value)) {
                    return 'Please Enter a valid Email';
                  }
                },

                controller: LoginCubit
                    .get(context)
                    .emailController),
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
              ), validator: (value) {
            if (value == null || value.isEmpty) {
            return 'Please Enter a valid Password';
            }
            },controller: LoginCubit.get(context).passwordController),
          ],
        ),
          SizedBox(height: 20.h,),
          PasswordValidations(hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,)
      ],),
    );
  }
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
