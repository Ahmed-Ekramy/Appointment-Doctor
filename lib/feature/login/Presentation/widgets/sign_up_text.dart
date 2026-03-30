import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_style.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: AppTextStyle.regular12(context).copyWith(
            color: AppColors.grey100,
          ),
          children: [
            const TextSpan(text: 'Already have an account yet? '),
            TextSpan(
              text: 'Sign Up',
              style: AppTextStyle.semiBold12(context).copyWith(
                color: AppColors.primary,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}