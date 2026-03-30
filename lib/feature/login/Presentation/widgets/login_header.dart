import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: AppTextStyle.bold24(context).copyWith(
            color: AppColors.primary,
            height: 1.8,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
          style: AppTextStyle.regular14(context).copyWith(
            color: AppColors.grey60,
            height: 1.8,
          ),
        ),
      ],
    );
  }
}