import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/responsive_size.dart';
import '../utils/text_style.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  final Color backgroundColor;
  final Color textColor;
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    required this.onPressed,
    this.textStyle,
    required this.width,
    required this.height,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius.r),
        ),
        minimumSize: Size(width.w, height.h),
      ),
      child: Text(
        text,
        style:
        textStyle ??
            AppTextStyle.semiBold20(
              context,
            ).copyWith(color: AppColors.backgroundWhite),
      ),
    );
  }
}