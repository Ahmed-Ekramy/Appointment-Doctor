import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/app_text.dart';

class CustomButton extends StatelessWidget {
  final double? borderRadius;
  final double? horizontal;
  final double? vertical;
  final double? widthButton;
  final double? heightButton;
  final Color? colorButton;
  final String? nameButton;
  final VoidCallback? onPressed;

  const CustomButton(
      {this.borderRadius,
      this.horizontal,
      this.vertical,
      this.widthButton,
      this.heightButton,
      this.nameButton,
      this.onPressed,
      super.key, this.colorButton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius??16))),
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal:horizontal?? 12.w, vertical:vertical??  14.h)),
          backgroundColor:
               MaterialStatePropertyAll(colorButton??ColorManager.primaryColor),
          fixedSize: MaterialStateProperty.all(Size(widthButton?? double.maxFinite,heightButton?? 50.h))),
      onPressed: onPressed,
      child: Text(nameButton??'Login', textAlign: TextAlign.center, style: inter16w600()),
    );
  }
}
