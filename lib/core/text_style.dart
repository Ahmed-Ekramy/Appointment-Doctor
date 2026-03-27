import 'package:flutter/material.dart';

class AppTextStyle {
  // Bold (w700)
  static TextStyle bold96(BuildContext context)  => _style(context, 96,  FontWeight.w700);
  static TextStyle bold60(BuildContext context)  => _style(context, 60,  FontWeight.w700);
  static TextStyle bold48(BuildContext context)  => _style(context, 48,  FontWeight.w700);
  static TextStyle bold34(BuildContext context)  => _style(context, 34,  FontWeight.w700);
  static TextStyle bold24(BuildContext context)  => _style(context, 24,  FontWeight.w700);
  static TextStyle bold20(BuildContext context)  => _style(context, 20,  FontWeight.w700);
  static TextStyle bold18(BuildContext context)  => _style(context, 18,  FontWeight.w700);
  static TextStyle bold16(BuildContext context)  => _style(context, 16,  FontWeight.w700);
  static TextStyle bold14(BuildContext context)  => _style(context, 14,  FontWeight.w700);
  static TextStyle bold12(BuildContext context)  => _style(context, 12,  FontWeight.w700);
  static TextStyle bold10(BuildContext context)  => _style(context, 10,  FontWeight.w700);

  // SemiBold (w600)
  static TextStyle semiBold96(BuildContext context)  => _style(context, 96,  FontWeight.w600);
  static TextStyle semiBold60(BuildContext context)  => _style(context, 60,  FontWeight.w600);
  static TextStyle semiBold48(BuildContext context)  => _style(context, 48,  FontWeight.w600);
  static TextStyle semiBold34(BuildContext context)  => _style(context, 34,  FontWeight.w600);
  static TextStyle semiBold24(BuildContext context)  => _style(context, 24,  FontWeight.w600);
  static TextStyle semiBold20(BuildContext context)  => _style(context, 20,  FontWeight.w600);
  static TextStyle semiBold18(BuildContext context)  => _style(context, 18,  FontWeight.w600);
  static TextStyle semiBold16(BuildContext context)  => _style(context, 16,  FontWeight.w600);
  static TextStyle semiBold14(BuildContext context)  => _style(context, 14,  FontWeight.w600);
  static TextStyle semiBold12(BuildContext context)  => _style(context, 12,  FontWeight.w600);
  static TextStyle semiBold10(BuildContext context)  => _style(context, 10,  FontWeight.w600);

  // Medium (w500)
  static TextStyle medium96(BuildContext context)  => _style(context, 96,  FontWeight.w500);
  static TextStyle medium60(BuildContext context)  => _style(context, 60,  FontWeight.w500);
  static TextStyle medium48(BuildContext context)  => _style(context, 48,  FontWeight.w500);
  static TextStyle medium34(BuildContext context)  => _style(context, 34,  FontWeight.w500);
  static TextStyle medium24(BuildContext context)  => _style(context, 24,  FontWeight.w500);
  static TextStyle medium20(BuildContext context)  => _style(context, 20,  FontWeight.w500);
  static TextStyle medium18(BuildContext context)  => _style(context, 18,  FontWeight.w500);
  static TextStyle medium16(BuildContext context)  => _style(context, 16,  FontWeight.w500);
  static TextStyle medium14(BuildContext context)  => _style(context, 14,  FontWeight.w500);
  static TextStyle medium12(BuildContext context)  => _style(context, 12,  FontWeight.w500);
  static TextStyle medium10(BuildContext context)  => _style(context, 10,  FontWeight.w500);

  // Regular (w400)
  static TextStyle regular96(BuildContext context)  => _style(context, 96,  FontWeight.w400);
  static TextStyle regular60(BuildContext context)  => _style(context, 60,  FontWeight.w400);
  static TextStyle regular48(BuildContext context)  => _style(context, 48,  FontWeight.w400);
  static TextStyle regular34(BuildContext context)  => _style(context, 34,  FontWeight.w400);
  static TextStyle regular24(BuildContext context)  => _style(context, 24,  FontWeight.w400);
  static TextStyle regular20(BuildContext context)  => _style(context, 20,  FontWeight.w400);
  static TextStyle regular18(BuildContext context)  => _style(context, 18,  FontWeight.w400);
  static TextStyle regular16(BuildContext context)  => _style(context, 16,  FontWeight.w400);
  static TextStyle regular14(BuildContext context)  => _style(context, 14,  FontWeight.w400);
  static TextStyle regular12(BuildContext context)  => _style(context, 12,  FontWeight.w400);
  static TextStyle regular10(BuildContext context)  => _style(context, 10,  FontWeight.w400);

  // Internal builder
  static TextStyle _style(BuildContext context, double size, FontWeight weight) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: getResponsiveFontSize(context, fontSize: size),
      fontWeight: weight,
    );
  }

  // Responsive helpers
  static double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
    double scaleFactor = getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;
    double lowerLimit = fontSize * 0.8;
    double upperLimit = fontSize * 1.2;
    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double getScaleFactor(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return width / 375;
  }
}
