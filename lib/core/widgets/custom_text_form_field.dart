import 'package:doc/core/utils/app_colors.dart';
import 'package:doc/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/responsive_size.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.labelText,

    // الأيقونات
    this.prefixIcon,
    this.suffixIcon,
    this.suffix,

    // السلوك
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.maxLines = 1,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,

    // الفانكشنز
    this.validator,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,

    // الشكل
    this.borderRadius = 12,
    this.fillColor,
    this.contentPadding,

    // إضافي
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final String? labelText;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final int maxLines;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;

  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final Function(String)? onFieldSubmitted;

  final double borderRadius;
  final Color? fillColor;
  final EdgeInsets? contentPadding;

  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.secondaryFillBlue,
      cursorWidth: 2.w,
      style: AppTextStyle.medium14(
        context,
      ).copyWith(height: 1.5, letterSpacing: 0),
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      maxLines: obscureText ? 1 : maxLines,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,

      decoration: InputDecoration(
        hintStyle: AppTextStyle.medium14(
          context,
        ).copyWith(color: Color(0xffC2C2C2), height: 1.5, letterSpacing: 0),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffix: suffix,
        filled: true,
        fillColor: fillColor ?? Colors.grey.shade100,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          gapPadding: 10,
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Color(0xFFEDEDED), width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.primary, width: 1.w),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.secondaryFillRed, width: 1.w),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: AppColors.secondaryFillRed,
            width: 1.5.w,
          ),
        ),
      ),
    );
  }
}
