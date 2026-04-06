import 'package:doc/core/utils/app_colors.dart';
import 'package:doc/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class DoctorErrorView extends StatelessWidget {
  const DoctorErrorView({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: AppTextStyle.medium14(context).copyWith(color: AppColors.grey60),
      ),
    );
  }
}
