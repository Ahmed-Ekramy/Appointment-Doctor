import 'package:appointment/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle inter32w700()=>GoogleFonts.inter(
    fontWeight: FontWeight.w700,fontSize: 32.sp,color: ColorManager.primaryColor
);
TextStyle inter13w400()=>GoogleFonts.inter(
    fontWeight: FontWeight.w400,fontSize: 13.sp,color: ColorManager.grayColor
);
TextStyle inter16w600()=>GoogleFonts.inter(
    fontWeight: FontWeight.w600,fontSize: 16.sp,color: Colors.white
);