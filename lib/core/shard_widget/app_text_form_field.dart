import 'package:appointment/core/theming/app_colors.dart';
import 'package:appointment/core/theming/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final bool? isObscureText;
  final Color? backGroundColorTextFormField;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final String hintText;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintTextStyle;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField(
      {super.key,
      this.isObscureText,
      this.suffixIcon,
      required this.hintText,
      this.focusedBorder,
      this.enabledBorder,
      this.inputTextStyle,
      this.hintTextStyle,
      this.contentPadding,
      this.backGroundColorTextFormField,
      this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureText ?? false,
      style: inputTextStyle ??
          inter14w500().copyWith(color: ColorManager.blackColor),
      decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 18.h),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: ColorManager.mainBlue, width: 1.3),
                  borderRadius: BorderRadius.circular(16)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.3),
              borderRadius: BorderRadius.circular(16)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.3),
              borderRadius: BorderRadius.circular(16)),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: ColorManager.lightGrayColor, width: 1.3),
                  borderRadius: BorderRadius.circular(16)),
          hintText: hintText,
          hintStyle: hintTextStyle ?? inter14w500(),
          suffixIcon: suffixIcon,
          fillColor:
              backGroundColorTextFormField ?? ColorManager.moreLightGrayColor,
          filled: true),
      validator: (value) {
        return validator(value);
      },
    );
  }
}
