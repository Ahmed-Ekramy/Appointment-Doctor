import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';

class RememberMeAndForgot extends StatelessWidget {
  final bool rememberMe;
  final ValueChanged<bool?> onChanged;

  const RememberMeAndForgot({
    required this.rememberMe,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 24.h,
          width: 24.w,
          child: Checkbox(
            activeColor: AppColors.primary,
            value: rememberMe,
            onChanged: onChanged,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            side: const BorderSide(color: AppColors.grey20),
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          'Remember me',
          style: AppTextStyle.regular12(context).copyWith(
            color: AppColors.grey40,
            height: 1,
            letterSpacing: 0,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            // TODO: Navigate to Forgot Password
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Forgot Password?',
            style: AppTextStyle.regular12(context).copyWith(
              color: AppColors.primary,
              height: 1.5,
              letterSpacing: 0,
            ),
          ),
        ),
      ],
    );
  }
}